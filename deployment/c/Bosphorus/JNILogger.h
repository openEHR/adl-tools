#pragma once
#include <iostream>
#include "jni.h"

using namespace std;

class JNILogger
{
public:
	JNILogger(void);
	~JNILogger(void);
	
	//jobject should be of type EiffelBridge from the Java world..
	static void log(JNIEnv*, jobject, string&);
};

