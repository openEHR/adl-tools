"""
Tool-specific initialisation for EiffelStudio.
This does not work with EiffelStudio 5.6 or earlier.
"""

import os, glob, sys, shutil, datetime, subprocess, xml.dom.minidom
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

def log_process(args, working_directory):
	commandline = subprocess.list2cmdline(args)
	if log_file != sys.stdout: print '  ' + commandline
	log(commandline)
	log_file.flush()
	return subprocess.call(args, cwd = working_directory, stdout = log_file, stderr = subprocess.STDOUT)

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
	 * target[0]: the path to the executable (application or dll) to be built (workbench or finalized).
	 * source[0]: the ECF file.
	 * source[1], source[2], etc.: any additional dependencies.
	 * env['ECLOG']: name of file to which all compiler output is logged (stdout if empty).
	 * env['ECFLAGS']: Eiffel compiler flags: -finalize, -freeze, -clean, -project_path, -target, etc.
	Result is 0 (success) if target[0] (the executable) is built; else 1.
	(Note that the Eiffel compiler's return code is unreliable: it returns 0 if C compilation fails.)
	"""
	result = 0

	log_open(env)
	log('=================== ' + ecf_target(target) + ' ===================')
	log_date()

	flags = env['ECFLAGS'].split()
	if not '-target' in flags: flags += ['-target', ecf_target(target)]
	log_process([env['EC'], '-batch', '-config', str(source[0])] + flags + ['-c_compile'], None)

	if not os.path.exists(str(target[0])):
		print log_file_tail()
		result = 1

	if log_file != sys.stdout: log_file.close()
	return result

def ec_emitter(target, source, env):
	"""
	The Eiffel Builder's emitter function.
	Parameters:
	 * target[0]: the base name of the executable (application or dll) produced by the Eiffel project.
	 * source[0]: the ECF file.
	 * source[1], source[2], etc.: optionally specify other dependencies.
	 * env['ECFLAGS']: some Eiffel compiler flags affect the full path to the executable.
	   The executable path is {-project_path}/EIFGENs/{-target}/{-finalize}/{target[0]}, where:
		-project_path if omitted defaults to the ECF file's directory;
		-target if omitted defaults to target[0] minus the extension;
		-finalize if present is "F_code", else if omitted defaults to "W_code".
	Result emits the target and source parameters passed to ec_action().
	"""
	result = None, source
	exe = str(target[0])

	if len(source) == 0:
		print '****** ERROR! No source .ecf file specified: cannot build ' + exe
	elif not env.Detect(env['EC']):
		print '****** ERROR! The Eiffel compiler ' + env['EC'] + ' is missing from your path: cannot build ' + exe
	else:
		ec_project_path = os.path.abspath(os.path.dirname(str(source[0])))
		ec_target = os.path.splitext(exe)[0]
		ec_code = '/W_code/'
		flags = env['ECFLAGS'].split()

		for i, flag in enumerate(flags):
			if flag == '-project_path':
				ec_project_path = flags[i + 1]
			elif flag == '-target':
				ec_target = flags[i + 1]
			elif flag == '-finalize':
				ec_code = '/F_code/'

		result = [ec_project_path + '/EIFGENs/' + ec_target + ec_code + exe], source

	return result

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
	result = []
	previous_cluster = ''
	ecf = xml.dom.minidom.parse(open(str(node)))

	for tag in ['cluster', 'override', 'library', 'assembly', 'external_include', 'external_object']:
		for element in ecf.getElementsByTagName(tag):
			location = env.subst(element.attributes['location'].value.replace('$(', '${').replace(')', '}')).replace('\\', '/')

			if location.startswith('$|'):
				location = os.path.join(previous_cluster, location.replace('$|', '', 1))
			elif not os.path.isabs(location):
				location = os.path.abspath(os.path.join(os.path.dirname(str(node)), location))

			previous_cluster = location

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
	"""Add a Builder and options for Eiffel to the given Environment."""
	opts = Options()
	opts.Add('EC', "The Eiffel command-line compiler.", 'ec')
	opts.Add('ECFLAGS', "Use ec -help to see possible options.", '-finalize -clean')
	opts.Add('ECLOG', "File to log Eiffel compiler output.", 'SCons.Eiffel.log')
	opts.Add('ISE_C_COMPILER', "EiffelStudio's C compiler: msc, gcc, mingw, etc.", ise_c_compiler(env))
	opts.Add('ISE_EIFFEL', "EiffelStudio's installation path.", ise_eiffel(env))
	opts.Add('ISE_LIBRARY', "EiffelStudio's library path.", ise_library(env))
	opts.Add('ISE_PLATFORM', "EiffelStudio's platform variable: windows, etc.", ise_platform(env))
	opts.Update(env)
	Help(opts.GenerateHelpText(env))

	env['BUILDERS']['Eiffel'] = Builder(action = Action(ec_action, ecf_target), emitter = ec_emitter, suffix = env['PROGSUFFIX'])
	env.Append(SCANNERS = Scanner(function = ecf_scanner, skeys = ['.ecf']))

def exists(env):
	"""Is the Eiffel compiler available?"""
	return env.Detect(env['EC'])

def ise_c_compiler(env):
	"""The given Environment's ISE_C_COMPILER variable, else a platform-specific assumption."""
	if env['ENV'].has_key('ISE_C_COMPILER'):
		return env['ENV']['ISE_C_COMPILER']
	elif env['PLATFORM'] == 'win32':
		return 'msc'
	else:
		return 'gcc'

def ise_eiffel(env):
	"""The given Environment's ISE_EIFFEL variable, else computed from the path to the "ec" compiler."""
	if env['ENV'].has_key('ISE_EIFFEL'):
		return env['ENV']['ISE_EIFFEL']
	elif env.WhereIs('ec'):
		return os.path.abspath(env.WhereIs('ec') + '/../../../../..')
	else:
		return ''

def ise_library(env):
	"""The given Environment's ISE_LIBRARY variable, else the same as ise_eiffel()."""
	if env['ENV'].has_key('ISE_LIBRARY'):
		return env['ENV']['ISE_LIBRARY']
	else:
		return ise_eiffel(env)

def ise_platform(env):
	"""The given Environment's ISE_PLATFORM variable, else a platform-specific assumption."""
	if env['ENV'].has_key('ISE_PLATFORM'):
		return env['ENV']['ISE_PLATFORM']
	elif env['PLATFORM'] == 'win32':
		return 'windows'
	elif env['PLATFORM'] == 'darwin':
		return 'macosx-x86'
	else:
		return 'linux-x86'

# Utility functions.

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
