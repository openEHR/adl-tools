#include "JavaAOMHelper.h"



JavaAOMHelper::JavaAOMHelper(JNIEnv* pEnv)
{
	_env = pEnv;
	_stringParamaterSignature = new string("(Ljava/lang/String;)V");
}


JavaAOMHelper::~JavaAOMHelper(void)
{
	if(_stringParamaterSignature != NULL)
		delete _stringParamaterSignature;
	//TODO: cleaning up objects created with jni, and other resource management should happen here. 
	//for example, nested ccomplex object attributes etc..
}

void JavaAOMHelper::initializeJavaTypes()
{
	_cComplexObjectFactoryClass = _env->FindClass("uk/ac/ucl/chime/CComplexObjectFactory");
	_cAttributeFactoryClass = _env->FindClass("uk/ac/ucl/chime/CAttributeFactory");
	_cPrimitiveObjectFactoryClass = _env->FindClass("uk/ac/ucl/chime/CPrimitiveObjectFactory");
	_cPrimitiveFactoryClass = _env->FindClass("uk/ac/ucl/chime/CPrimitiveFactory");
}

void JavaAOMHelper::createCComplexObjectFactory()
{	
	jmethodID constrMId = _env->GetMethodID(_cComplexObjectFactoryClass, "<init>", "()V");
	_cComplexObjectFactory = _env->NewObject(_cComplexObjectFactoryClass, constrMId);	
}

void JavaAOMHelper::setCComplexObjectPath(string &pPath)
{
	jmethodID methodSetPath = _env->GetMethodID(_cComplexObjectFactoryClass, "setPath", (*_stringParamaterSignature).c_str());
	jstring path = _env->NewStringUTF(pPath.c_str());//TODO: release this jstring
	_env->CallVoidMethod(_cComplexObjectFactory, methodSetPath, path);
}

void JavaAOMHelper::setCComplexObjectRMTypeName(string &pTypeName)
{
	jmethodID methodSetRMTypeName = _env->GetMethodID(_cComplexObjectFactoryClass, "setRMTypeName", (*_stringParamaterSignature).c_str());
	jstring rmTypeName = _env->NewStringUTF(pTypeName.c_str());
	_env->CallVoidMethod(_cComplexObjectFactory, methodSetRMTypeName, rmTypeName);
}

void JavaAOMHelper::setCComplexObjectOccurences(int pLower, int pUpper)
{
	jmethodID methodSetOccurances = _env->GetMethodID(_cComplexObjectFactoryClass, "setOccurences", "(II)V");	
	_env->CallVoidMethod(_cComplexObjectFactory, methodSetOccurances, pLower, pUpper);
}

void JavaAOMHelper::setCComplexObjectParent(jobject pParent)
{
	jmethodID methodSetParent = _env->GetMethodID(_cComplexObjectFactoryClass, "setParent", "(Lorg/openehr/am/archetype/constraintmodel/CAttribute;)V");
	_env->CallVoidMethod(_cComplexObjectFactory, methodSetParent, pParent);
}

void JavaAOMHelper::setCComplexObjectNodeId(string &pNodeId)
{
	jmethodID methodSetNodeId = _env->GetMethodID(_cComplexObjectFactoryClass, "setNodeId", (*_stringParamaterSignature).c_str());
	jstring nodeId = _env->NewStringUTF(pNodeId.c_str());
	_env->CallVoidMethod(_cComplexObjectFactory, methodSetNodeId, nodeId);
}

void JavaAOMHelper::createCAttributeFactory()
{
	jmethodID cAttributeConstr = _env->GetMethodID(_cAttributeFactoryClass, "<init>", "()V");
	_cAttributeFactory = _env->NewObject(_cAttributeFactoryClass, cAttributeConstr);
}

void JavaAOMHelper::setCAttributeFactoryPath(string &pPath)
{
	jmethodID methodSetPath = _env->GetMethodID(_cAttributeFactoryClass, "setPath", (*_stringParamaterSignature).c_str());
	jstring path = _env->NewStringUTF(pPath.c_str());//TODO: release this jstring
	_env->CallVoidMethod(_cAttributeFactory, methodSetPath, path);
}

void JavaAOMHelper::setCAttributeRMAttributeName(string &pPath)
{
	jmethodID methodCAttrSetRMAttrName = _env->GetMethodID(_cAttributeFactoryClass, "setRMAttributeName", (*_stringParamaterSignature).c_str());
	jstring cAttrRMAttrName = _env->NewStringUTF(pPath.c_str());
	_env->CallVoidMethod(_cAttributeFactory, methodCAttrSetRMAttrName, cAttrRMAttrName);
}

void JavaAOMHelper::setCAttributeExistence(string& pExistence)
{
	jmethodID methodCAttrSetExistence = _env->GetMethodID(_cAttributeFactoryClass, "setExistence", (*_stringParamaterSignature).c_str());
	jstring cAttrExistence = _env->NewStringUTF(pExistence.c_str());
	_env->CallVoidMethod(_cAttributeFactory, methodCAttrSetExistence, cAttrExistence);
}

void JavaAOMHelper::createCPrimitiveObjectFactory()
{	
	jmethodID cPrimitiveObjectFactoryConstr = _env->GetMethodID(_cPrimitiveObjectFactoryClass, "<init>", "()V");
	_cPrimitiveObjectFactory = _env->NewObject(_cPrimitiveObjectFactoryClass, cPrimitiveObjectFactoryConstr);
}

void JavaAOMHelper::setCPrimitiveObjectFactoryPath(string& pPath)
{
	jmethodID methodCPrimitiveObjFactSetPath = _env->GetMethodID(_cPrimitiveObjectFactoryClass, "setPath", (*_stringParamaterSignature).c_str());
	jstring cPrimitiveObjPath = _env->NewStringUTF(pPath.c_str());
	_env->CallVoidMethod(_cPrimitiveObjectFactory, methodCPrimitiveObjFactSetPath, cPrimitiveObjPath);
}

void JavaAOMHelper::setCPrimitiveObjectFactoryInterval(int pLower, int pUpper)
{
	jmethodID methodCPrimitiveObjFactSetInterval = _env->GetMethodID(_cPrimitiveObjectFactoryClass, "setInterval", "(II)V");
	jint cPrimitiveObjFactIntervalLower = pLower;
	jint cPrimitiveObjFactIntervalUpper = pUpper;
	_env->CallVoidMethod(_cPrimitiveObjectFactory, methodCPrimitiveObjFactSetInterval, cPrimitiveObjFactIntervalLower, cPrimitiveObjFactIntervalUpper);
}

void JavaAOMHelper::setCPrimitiveObjectFactoryNodeId(string &pNodeId)
{
	jmethodID methodCPrimitiveObjFactSetNodeId = _env->GetMethodID(_cPrimitiveObjectFactoryClass, "setNodeId", (*_stringParamaterSignature).c_str());
	jstring cPrimitiveObjctFactNodeId = _env->NewStringUTF(pNodeId.c_str());
	_env->CallVoidMethod(_cPrimitiveObjectFactory, methodCPrimitiveObjFactSetNodeId, cPrimitiveObjctFactNodeId);
}

void JavaAOMHelper::createCPrimitiveFactory()
{	
	jmethodID cPrimitiveFactConstr = _env->GetMethodID(_cPrimitiveFactoryClass, "<init>", "()V");
	_cPrimitiveFactory = _env->NewObject(_cPrimitiveFactoryClass, cPrimitiveFactConstr);
}

void JavaAOMHelper::setCPrimitiveFactoryCStringPattern(string &pPattern)
{
	jmethodID methodCPrimitiveSetCStringPattern = _env->GetMethodID(_cPrimitiveFactoryClass, "setCStringPattern", (*_stringParamaterSignature).c_str());
	jstring cPrimitiveStringPattrn = _env->NewStringUTF(pPattern.c_str());
	_env->CallVoidMethod(_cPrimitiveFactory, methodCPrimitiveSetCStringPattern, cPrimitiveStringPattrn);
}

void JavaAOMHelper::addStringToCPrimitiveFactoryCStringList(string &pStringToAdd)
{
	jmethodID methodCPrimitiveAddStrToStrPattern = _env->GetMethodID(_cPrimitiveFactoryClass, "addStringToCStringList", (*_stringParamaterSignature).c_str());
	jstring cPrimitiveString = _env->NewStringUTF(pStringToAdd.c_str());
	_env->CallVoidMethod(_cPrimitiveFactory, methodCPrimitiveAddStrToStrPattern, cPrimitiveString);
}

jobject JavaAOMHelper::buildCStringWthCPrimitiveFactory()
{
	jmethodID methodCPrimitiveBuildCString = _env->GetMethodID(_cPrimitiveFactoryClass, "buildCString", "()Lorg/openehr/am/archetype/constraintmodel/primitive/CPrimitive;");
	jobject cStringObj = _env->CallObjectMethod(_cPrimitiveFactory, methodCPrimitiveBuildCString);	
	return cStringObj;
}

void JavaAOMHelper::setCPrimitiveObjectFactoryItem(jobject pItem)
{
	jmethodID methodCPrimitiveObjFactSetItem = _env->GetMethodID(_cPrimitiveObjectFactoryClass, "setItem", "(Lorg/openehr/am/archetype/constraintmodel/primitive/CPrimitive;)V");
	_env->CallVoidMethod(_cPrimitiveObjectFactory, methodCPrimitiveObjFactSetItem, pItem);
}

jobject JavaAOMHelper::buildCPrimitiveObjectWthCPrimitiveObjectFactory()
{
	jmethodID methodCPrimitiveObjFactoryBuildCPrimitiveObject = _env->GetMethodID(_cPrimitiveObjectFactoryClass, "buildCPrimitiveObject", "()Lorg/openehr/am/archetype/constraintmodel/CPrimitiveObject;");
	jobject cPrimitiveObject = _env->CallObjectMethod(_cPrimitiveObjectFactory, methodCPrimitiveObjFactoryBuildCPrimitiveObject);
	return cPrimitiveObject;
}

void JavaAOMHelper::addChildToCAttributeFactoryChildren(jobject pChild)
{
	jmethodID methodAddChild = _env->GetMethodID(_cAttributeFactoryClass, "addChild", "(Lorg/openehr/am/archetype/constraintmodel/CObject;)V");
	_env->CallVoidMethod(_cAttributeFactory, methodAddChild, pChild);
}

jobject JavaAOMHelper::buildSingleCAttributeUsingCAttributeFactory()
{
	jmethodID methodBuildSingleAttribute = _env->GetMethodID(_cAttributeFactoryClass, "buildSingleCAttribute", "()Lorg/openehr/am/archetype/constraintmodel/CAttribute;");
	jobject singleAttrObj = _env->CallObjectMethod(_cAttributeFactory, methodBuildSingleAttribute);
	return singleAttrObj;
}

void JavaAOMHelper::addAttributeToCComplexObject(jobject pAttribute)
{
	jmethodID methodAddCAttribute = _env->GetMethodID(_cComplexObjectFactoryClass, "addCAttributes", "(Lorg/openehr/am/archetype/constraintmodel/CAttribute;)V");
	_env->CallVoidMethod(_cComplexObjectFactory, methodAddCAttribute, pAttribute);
}

jobject JavaAOMHelper::buildCComplexObjectWthCComplexObjectFactory()
{
	jmethodID methodBuildComplexObject = _env->GetMethodID(_cComplexObjectFactoryClass, "buildCComplexObject", "()Lorg/openehr/am/archetype/constraintmodel/CComplexObject;");
	jobject cComplexObj = _env->CallObjectMethod(_cComplexObjectFactory, methodBuildComplexObject);
	return cComplexObj;
}

jobject JavaAOMHelper::getLastBuiltCComplexObject()
{
	return _lastBuiltCComplexObject;
}

jobject JavaAOMHelper::getLastBuiltCAttributeObject()
{
	return _lastBuiltCAttributeObject;
}

jobject JavaAOMHelper::getLastBuiltCPrimitiveObject()
{
	return _lastBuiltCPrimitiveObject;
}

jobject JavaAOMHelper::getLastBuiltCPrimitive()
{
	return _lastBuiltCPrimitiveObject;
}