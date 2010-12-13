#pragma once
#include "eif_eiffel.h"
#include <string>

using namespace std;

class EiffelAccessHelper{

public:
	/*EiffelAccessHelper(){}
	~EiffelAccessHelper(){}*/
	
	//parameters: type name
	EIF_TYPE_ID getEifTypeId(char*);

	//parameters: function name
	//this function assumes there exist a main Eiffel Object with a main type_id, and performs operation on it
	virtual string* callStringFunction(char*) = 0;

	//parameters: Eiffel string in form of EIF_OBJECT	
	virtual string* getStringFromEiffelString(EIF_OBJECT&) = 0;	
	
	//parameters: function name
	//this function assumes there exist a main Eiffel Object with a main type_id, and performs operation on it
	virtual EIF_OBJECT callReferenceFunc(char*) = 0;
	
	//parameters: function name, int value to pass as parameter to function, eiffel object on which the function will be invoked, Eiffel type name of Eiffel object	
	virtual EIF_OBJECT callReferenceFuncOnObjWthIntParam(char*, int, EIF_OBJECT&, char*) = 0;
	
	//parameters, function name, eiffel object on which function will be invoked, type id of Eiffel object
	virtual EIF_POINTER callPointerFuncOnObj(char*, EIF_OBJECT&, EIF_TYPE_ID&) = 0;

	//parameters, function name, eiffel object on which function will be invoked, type id of Eiffel object
	virtual string* callStringFuncOnObj(char*, EIF_OBJECT&, char*) = 0;
	
	//parameters, function name, eiffel object on which the function will be invoked, eiffel object type name
	virtual EIF_INTEGER callIntegerFuncOnObj(char*, EIF_OBJECT&, char*) = 0;
	
	//parameters: function name, eiffel object on which the function will be invoked, type id of Eiffel object
	virtual EIF_OBJECT callArrayFuncOnObj(char*, EIF_OBJECT&, EIF_TYPE_ID&) = 0;
	
	//parameters: procedure name
	//this function assumes there exist a main Eiffel Object with a main type_id, and performs operation on it
	virtual void callEiffelProcedure(char*) = 0;

	//parameters: attribute name, target object, type id
	virtual string* getStringAttributeFromObj(char* pAttrName, EIF_OBJECT& pTargetObj, char* pTypeId) = 0;

	//parameters: procedure name, string to pass as parameter
	//this function assumes there exist a main Eiffel Object with a main type_id, and performs operation on it
	virtual void callEiffelProcedureWthStringParameter(char*, char*) = 0;

	//parameters: procedure name, target object which owns the procedure, eiffel object type name
	virtual void callEiffelProcedureOnObj(char*, EIF_OBJECT&, char*) = 0;

	//parameters: procedure name, target object which owns the procedure, eiffel object type name, variable number of parameters, 
	//WARNING: at the moment only the first of these parameters is passed to the underlying procedure, after a cast to EIF_POINTER
	virtual void callEiffelProcedureOnObjWthEifObjParam(char*, EIF_OBJECT&, char*, ...) = 0;

};