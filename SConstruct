import os, re, subprocess
from Eiffel import files

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 97, 0)

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'mac_osx'

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
	for scanner, parser, tokens, dir in [
		['adl_scanner', 'adl_validator', 'adl_tokens', 'components/adl_parser/src/syntax/adl/parser/'],
		['cadl_scanner', 'cadl_validator', 'cadl_tokens', 'components/adl_parser/src/syntax/cadl/parser/'],
		['dadl_scanner', 'dadl2_validator', 'dadl_tokens', 'libraries/common_libs/src/structures/syntax/dadl/parser/'],
		['units_scanner', 'units_parser', 'units_tokens', 'libraries/common_libs/src/unit_parser/parser/']
	]:
		gelex(dir + scanner + '.e', dir + scanner + '.l')
		geyacc([dir + parser + '.e', dir + tokens + '.e'], dir + parser + '.y')
		geyacc_html(dir + parser + '.html', dir + parser + '.y')

# Define how to build the Eiffel projects.

def eiffel(target, ecf, ectarget = None):
	if ectarget == None: ectarget = target
	if platform == 'mac_osx': ectarget += '_no_precompile'
	result = env.Eiffel(target, [ecf], ECTARGET = ectarget)
	Alias(target, result)
	return result

adl_workbench = eiffel('adl_workbench', 'apps/adl_workbench/app/adl_workbench.ecf')
eiffel('openehr_test',     'libraries/openehr/test/app/openehr_test.ecf')
eiffel('adl_parser_test',  'components/adl_parser/test/app/adl_parser_test.ecf')
eiffel('common_libs_test', 'libraries/common_libs/test/app/common_libs_test.ecf')

if platform == 'windows':
	adl_parser = eiffel('adl_dotnet_lib.dll', 'components/adl_parser/lib/dotnet_dll/adl_dotnet_lib.ecf', 'adl_dotnet_lib')

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
					'-XOutFile ${TARGET.abspath}',
					'$SOURCE'
				]

				env.Command(distrib + 'tools/OceanADLWorkbenchInstall.exe', sources, [command])

		if len(adl_parser) > 2:
			unmanaged_dll = os.path.dirname(str(adl_parser[2])) + '/lib' + os.path.basename(str(adl_parser[2]))
			SideEffect(unmanaged_dll, adl_parser[2])
			Install(distrib + 'adl_parser/lib', [adl_parser[2], unmanaged_dll])

	if platform == 'mac_osx':
		if len(adl_workbench) > 2:
			packagemaker = '/Developer/usr/bin/packagemaker'

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

	# Set the Subversion revision number as the final part of the file version string.

	if not env.Detect('svnversion'):
		print 'WARNING! The svnversion command is missing from your path: cannot set the revision part of the version number.'
	else:
		revision = re.match(r'\d+', os.popen('svnversion').read())

		if revision:
			revision = revision.group()

			def rename_file(src, dst):
				if os.path.exists(src):
					if os.path.exists(dst): os.remove(dst)
					os.rename(src, dst)

			def set_revision_from_subversion(target, source, env):
				global backed_up_files
				backed_up_files = []
				substitutions = [['libraries/version/openehr_version.e', r'\b(revision:\s*INTEGER\s*=\s*)\d+']]

				if target == adl_workbench and platform == 'windows':
					substitutions += [['apps/adl_workbench/app/adl_workbench.rc', r'(#define\s+VER_\S+\s+"?\d+[,.]\d+[,.]\d+[,.])\d+']]

				if target == adl_parser:
					substitutions += [['components/adl_parser/lib/dotnet_dll/adl_dotnet_lib.ecf', r'(<version\s+major="\d+"\s+minor="\d+"\s+release="\d+"\s+build=")\d+']]

				for filename, pattern in substitutions:
					bak = filename + '.bak'
					rename_file(filename, bak)
					backed_up_files.append(filename)

					f = open(bak, 'r')
					try: s = f.read()
					finally: f.close()

					s = re.sub(pattern, r'\g<1>' + revision, s)
					f = open(filename, 'w')
					try: f.write(s)
					finally: f.close()

			def restore_backed_up_files(target, source, env):
				global backed_up_files

				for filename in backed_up_files:
					rename_file(filename + '.bak', filename)

			targets = [adl_workbench]
			if platform == 'windows': targets += [adl_parser]
			env.AddPreAction(targets, env.Action(set_revision_from_subversion, None))
			env.AddPostAction(targets, env.Action(restore_backed_up_files, None))
