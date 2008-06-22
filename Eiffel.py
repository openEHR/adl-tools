"""
Tool-specific initialisation for EiffelStudio.
This does not work with EiffelStudio 5.6 or earlier.
"""

import os, glob, sys, shutil, datetime, subprocess, re, xml.dom.minidom
from SCons.Script import *
	
log_file = None

def log_open(env):
	global log_file

	if env['ECLOG'] == '':
		log_file = sys.stdout
	elif log_file == None:
		log_file = open(env['ECLOG'], 'w+')
	elif log_file.closed:
		log_file = open(env['ECLOG'], 'a+')

def log(s):
	log_file.write(str(s) + '\n')

def log_date():
	log(datetime.datetime.now())

def log_process(args):
	commandline = subprocess.list2cmdline(args)
	if log_file != sys.stdout: print '  ' + commandline
	log(commandline)
	log_file.flush()
	subprocess.call(args, stdout = log_file, stderr = subprocess.STDOUT)

def log_file_tail():
	"""The last thousand characters of the log file."""
	result = ''

	if log_file != sys.stdout:
		if log_file.tell() > 1000:
			log_file.seek(-1000, 1)
		else:
			log_file.seek(0)

		result = '... ' + log_file.read()
		log_file.seek(0, 2)

	return result

def ec_action(target, source, env):
	"""
	The Eiffel Builder's action function, running the Eiffel compiler.
	Parameters are as returned by ec_emitter():
	 * target: the paths to the files to be built (a workbench or finalized application or dll).
	 * source[0]: the ECF file.
	 * source[1], source[2], etc.: any additional dependencies.
	 * env['ECLOG']: name of file to which all compiler output is logged (stdout if empty).
	 * env['ECFLAGS']: Eiffel compiler flags: -finalize, -freeze, -clean, -project_path, -target, etc.
	Result is 0 (success) if all targets are built; else 1.
	(Note that the Eiffel compiler's return code is unreliable: it returns 0 if C compilation fails.)
	"""
	result = 0

	log_open(env)
	log('=================== ' + ecf_target(target) + ' ===================')
	log_date()

	flags = env['ECFLAGS'].split()
	if not '-target' in flags: flags += ['-target', ecf_target(target)]
	log_process([env['EC'], '-batch', '-config', str(source[0])] + flags + ['-c_compile'])

	for t in target:
		if result == 0 and not os.path.exists(str(t)):
			print log_file_tail()
			result = 1

	if log_file != sys.stdout: log_file.close()
	return result

def ec_emitter(target, source, env):
	"""
	The Eiffel Builder's emitter function.
	Parameters:
	 * target[0]: the ECF target to be built; if empty then defaults to the first target in the ECF file.
	 * source[0]: the ECF file. The paths to the files to be built are computed by reading this file.
	 * source[1], source[2], etc.: additional optional dependencies (precompiled libraries, ".rc" files, etc.).
	 * env['ECFLAGS']: some Eiffel compiler flags affect the full path to the executable.
	Result emits the target and source parameters passed to ec_action().
	 * The target path is {-project_path}/EIFGENs/{-target}/{-finalize}/{exe_name}, where:
		-project_path if omitted defaults to the ECF file's directory;
		-target if omitted defaults to the base name of target[0] (or else to the first target in the ECF file);
		-finalize evaluates to "F_code", else if omitted defaults to "W_code";
		The exe_name depends on the contents of the ECF file; it is also affected by the -precompile flag.
	"""
	result = None

	if len(target) > 0:
		ec_target = os.path.basename(str(target[0]))
	else:
		ec_target = ""

	if len(source) == 0:
		print '****** ERROR! No source .ecf file specified: cannot build ' + ec_target
	elif not env.Detect(env['EC']):
		print '****** ERROR! The Eiffel compiler ' + env['EC'] + ' is missing from your path: cannot build ' + ec_target
	else:
		ecf = str(source[0])
		ec_path = os.path.abspath(os.path.dirname(ecf))
		ec_code = '/W_code/'
		exe_name = dotnet_type = is_dotnet = is_precompiling = is_shared_library = None

		flags = env['ECFLAGS'].split()

		for i, flag in enumerate(flags):
			if flag == '-project_path':
				ec_path = flags[i + 1]
			elif flag == '-target':
				ec_target = flags[i + 1]
			elif flag == '-finalize':
				ec_code = '/F_code/'
			elif flag == '-precompile':
				is_precompiling = True

		ecf_as_xml = xml.dom.minidom.parse(ecf)
		ec_target_next = ec_target

		while ec_target_next <> None:
			t = ec_target_next
			ec_target_next = None

			for element in ecf_as_xml.getElementsByTagName('target'):
				name = element.attributes['name'].value
				if ec_target == "": t = ec_target = name

				if t == name:
					if element.hasAttribute('extends'):
						ec_target_next = element.attributes['extends'].value

					for setting in element.getElementsByTagName('setting'):
						name = setting.attributes['name'].value

						if name == 'msil_generation':
							if is_dotnet == None:
								is_dotnet = setting.attributes['value'].value == 'true'
						elif name == 'msil_generation_type':
							if dotnet_type == None:
								dotnet_type = '.' + setting.attributes['value'].value
						elif name == 'executable_name':
							if exe_name == None:
								exe_name = setting.attributes['value'].value
						elif name == 'shared_library_definition':
							if is_shared_library == None:
								is_shared_library = True

		if exe_name == None:
			exe_name = str(ecf_as_xml.documentElement.attributes['name'].value)

		if dotnet_type:
			ext = dotnet_type
		elif is_precompiling:
			ext = '.melted'
		elif is_shared_library:
			exe_name = env['SHLIBPREFIX'] + exe_name
			ext = env['SHLIBSUFFIX']
		else:
			exe_name = env['PROGPREFIX'] + exe_name
			ext = env['PROGSUFFIX']

		ec_path += '/EIFGENs/' + ec_target + ec_code
		result = [ec_path + exe_name + ext]

		if is_dotnet:
			result += [ec_path + 'lib' + exe_name + '.dll']
		elif is_precompiling:
			result += [ec_path + environment_variable(env, 'ISE_C_COMPILER') + '/' + env['PROGPREFIX'] + 'driver' + env['PROGSUFFIX']]
		elif is_shared_library and env['PLATFORM'] == 'win32':
			result += [ec_path + 'dll_' + exe_name + '.lib']

	return result, source

ecf_environment_variable_regex = re.compile(r'(\$\||\$\(?\w*\)?|[^$]+)', re.M)

def ecf_scanner(node, env, path):
	"""
	All dependencies mentioned in 'node', which is expected to be an ECF file.
	The dependencies consist of:
	 * All Eiffel class files found in all clusters (including override clusters) mentioned in the ECF file.
	 * All .ecf library files mentioned in the ECF file. (Such libraries are not themselves scanned).
	 * All .NET assemblies mentioned in the ECF file.
	 * All external object files mentioned in the ECF file.
	 * All .h and .hpp files found in external include directories mentioned in the ECF file.
	Because this ignores targets and conditionals in the ECF file, it may cause unnecessary builds.
	"""

	def element_location(element):
		"""
		The 'location' attribute of 'element', processed to take care of:
		 * Expansion of environment variables.
		 * If 'location' is relative, prefixing with the directory name of 'node'.
		 * If 'location' is a nested cluster, prefixing with the location of the parent element (recursively).
		"""
		result = ''

		for token in ecf_environment_variable_regex.findall(element.attributes['location'].value):
			if token[0] <> r'$':
				result += token
			elif token == r'$|':
				result += element_location(element.parentNode) + '/'
			else:
				s = environment_variable(env, token)

				if s:
					result += s
				else:
					print '****** WARNING!', str(node), 'uses undefined environment variable', token

		if not os.path.isabs(result):
			result = os.path.join(os.path.dirname(str(node)), result)

		return os.path.abspath(result)

	result = []
	ecf_as_xml = xml.dom.minidom.parse(str(node))

	for tag in ['cluster', 'override', 'library', 'assembly', 'external_include', 'external_object']:
		for element in ecf_as_xml.getElementsByTagName(tag):
			location = element_location(element)

			if os.path.isfile(location):
				result += [location]
			elif tag == 'external_include':
				result += files(location + '/*.h') + files(location + '/*.hpp')
			elif element.attributes.get('recursive', None):
				result += eiffel_classes_in_cluster(location)
			else:
				result += files(location + '/*.e')

	return result

def ecf_target(target, source = None, env = None):
	"""The ECF target corresponding to the given build target."""
	return os.path.basename(os.path.dirname(os.path.dirname(str(target[0]))))

def generate(env):
	"""Add a Builder and construction variables for Eiffel to the given Environment."""
	vars = Options()
	vars.Add('EC', "The Eiffel command-line compiler.", 'ec')
	vars.Add('ECFLAGS', "Use ec -help to see possible options.", '-finalize -clean')
	vars.Add('ECLOG', "File to log Eiffel compiler output.", 'SCons.Eiffel.log')
	vars.Update(env)
	Help(vars.GenerateHelpText(env))

	env['BUILDERS']['Eiffel'] = Builder(action = Action(ec_action, ecf_target), emitter = ec_emitter, target_factory = Entry)
	env.Append(SCANNERS = Scanner(ecf_scanner, skeys = ['.ecf']))

def exists(env):
	"""Is the Eiffel compiler available?"""
	return env.Detect(env['EC'])

# Utility functions.

def environment_variable(env, var):
	"""
	The value of the environment variable 'var' within 'env'.
	If undefined and it is one of the standard EiffelStudio variables, a sensible platform-specific assumption is used; else None.
	"""
	result = None
	var = var.lstrip('$(').rstrip(')')

	if env['ENV'].has_key(var):
		result = env['ENV'][var]
	elif var == 'ISE_PLATFORM':
		if env['PLATFORM'] == 'win32':
			result = 'windows'
		elif env['PLATFORM'] == 'darwin':
			result = 'macosx-x86'
		else:
			result = 'linux-x86'
	elif var == 'ISE_C_COMPILER':
		if env['PLATFORM'] == 'win32':
			result = 'msc'
		else:
			result = 'gcc'
	elif var == 'ISE_EIFFEL':
		result = env.WhereIs(env['EC'])
		if result: result = os.path.abspath(result + '/../../../../..')
	elif var == 'ISE_LIBRARY':
		result = environment_variable(env, 'ISE_EIFFEL')

	return result

def files(pattern):
	"""All files matching a pattern, excluding directories."""
	return [file for file in glob.glob(pattern) if os.path.isfile(file)]

def eiffel_classes_in_cluster(cluster):
	"""All Eiffel class files in the given cluster and its subclusters."""
	result = []

	for root, dirnames, filenames in os.walk(cluster):
		if '.svn' in dirnames: dirnames.remove('.svn')
		result += files(root + '/*.e')

	return result
