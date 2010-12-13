#pragma once
#include "EiffelAccessHelper.h"
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */

//this class is a helper which assumes Eiffel type ExperimentalApplication as the wrapped type
class ExperimentalApplicationEiffelAccessHelper :
	public EiffelAccessHelper
{
public:
	ExperimentalApplicationEiffelAccessHelper(EIF_OBJECT, EIF_TYPE_ID);
	~ExperimentalApplicationEiffelAccessHelper(void);
			
	///EiffelHelper methods 
	EIF_TYPE_ID getEifTypeId(char*);
	
	string* callStringFunction(char*);
	
	string* getStringFromEiffelString(EIF_OBJECT&);
	
	EIF_OBJECT callReferenceFunc(char*);
	
	EIF_OBJECT callReferenceFuncOnObjWthIntParam(char*, int, EIF_OBJECT&, char*) ;
	
	EIF_POINTER callPointerFuncOnObj(char*, EIF_OBJECT&, EIF_TYPE_ID&) ;
	
	string* callStringFuncOnObj(char*, EIF_OBJECT&, char*);
	
	EIF_INTEGER callIntegerFuncOnObj(char*, EIF_OBJECT&, char*);
	
	EIF_OBJECT callArrayFuncOnObj(char*, EIF_OBJECT&, EIF_TYPE_ID&);
	
	void callEiffelProcedure(char*);
	
	void callEiffelProcedureWthStringParameter(char*, char*);
	
	void callEiffelProcedureOnObj(char*, EIF_OBJECT&, char*);

	string* getStringAttributeFromObj(char* pAttrName, EIF_OBJECT& pTargetObj, char* pTypeId);
	
	void callEiffelProcedureOnObjWthEifObjParam(char*, EIF_OBJECT&, char*, ... );

	EIF_OBJECT getObjectAttributeFromObj(char* , EIF_OBJECT&);

	///EiffelHelper methods end

private:
	EIF_OBJECT eiffelObj;
	EIF_TYPE_ID tid;
};

