/*
 * EiffelBridge.cpp
 *
 *  Created on: 28 Aug 2010
 *      Author: sarikan
 */

#include "jni.h"
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include "uk_ac_ucl_chime_EiffelBridge.h"
#include "OpenEHRManager.h"
#include "JavaAOMHelper.h"

using namespace std;

string st("dneme");
OpenEHRManager* manager = NULL;

void initManager(JNIEnv *env, jobject obj){
	if(manager == NULL)
			manager = new OpenEHRManager();
	ArchetypeVisitor *visitor = new ArchetypeVisitor(env, obj);
	manager->setVisitor(visitor);
}

JNIEXPORT jstring JNICALL Java_uk_ac_ucl_chime_EiffelBridge_getStringValue
  (JNIEnv * env, jobject thisObj){
	  initManager(env, thisObj);
//	int val = manager->getFunctionCallResult();
	stringstream out;
//	out << val;
	st.append(" adding this");
	jstring testStr = env->NewStringUTF(st.c_str());
//	jstring testStr = env->NewStringUTF(out.str().c_str());
//	return testStr;
	return testStr;

}

JNIEXPORT jobjectArray JNICALL Java_uk_ac_ucl_chime_EiffelBridge_getArchetypeNames(JNIEnv * env, jobject thisObj) {
	initManager(env, thisObj);
	vector<string>* archetypeNames = manager->getArchetypeNames();
	jobjectArray arr;
	int size = 5;
	jsize len = archetypeNames->size();
	arr = (jobjectArray)env->NewObjectArray(len, env->FindClass("java/lang/String"), env->NewStringUTF(""));
	for(int i = 0; i < archetypeNames->size(); i++){
//		stringstream indexStr;
//		indexStr << i;
//		string st("array member value ");
//		st.append(indexStr.str().c_str());

		jstring arrCellVal = env->NewStringUTF(archetypeNames->at(i).c_str());
		env->SetObjectArrayElement(arr, i, arrCellVal);
	}
	return arr;
}

JNIEXPORT void JNICALL Java_uk_ac_ucl_chime_EiffelBridge_setErrorDBDirectoryPath(JNIEnv *env, jobject obj, jstring str){
	initManager(env, obj);
	const char* cStr = env->GetStringUTFChars(str, 0);
	string cppStr(cStr);
	manager->setErrorDBDirPath(cppStr);
	env->ReleaseStringUTFChars(str, cStr);

	
}

JNIEXPORT void JNICALL Java_uk_ac_ucl_chime_EiffelBridge_setRMSchemaDirectoryPath(JNIEnv *env, jobject obj, jstring str){
	initManager(env, obj);
	const char* cStr = env->GetStringUTFChars(str, 0);
	string cppStr(cStr);
	manager->setRmSchemaDirPath(cppStr);
	env->ReleaseStringUTFChars(str, cStr);
}

JNIEXPORT void JNICALL Java_uk_ac_ucl_chime_EiffelBridge_compileArcheytpe(JNIEnv * env, jobject obj, jstring str){
	initManager(env, obj);
	const char* cStr = env->GetStringUTFChars(str, 0);
	string cppStr(cStr);
	manager->compileArchetype(cppStr);
	env->ReleaseStringUTFChars(str, cStr);		
}

JNIEXPORT jobject JNICALL Java_uk_ac_ucl_chime_EiffelBridge_parseArchetype(JNIEnv *env, jobject obj, jstring str){

	JavaAOMHelper *javaAOMHelper = new JavaAOMHelper(env);
	
	javaAOMHelper->initializeJavaTypes();
	
	javaAOMHelper->createCComplexObjectFactory();
	javaAOMHelper->setCComplexObjectPath(string("path from cpp object"));
	javaAOMHelper->setCComplexObjectRMTypeName(string("rm type name for ccomplexobj from cpp object"));
	javaAOMHelper->setCComplexObjectOccurences(0, 5);
	javaAOMHelper->setCComplexObjectParent(NULL);
	javaAOMHelper->setCComplexObjectNodeId(string("node id for ccomplex object, from cpp object"));
	
	javaAOMHelper->createCAttributeFactory();
	javaAOMHelper->setCAttributeRMAttributeName(string("rm attribute name for cattribute from cpp obj"));
	javaAOMHelper->setCAttributeExistence(string("REQUIRED"));
	javaAOMHelper->setCAttributeFactoryPath(string("path for attribute from cpp obj"));
	//path rmattrname existence

	javaAOMHelper->createCPrimitiveObjectFactory();
	javaAOMHelper->setCPrimitiveObjectFactoryPath(string("path for cprimitive object from cpp obj"));
	javaAOMHelper->setCPrimitiveObjectFactoryInterval(0, 4);
	javaAOMHelper->setCPrimitiveObjectFactoryNodeId(string("node Id for cprimitive object from cpp obj"));	
	//create cprimitive objc , path interval nodeId

	javaAOMHelper->createCPrimitiveFactory();
	javaAOMHelper->setCPrimitiveFactoryCStringPattern(string("string pattern for cstring in primitive, from cpp obj"));
	javaAOMHelper->addStringToCPrimitiveFactoryCStringList(string("string added to list from cpp obj"));
	jobject cstring = javaAOMHelper->buildCStringWthCPrimitiveFactory();

	javaAOMHelper->setCPrimitiveObjectFactoryItem(cstring);

	
	jobject cPrimitiveObj = javaAOMHelper->buildCPrimitiveObjectWthCPrimitiveObjectFactory();
	
	javaAOMHelper->addChildToCAttributeFactoryChildren(cPrimitiveObj);

	jobject cSingleAttr = javaAOMHelper->buildSingleCAttributeUsingCAttributeFactory();
	javaAOMHelper->addAttributeToCComplexObject(cSingleAttr);
	//build ccomplex obj
	jobject cComplexObj = javaAOMHelper->buildCComplexObjectWthCComplexObjectFactory();
	return cComplexObj;
	
	//THE FOLLOWING IS THE FIRST VERSION OF CODE THAT WORKS SUCCESSFULLY. THIS CODE HAS BEEN REFACTORED INTO 
	//JAVAAOMHELPER CLASS. 
	//TODO: DELETE THIS ONCE JAVAAOMHELPER IS STABLE 

	//jclass eiffelBridge = env->FindClass("uk/ac/ucl/chime/CComplexObjectFactory");
	//jmethodID constrMId = env->GetMethodID(eiffelBridge, "<init>", "()V");
	//jobject factoryObj = env->NewObject(eiffelBridge, constrMId);
	//
	//jmethodID methodSetPath = env->GetMethodID(eiffelBridge, "setPath", "(Ljava/lang/String;)V");
	//jstring path = env->NewStringUTF("path from cpp obj");
	//env->CallVoidMethod(factoryObj, methodSetPath, path);

	//jmethodID methodSetRMTypeName = env->GetMethodID(eiffelBridge, "setRMTypeName", "(Ljava/lang/String;)V");
	//jstring rmTypeName = env->NewStringUTF("rm type name from cpp obj");
	//env->CallVoidMethod(factoryObj, methodSetRMTypeName, rmTypeName);

	//jmethodID methodSetOccurances = env->GetMethodID(eiffelBridge, "setOccurences", "(II)V");
	//jint lower = 0;
	//jint upper = 3;
	//env->CallVoidMethod(factoryObj, methodSetOccurances, lower, upper);

	//jmethodID methodSetParent = env->GetMethodID(eiffelBridge, "setParent", "(Lorg/openehr/am/archetype/constraintmodel/CAttribute;)V");
	//env->CallVoidMethod(factoryObj, methodSetParent, NULL);

	//jmethodID methodSetNodeId = env->GetMethodID(eiffelBridge, "setNodeId", "(Ljava/lang/String;)V");
	//jstring nodeId = env->NewStringUTF("node id from cpp obj");
	//env->CallVoidMethod(factoryObj, methodSetNodeId, nodeId);

	////create CAttribute instance
	//jclass cAttributeClass = env->FindClass("uk/ac/ucl/chime/CAttributeFactory");
	//jmethodID cAttributeConstr = env->GetMethodID(cAttributeClass, "<init>", "()V");
	//jobject cAttributeFactoryObj = env->NewObject(cAttributeClass, cAttributeConstr);

	//jmethodID methodCAttrSetPath = env->GetMethodID(cAttributeClass, "setPath", "(Ljava/lang/String;)V");
	//jstring cAttrPath = env->NewStringUTF("path from cpp obj");
	//env->CallVoidMethod(cAttributeFactoryObj, methodCAttrSetPath, cAttrPath);

	//jmethodID methodCAttrSetRMAttrName = env->GetMethodID(cAttributeClass, "setRMAttributeName", "(Ljava/lang/String;)V");
	//jstring cAttrRMAttrName = env->NewStringUTF("rm attr name from cpp obj");
	//env->CallVoidMethod(cAttributeFactoryObj, methodCAttrSetRMAttrName, cAttrRMAttrName);

	//jmethodID methodCAttrSetExistence = env->GetMethodID(cAttributeClass, "setExistence", "(Ljava/lang/String;)V");
	//jstring cAttrExistence = env->NewStringUTF("REQUIRED");
	//env->CallVoidMethod(cAttributeFactoryObj, methodCAttrSetExistence, cAttrExistence);

	//	//create CPrimitive Object Instance
	//jclass cPrimitiveObjectFactoryClass = env->FindClass("uk/ac/ucl/chime/CPrimitiveObjectFactory");
	//jmethodID cPrimitiveObjectFactoryConstr = env->GetMethodID(cPrimitiveObjectFactoryClass, "<init>", "()V");
	//jobject cPrimitiveObjectFactoryObj = env->NewObject(cPrimitiveObjectFactoryClass, cPrimitiveObjectFactoryConstr);

	//jmethodID methodCPrimitiveObjFactSetPath = env->GetMethodID(cPrimitiveObjectFactoryClass, "setPath", "(Ljava/lang/String;)V");
	//jstring cPrimitiveObjPath = env->NewStringUTF("path from cpp obj");
	//env->CallVoidMethod(cPrimitiveObjectFactoryObj, methodCPrimitiveObjFactSetPath, cPrimitiveObjPath);

	//jmethodID methodCPrimitiveObjFactSetInterval = env->GetMethodID(cPrimitiveObjectFactoryClass, "setInterval", "(II)V");
	//jint cPrimitiveObjFactIntervalLower = 0;
	//jint cPrimitiveObjFactIntervalUpper = 3;
	//env->CallVoidMethod(cPrimitiveObjectFactoryObj, methodCPrimitiveObjFactSetInterval, cPrimitiveObjFactIntervalLower, cPrimitiveObjFactIntervalUpper);

	//jmethodID methodCPrimitiveObjFactSetNodeId = env->GetMethodID(cPrimitiveObjectFactoryClass, "setNodeId", "(Ljava/lang/String;)V");
	//jstring cPrimitiveObjctFactNodeId = env->NewStringUTF("node id from cpp obj");
	//env->CallVoidMethod(cPrimitiveObjectFactoryObj, methodCPrimitiveObjFactSetNodeId, cPrimitiveObjctFactNodeId);

	//		//create CPrimitive Instance
	//jclass cPrimitiveFactoryCls = env->FindClass("uk/ac/ucl/chime/CPrimitiveFactory");
	//jmethodID cPrimitiveFactConstr = env->GetMethodID(cPrimitiveFactoryCls, "<init>", "()V");
	//jobject cPrimitiveFactObj = env->NewObject(cPrimitiveFactoryCls, cPrimitiveFactConstr);

	//jmethodID methodCPrimitiveSetCStringPattern = env->GetMethodID(cPrimitiveFactoryCls, "setCStringPattern", "(Ljava/lang/String;)V");
	//jstring cPrimitiveStringPattrn = env->NewStringUTF("string pattern from cpp obj");
	//env->CallVoidMethod(cPrimitiveFactObj, methodCPrimitiveSetCStringPattern, cPrimitiveStringPattrn);

	//jmethodID methodCPrimitiveAddStrToStrPattern = env->GetMethodID(cPrimitiveFactoryCls, "addStringToCStringList", "(Ljava/lang/String;)V");
	//jstring cPrimitiveString = env->NewStringUTF("value to add to string list from cpp obj");
	//env->CallVoidMethod(cPrimitiveFactObj, methodCPrimitiveAddStrToStrPattern, cPrimitiveString);

	//jmethodID methodCPrimitiveBuildCString = env->GetMethodID(cPrimitiveFactoryCls, "buildCString", "()Lorg/openehr/am/archetype/constraintmodel/primitive/CPrimitive;");
	//jobject cStringObj = env->CallObjectMethod(cPrimitiveFactObj, methodCPrimitiveBuildCString);	
	//		//end create CPrimitive Instance

	//jmethodID methodCPrimitiveObjFactSetItem = env->GetMethodID(cPrimitiveObjectFactoryClass, "setItem", "(Lorg/openehr/am/archetype/constraintmodel/primitive/CPrimitive;)V");
	//env->CallVoidMethod(cPrimitiveObjectFactoryObj, methodCPrimitiveObjFactSetItem, cStringObj);

	//jmethodID methodCPrimitiveObjFactoryBuildCPrimitiveObject = env->GetMethodID(cPrimitiveObjectFactoryClass, "buildCPrimitiveObject", "()Lorg/openehr/am/archetype/constraintmodel/CPrimitiveObject;");
	//jobject cPrimitiveObject = env->CallObjectMethod(cPrimitiveObjectFactoryObj, methodCPrimitiveObjFactoryBuildCPrimitiveObject);

	//	//end create CPrimitive Object Instance
	//jmethodID methodAddChild = env->GetMethodID(cAttributeClass, "addChild", "(Lorg/openehr/am/archetype/constraintmodel/CObject;)V");
	//env->CallVoidMethod(cAttributeFactoryObj, methodAddChild, cPrimitiveObject);//TODO: USE CPRIMITIVE OBJECT, NOT CPRIMITIVE HERE

	//jmethodID methodBuildSingleAttribute = env->GetMethodID(cAttributeClass, "buildSingleCAttribute", "()Lorg/openehr/am/archetype/constraintmodel/CAttribute;");
	//jobject singleAttrObj = env->CallObjectMethod(cAttributeFactoryObj, methodBuildSingleAttribute);

	////end create CAttribute instance

	//jmethodID methodAddCAttribute = env->GetMethodID(eiffelBridge, "addCAttributes", "(Lorg/openehr/am/archetype/constraintmodel/CAttribute;)V");
	//env->CallVoidMethod(factoryObj, methodAddCAttribute, singleAttrObj);

	//jmethodID methodBuildComplexObject = env->GetMethodID(eiffelBridge, "buildCComplexObject", "()Lorg/openehr/am/archetype/constraintmodel/CComplexObject;");
	//jobject cComplexObj = env->CallObjectMethod(factoryObj, methodBuildComplexObject);

	//return cComplexObj;
}




