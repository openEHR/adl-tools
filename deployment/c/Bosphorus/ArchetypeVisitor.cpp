#include "ArchetypeVisitor.h"
#include <iostream>

using namespace std;

ArchetypeVisitor::ArchetypeVisitor(void)
{
}


ArchetypeVisitor::~ArchetypeVisitor(void)
{
}

void ArchetypeVisitor::startCComplexObject(EIF_REFERENCE pCComplexObject, EIF_INTEGER pDepth){
	cout << "startCComplexObj" << endl;
}

void ArchetypeVisitor::endCComplexObject(EIF_REFERENCE , EIF_INTEGER){
	cout << "endCComplexObj" << endl;
}

void ArchetypeVisitor::startCAttributeNode(EIF_REFERENCE pCAttributeNode, EIF_INTEGER pDepth){
	cout << "startCAttributeNode" << endl;
}
void ArchetypeVisitor::endCAttributeNode(EIF_REFERENCE pCAttributeNode, EIF_INTEGER pDepth){
	cout << "endCAttrNode" << endl;
}

void ArchetypeVisitor::startCPrimitiveObject(EIF_REFERENCE pCPrimitiveObject, EIF_INTEGER pDepth){
	cout << "startCPrimitiveNode" << endl;
}

void ArchetypeVisitor::endCPrimitiveObject(EIF_REFERENCE pCPrimitiveObject, EIF_INTEGER pDepth){

}