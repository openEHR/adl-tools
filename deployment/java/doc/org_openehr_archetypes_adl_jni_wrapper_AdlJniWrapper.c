/*
 * component:   "openEHR ADL Reference Parser"
 * description: "Wrapper class for JNI-ised Eiffel reference parser"
 * keywords:    "ADL, archetype, JNI, wrapper"
 *
 * author:      "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
 * contributors:"Rahil Qamar "qamarr@cs.man.ac.uk>"
 * support:     "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
 * copyright:   "Copyright (c) 2004,2005 Ocean Informatics Australia, Manchester University"
 * license:     "See notice at bottom of class"
 *
 * file:        "$Source: java/jni_c/SCCS/s.org_openehr_archetypes_adl_jni_wrapper_AdlJniWrapper.c $"
 * revision:    "$Revision$"
 * last_change: "$Date$"
 *
 * THIS VERSION ABRIDGED FROM ORIGINAL FOR DOCUMENTATION PURPOSES
 *
 */

#include "org_openehr_archetypes_adl_jni_wrapper_AdlJniWrapper.h"
#include "eif_eiffel.h"
#include "eif_cecil.h"

#include <stdio.h>


/*
 * Method:    jarchetype_available ########### SIMPLE BOOLEAN-RETURNING FUNCTION
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1available
  (JNIEnv *env, jobject obj)
{
	return archetype_available();
}

/*
 * Method:    jcreate_new_archetype ########### PROCEDURE (VOID-RETURNING FUNCTION) TAKING STRING ARGS
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1new_1archetype
  (JNIEnv *env, jobject obj, jstring orginator, jstring name, jstring entity, jstring lang)
{
	const char *a_im_originator = (*env)->GetStringUTFChars(env, orginator, 0);
	const char *a_im_name = (*env)->GetStringUTFChars(env, name, 0);
	const char *a_im_entity = (*env)->GetStringUTFChars(env, entity, 0);
	const char *a_primary_language = (*env)->GetStringUTFChars(env, lang, 0);

	create_new_archetype(a_im_originator, a_im_name, a_im_entity,a_primary_language);

	(*env)->ReleaseStringUTFChars(env, im_originator, a_im_originator);
	(*env)->ReleaseStringUTFChars(env, im_name, a_im_name);
	(*env)->ReleaseStringUTFChars(env, im_entity, a_im_entity);
	(*env)->ReleaseStringUTFChars(env, im_primary_language, a_im_primary_language);

	return;
}


/*
 * Method:    jparse_archetype ######### PROCEDURE
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jparse_1archetype
  (JNIEnv *env, jobject obj)
{
	parse_archetype();
	return;
}

/*
 * Method:    jstatus ######### STRING-RETURNING FUNCTION
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jstatus
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, status());
}


/*
* Method:	jcreate_c_string_make_from_string_list ####### FUNCTION TAKING ARRAY[STRING] ARGUMENT
*           (THIS IS NOT YET WORKING)
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1string_1make_1from_1string_1list
(JNIEnv *env, jobject obj, jobjectArray str_lst)
{
	jsize len = (*env)->GetArrayLength(env, str_lst);
	char **new_str_lst;
	int i;
	EIF_PROCEDURE p_make;
	EIF_TYPE_ID tid;
	EIF_OBJECT eif_array;

	// create C array
	new_str_lst = malloc(len * sizeof(char*));
	for (i=0; i<len; i++) {
		jstring str = (jstring) (*env)->GetObjectArrayElement(env, str_lst, (jsize)i);
		new_str_lst[i] = (char *) (*env)->GetStringUTFChars(env, str, 0);
	}
	
	// Make Eiffel array
	tid = eif_type_id ("ARRAY[POINTER]");
	if (tid != EIF_NO_TYPE) {
		eif_array = eif_create(tid);
		p_make = eif_procedure ("make", tid);
		if (p_make != NULL) {
			(p_make)(eif_access(eif_array), 0);
			// FIXME: eif_make_from_c(eif_array, new_str_lst, len, tid);
		}
	}
	else {
		eif_panic("No type id");
	}

	free (new_str_lst);

	return create_c_string_make_from_string_list(eif_wean(eif_array));
}


/*
* Method:	jarchetype_logical_paths ############# FUNCTION RETURNING Java Array[String]
*/
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1logical_1paths
(JNIEnv *env, jobject obj, jstring lang)
{
	jobjectArray result;
	int i;
	int len = archetype_logical_paths_count();
	char **eif_array = archetype_logical_paths();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}


/*
 *  ***** BEGIN LICENSE BLOCK *****
 *  Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 *  The contents of this file are subject to the Mozilla Public License Version
 *  1.1 (the 'License'); you may not use this file except in compliance with
 *  the License. You may obtain a copy of the License at
 *  http://www.mozilla.org/MPL/
 *
 *  Software distributed under the License is distributed on an 'AS IS' basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 *  for the specific language governing rights and limitations under the
 *  License.
 *
 *  The Original Code is AdlJniWrapper.c
 *
 *  The Initial Developer of the Original Code is Rong Chen.
 *  Portions created by the Initial Developer are Copyright (C) 2003-2004
 *  the Initial Developer. All Rights Reserved.
 *
 *  Contributor(s):
 *
 * Software distributed under the License is distributed on an 'AS IS' basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 *  ***** END LICENSE BLOCK *****
 */
