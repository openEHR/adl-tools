#pragma once
#include "IArchetypeVisitor.h"
#include "jni.h"

//jni related resources should not be cached, so this visitor should be used per call from JAVA side
class ArchetypeVisitor : public IArchetypeVisitor
{
public:
	ArchetypeVisitor(void);
	ArchetypeVisitor(JNIEnv*, jobject);
	~ArchetypeVisitor(void);
	
	void startCComplexObject(EIF_REFERENCE, EIF_INTEGER);
	void endCComplexObject(EIF_REFERENCE, EIF_INTEGER);

	void startCAttributeNode(EIF_REFERENCE, EIF_INTEGER);
	void endCAttributeNode(EIF_REFERENCE, EIF_INTEGER);

	void startCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER);
	void endCPrimitiveObject(EIF_REFERENCE, EIF_INTEGER);

	//JNI setters, no getters since this'll be used internally
	void setJniEnv(JNIEnv*);		

private:	 
	JNIEnv* env;
	jobject obj;
};

