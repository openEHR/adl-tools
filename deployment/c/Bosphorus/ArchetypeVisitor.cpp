#include "ArchetypeVisitor.h"
#include <iostream>
#include "JNILogger.h"
#include <string>

using namespace std;

ArchetypeVisitor::ArchetypeVisitor(void)
{
	env = NULL;
	obj = NULL;
}

ArchetypeVisitor::ArchetypeVisitor(JNIEnv* pEnv, jobject pJobject){
	env = pEnv;
	obj = pJobject;
}


ArchetypeVisitor::~ArchetypeVisitor(void)
{
}

void ArchetypeVisitor::startCComplexObject(EIF_REFERENCE pCComplexObject, EIF_INTEGER pDepth){	
	
	if(env != NULL && obj != NULL){
		string valToPass("value from visitor");
		string& passme = valToPass;
		JNILogger::log(env, obj, passme);
	}
	
}

void ArchetypeVisitor::endCComplexObject(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){
	
}

void ArchetypeVisitor::startArchetypeSlot(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endArchetypeSlot(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}


void ArchetypeVisitor::startCAttribute(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

}

void ArchetypeVisitor::endCAttribute(EIF_REFERENCE pEifRef, EIF_INTEGER pDepth){

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