/*
 * OpenEHRManager.h
 *
 *  Created on: 28 Aug 2010
 *      Author: sarikan
 */

#ifndef OPENEHRMANAGER_H_
#define OPENEHRMANAGER_H_
#include <string>
#include <vector>
#include "eif_eiffel.h" /* Exported functions of the Eiffel run-time */
#include <iostream>
#include "ArchetypeVisitor.h"
#include "ILogger.h"

using namespace std;

class OpenEHRManager {
public:
	OpenEHRManager();
	virtual ~OpenEHRManager();
	void printAttributeValue();	
	void printFunctionCallResult();
	void performParsing();
	void callMake();
	vector<string>* getArchetypeNames();
	void setErrorDBDirPath(string&);
	void setRmSchemaDirPath(string&);
	void compileArchetype(string&);
	int getFunctionCallResult();
	void setVisitor(ArchetypeVisitor*);
	void setLogger(ILogger*);
	void testLogger();
private:
	EIF_OBJECT eiffelObj;
	EIF_TYPE_ID tid;
	ArchetypeVisitor* archetypeVisitor;
	ILogger* logger;
};

#endif /* OPENEHRMANAGER_H_ */
