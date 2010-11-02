#pragma once
#include "IArchetypeVisitor.h"

class ArchetypeVisitor : public IArchetypeVisitor
{
public:
	ArchetypeVisitor(void);
	~ArchetypeVisitor(void);
	
	void startCComplexObject(EIF_REFERENCE, EIF_INTEGER);
	void endCComplexObject(EIF_REFERENCE, EIF_INTEGER);

	void startCAttributeNode(EIF_REFERENCE, EIF_INTEGER);
	void endCAttributeNode(EIF_REFERENCE, EIF_INTEGER);

	void startCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER);
	void endCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER);
};

