/*
 * OpenEHRManager.cpp
 *
 *  Created on: 28 Aug 2010
 *      Author: sarikan
 */

//#include "iostream.h"
#include "OpenEHRManager.h"
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
	EIF_PROCEDURE make = eif_procedure("perform_parsing", tid);
	make(eif_access(eiffelObj));

//	EIF_PROCEDURE initialise = eif_procedure("initialise", tid);
//	(initialise)(eif_access(eiffelObj));
	counter = 1;
}

void OpenEHRManager::printAttributeValue(){
//	cout<< "initialization of EiffelRuntime";
	int* status = NULL;
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

void OpenEHRManager::printFunctionCallResult(){
	//call en eiffel function
	EIF_INTEGER_32_FUNCTION get_int_value = eif_integer_32_function("get_int_value", tid);
	EIF_INTEGER_32 funcCallResult = get_int_value(eif_access(eiffelObj), counter);
//	cout << funcCallResult;
//	cout << "\n";
}

int OpenEHRManager::getFunctionCallResult(){
	EIF_INTEGER_32_FUNCTION get_int_value = eif_integer_32_function("get_int_value", tid);
	EIF_INTEGER_32 funcCallResult = get_int_value(eif_access(eiffelObj), counter);
	counter++;
	return funcCallResult;
}

OpenEHRManager::~OpenEHRManager() {
//	cout << "NOW DESTROYING EIFFEL RUNTIME";
	reclaim();
}

EIF_OBJECT OpenEHRManager::eiffelObj;
EIF_TYPE_ID OpenEHRManager::tid;
int OpenEHRManager::counter;
