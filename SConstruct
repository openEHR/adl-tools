import os
from Eiffel import files, eiffel_classes_in_cluster

EnsurePythonVersion(2, 4)
EnsureSConsVersion(0, 96, 92)

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'macintosh'

def install(dir, source):
	Alias('install', Install('../oe_distrib/' + platform + '/' + dir, source))

def eiffel(target, source):
	result = env.Eiffel(target, source)
	Default(Alias(str(target[0]), result))
	return result

openehr_clusters = eiffel_classes_in_cluster('libraries/openehr/src') + eiffel_classes_in_cluster('libraries/vendor-fixes') + eiffel_classes_in_cluster('libraries/common_libs/src')
all_clusters = openehr_clusters + eiffel_classes_in_cluster('libraries/version') + eiffel_classes_in_cluster('components/adl_parser/src') + eiffel_classes_in_cluster('components/archetype_repository/src')
sources = ['apps/adl_workbench/app/adl_workbench.ecf'] + eiffel_classes_in_cluster('apps/adl_workbench/src') + all_clusters

if platform == 'macintosh':
	eiffel('adl_workbench', sources)

if platform == 'windows':
	target = eiffel(['adl_workbench', 'adl_workbench_precompile'], sources)

	if len(target) > 2 and env.Detect('devenv'):
		dir = 'apps/adl_workbench/install/windows/ADL_Workbench/'

		sources = [
			dir + 'ADL_Workbench.sln',
			dir + 'ADL_Workbench.vdproj',
			target[2],
			'apps/adl_workbench/app/news.txt'
		] + files('apps/adl_workbench/app/icons/*') + files('apps/adl_workbench/etc/vim/*')

		msi = env.Command(dir + 'Release/ADL_Workbench.msi', sources, 'devenv $SOURCE /build Release')
		install('tools', msi)

	target = eiffel('adl_dotnet_lib.dll', ['components/adl_parser/lib/dotnet_dll/adl_dotnet_lib.ecf'] + all_clusters)

	if len(target) > 2:
		install('adl_parser/lib', [target[2], os.path.dirname(str(target[2])) + '/libadl_dotnet_lib.dll'])

	eiffel('common_libs_test', ['libraries/common_libs/test/app/common_libs_test.ecf'] + eiffel_classes_in_cluster('libraries/common_libs/test/src') + openehr_clusters)
	eiffel('openehr_test',     ['libraries/openehr/test/app/openehr_test.ecf']         + eiffel_classes_in_cluster('libraries/openehr/test/src') + openehr_clusters)
	eiffel('adl_parser_test',  ['components/adl_parser/test/app/adl_parser_test.ecf']  + eiffel_classes_in_cluster('components/adl_parser/test/src') + all_clusters)
