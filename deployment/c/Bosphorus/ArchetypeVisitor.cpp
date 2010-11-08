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

void ArchetypeVisitor::endCComplexObject(EIF_REFERENCE , EIF_INTEGER){
	
}

void ArchetypeVisitor::startArchetypeSlot(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endArchetypeSlot(EIF_REFERENCE, EIF_INTEGER){

}


void ArchetypeVisitor::startCAttribute(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCAttribute(EIF_REFERENCE, EIF_INTEGER){

}


void ArchetypeVisitor::startCLeafObject(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCLeafObject(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCReferenceObject(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCReferenceObject(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCArchetypeRoot(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCArchetypeRoot(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startArchetypeInternalRef(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endArchetypeInternalRef(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startConstraintRef(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endConstraintRef(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCDomainType(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCDomainType(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCCodePhrase(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCCodePhrase(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCOrdinal(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCOrdinal(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::startCQuantity(EIF_REFERENCE, EIF_INTEGER){

}

void ArchetypeVisitor::endCQuantity(EIF_REFERENCE, EIF_INTEGER){

}