#include "ExperimentalApplicationEiffelAccessHelper.h"
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */

ExperimentalApplicationEiffelAccessHelper::ExperimentalApplicationEiffelAccessHelper(EIF_OBJECT pObj, EIF_TYPE_ID pTypeId)
{
	eiffelObj = pObj;
	tid = pTypeId;
}


ExperimentalApplicationEiffelAccessHelper::~ExperimentalApplicationEiffelAccessHelper(void)
{
}

///EiffelHelper methods implemented here
void ExperimentalApplicationEiffelAccessHelper::callEiffelProcedureOnObj(char* pProcName, EIF_OBJECT& pTargetObj, char* pTypeId){
	EIF_PROCEDURE proc = eif_procedure(pProcName, getEifTypeId(pTypeId));
	proc(eif_access(pTargetObj));
}

void ExperimentalApplicationEiffelAccessHelper::callEiffelProcedureWthStringParameter(char* pProcName, char* pStringToPass){
	EIF_PROCEDURE procToCall = eif_procedure(pProcName, tid);			
	procToCall(eif_access(eiffelObj), eif_string(pStringToPass));	
}

void ExperimentalApplicationEiffelAccessHelper::callEiffelProcedureOnObjWthEifObjParam(char* pProcName, EIF_OBJECT& pTargetObj, char* pTypeId, ... ){
	EIF_PROCEDURE proc = eif_procedure(pProcName, getEifTypeId(pTypeId));				
	va_list listPntr;
	va_start(listPntr,pTypeId);
	proc(eif_access(pTargetObj), va_arg(listPntr,EIF_POINTER));
}

void ExperimentalApplicationEiffelAccessHelper::callEiffelProcedure(char* pProcName){
	EIF_PROCEDURE proc = eif_procedure(pProcName, tid);
	proc(eif_access(eiffelObj));
}

string* ExperimentalApplicationEiffelAccessHelper::callStringFunction(char* pFuncName){
	return NULL;
}

string* ExperimentalApplicationEiffelAccessHelper::getStringFromEiffelString(EIF_OBJECT& pTargetObj){
	EIF_POINTER_FUNCTION charFunc = eif_pointer_function("to_c", getEifTypeId("STRING"));
	EIF_POINTER strPtr = (charFunc)(eif_access(pTargetObj), NULL);
	string* str = new string((char*)strPtr);
	return str;
}

EIF_OBJECT ExperimentalApplicationEiffelAccessHelper::callReferenceFunc(char* pFuncName){
	EIF_REFERENCE_FUNCTION refFunc = eif_reference_function(pFuncName, tid);
	EIF_OBJECT result = eif_protect((refFunc)(eif_access(eiffelObj), NULL));
	return result;
}

EIF_OBJECT ExperimentalApplicationEiffelAccessHelper::callReferenceFuncOnObjWthIntParam(char* pFuncName, int pParamVal, EIF_OBJECT& pTargetObj, char* pTypeName) {
	EIF_REFERENCE_FUNCTION refFunc = eif_reference_function(pFuncName, getEifTypeId(pTypeName));
	EIF_OBJECT result = eif_protect((refFunc)(eif_access(pTargetObj),pParamVal));
	return result;
}

EIF_POINTER ExperimentalApplicationEiffelAccessHelper::callPointerFuncOnObj(char* pFuncName, EIF_OBJECT& pTargetObj, EIF_TYPE_ID& pTypeId) {
	EIF_POINTER_FUNCTION pointerFunc = eif_pointer_function(pFuncName, pTypeId);
	EIF_POINTER strPtr = (pointerFunc)(eif_access(pTargetObj), NULL);
	return strPtr;
}

string* ExperimentalApplicationEiffelAccessHelper::callStringFuncOnObj(char* pFuncName, EIF_OBJECT& pTargetObj, char* pTypeId){
	EIF_REFERENCE_FUNCTION stringFunc = eif_reference_function(pFuncName, getEifTypeId(pTypeId));	
	EIF_OBJECT stringObj = eif_protect(stringFunc(eif_access(pTargetObj),NULL));
	if(*stringObj == NULL)
		return NULL;
	string* result = getStringFromEiffelString(stringObj);
	return result;
}

string* ExperimentalApplicationEiffelAccessHelper::getStringAttributeFromObj(char* pAttrName, EIF_OBJECT& pTargetObj){
	int* status = NULL;
	EIF_OBJECT eif_str = eif_protect(eif_attribute(eif_access(pTargetObj), pAttrName, EIF_REFERENCE, status));
	if(*eif_str == NULL)
		return	NULL;
	string* ptr = getStringFromEiffelString(eif_str);
	return ptr;
}

EIF_OBJECT ExperimentalApplicationEiffelAccessHelper::getObjectAttributeFromObj(char* pAttributeName, EIF_OBJECT &pTargetObj){
	int* status = NULL;
	EIF_OBJECT eif_obj = eif_protect(eif_attribute(eif_access(pTargetObj), pAttributeName, EIF_REFERENCE, status));
	return eif_obj;
}
	
EIF_INTEGER ExperimentalApplicationEiffelAccessHelper::callIntegerFuncOnObj(char* pFuncName, EIF_OBJECT& pTargetObj, char* pTypeName){
	EIF_PROCEDURE ep;
	EIF_TYPE_ID tid_any;
	tid_any = eif_type_id (pTypeName);
	if (tid_any == EIF_NO_TYPE)
			eif_panic ("No type id for given type name");
	ep = eif_procedure ("put", tid_any);
	
	EIF_INTEGER_FUNCTION intFunc = eif_integer_function(pFuncName, tid_any);
	EIF_INTEGER countResult = (intFunc)(eif_access(pTargetObj),0);

	return countResult;
}


EIF_OBJECT ExperimentalApplicationEiffelAccessHelper::callReferenceFuncOnObj(char* pFuncName, EIF_OBJECT& pTargetObj, char* pTypeId){
	EIF_REFERENCE_FUNCTION myArrayStrF = eif_reference_function(pFuncName, getEifTypeId(pTypeId));
	EIF_OBJECT arrObject = eif_protect((myArrayStrF)(eif_access(pTargetObj), NULL));
	return arrObject;
}

///EiffelHelper methods implementation ends
EIF_TYPE_ID ExperimentalApplicationEiffelAccessHelper::getEifTypeId(char* pTypeName){
	EIF_TYPE_ID tid_any;
	tid_any = eif_type_id (pTypeName);
	if (tid_any == EIF_NO_TYPE)
			eif_panic ("No type id for given type name");
	return tid_any;
}

EIF_INTEGER ExperimentalApplicationEiffelAccessHelper::getIntegerAttributeFromObj(char* pAttributeName, EIF_OBJECT &pTargetObject){
	int* status = NULL;
	EIF_INTEGER val = eif_attribute(eif_access(pTargetObject), pAttributeName, EIF_INTEGER, status);	
	return val;
}
