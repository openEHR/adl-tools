/*
 * OpenEHRManager.h
 *
 *  Created on: 28 Aug 2010
 *      Author: sarikan
 */

#ifndef OPENEHRMANAGER_H_
#define OPENEHRMANAGER_H_
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */

class OpenEHRManager {
public:
	OpenEHRManager();
	virtual ~OpenEHRManager();
	void printAttributeValue();
	static EIF_OBJECT eiffelObj;
	static EIF_TYPE_ID tid;
	static int counter;
	void printFunctionCallResult();
	int getFunctionCallResult();
private:

};

#endif /* OPENEHRMANAGER_H_ */
