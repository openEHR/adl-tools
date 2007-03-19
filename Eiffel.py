"""
Tool-specific initialisation for EiffelStudio 5.7.
This does not work with EiffelStudio 5.6 or earlier.
"""

import os, glob, sys, shutil, datetime, subprocess
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

def ec(target, source, env):
	"""
	The Eiffel Builder's action function, running the Eiffel compiler "ec".
	All compiler output is logged to a file.
	Parameters are as returned by ec_emitter().
	Result is 0 (success) if target[0] (the workbench executable) is built; else 1.
	(Note that ec's return code is unreliable: it returns 0 if C compilation fails.)
	"""
	result = 0
	exe = str(target[1])
	ecf = os.path.abspath(str(source[0]))

	log_open(env)
	log('=================== ' + ecf_target(target) + ' ===================')
	log_date()

	shutil.rmtree(os.path.dirname(str(target[0])))

	log_process(['ec', '-batch', '-config', ecf, '-target', ecf_target(target)] + env['ECFLAGS'].split() + ['-c_compile'], None)

	if len(target) > 2 and os.path.exists(os.path.dirname(exe)):
		log('--------------------------')
		log_date()
		log_process(['finish_freezing', '-silent'], os.path.dirname(exe))

	if not os.path.exists(exe):
		if log_file != sys.stdout:
			if log_file.tell() > 1000:
				log_file.seek(-1000, 1)
			else:
				log_file.seek(0)

			print '... ' + log_file.read()
			log_file.seek(0, 2)

		result = 1

	if log_file != sys.stdout: log_file.close()
	return result

def ec_emitter(target, source, env):
	"""
	The Eiffel Builder's emitter function.
	Parameters:
	1. target[0]: the base name of the executable (application or dll) produced by the Eiffel project.
	2. target[1]: optionally specifies the name of the ECF target to build. If not given, then the ECF target is target[0] minus the extension.
	3. source[0]: the ECF file.
	4. source[1], source[2], etc.: optionally specify other dependencies, e.g., Eiffel class file names.
	The result specifies the targets and sources that will be passed to ec():
	1. Result target[0]: the path to the "project.epr" file of the ECF target to build.
	2. Result target[1]: the path to the workbench executable that the ECF target will build.
	3. Result target[2]: the path to the finalised executable that the ECF target will build (only if finalising).
	4. Result source[0]: the given ECF file.
	5. Result source[1], source[2], etc.: the additional given dependencies, if any.
	"""
	result = None, source
	exe = str(target[0])

	if len(source) == 0:
		print 'No source .ecf file specified: cannot build ' + exe
	elif not env.Detect('ec'):
		print 'Please add "ec" to your path: cannot build ' + exe
	else:
		project_dir = os.path.abspath(os.path.dirname(str(source[0]))) + '/EIFGENs/'

		if len(target) > 1:
			project_dir += str(target[1])
		else:
			project_dir += os.path.splitext(exe)[0]

		exe = project_dir + '/?_code/' + exe
		result = [project_dir + '/project.epr', exe.replace('?', 'W')]

		if '-finalize' in env['ECFLAGS']:
			result += [exe.replace('?', 'F')]

		result = result, source

	return result

def ecf_target(target, source = None, env = None):
	return os.path.basename(os.path.dirname(str(target[0])))

def c_compiler(env):
	"""
	The given Environment's ISE_C_COMPILER variable, if set.
	The Microsoft compiler is the default because ISE_C_COMPILER is normally set on all platforms but Windows.
	"""
	if env['ENV'].has_key('ISE_C_COMPILER'):
		return env['ENV']['ISE_C_COMPILER']
	else:
		return 'msc'

def generate(env):
	"""Add a Builder and options for Eiffel to the given Environment."""
	opts = Options()
	opts.Add('ECFLAGS', '"-freeze" for a workbench build.', '-finalize')
	opts.Add('ECLOG', 'File to log Eiffel compiler output.', 'SCons.Eiffel.log')
	opts.Add('ISE_C_COMPILER', 'msc = Microsoft, bcc = Borland, etc.', c_compiler(env))
	opts.Update(env)
	Help(opts.GenerateHelpText(env))

	env['BUILDERS']['Eiffel'] = Builder(action = Action(ec, ecf_target), emitter = ec_emitter, suffix = env['PROGSUFFIX'])

def exists(env):
	"""Is the Eiffel compiler available?"""
	return env.Detect('ec')

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
