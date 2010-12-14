/*
 * OpenEHRManager.cpp
 *
 *  Created on: 28 Aug 2010
 *      Author: sarikan
 */

//#include "iostream.h"
#include "OpenEHRManager.h"
#include <iostream>
#include <string>
#include <vector>
#include "eif_setup.h"  /* Macros EIF_INITIALIZE and EIF_DISPOSE_ALL */
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */
#include "ExperimentalApplicationEiffelAccessHelper.h"

using namespace std;

OpenEHRManager::OpenEHRManager(){
	int argc = 1;
	char *argv[] = {"EiffelBridgeNativeClient", NULL};
	char **envp = NULL;

	archetypeVisitor = NULL;
	logger = NULL;

	EIF_INITIALIZE(failure)}//this is required due to way this macro is written
	tid = eif_type_id ("EXPERIMENTAL_APPLICATION");
	if (tid == EIF_NO_TYPE)
	eif_panic ("No type id.");
	eiffelObj = eif_create (tid); /* Create eiffel object, returns an indirection. */
	experimentalAppHelper = new ExperimentalApplicationEiffelAccessHelper(eiffelObj, tid);
	eif_enable_visible_exception();
}

void OpenEHRManager::setErrorDBDirPath(string& pPath){
	char* cStr = const_cast<char*>(pPath.c_str());	
	experimentalAppHelper->callEiffelProcedureWthStringParameter("set_error_db_dir_location", cStr);
}

void OpenEHRManager::setRmSchemaDirPath(string& pPath){
	char* cStr = const_cast<char*>(pPath.c_str());
	experimentalAppHelper->callEiffelProcedureWthStringParameter("set_rm_schema_dir_location", cStr);
}

void OpenEHRManager::compileArchetype(string& pArchetypeName){
	char* cStr = const_cast<char*>(pArchetypeName.c_str());
	experimentalAppHelper->callEiffelProcedureWthStringParameter("compile_archetype", cStr);
}

void OpenEHRManager::setVisitor(ArchetypeVisitor *pVisitor){
	pVisitor->setExperimentalAppHelper(experimentalAppHelper);
	experimentalAppHelper->callEiffelProcedureOnObjWthEifObjParam("save_cpp_visitor", eiffelObj, "EXPERIMENTAL_APPLICATION", pVisitor);
}


void OpenEHRManager::setLogger(ILogger *pLogger){
	logger = pLogger;		
	if(logger != NULL){
		EIF_OBJECT loggerObj = experimentalAppHelper->callReferenceFunc("logger");
		experimentalAppHelper->callEiffelProcedureOnObjWthEifObjParam("set_cpp_logger", loggerObj, "LOGGER", logger);
	}
}

void OpenEHRManager::testLogger(){
	if(logger != NULL){		
		EIF_OBJECT loggerObj  = experimentalAppHelper->callReferenceFunc("logger");
		experimentalAppHelper->callEiffelProcedureOnObjWthEifObjParam("set_cpp_logger", loggerObj, "LOGGER", logger);
		experimentalAppHelper->callEiffelProcedureOnObj("test", loggerObj, "LOGGER");
	}
}


void OpenEHRManager::performParsing(){
	experimentalAppHelper->callEiffelProcedure("perform_parsing");
}

void OpenEHRManager::callMake(){
	experimentalAppHelper->callEiffelProcedure("make");
}

vector<string>* OpenEHRManager::getArchetypeNames(){	
	EIF_OBJECT arrObject = experimentalAppHelper->callReferenceFunc("archetype_names");
	EIF_INTEGER countResult = experimentalAppHelper->callIntegerFuncOnObj("count", arrObject, "ARRAY[STRING]");
	
	vector<string>* archetypeNames = new vector<string>;
	for(int i = 0; i < countResult; i++){		
		EIF_OBJECT itemResult = experimentalAppHelper->callReferenceFuncOnObjWthIntParam("item", i, arrObject, "ARRAY[STRING]");
		string* str = experimentalAppHelper->getStringFromEiffelString(itemResult);
		archetypeNames->push_back(*str);
	}
	return archetypeNames;
}



int OpenEHRManager::getFunctionCallResult(){
	EIF_INTEGER_32_FUNCTION get_int_value = eif_integer_32_function("get_int_value", tid);
//	EIF_INTEGER_32 funcCallResult = get_int_value(eif_access(eiffelObj), counter);
//	counter++;
//	return funcCallResult;
	return 0;
}

OpenEHRManager::~OpenEHRManager() {
	if(archetypeVisitor != NULL)
		delete archetypeVisitor;
	if(logger != NULL)
		delete logger;
	delete experimentalAppHelper;
//	cout << "NOW DESTROYING EIFFEL RUNTIME";
	reclaim();
}

