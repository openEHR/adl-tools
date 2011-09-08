#include "JNILogger.h"


JNILogger::JNILogger(void)
{
}


JNILogger::~JNILogger(void)
{
}

void JNILogger::log(JNIEnv *env, jobject obj, string& pText){
	jclass eiffelBridge = env->FindClass("uk/ac/ucl/chime/EiffelBridge");
	if(eiffelBridge == NULL)
		cout << "Could not find EiffelBridge type" << endl;
	jmethodID logMethod = env->GetMethodID(eiffelBridge, "printLog", "(Ljava/lang/String;)V");
	jstring paramVal = env->NewStringUTF(pText.c_str());
	env->CallVoidMethod(obj, logMethod, paramVal);
}