import os
from Eiffel import files, eiffel_classes_in_cluster

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 96, 92)

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'macintosh'

def install_path(name):
	return '../oe_distrib/' + platform + '/' + name

def install(dir, source):
	Alias('install', Install(install_path(dir), source))

def eiffel(target, source):
	result = env.Eiffel(target, source)
	Default(Alias(str(target[0]), result))
	return result

openehr_clusters = eiffel_classes_in_cluster('libraries/openehr/src') + eiffel_classes_in_cluster('libraries/vendor-fixes') + eiffel_classes_in_cluster('libraries/common_libs/src')
all_clusters = openehr_clusters + eiffel_classes_in_cluster('libraries/version') + eiffel_classes_in_cluster('components/adl_parser/src') + eiffel_classes_in_cluster('components/archetype_repository/src')
sources = ['apps/adl_workbench/app/adl_workbench.ecf'] + eiffel_classes_in_cluster('apps/adl_workbench/src') + all_clusters
icons = 'apps/adl_workbench/app/icons'
news = 'apps/adl_workbench/app/news.txt'
vim = files('apps/adl_workbench/etc/vim/*')

if platform == 'windows':
	target = eiffel(['adl_workbench', 'adl_workbench_precompile'], sources)

	if len(target) > 2 and env.Detect('devenv'):
		dir = 'apps/adl_workbench/install/windows/ADL_Workbench/'

		sources = [
			dir + 'ADL_Workbench.sln',
			dir + 'ADL_Workbench.vdproj',
			target[2],
			news
		] + vim

		for source, dirnames, filenames in os.walk(icons):
			if '.svn' in dirnames: dirnames.remove('.svn')
			sources += files(source + '/*')

		msi = env.Command(dir + 'Release/ADL_Workbench.msi', sources, 'devenv $SOURCE /build Release')
		install('tools', msi)

	target = eiffel(['adl_dotnet_lib.dll'], ['components/adl_parser/lib/dotnet_dll/adl_dotnet_lib.ecf'] + all_clusters)

	if len(target) > 2:
		install('adl_parser/lib', [target[2], os.path.dirname(str(target[2])) + '/libadl_dotnet_lib.dll'])

	eiffel(['openehr_test'],     ['libraries/openehr/test/app/openehr_test.ecf']         + eiffel_classes_in_cluster('libraries/openehr/test/src') + openehr_clusters)
	eiffel(['adl_parser_test'],  ['components/adl_parser/test/app/adl_parser_test.ecf']  + eiffel_classes_in_cluster('components/adl_parser/test/src') + all_clusters)

#	TODO: common_libs_test does not compile!
#	eiffel(['common_libs_test'], ['libraries/common_libs/test/app/common_libs_test.ecf'] + eiffel_classes_in_cluster('libraries/common_libs/test/src') + openehr_clusters)

if platform == 'macintosh':
	target = eiffel(['adl_workbench'], sources)
	packagemaker = '/Developer/Tools/packagemaker'

	if len(target) > 2 and os.path.exists(packagemaker):
		dir = 'apps/adl_workbench/install/macintosh/'
		root = dir + 'ADL_Workbench/'
		bin = root + 'ADL Workbench.app/Contents/Resources/bin/'
		resources = dir + 'English.lproj/'
		info = dir + 'Info.plist'
		description = dir + 'Description.plist'

		sources = [info, description]
		sources += Install(bin, target[2])
		sources += Install(bin, news)
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
			substitutions = '2s|^.+$|<h2>&</h2>|;s|^[A-Z].+$|<h3>&</h3>|;s|^$|<br><br>|;s|^-+$||'
			sources += env.Command(html, txt, 'sed -E \'' + substitutions + '\' $SOURCE > $TARGET')

		command = [
			packagemaker, '-build',
			'-p', '$TARGET',
			'-f', root,
			'-r', resources,
			'-i', info,
			'-d', description
		]

		pkg = env.Command(install_path('tools/ADL Workbench.pkg'), sources, [command])
		Alias('install', pkg)
