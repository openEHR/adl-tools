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



