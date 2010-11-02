#pragma once
#include "eif_eiffel.h"

class IArchetypeVisitor
{
public:
	/*IArchetypeVisitor(void);
	~IArchetypeVisitor(void);*/
	
	virtual void startCComplexObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCComplexObject(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCAttributeNode(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCAttributeNode(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	
};

