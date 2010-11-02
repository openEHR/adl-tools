#pragma once
#include "ILogger.h"
#include "eif_eiffel.h"

class ArchetypeLogger :	public ILogger
{
public:
	ArchetypeLogger(void);
	~ArchetypeLogger(void);

	void log(EIF_REFERENCE);
};

