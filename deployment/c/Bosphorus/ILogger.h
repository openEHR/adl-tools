#pragma once
#include "eif_eiffel.h"


class ILogger
{
public:
	/*ILogger(void);
	~ILogger(void);*/

	virtual void log(EIF_REFERENCE) = 0;
};

