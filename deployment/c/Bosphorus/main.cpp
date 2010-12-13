#include <stdio.h>
#include "eif_setup.h"
#include "eif_eiffel.h"
#include "ArchetypeVisitor.h"
#include <string>
#include <iostream>
#include "OpenEHRManager.h"
#include "JNILogger.h"
#include "ArchetypeLogger.h"

using namespace std;

int main (int argc,char **argv,char **envp) {
	cout << "will fix the issue" << endl;
	
	OpenEHRManager* manager = new OpenEHRManager();
	string errorDir = string("c:\\tmp\\error_db");
	manager->setErrorDBDirPath(errorDir);
	string schemaDir = string("c:\\tmp\\rm_schemas");
	manager->setRmSchemaDirPath(schemaDir);
	vector<string>* names = manager->getArchetypeNames();
	string name = names->at(2);
	cout << name;
	
	ArchetypeVisitor* visitor = new ArchetypeVisitor;
	manager->setVisitor(visitor);

	ArchetypeLogger *logger = new ArchetypeLogger();
	//manager->setLogger(logger);
	manager->testLogger();

	string& arcNameToCompile = name;	
	manager->compileArchetype(arcNameToCompile);
	
	delete(manager);
	string someChars;
	cout << "type something, and press enter" << endl;
	cin >> someChars;
		
	
	return 0;	


}

//#ifdef EIF_WIN32
//int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
//{
//	int argc;
//	char **argv;
//	char **envp;
//
//	get_argcargv (&argc, &argv);
//	envp = (char **) GetEnvironmentStrings ();
//	return main(argc, argv, envp);
//}
//#endif

