#pragma once

#include "uk_ac_ucl_chime_EiffelBridge.h"
#include "jni.h"
#include <iostream>
#include <string>

using namespace std;

class JavaAOMHelper
{

public:
	JavaAOMHelper(JNIEnv*);
	~JavaAOMHelper(void);
	void initializeJavaTypes();
	
	void createCComplexObjectFactory();
	void setCComplexObjectPath(string&);
	void setCComplexObjectRMTypeName(string&);
	void setCComplexObjectOccurences(int,int);
	void setCComplexObjectParent(jobject);
	void setCComplexObjectNodeId(string&);
	void addAttributeToCComplexObject(jobject);
	jobject buildCComplexObjectWthCComplexObjectFactory();

	void createCAttributeFactory();
	void setCAttributeFactoryPath(string&);
	void setCAttributeRMAttributeName(string&);
	void setCAttributeExistence(string&);
	void addChildToCAttributeFactoryChildren(jobject);
	jobject buildSingleCAttributeUsingCAttributeFactory();

	void createCPrimitiveObjectFactory();
	void setCPrimitiveObjectFactoryPath(string&);
	void setCPrimitiveObjectFactoryInterval(int,int);
	void setCPrimitiveObjectFactoryNodeId(string&);
	void setCPrimitiveObjectFactoryItem(jobject);
	jobject buildCPrimitiveObjectWthCPrimitiveObjectFactory();

	void createCPrimitiveFactory();
	void setCPrimitiveFactoryCStringPattern(string&);
	void addStringToCPrimitiveFactoryCStringList(string&);
	jobject buildCStringWthCPrimitiveFactory();	

	jobject getLastBuiltCComplexObject();
	jobject getLastBuiltCAttributeObject();
	jobject getLastBuiltCPrimitiveObject();
	jobject getLastBuiltCPrimitive();

private:
	
	JNIEnv* _env;
	
	jclass _cComplexObjectFactoryClass;
	jclass _cAttributeFactoryClass;
	jclass _cPrimitiveObjectFactoryClass;
	jclass _cPrimitiveFactoryClass;

	jobject _cComplexObjectFactory;
	jobject _cAttributeFactory;
	jobject _cPrimitiveObjectFactory;
	jobject _cPrimitiveFactory;

	jobject _lastBuiltCComplexObject;
	jobject _lastBuiltCAttributeObject;
	jobject _lastBuiltCPrimitiveObject;
	jobject _lastBuiltPrimitive;

	string *_stringParamaterSignature;
};

