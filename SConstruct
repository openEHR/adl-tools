import os
from Eiffel import files, classes_in_cluster

env = Environment(ENV = os.environ, tools = ['Eiffel'], toolpath = ['.'])

if env['PLATFORM'] == 'win32': platform = 'windows'
if env['PLATFORM'] == 'darwin': platform = 'macosx'

TargetSignatures('content')	# Ensure applications are always installed after being rebuilt.

def install(dir, source):
	Alias('install', Install('../oe_distrib/' + platform + '/' + dir, source))

def eiffel(name, dir, classes):
	project = dir + '/app'
	if not os.path.exists(project): project = dir
	aces = [project + '/' + platform + '.ace']
	if not os.path.exists(aces[0]): aces = files(project + '/*.ace')
	target = env.Eiffel(name, aces + classes + classes_in_cluster(dir + '/src'))
	Default(target)
	Alias(name, target)
	return target

openehr = classes_in_cluster('libraries/openehr/src') + classes_in_cluster('libraries/vendor-fixes') + classes_in_cluster('libraries/common_libs/src')
version = classes_in_cluster('libraries/version')
adl_parser = classes_in_cluster('components/adl_parser/src')
archetype_repository = classes_in_cluster('components/archetype_repository/src')
target = eiffel('adl_workbench', 'apps/adl_workbench', version + openehr + adl_parser + archetype_repository)

if platform == 'windows':
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

	target = eiffel('adl_dotnet_lib.dll', 'components/adl_parser/lib/dotnet_dll', version + openehr + adl_parser + archetype_repository)
	if len(target) > 2: install('adl_parser/lib', [target[2], os.path.dirname(str(target[2])) + '/libadl_dotnet_lib.dll'])

	eiffel('common_libs_test', 'libraries/common_libs/test', openehr)
	eiffel('openehr_test', 'libraries/openehr/test', openehr)
	eiffel('adl_parser_test', 'components/adl_parser/test', version + openehr + adl_parser + archetype_repository)
