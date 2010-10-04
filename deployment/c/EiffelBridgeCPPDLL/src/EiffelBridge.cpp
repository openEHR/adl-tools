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
#include "uk_ac_ucl_chime_EiffelBridge.h"
#include "OpenEHRManager.h"
using namespace std;

string st("dneme");
OpenEHRManager* manager = NULL;
JNIEXPORT jstring JNICALL Java_uk_ac_ucl_chime_EiffelBridge_getStringValue
  (JNIEnv * env, jobject thisObj){
	 if(manager == NULL)
		 manager = new OpenEHRManager();
//	int val = manager->getFunctionCallResult();
	stringstream out;
//	out << val;
	st.append(" adding this");
	jstring testStr = env->NewStringUTF(st.c_str());
//	jstring testStr = env->NewStringUTF(out.str().c_str());
//	return testStr;
	return testStr;

}
