import os, shutil, re, fnmatch

EnsurePythonVersion(2, 4)
EnsureSConsVersion(1, 0, 0)

env = Environment(ENV = os.environ, tools = ['default', 'Eiffel'], toolpath = ['scripts'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'posix': platform = 'linux'
if env['PLATFORM'] == 'darwin': platform = 'mac_osx'

###################################################################################################
# Pull the various git repositories if 'git=1' is one of the command line arguments.

if ARGUMENTS.get('git', 0):
       for dir in ['.', '../reference-models', '../terminology', '../EOMF', '../eiffelhub/iso8601']:
               os.popen('git -C ' + os.path.abspath(dir) + ' pull')

###################################################################################################
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

for scanner, parser, tokens, dir in [
	['adl_scanner', 'adl_validator', 'adl_tokens', 'libraries/parsers/adl/'],
	['cadl_scanner', 'cadl_validator', 'cadl_tokens', 'libraries/parsers/cadl/'],
	['units_scanner', 'units_parser', 'units_tokens', 'libraries/parsers/ucum/parser/']
]:
	gobo(scanner, [dir + scanner + '.e'], dir + scanner + '.l', [gelex])
	gobo(parser, [dir + parser + '.e', dir + tokens + '.e'], dir + parser + '.y', [geyacc])
	gobo(parser, [dir + parser + '.html'], dir + parser + '.y', [geyacc_html])

###################################################################################################
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

# eiffel('adl_compiler_app', 'apps/adl_compiler_app/app/adl_compiler_app.ecf')
# adl_compiler = eiffel('adl_compiler', 'deployment/c/adl_compiler/adl_compiler.ecf')

###################################################################################################
# Define how to build the ADL compiler static library and its test C language wrapper.

# make = ['make']
# libs = []
# include = env.EiffelSpecPath('studio', 'include')

# if env.EiffelEnvironmentVariable('ISE_C_COMPILER') == 'msc':
#	make = ['nmake', '/nologo']
#	libs = ['ws2_32']

#adl_compiler_lib = env.Command('${SOURCE.dir}/lib${SOURCE.filebase}$LIBSUFFIX', adl_compiler, [make + ['cecil']], chdir = 1)
#env.Program(['deployment/c/c_tester_for_adl_compiler/adlc_test_app.c', adl_compiler_lib], CPPPATH=include, LIBS=libs)

###################################################################################################
# Define how to generate the terminology and reference model schemas directories.

terminology = 'terminology'
rm_schemas = 'rm_schemas'
aom_profiles = 'aom_profiles'

env.Install(terminology, env.Glob('../terminology/openEHR_RM/RM/Release-1.0.2/*'))

for dir, dirnames, filenames in os.walk('../reference-models/models'):
	if '.git' in dirnames: dirnames.remove('.git')
	env.Install(rm_schemas, [os.path.join(dir, filename) for filename in fnmatch.filter(filenames, '*.bmm')])

env.Install(aom_profiles, env.Glob('apps/resources/aom_profiles/*.arp'))

###################################################################################################
# Define how to put installers, etc., into the downloads directory.
# These are not performed unless a path containing 'downloads' is explicitly requested on the command line.

downloads = None
installer = None

for target in COMMAND_LINE_TARGETS:
	s = os.path.normpath(target)

	while downloads == None and s != os.path.dirname(s):
		if os.path.basename(s) == 'downloads':
			downloads = s + '/' + platform
		else:
			s = os.path.dirname(s)

if downloads and len(adl_workbench) > 0:
	license = 'LICENSE.txt'
	xsl = 'apps/adl_workbench/app/ArchetypeRepositoryReport.xsl'
	css = 'apps/adl_workbench/app/ArchetypeRepositoryReport.css'
	xml_rules = 'apps/adl_workbench/app/sample_xml_rules.cfg'
	ui_config = 'apps/adl_workbench/app/default_ui_config.cfg'
	testscripts = 'apps/adlc/test'
	install = 'apps/adl_workbench/install/' + platform

	adl_workbench_installer_sources = [adl_workbench[0], adlc[0], license, xsl, css, xml_rules, ui_config, terminology, rm_schemas, aom_profiles]

	for root in [install, testscripts]:
		for dir, dirnames, filenames in os.walk(root):
			if '.git' in dirnames: dirnames.remove('.git')
			adl_workbench_installer_sources += [os.path.join(dir, filename) for filename in filenames]

	if platform == 'windows':
		Install(downloads + '/adl_parser/dotnet', adl_parser)

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

			installer = env.Command(downloads + '/adl_workbench/ADLWorkbenchInstall.exe', adl_workbench_installer_sources + env.Glob(install + '/ADL_Workbench/*'), [command])

	if platform == 'linux':
		def create_linux_installer(target, source, env):
			import tarfile
			tar = tarfile.open(str(target[0]), 'w:bz2')

			for src in [str(adl_workbench[0]), str(adlc[0]), license, xsl, css, xml_rules, ui_config]:
				tar.add(src, os.path.basename(src))

			for root in [terminology, rm_schemas, aom_profiles, testscripts]:
				root_dirname_length = len(os.path.dirname(root))

				for dir, dirnames, filenames in os.walk(root):
					if '.git' in dirnames: dirnames.remove('.git')

					if root_dirname_length > 0:
						archived_dir = dir[root_dirname_length + 1:]
					else:
						archived_dir = dir

					for name in filenames: tar.add(os.path.join(dir, name), os.path.join(archived_dir, name))

			tar.close()

		env.Command(downloads + '/adl_workbench/adl_workbench-linux.tar.bz2', adl_workbench_installer_sources, create_linux_installer)

	if platform == 'mac_osx':
		pkg_tmp = downloads + '/' + platform
		pkg_contents = pkg_tmp + '/contents'
		pkg_resources = pkg_tmp + '/resources'

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
			copy_tree(install, downloads)

			for src in [str(adl_workbench[0]), str(adlc[0]), license, xsl, css, xml_rules, ui_config, terminology, rm_schemas, aom_profiles, testscripts]:
				copy_tree(src, pkg_contents)

			substitutions = 's|\&|\&amp;|;'
			substitutions += 's|\<|\&lt;|;'
			substitutions += 's|\>|\&gt;|;'
			substitutions += '2s|^.+$|<h2>&</h2>|;'
			substitutions += 's|^[A-Z].+$|<h3>&</h3>|;'
			substitutions += 's|^$|<br><br>|;'
			substitutions += 's|^-+$||'
			f = open(pkg_resources + '/License.html', 'w')
			f.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"')
    			f.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">')
			f.write('<html lang="en" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">')
  			f.write('<body>')
			f.write(os.popen('sed -E \'' + substitutions + '\' ' + license).read())
  			f.write('</body>')
  			f.write('</html>')
			f.close()

		pkg_name = ''
		match = re.match(r'\d+', os.popen('uname -r').read())

		if match:
			pkg_name = match.group()
			if pkg_name == '9': pkg_name = 'for Leopard'
			if pkg_name == '10': pkg_name = 'for Snow Leopard'
			if pkg_name == '11': pkg_name = 'for Lion'
			if pkg_name == '12': pkg_name = 'for Mountain Lion'
			if pkg_name == '13': pkg_name = 'for Mavericks'
			if pkg_name == '14': pkg_name = 'for Yosemite'
			if pkg_name == '15': pkg_name = 'for El Capitan'

		pkg_name = 'ADL Workbench ' + pkg_name

		pkgbuild = [
			'pkgbuild',
			'--root', pkg_contents,
			'--component-plist', pkg_tmp + '/Component.plist',
			'--scripts', pkg_tmp + '/scripts',
			'--identifier', 'org.openehr.adl_workbench',
			'--version', '1.5.1',
			'--ownership', 'recommended',
			'--install-location', '/Applications/openEHR',
			pkg_tmp + '/ADL Workbench.pkg'
		]

		productbuild = [
			'productbuild',
			'--distribution', pkg_tmp + '/Distribution.xml',
			'--resources', pkg_resources,
			'--package-path', pkg_tmp,
			pkg_tmp + '/' + pkg_name + '.pkg'
		]

		installer = env.Command(downloads + '/adl_workbench/' + pkg_name + '.dmg', adl_workbench_installer_sources, [
			Delete(pkg_tmp),
			env.Action(copy_mac_osx_installer_sources, 'Copying installer files to ' + pkg_tmp),
			pkgbuild,
			productbuild,
			['hdiutil', 'create', '-srcfolder', pkg_tmp + '/' + pkg_name + '.pkg', '$TARGET'],
			Delete(pkg_tmp)
			])

###################################################################################################
# Set the revision number at the end of the file string.
# The revision is retrieved from git as the numeric part of a string similar to "Revision-925-g749e8be".
# This gives us a monotonically increasing number, roughly like Subversion revision numbers.
# We add 1000 to it so as to preserve continuity, more or less, with the old Subversion revision numbering.
# For this to work, a git tag called "Revision" must previously have been set up with a command similar to:
#	git tag -m 'Tag for the initial commit.' Revision b900305458cf617ac511c7fdbc5cd183f9bdbd15

if not env.Detect('git'):
	print 'WARNING! The git command is missing from your path: cannot set the revision part of the version number.'
else:
	match = re.match(r'Revision-(\d+)', os.popen('git describe --match Revision').read())

	if not match:
		print 'WARNING! The git Revision tag was missing: cannot set the revision part of the version number.'
	else:
		revision = str(int(match.group(1)) + 1000)

		def backup_filename(filename):
			split = os.path.split(filename)
			return os.path.join(split[0], '.' + split[1] + '.bak.' + revision)

		def set_revision(target, source, env):
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
		env.AddPreAction(versioned_targets, env.Action(set_revision, 'Setting revision ' + revision + ' ...'))
		env.AddPostAction(versioned_targets, env.Action(restore_backed_up_files, None))
