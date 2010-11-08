#pragma once
#include "eif_eiffel.h"

class IArchetypeVisitor
{
public:
	
	virtual void startCComplexObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCComplexObject(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startArchetypeSlot(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endArchetypeSlot(EIF_REFERENCE, EIF_INTEGER) = 0;	

	virtual void startCAttribute(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCAttribute(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCLeafObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCLeafObject(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCReferenceObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCReferenceObject(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCArchetypeRoot(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCArchetypeRoot(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startArchetypeInternalRef(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endArchetypeInternalRef(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startConstraintRef(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endConstraintRef(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCDomainType(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCDomainType(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCCodePhrase(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCCodePhrase(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCOrdinal(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCOrdinal(EIF_REFERENCE, EIF_INTEGER) = 0;

	virtual void startCQuantity(EIF_REFERENCE, EIF_INTEGER) = 0;
	virtual void endCQuantity(EIF_REFERENCE, EIF_INTEGER) = 0;
	
};

