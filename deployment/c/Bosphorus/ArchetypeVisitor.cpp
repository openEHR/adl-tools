#include "ArchetypeVisitor.h"
#include <iostream>
#include "JNILogger.h"
#include <string>
#include "eif_eiffel.h"
#include <sstream>



using namespace std;

ArchetypeVisitor::ArchetypeVisitor(void)
{
	env = NULL;
	obj = NULL;	
	objectAttributes = new std::stack<EIF_OBJECT>();
	tempObjectAttributes = new std::stack<EIF_OBJECT>();
}

ArchetypeVisitor::ArchetypeVisitor(JNIEnv* pEnv, jobject pJobject){
	env = pEnv;
	obj = pJobject;
	objectAttributes = new std::stack<EIF_OBJECT>();
	tempObjectAttributes = new std::stack<EIF_OBJECT>();
}


ArchetypeVisitor::~ArchetypeVisitor(void)
{
	if(objectAttributes != NULL)
		delete objectAttributes;
}

void ArchetypeVisitor::setExperimentalAppHelper(ExperimentalApplicationEiffelAccessHelper* pHelper){
	helper = pHelper;
}

void ArchetypeVisitor::backupAndResetObjectAttributes(){
	while(tempObjectAttributes->size() > 0){
		tempObjectAttributes->pop();
	}
	while(objectAttributes->size() > 0){
		tempObjectAttributes->push(objectAttributes->top());
		objectAttributes->pop();
	}
}

void ArchetypeVisitor::restoreObjectAttributes(){
	while(objectAttributes->size() > 0){
		objectAttributes->pop();
	}

	while(tempObjectAttributes->size() > 0){
		objectAttributes->push(tempObjectAttributes->top());
		tempObjectAttributes->pop();
	}
}

string ArchetypeVisitor::int2String(int pInt){
	stringstream sstream;
	sstream << pInt;
	return sstream.str();
}

void ArchetypeVisitor::startCComplexObject(EIF_REFERENCE pCComplexObject, EIF_INTEGER pDepth){	
	
	if(env != NULL && obj != NULL){
		string valToPass("value from visitor");
		string& passme = valToPass;
		JNILogger::log(env, obj, passme);
	}
	
	EIF_OBJECT o = eif_protect(pCComplexObject);
	string* str = helper->callStringFuncOnObj("node_id", o, "C_COMPLEX_OBJECT");
	cout << "Node id: " + *str << endl;
	string* rmTypeName = helper->getStringAttributeFromObj("rm_type_name", o, "asfafds");
	cout << "Rm type name: " + *rmTypeName << endl;
	//reset attributes stack
	cout<< "calling stack backup" << endl;
	backupAndResetObjectAttributes();
	cout<< "called stack backup" << endl;
	
}

void ArchetypeVisitor::endCComplexObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){
	while(objectAttributes->size() > 0){
		EIF_OBJECT attrObj = objectAttributes->top();
		string* str = helper->callStringFuncOnObj("rm_attribute_name", attrObj, "C_ATTRIBUTE");
		cout << "CComplexObject Attribute (" + int2String(pDepth) + ") :" + *str << endl;
		delete str;
		objectAttributes->pop();
	}
	//restore attributes
	restoreObjectAttributes();
}

void ArchetypeVisitor::startArchetypeSlot(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endArchetypeSlot(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}


void ArchetypeVisitor::startCAttribute(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCAttribute(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){
	EIF_OBJECT cattr = eif_protect(pEifRef);
	objectAttributes->push(cattr);
}


void ArchetypeVisitor::startCLeafObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCLeafObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCReferenceObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCReferenceObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCArchetypeRoot(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCArchetypeRoot(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startArchetypeInternalRef(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endArchetypeInternalRef(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startConstraintRef(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endConstraintRef(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCPrimitiveObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCPrimitiveObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCDomainType(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCDomainType(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCCodePhrase(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCCodePhrase(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCOrdinal(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCOrdinal(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::startCQuantity(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCQuantity(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}