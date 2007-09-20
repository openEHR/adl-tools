import os
from Eiffel import files

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 97, 0)

env = Environment(ENV = os.environ, tools = ['Eiffel', 'packaging'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'macintosh'

# Define how to build the parser classes.

if not env.Detect('gelex') or not env.Detect('geyacc'):
	print 'WARNING! The Gobo tools are missing from your path: cannot build the parsers.'
else:
	for prefix, dir in [
		['adl_', 'components/adl_parser/src/syntax/adl/parser/'],
		['cadl_', 'components/adl_parser/src/syntax/cadl/parser/']
	]:
		env.Command(dir + prefix + 'scanner.e', dir + prefix + 'scanner.l', [['gelex', '-o', '$TARGET', '$SOURCE']])
		env.Command([dir + prefix + 'validator.e', dir + prefix + 'tokens.e'], dir + prefix + 'validator.y', [['geyacc', '--new_typing', '-v', dir + 'parser_errs.txt', '-t', prefix + 'tokens', '-o', '$TARGET', '-k', '${TARGETS[1]}', '$SOURCE']])
		env.Command(dir + prefix + 'validator.html', dir + prefix + 'validator.y', [['geyacc', '--doc=html', '-o', '$TARGET', '$SOURCE']])

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
			if not env.Detect('candle') or not env.Detect('light'):
				print 'WARNING! WiX is missing from your path: cannot build installer for ADL Workbench.'
			else:
				sources = Install('/', [adl_workbench[2], news]) + Install('/vim', vim)

				for source, dirnames, filenames in os.walk(icons):
					if '.svn' in dirnames: dirnames.remove('.svn')
					subdir = os.path.basename(source)
					if subdir == 'icons': subdir = ''
					#sources += Install('/icons/' + subdir, files(source + '/*'))

					# Hack to work around duplicate file IDs bug in Package():
					for f in files(source + '/*'):
						env.Tag(File(f), X_MSI_FILEID = subdir + os.path.basename(f))
						sources += Install('/icons/' + subdir, f)

				msi = env.Package(
					NAME        = 'ADL Workbench',
					DESCRIPTION = 'openEHR ADL Workbench',
					SUMMARY     = 'A rip snorter of a release',
					VERSION     = '1.4',
					PACKAGETYPE = 'msi',
					VENDOR      = 'Ocean Informatics',
					vendor      = 'Ocean Informatics',
					target      = distrib + 'tools/ADL_Workbench',
					source      = sources
				)

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
