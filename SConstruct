import os
from Eiffel import files

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 97, 0)

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'macintosh'

# Define how to build the parser classes.

def gelex(target, source):
	return env.Command(target, source, [['gelex', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

def geyacc(target, source):
	return env.Command(target, source, [['geyacc', '--new_typing', '-v', '${TARGET.filebase}.txt', '-t', '${TARGETS[1].filebase}', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

def geyacc_html(target, source):
	return env.Command(target, source, [['geyacc', '--doc=html', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

if not env.Detect('gelex') or not env.Detect('geyacc'):
	print 'WARNING! The Gobo tools are missing from your path: cannot build the parsers.'
else:
	dir = 'components/adl_parser/src/syntax/adl/parser/'
	gelex(dir + 'adl_scanner.e', dir + 'adl_scanner.l')
	geyacc([dir + 'adl_validator.e', dir + 'adl_tokens.e'], dir + 'adl_validator.y')
	geyacc_html(dir + 'adl_validator.html', dir + 'adl_validator.y')

	dir = 'components/adl_parser/src/syntax/cadl/parser/'
	gelex(dir + 'cadl_scanner.e', dir + 'cadl_scanner.l')
	geyacc([dir + 'cadl_validator.e', dir + 'cadl_tokens.e'], dir + 'cadl_validator.y')
	geyacc_html(dir + 'cadl_validator.html', dir + 'cadl_validator.y')

	dir = 'libraries/common_libs/src/structures/syntax/dadl/parser/'
	gelex(dir + 'dadl_scanner.e', dir + 'dadl_scanner.l')
	geyacc([dir + 'dadl2_validator.e', dir + 'dadl_tokens.e'], dir + 'dadl2_validator.y')
	geyacc_html(dir + 'dadl2_validator.html', dir + 'dadl2_validator.y')

	dir = 'libraries/common_libs/src/unit_parser/parser/'
	gelex(dir + 'units_scanner.e', dir + 'units_scanner.l')
	geyacc([dir + 'units_parser.e', dir + 'units_tokens.e'], dir + 'units_parser.y')
	geyacc_html(dir + 'units_parser.html', dir + 'units_parser.y')

# Define how to build the Eiffel projects.

def eiffel(target, ecf):
	if platform == 'macintosh': env['ECTARGET'] = target + '_no_precompile'
	result = env.Eiffel(target, [ecf])
	Alias(target, result)
	return result

adl_workbench = eiffel('adl_workbench', 'apps/adl_workbench/app/adl_workbench.ecf')
eiffel('openehr_test',     'libraries/openehr/test/app/openehr_test.ecf')
eiffel('adl_parser_test',  'components/adl_parser/test/app/adl_parser_test.ecf')
eiffel('common_libs_test', 'libraries/common_libs/test/app/common_libs_test.ecf')

if platform == 'windows':
	adl_dotnet_lib = eiffel('adl_dotnet_lib.dll', 'components/adl_parser/lib/dotnet_dll/adl_dotnet_lib.ecf')

# Define how to put installers, etc., into the distribution directory.

distrib = None

for target in COMMAND_LINE_TARGETS:
	s = os.path.normpath(target)

	while distrib == None and s != os.path.dirname(s):
		if os.path.basename(s) == 'oe_distrib':
			distrib = s + '/' + platform + '/'
		else:
			s = os.path.dirname(s)

if distrib:
	icons = 'apps/adl_workbench/app/icons'
	news = 'apps/adl_workbench/app/news.txt'
	vim = files('apps/adl_workbench/etc/vim/*')
	install = 'apps/adl_workbench/install/' + platform + '/'
	root = install + 'ADL_Workbench/'

	if platform == 'windows':
		if len(adl_workbench) > 2:
			if not env.Detect('makensis'):
				print 'WARNING! NSIS is missing from your path: cannot build installer for ADL Workbench.'
			else:
				sources = [
					root + 'ADLWorkbenchInstall.nsi',
					adl_workbench[2],
					news
				] + vim

				for source, dirnames, filenames in os.walk(icons):
					if '.svn' in dirnames: dirnames.remove('.svn')
					sources += files(source + '/*')

				command = [
					'makensis', '-V1',
					'-XOutFile $TARGET',
					'$SOURCE'
				]

				env.Command(distrib + 'tools/OceanADLWorkbenchInstall.exe', sources, [command])

		if len(adl_dotnet_lib) > 2:
			Install(distrib + 'adl_parser/lib', [adl_dotnet_lib[2], os.path.dirname(str(adl_dotnet_lib[2])) + '/libadl_dotnet_lib.dll'])

	if platform == 'macintosh':
		if len(adl_workbench) > 2:
			packagemaker = '/Developer/Tools/packagemaker'

			if not os.path.exists(packagemaker):
				print 'WARNING! ' + packagemaker + ' is missing: cannot build installer for ADL Workbench.'
			else:
				bin = root + 'ADL Workbench.app/Contents/Resources/bin/'
				resources = install + 'English.lproj/'
				info = install + 'Info.plist'
				description = install + 'Description.plist'

				sources = [info, description]
				sources += Install(bin, [adl_workbench[2], news])
				sources += Install(root + 'vim', vim)
				sources += InstallAs(resources + 'Welcome.txt', news)

				for source, dirnames, filenames in os.walk(icons):
					if '.svn' in dirnames: dirnames.remove('.svn')
					subdir = os.path.basename(source)
					if subdir == 'icons': subdir = ''
					sources += Install(bin + 'icons/' + subdir, files(source + '/*'))

				for source, dirnames, filenames in os.walk(root + 'ADL Workbench.app'):
					if '.svn' in dirnames: dirnames.remove('.svn')
					if 'bin' in dirnames: dirnames.remove('bin')
					sources += files(source + '/*')

				for html, txt in [
					[resources + 'ReadMe.html', 'apps/doc/README-adl_workbench.txt'],
					[resources + 'License.html', 'apps/doc/LICENSE.txt']
				]:
					substitutions = 's|\&|\&amp;|;'
					substitutions += 's|\<|\&lt;|;'
					substitutions += 's|\>|\&gt;|;'
					substitutions += '2s|^.+$|<h2>&</h2>|;'
					substitutions += 's|^[A-Z].+$|<h3>&</h3>|;'
					substitutions += 's|^$|<br><br>|;'
					substitutions += 's|^-+$||'
					sources += env.Command(html, txt, 'sed -E \'' + substitutions + '\' $SOURCE > $TARGET')

				command = [
					packagemaker, '-build',
					'-p', '${TARGET.dir.dir}',
					'-f', root,
					'-r', resources,
					'-i', info,
					'-d', description
				]

				env.Command(distrib + 'tools/ADL Workbench.pkg/Contents/Archive.pax.gz', sources, [command])
