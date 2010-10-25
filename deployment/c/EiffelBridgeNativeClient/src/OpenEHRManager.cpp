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

using namespace std;

OpenEHRManager::OpenEHRManager() {
	int argc = 1;
	char *argv[] = {"EiffelBridgeNativeClient", NULL};
	char **envp = NULL;


	EIF_INITIALIZE(failure)}//this is required due to way this macro is written
	tid = eif_type_id ("EXPERIMENTAL_APPLICATION");
	if (tid == EIF_NO_TYPE)
	eif_panic ("No type id.");
	eiffelObj = eif_create (tid); /* Create eiffel object, returns an indirection. */
	eif_enable_visible_exception();
}

void OpenEHRManager::setErrorDBDirPath(string& pPath){
	EIF_PROCEDURE setErrorDBLoc = eif_procedure("set_error_db_dir_location", tid);
	char* cStr = const_cast<char*>(pPath.c_str());
	cout << "this is error db path: ";
	cout << cStr << endl;
//	setErrorDBLoc(eif_access(eiffelObj), eif_string("c:\\tmp\\error_db"));
	setErrorDBLoc(eif_access(eiffelObj), eif_string(cStr));
}

void OpenEHRManager::setRmSchemaDirPath(string& pPath){
	EIF_PROCEDURE setRMSchemaDirLoc = eif_procedure("set_rm_schema_dir_location", tid);
	char* cStr = const_cast<char*>(pPath.c_str());
	cout << "this is rm schema path: " << endl;
	cout << cStr << endl;
//	setRMSchemaDirLoc(eif_access(eiffelObj), eif_string("c:\\tmp\\rm_schemas"));
	setRMSchemaDirLoc(eif_access(eiffelObj), eif_string(cStr));
}

void OpenEHRManager::compileArchetype(string& pArchetypeName){
	EIF_PROCEDURE compileArchetype = eif_procedure("compile_archetype", tid);
	char* cStr = const_cast<char*>(pArchetypeName.c_str());
	compileArchetype(eif_access(eiffelObj), eif_string(cStr));
}


void OpenEHRManager::printAttributeValue(){
//	cout<< "initialization of EiffelRuntime";
	int* status = NULL;
	//WRONG!!!! NEVER, NEVER PRECOMPUTE EIF_ACCESS VALUE!!!!
	EIF_REFERENCE my_obj_ref = eif_access(eiffelObj);
	EIF_INTEGER attrVal = eif_attribute(my_obj_ref, "some_test_val", EIF_INTEGER, status);
//	cout << "\n";
//	if(status != NULL)
//		cout << *status;
//	else
//		cout << "status is null";
//	cout << "\n";
//	cout << attrVal;

}

void OpenEHRManager::performParsing(){
	EIF_PROCEDURE performParsing = eif_procedure("perform_parsing", tid);
	performParsing(eif_access(eiffelObj));
}

void OpenEHRManager::callMake(){
	EIF_PROCEDURE make = eif_procedure("make", tid);
	make(eif_access(eiffelObj));
}

vector<string>* OpenEHRManager::getArchetyepNames(){
//	string* s = new string("helo");
//	vector<string> v;
//	v.push_back(*s);
//	cout << v[0];
//	return v;


	EIF_PROCEDURE ep;
	EIF_TYPE_ID tid_any;
	tid_any = eif_type_id ("ARRAY[STRING]");
	if (tid_any == EIF_NO_TYPE)
			eif_panic ("No type id for ARRAY[STRING].");
	ep = eif_procedure ("put", tid_any);
//	printf("I've accessed ep\n");

	EIF_REFERENCE_FUNCTION myArrayStrF = eif_reference_function("archetype_names", tid);
	EIF_OBJECT arrObject = eif_protect((myArrayStrF)(eif_access(eiffelObj), NULL));
//	printf("I now have string array  from func\n");

	EIF_INTEGER_FUNCTION countFunc = eif_integer_function("count", tid_any);
	EIF_INTEGER countResult = (countFunc)(eif_access(arrObject),0);
//	printf("the length of array: %d\n", countResult);

	EIF_PROCEDURE epstr;
	EIF_TYPE_ID tid_str;
	tid_str = eif_type_id ("STRING");
	if (tid_str == EIF_NO_TYPE)
			eif_panic ("No type id for STRING.");
	//ep = eif_procedure ("put", tid_str);
//	printf("I've accessed STRING TYPE ID\n");

	vector<string>* archetypeNames = new vector<string>;
	for(int i = 0; i < countResult; i++){
		EIF_REFERENCE_FUNCTION itemFunc = eif_reference_function("item", tid_any);
		EIF_OBJECT itemResult = eif_protect((itemFunc)(eif_access(arrObject),i));

		EIF_POINTER_FUNCTION charFunc = eif_pointer_function("to_c", tid_str);
		EIF_POINTER strPtr = (charFunc)(eif_access(itemResult), NULL);
//		cout << ((char*)strPtr) << endl;
//		cout << i << endl;

		string* str = new string((char*)strPtr);
		archetypeNames->push_back(*str);
	}
	return archetypeNames;

}

void OpenEHRManager::printFunctionCallResult(){
	//call en eiffel function
	EIF_INTEGER_32_FUNCTION get_int_value = eif_integer_32_function("get_int_value", tid);
//	EIF_INTEGER_32 funcCallResult = get_int_value(eif_access(eiffelObj), counter);
//	cout << funcCallResult;
//	cout << "\n";
}

int OpenEHRManager::getFunctionCallResult(){
	EIF_INTEGER_32_FUNCTION get_int_value = eif_integer_32_function("get_int_value", tid);
//	EIF_INTEGER_32 funcCallResult = get_int_value(eif_access(eiffelObj), counter);
//	counter++;
//	return funcCallResult;
	return 0;
}

OpenEHRManager::~OpenEHRManager() {
//	cout << "NOW DESTROYING EIFFEL RUNTIME";
	reclaim();
}

EIF_OBJECT OpenEHRManager::eiffelObj;
EIF_TYPE_ID OpenEHRManager::tid;
