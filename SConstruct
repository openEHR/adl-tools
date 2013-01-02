import os, shutil, re

EnsurePythonVersion(2, 4)
EnsureSConsVersion(1, 0, 0)

env = Environment(ENV = os.environ, tools = ['default', 'Eiffel'], toolpath = ['scripts'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'posix': platform = 'linux'
if env['PLATFORM'] == 'darwin': platform = 'mac_osx'

# Define how to build the parser classes, using the Gobo tools.
# These are not performed unless explicitly requested on the command line in one of the following ways:
# * The target 'gobo' builds all of the lex and parser targets.
# * Listing specific lex or parser class names builds only the targets related to those names.
# * Listing specific paths builds only the targets under those paths.

def is_subpath(subpath, whole):
	s = os.path.abspath(subpath)
	return os.path.commonprefix([os.path.abspath(whole), os.path.abspath(s)]) == s

def gobo(alias, target, source, action):
	if 'gobo' in COMMAND_LINE_TARGETS or alias in COMMAND_LINE_TARGETS or [t for t in target for c in COMMAND_LINE_TARGETS if is_subpath(c, t)]:
		Alias('gobo', Alias(alias, env.Command(target, source, action)))

gelex = Action([['gelex', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

geyacc = Action([['geyacc', '--new_typing', '-v', '${TARGET.filebase}.txt', '-t', '${TARGETS[1].filebase}', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

geyacc_html = Action([['geyacc', '--doc=html', '-o', '${TARGET.file}', '${SOURCE.file}']], chdir = 1)

eiffel_syntax_updater = [env.EiffelSpecPath('tools' , 'bin/syntax_updater'),  '${TARGET.dir}']

for scanner, parser, tokens, dir in [
	['adl_scanner', 'adl_validator', 'adl_tokens', 'components/adl_compiler/src/syntax/adl/parser/'],
	['cadl_scanner', 'cadl_validator', 'cadl_tokens', 'components/adl_compiler/src/syntax/cadl/parser/'],
	['dadl_scanner', 'dadl2_validator', 'dadl_tokens', 'libraries/common_libs/src/structures/syntax/dadl/parser/'],
	['units_scanner', 'units_parser', 'units_tokens', 'libraries/common_libs/src/unit_parser/parser/'],
	['og_path_scanner', 'og_path_validator', 'og_path_tokens', 'libraries/common_libs/src/structures/object_graph/path/']
]:
	gobo(scanner, [dir + scanner + '.e'], dir + scanner + '.l', [gelex, eiffel_syntax_updater])
	gobo(parser, [dir + parser + '.e', dir + tokens + '.e'], dir + parser + '.y', [geyacc, eiffel_syntax_updater])
	gobo(parser, [dir + parser + '.html'], dir + parser + '.y', [geyacc_html])

# Define how to build the Eiffel projects.

def eiffel(target, ecf):
	result = env.Eiffel(target, ecf)
	Alias(target, result)
	return result

adl_workbench = eiffel('adl_workbench', 'apps/adl_workbench/app/adl_workbench.ecf')
adlc = eiffel('adlc', 'apps/adlc/app/adlc.ecf')
versioned_targets = [adl_workbench, adlc]

if platform == 'windows':
	adl_parser = eiffel('adl_parser', 'deployment/dotnet/dll/adl_parser.ecf')
	versioned_targets += [adl_parser]

eiffel('bmm_demo', 'apps/bmm_demo/app/bmm_demo.ecf')
eiffel('dadl_test', 'apps/dadl_test/app/dadl_test.ecf')
eiffel('adl_compiler_app', 'apps/adl_compiler_app/app/adl_compiler_app.ecf')
adl_compiler = eiffel('adl_compiler', 'deployment/c/adl_compiler/adl_compiler.ecf')

# Define how to build the ADL compiler static library and its test C language wrapper.

make = ['make']
libs = []
include = env.EiffelSpecPath('studio', 'include')

if env.EiffelEnvironmentVariable('ISE_C_COMPILER') == 'msc':
	make = ['nmake', '/nologo']
	libs = ['ws2_32']

adl_compiler_lib = env.Command('${SOURCE.dir}/lib${SOURCE.filebase}$LIBSUFFIX', adl_compiler, [make + ['cecil']], chdir = 1)
env.Program(['deployment/c/c_tester_for_adl_compiler/adlc_test_app.c', adl_compiler_lib], CPPPATH=include, LIBS=libs)

# Define how to generate the reference model schemas directory.

rm_schemas = []

for dir, dirnames, filenames in os.walk('reference-models'):
		if '.svn' in dirnames: dirnames.remove('.svn')
		if '.git' in dirnames: dirnames.remove('.git')
		rm_schemas += env.Install('rm_schemas', env.Files(dir + '/*.bmm'))

Alias('rm_schemas', rm_schemas)

# Define how to put installers, etc., into the distribution directory.
# These are not performed unless a path containing 'downloads' is explicitly requested on the command line.

distrib = None
installer = None

for target in COMMAND_LINE_TARGETS:
	s = os.path.normpath(target)

	while distrib == None and s != os.path.dirname(s):
		if os.path.basename(s) == 'downloads':
			distrib = s + '/' + platform
		else:
			s = os.path.dirname(s)

if distrib and len(adl_workbench) > 0:
	license = 'apps/adl_workbench/doc/LICENSE.txt'
	xsl = 'apps/adl_workbench/app/ArchetypeRepositoryReport.xsl'
	css = 'apps/adl_workbench/app/ArchetypeRepositoryReport.css'
	xml_rules = 'apps/adl_workbench/app/sample_xml_rules.cfg'
	ui_config = 'apps/adl_workbench/app/default_ui_config.cfg'
	icons = 'apps/adl_workbench/app/icons'
	terminology = 'apps/adl_workbench/app/terminology'
	error_db = 'apps/adl_workbench/app/error_db'
	vim = 'components/adl_compiler/etc/vim'
	install = 'apps/adl_workbench/install/' + platform
	adl_workbench_installer_sources = [adl_workbench[0], adlc[0], license, xsl, css, xml_rules, ui_config] + rm_schemas

	for root in [icons, terminology, error_db, vim, install]:
		for dir, dirnames, filenames in os.walk(root):
			if '.svn' in dirnames: dirnames.remove('.svn')
			if '.git' in dirnames: dirnames.remove('.git')
			adl_workbench_installer_sources += env.Files(dir + '/*')

	if platform == 'windows':
		Install(distrib + '/adl_parser/dotnet', adl_parser)

		if not env.Detect('makensis'):
			print 'WARNING! NSIS is missing from your path: cannot build installer for ADL Workbench.'
		else:
			command = [
				'makensis', '-V1',
				'-XOutFile ${TARGET.abspath}',
				'-DADL_WORKBENCH_EXE=${SOURCES[0].abspath}',
				'-DADLC_EXE=${SOURCES[1].abspath}',
				install + '/ADL_Workbench/ADLWorkbenchInstall.nsi'
			]

			installer = env.Command(distrib + '/adl_workbench/ADLWorkbenchInstall.exe', adl_workbench_installer_sources + env.Files(install + '/ADL_Workbench/*'), [command])

	if platform == 'linux':
		def create_linux_installer(target, source, env):
			import tarfile
			tar = tarfile.open(str(target[0]), 'w:bz2')

			for src in [str(adl_workbench[0]), str(adlc[0]), license, xsl, css, xml_rules, ui_config]:
				tar.add(src, os.path.basename(src))

			for root in [icons, terminology, error_db, vim, 'rm_schemas']:
				root_dirname_length = len(os.path.dirname(root))

				for dir, dirnames, filenames in os.walk(root):
					if '.svn' in dirnames: dirnames.remove('.svn')
					if '.git' in dirnames: dirnames.remove('.git')

					if root_dirname_length > 0:
						archived_dir = dir[root_dirname_length + 1:]
					else:
						archived_dir = dir

					for name in filenames: tar.add(os.path.join(dir, name), os.path.join(archived_dir, name))

			tar.close()

		env.Command(distrib + '/adl_workbench/adl_workbench-linux.tar.bz2', adl_workbench_installer_sources, create_linux_installer)

	if platform == 'mac_osx':
		packagemaker = '/Developer/usr/bin/packagemaker'
		if not os.path.exists(packagemaker): packagemaker = '/Developer/Tools/packagemaker'

		if not os.path.exists(packagemaker):
			print 'WARNING! ' + packagemaker + ' is missing: cannot build installer for ADL Workbench.'
		else:
			pkg_tree = distrib + '/' + platform
			pkg_contents = pkg_tree + '/ADL_Workbench'
			pkg_resources = pkg_tree + '/English.lproj'

			def copy_tree(src, dir):
				name = os.path.basename(src)

				if not name.startswith('.'):
					dst = os.path.join(dir, name)

					if os.path.isfile(src):
						shutil.copy2(src, dst)
					else:
						os.mkdir(dst)
						for name in os.listdir(src): copy_tree(os.path.join(src, name), dst)

			def copy_mac_osx_installer_sources(target, source, env):
				copy_tree(install, distrib)
				copy_tree(vim, pkg_contents)

				for src in [str(adl_workbench[0]), str(adlc[0]), license, xsl, css, xml_rules, ui_config, icons, terminology, error_db, 'rm_schemas']:
					copy_tree(src, pkg_contents + '/ADL Workbench.app/Contents/Resources/')

				for src, dst in [['apps/adl_workbench/doc/web/release_notes.html', 'Welcome.html'], ['apps/adl_workbench/doc/web/help-mac_install.html', 'ReadMe.html']]:
					substitutions = 's|\</head\>|<base href="http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/apps/adl_workbench/doc/web/" /></head>|;'
					substitutions += 's|div id="header"|div style="display: none;"|'
					f = open(pkg_resources + '/' + dst, 'w')
					f.write(os.popen('sed -E \'' + substitutions + '\' ' + src).read())
					f.close()

				substitutions = 's|\&|\&amp;|;'
				substitutions += 's|\<|\&lt;|;'
				substitutions += 's|\>|\&gt;|;'
				substitutions += '2s|^.+$|<h2>&</h2>|;'
				substitutions += 's|^[A-Z].+$|<h3>&</h3>|;'
				substitutions += 's|^$|<br><br>|;'
				substitutions += 's|^-+$||'
				f = open(pkg_resources + '/License.html', 'w')
				f.write(os.popen('sed -E \'' + substitutions + '\' ' + license).read())
				f.close()

			pkg_name = ''
			match = re.match(r'\d+', os.popen('uname -r').read())

			if match:
				pkg_name = match.group()
				if pkg_name == '9': pkg_name = 'for Leopard'
				if pkg_name == '10': pkg_name = 'for Snow Leopard'
				if pkg_name == '11': pkg_name = 'for Lion'
				if pkg_name == '12': pkg_name = 'for Mountain Lion'

			pkg_name = 'ADL Workbench ' + pkg_name + ' ' + os.popen('uname -p').read().strip()
			pkg_path = pkg_tree + '/' + pkg_name + '.pkg'

			command = [
				packagemaker, '-build',
				'-p', pkg_path,
				'-f', pkg_contents,
				'-r', pkg_resources,
				'-i', pkg_tree + '/Info.plist',
				'-d', pkg_tree + '/Description.plist'
			]

			installer = env.Command(distrib + '/adl_workbench/' + pkg_name + '.dmg', adl_workbench_installer_sources, [
				Delete(pkg_tree),
				env.Action(copy_mac_osx_installer_sources, 'Copying installer files to ' + pkg_tree),
				command,
				Move(pkg_path + '/Contents/Resources/TokenDefinitions.plist', pkg_tree + '/TokenDefinitions.plist'),
				['hdiutil', 'create', '-srcfolder', pkg_path, '$TARGET'],
				Delete(pkg_tree)
				])

# Set the Subversion revision number as the final part of the file version string.

if not env.Detect('svnversion'):
	print 'WARNING! The svnversion command is missing from your path: cannot set the revision part of the version number.'
else:
	match = re.match(r'\d+', os.popen('svnversion .').read())

	if match:
		revision = match.group()

		def backup_filename(filename):
			split = os.path.split(filename)
			return os.path.join(split[0], '.' + split[1] + '.bak.' + revision)

		def set_revision_from_subversion(target, source, env):
			global backed_up_files
			backed_up_files = []
			substitutions = [['libraries/version/openehr_version.e', r'\b(revision:\s*INTEGER\s*=\s*)\d+']]

			if platform == 'windows':
				if target == adl_workbench:
					substitutions += [['apps/adl_workbench/app/adl_workbench.rc', r'(#define\s+VER_\S+\s+"?\d+[,.]\d+[,.]\d+[,.])\d+']]

				if target == adl_parser:
					substitutions += [['deployment/dotnet/dll/adl_parser.ecf', r'(<version\s+major="\d+"\s+minor="\d+"\s+release="\d+"\s+build=")\d+']]

				if target == installer:
					substitutions = [[install + '/ADL_Workbench/ADLWorkbenchInstall.nsi', r'(VIProductVersion\s+\d+\.\d+\.\d+\.)\d+']]

			if platform == 'mac_osx' and target == installer:
				pattern = r'(<string>\d+\.\d+\.\d+\.)\d+'
				substitutions = [
					[install + '/Info.plist', pattern],
					[install + '/ADL_Workbench/ADL Workbench.app/Contents/Info.plist', pattern]
					]

			for filename, pattern in substitutions:
				if os.path.exists(filename):
					f = open(filename, 'r')
					try: s = f.read()
					finally: f.close()

					if s:
						s = re.sub(pattern, r'\g<1>' + revision, s)
						bak = backup_filename(filename)
						if not os.path.exists(bak): os.rename(filename, bak)
						backed_up_files.append(filename)
						f = open(filename, 'w')
						try: f.write(s)
						finally: f.close()

		def restore_backed_up_files(target, source, env):
			global backed_up_files

			for filename in backed_up_files:
				bak = backup_filename(filename)

				if os.path.exists(bak):
					if os.path.exists(filename): os.remove(filename)
					os.rename(bak, filename)

		if installer: versioned_targets += [installer]
		env.AddPreAction(versioned_targets, env.Action(set_revision_from_subversion, 'Setting revision ' + revision + ' ...'))
		env.AddPostAction(versioned_targets, env.Action(restore_backed_up_files, None))
