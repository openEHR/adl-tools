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
 * file:        "$URL$"
 * revision:    "$LastChangedRevision$"
 * last_change: "$LastChangedDate$"
 */

#include "org_openehr_archetypes_adl_jni_wrapper_AdlJniWrapper.h"
#include "eif_eiffel.h"
#include "eif_cecil.h"

#include <stdio.h>


/*
 * Method:    jarchetype_available
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1available
  (JNIEnv *env, jobject obj)
{
	return archetype_available();
}

/*
 * Method:    jarchetype_source_loaded
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1source_1loaded
  (JNIEnv *env, jobject obj)
{
	return archetype_source_loaded();
}

/*
 * Method:    jarchetype_valid
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1valid
  (JNIEnv *env, jobject obj)
{
	return archetype_valid();
}

/*
 * Method:    jcreate_new_archetype
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1new_1archetype
  (JNIEnv *env, jobject obj, jstring im_originator, jstring im_name, jstring im_entity, jstring primary_language)
{
	const char *a_im_originator = (*env)->GetStringUTFChars(env, im_originator, 0);
	const char *a_im_name = (*env)->GetStringUTFChars(env, im_name, 0);
	const char *a_im_entity = (*env)->GetStringUTFChars(env, im_entity, 0);
	const char *a_primary_language = (*env)->GetStringUTFChars(env, primary_language, 0);

	create_new_archetype(a_im_originator, a_im_name, a_im_entity,a_primary_language);

	(*env)->ReleaseStringUTFChars(env, im_originator, a_im_originator);
	(*env)->ReleaseStringUTFChars(env, im_name, a_im_name);
	(*env)->ReleaseStringUTFChars(env, im_entity, a_im_originator);
	(*env)->ReleaseStringUTFChars(env, primary_language, a_primary_language);

	return;
}


/*
 * Method:    jexception_encountered
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jexception_1encountered
  (JNIEnv *env, jobject obj)
{
	return exception_encountered();
}

/*
 * Method:    jfile_changed_on_disk
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jfile_1changed_1on_1disk
  (JNIEnv *env, jobject obj)
{
	return file_changed_on_disk();
}

/*
 * Method:    jhas_archetype_serialiser_format
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1archetype_1serialiser_1format
  (JNIEnv *env, jobject obj, jstring format)
{
	jboolean result;
	char *a_format = (*env)->GetStringUTFChars(env, format, 0);

	result = has_archetype_serialiser_format(a_format);

	(*env)->ReleaseStringUTFChars(env, format, a_format);

	return result;
}


/*
 * Method:    jmake
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jmake
  (JNIEnv *env, jobject obj)
{
	make();
	return;
}

/*
 * Method:    jopen_adl_file
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jopen_1adl_1file
  (JNIEnv *env, jobject obj, jstring path)
{
	char *a_path = (*env)->GetStringUTFChars(env, path, 0);

	open_adl_file(a_path);

	(*env)->ReleaseStringUTFChars(env, path, a_path);

	return;
}

/*
 * Method:    jparse_archetype
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jparse_1archetype
  (JNIEnv *env, jobject obj)
{
	parse_archetype();
	return;
}

/*
 * Method:    jparse_succeeded
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jparse_1succeeded
  (JNIEnv *env, jobject obj)
{
	return parse_succeeded();
}


/*
 * Method:    jreset
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jreset
  (JNIEnv *env, jobject obj)
{
	reset();
	return;
}

/*
 * Method:    jresync_file
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jresync_1file
  (JNIEnv *env, jobject obj)
{
	resync_file();
	return;
}

/*
 * Method:    jsave_archetype
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jsave_1archetype
  (JNIEnv *env, jobject obj, jstring path, jstring format)
{
	const char *file_path = (*env)->GetStringUTFChars(env, path, 0);
	const char *save_format = (*env)->GetStringUTFChars(env, format, 0);

	save_archetype(file_path, save_format);

	(*env)->ReleaseStringUTFChars(env, path, file_path);
	(*env)->ReleaseStringUTFChars(env, format, save_format);

	return;
}


/*
 * Method:    jsave_succeeded
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jsave_1succeeded
  (JNIEnv *env, jobject obj)
{
	return save_succeeded();
}

/*
 * Method:    jserialised_archetype
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jserialised_1archetype
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, serialised_archetype());
}

/*
 * Method:    jset_current_directory
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jset_1current_1directory
  (JNIEnv *env, jobject obj, jstring dir)
{
	char *a_dir = (*env)->GetStringUTFChars(env, dir, 0);

	set_current_directory(a_dir);

	(*env)->ReleaseStringUTFChars(env, dir, a_dir);

	return;
}

/*
 * Method:    jspecialise_archetype
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jspecialise_1archetype
  (JNIEnv *env, jobject obj, jstring spec)
{
	char *a_spec = (*env)->GetStringUTFChars(env, spec, 0);

	specialise_archetype(a_spec);

	(*env)->ReleaseStringUTFChars(env, spec, a_spec);

	return;
}


/*
 * Method:    jstatus
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jstatus
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, status());
}

/*
 * Method:    jopenehr_version
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jopenehr_1version
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, openehr_version());
}

/*
* Method:	jserialise_archetype
*/
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jserialise_1archetype
(JNIEnv *env,jobject obj,jstring format)
{
	char *a_format = (*env)-> GetStringUTFChars(env, format, 0);
	
	serialise_archetype(a_format);

	(*env)->ReleaseStringUTFChars(env, format, a_format);
	return;
}


/*
 * ------------------ FACTORY --------------------
 */

/*
* Method:	jis_valid_iso8601_date_constraint_pattern
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1date_1constraint_1pattern
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_date_constraint_pattern(a_str);
	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jis_valid_iso8601_date_string
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1date_1string
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_date_string(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jis_valid_iso8601_date_time_constraint_pattern
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1date_1time_1constraint_1pattern
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_date_time_constraint_pattern(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jis_valid_iso8601_date_time_string
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1date_1time_1string
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_date_time_string(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jis_valid_iso8601_duration_string
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1duration_1string
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_duration_string(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jis_valid_iso8601_time_constraint_pattern
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1time_1constraint_1pattern
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_time_constraint_pattern(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jis_valid_iso8601_time_string
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jis_1valid_1iso8601_1time_1string
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	jboolean result;

	result = is_valid_iso8601_time_string(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	return result;
}

/*
* Method:	jcreate_c_boolean_make_false
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1boolean_1make_1false
(JNIEnv *env,jobject obj)
{
	return create_c_boolean_make_false();
}

/*
* Method:	jcreate_c_boolean_make_true
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1boolean_1make_1true
(JNIEnv *env,jobject obj)
{
	return	create_c_boolean_make_true();
}

/*
* Method:	jcreate_c_boolean_make_true_false
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1boolean_1make_1true_1false
(JNIEnv *env,jobject obj)
{
	return create_c_boolean_make_true_false();
}

/*
* Method:	jcreate_c_date_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1make_1bounded
(JNIEnv *env,jobject obj,jstring lower,jstring upper)
{
	const char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	const char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_date_make_bounded(a_lower, an_upper);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);
	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	jcreate_c_date_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1make_1lower_1unbounded
(JNIEnv *env,jobject obj,jstring upper)
{
	char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;
	
	result = create_c_date_make_lower_unbounded(an_upper);

	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	jcreate_c_date_make_pattern
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1make_1pattern
(JNIEnv *env, jobject obj,jstring pattern)
{
	char *a_pattern = (*env)-> GetStringUTFChars(env, pattern, 0);
	int result;
	
	result = create_c_date_make_pattern(a_pattern);

	(*env)->ReleaseStringUTFChars(env, pattern, a_pattern);

	return result;
}

/*
* Method:	jcreate_c_date_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1make_1unbounded
(JNIEnv *env,jobject obj)
{

	return create_c_date_make_unbounded(); 
}

/*
* Method:	jcreate_c_date_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jstring lower)
{
	char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	int result;

	result = create_c_date_make_upper_unbounded(a_lower);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);

	return result;
}

/*
* Method:	jcreate_c_date_time_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1time_1make_1bounded
(JNIEnv *env,jobject obj,jstring lower,jstring upper)
{
	const char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	const char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_date_time_make_bounded(a_lower, an_upper);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);
	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	jcreate_c_date_time_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1time_1make_1lower_1unbounded
(JNIEnv *env,jobject obj, jstring upper)
{
	char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_date_time_make_lower_unbounded(an_upper);

	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method: jcreate_c_date_time_make_pattern
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1time_1make_1pattern
(JNIEnv *env,jobject obj,jstring pattern)
{
	char *a_pattern = (*env)-> GetStringUTFChars(env, pattern, 0);
	int result;

	result = create_c_date_time_make_pattern(a_pattern);

	(*env)->ReleaseStringUTFChars(env, pattern, a_pattern);

	return result;
}

/*
* Method:	jcreate_c_date_time_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1time_1make_1unbounded
(JNIEnv *env,jobject obj)
{
	
	return create_c_date_time_make_unbounded();
}

/*
* Method:	jcreate_c_date_time_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1date_1time_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jstring lower)
{
	char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	int result;

	result = create_c_date_time_make_upper_unbounded(a_lower);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);

	return result;
}

/*
* Method:	jcreate_c_duration_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1duration_1make_1bounded
(JNIEnv *env, jobject obj, jstring lower, jstring upper, jboolean include_lower, jboolean include_upper)
{
	const char *a_lower = (*env)->GetStringUTFChars(env, lower, 0);
	const char *an_upper = (*env)->GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_duration_make_bounded(a_lower,an_upper, include_lower, include_upper);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);
	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	jcreate_c_duration_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1duration_1make_1lower_1unbounded
(JNIEnv *env,jobject obj, jstring upper, jboolean include_upper)
{
	char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_duration_make_lower_unbounded(an_upper, include_upper);

	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	 jcreate_c_duration_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1duration_1make_1unbounded
(JNIEnv *env,jobject obj)
{
	
	return create_c_duration_make_unbounded();
}

/*
* Method:	jcreate_c_duration_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1duration_1make_1upper_1unbounded
(JNIEnv *env, jobject obj, jstring lower, jboolean include_lower)
{
	char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	int result;

	result = create_c_duration_make_upper_unbounded(a_lower, include_lower);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);

	return result;
}

/*
* Method:	jcreate_c_integer_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1integer_1make_1bounded
(JNIEnv *env,jobject obj,jint lower,jint upper, jboolean include_lower, jboolean include_upper)
{
	return create_c_integer_make_bounded(lower, upper, include_lower, include_upper);
}

/*
* Method:	jcreate_c_integer_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1integer_1make_1lower_1unbounded
(JNIEnv *env,jobject obj,jint upper, jboolean include_upper)
{
	
	return create_c_integer_make_lower_unbounded(upper, include_upper);
}

/*
* Method:	jcreate_c_integer_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1integer_1make_1unbounded
(JNIEnv *env,jobject obj)
{

	return create_c_integer_make_unbounded();
}

/*
* Method:	jcreate_c_integer_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1integer_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jint lower, jboolean include_lower)
{

	return create_c_integer_make_upper_unbounded(lower, include_lower);
}

/*
* Method:	jcreate_c_real_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1real_1make_1bounded
(JNIEnv *env,jobject obj,jfloat lower,jfloat upper, jboolean include_lower, jboolean include_upper)
{

	return create_c_real_make_bounded(lower, upper, include_lower, include_upper);
}

/*
* Method:	jcreate_c_real_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1real_1make_1lower_1unbounded
(JNIEnv *env,jobject obj,jfloat upper, jboolean include_upper)
{

	return create_c_real_make_lower_unbounded(upper, include_upper);
}

/*
* Method:	jcreate_c_real_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1real_1make_1unbounded
(JNIEnv *env,jobject obj)
{

	return create_c_real_make_unbounded();
}

/*
* Method:	jcreate_c_real_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1real_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jfloat lower, jboolean include_lower)
{

	return create_c_real_make_upper_unbounded(lower, include_lower);
}

/*
* Method:	jcreate_c_string_make_any
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1string_1make_1any
(JNIEnv *env,jobject obj)
{

	return create_c_string_make_any();
}

/*
* Method:	jcreate_c_string_make_from_regexp
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1string_1make_1from_1regexp
(JNIEnv *env,jobject obj,jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, str, 0);
	int result;

	result = create_c_string_make_from_regexp(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);

	return result;
}

/*
* Method:	jcreate_c_string_make_from_string
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1string_1make_1from_1string
(JNIEnv *env, jobject obj, jstring str)
{
	char *a_str = (*env)-> GetStringUTFChars(env, a_str, 0);
	int result;

	result = create_c_string_make_from_string(a_str);

	(*env)->ReleaseStringUTFChars(env, str, a_str);

	return result;
}

/*
* Method:	jcreate_c_string_make_from_string_list
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
* Method:	jcreate_c_time_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1time_1make_1bounded
(JNIEnv *env,jobject obj,jstring lower,jstring upper, jboolean include_lower, jboolean include_upper)
{
	const char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	const char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_time_make_bounded(a_lower, an_upper, include_lower, include_upper);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);
	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	jcreate_c_time_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1time_1make_1lower_1unbounded
(JNIEnv *env, jobject obj, jstring upper, jboolean include_upper)
{
	char *an_upper = (*env)-> GetStringUTFChars(env, upper, 0);
	int result;

	result = create_c_time_make_lower_unbounded(an_upper, include_upper);

	(*env)->ReleaseStringUTFChars(env, upper, an_upper);

	return result;
}

/*
* Method:	jcreate_c_time_make_pattern
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1time_1make_1pattern
(JNIEnv *env,jobject obj,jstring pattern)
{
	char *a_pattern = (*env)-> GetStringUTFChars(env, pattern, 0);
	int result;

	result = create_c_time_make_pattern(a_pattern);

	(*env)->ReleaseStringUTFChars(env, pattern, a_pattern);

	return result;
}

/*
* Method:	jcreate_c_time_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1time_1make_1unbounded
(JNIEnv *env,jobject obj)
{

	return create_c_time_make_unbounded();
}


/*
* Method:	jcreate_c_time_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1time_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jstring lower, jboolean include_lower)
{
	char *a_lower = (*env)-> GetStringUTFChars(env, lower, 0);
	int result;

	result = create_c_time_make_upper_unbounded(a_lower, include_lower);

	(*env)->ReleaseStringUTFChars(env, lower, a_lower);

	return result;
}

/*
* Method:	jcreate_c_integer_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1integer_1interval_1make_1bounded
(JNIEnv *env,jobject obj,jint lower,jint upper, jboolean include_lower, jboolean include_upper)
{

	return create_c_integer_make_bounded(lower, upper, include_lower, include_upper);
}

/*
* Method:	jcreate_c_integer_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1integer_1interval_1make_1lower_1unbounded
(JNIEnv *env,jobject obj,jint upper, jboolean include_upper)
{

	return create_c_integer_make_lower_unbounded(upper, include_upper);
}

/*
* Method:	jcreate_c_integer_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1integer_1interval_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jint lower, jboolean include_lower)
{

	return create_c_integer_make_upper_unbounded(lower, include_lower);
}

/*
* Method:	jcreate_c_real_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1real_1interval_1make_1bounded
(JNIEnv *env,jobject obj,jfloat lower,jfloat upper, jboolean include_lower, jboolean include_upper)
{

	return create_c_real_make_bounded(lower, upper, include_lower, include_upper);
}

/*
* Method:	jcreate_c_real_make_lower_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1real_1interval_1make_1lower_1unbounded
(JNIEnv *env,jobject obj,jfloat upper, jboolean include_upper)
{

	return create_c_real_make_lower_unbounded(upper, include_upper);
}

/*
* Method:	jcreate_c_real_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1real_1interval_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jfloat lower, jboolean include_lower)
{

	return create_c_real_make_upper_unbounded(lower, include_lower);
}

/*
* Method:	jhas_archetype_internal_ref
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1archetype_1internal_1ref
(JNIEnv *env,jobject obj,jint handle)
{
	
	return has_archetype_internal_ref(handle);
}

/*
* Method:	jhas_archetype_slot
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1archetype_1slot
(JNIEnv *env,jobject obj,jint handle)
{

	return has_archetype_slot(handle);
}

/*
* Method:	jhas_c_attribute
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1c_1attribute
(JNIEnv *env,jobject obj,jint handle)
{

	return has_c_attribute(handle);
}

/*
* Method:	jhas_c_coded_term
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1c_1coded_1term
(JNIEnv *env,jobject obj,jint handle)
{

	return has_c_coded_term(handle);
}

/*
* Method:	jhas_c_complex_object
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1c_1complex_1object
(JNIEnv *env,jobject obj,jint handle)
{

	return has_c_complex_object(handle);
}

/*
* Method:	jhas_c_ordinal
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1c_1ordinal
(JNIEnv *env,jobject obj,jint handle)
{

	return has_c_ordinal(handle);
}

/*
* Method:	jhas_c_quantity
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1c_1quantity
(JNIEnv *env,jobject obj,jint handle)
{

	return has_c_quantity(handle);
}

/*
* Method:	jhas_cardinality
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1cardinality
(JNIEnv *env,jobject obj,jint handle)
{

	return has_cardinality(handle);
}

/*
* Method:	jhas_constraint_ref
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jhas_1constraint_1ref
(JNIEnv *env,jobject obj,jint handle)
{

	return has_constraint_ref(handle);
}

/*
* Method:	jcreate_archetype_internal_ref
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1archetype_1internal_1ref
(JNIEnv *env,jobject obj,jint attr, jstring name, jstring path)
{
	const char *a_name = (*env)-> GetStringUTFChars(env, name, 0);
	const char *a_path = (*env)-> GetStringUTFChars(env, path, 0);
	int result;
	
	result = create_archetype_internal_ref(attr, a_name, a_path);

	(*env)->ReleaseStringUTFChars(env, name, a_name);
	(*env)->ReleaseStringUTFChars(env, path, a_path);

	return result;
}

/*
* Method:	jcreate_archetype_slot_anonymous
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1archetype_1slot_1anonymous
(JNIEnv *env, jobject obj, jint attr, jstring name)
{
	char *a_name = (*env)-> GetStringUTFChars(env, name, 0);
	int result;
		
	result = create_archetype_slot_anonymous(attr, a_name);

	(*env)->ReleaseStringUTFChars(env, name, a_name);

	return result;
}

/*
* Method:	jcreate_archetype_slot_identified
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1archetype_1slot_1identified
(JNIEnv *env, jobject obj, jint attr, jstring name, jstring node_id)
{
	const char *a_name = (*env)-> GetStringUTFChars(env, name, 0);
	const char *a_node_id = (*env)-> GetStringUTFChars(env, node_id, 0);
	int result;
	
	result = create_archetype_internal_ref(attr, a_name, a_node_id);

	(*env)->ReleaseStringUTFChars(env, name, a_name);
	(*env)->ReleaseStringUTFChars(env, node_id, a_node_id);

	return result;
}

/*
* Method:	jcreate_c_attribute_multiple
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1attribute_1multiple
(JNIEnv *env, jobject obj, jint complObj, jstring name, jint cardinality)
{
	char *a_name = (*env)-> GetStringUTFChars(env, name, 0);
	int result;

	result = create_c_attribute_multiple(complObj, a_name, cardinality);

	(*env)->ReleaseStringUTFChars(env, name, a_name);

	return result;
}

/*
* Method:	jcreate_c_attribute_single
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1attribute_1single
(JNIEnv *env, jobject obj, jint complObj, jstring name)
{
	char *a_name = (*env)-> GetStringUTFChars(env, name, 0);
	int result;

	result = create_c_attribute_single(complObj, a_name);

	(*env)->ReleaseStringUTFChars(env, name, a_name);

	return result;
}

/*
* Method:	jcreate_c_coded_term_from_pattern
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1coded_1term_1from_1pattern
(JNIEnv *env,jobject obj, jint attribute, jstring constraint)
{
	char *a_constraint = (*env)-> GetStringUTFChars(env, constraint, 0);
	int result;

	result = create_c_coded_term_from_pattern(attribute, a_constraint);

	(*env)->ReleaseStringUTFChars(env, constraint, a_constraint);

	return result;
}

/*
* Method:	jcreate_c_complex_object_anonymous
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1complex_1object_1anonymous
(JNIEnv *env,jobject obj,jint attribute,jstring name)
{
	char *a_name = (*env)-> GetStringUTFChars(env, name, 0);
	int result;

	result = create_c_complex_object_anonymous(attribute, a_name);

	(*env)->ReleaseStringUTFChars(env, name, a_name);

	return result;
}

/*
* Method:	jcreate_c_complex_object_identified
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1complex_1object_1identified
(JNIEnv *env,jobject obj, jint attr, jstring name, jstring node_id)
{
	const char *a_name = (*env)->GetStringUTFChars(env, name, 0);
	const char *a_node_id = (*env)->GetStringUTFChars(env, node_id, 0);
	int result;

	result = create_c_complex_object_identified(attr, a_name, a_node_id);

	(*env)->ReleaseStringUTFChars(env, name, a_name);
	(*env)->ReleaseStringUTFChars(env, node_id, a_node_id);

	return result;
}

/*
* Method:	jcreate_c_ordinal
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1ordinal
(JNIEnv *env,jobject obj,jint attribute)
{

	return create_c_ordinal(attribute);
}

/*
* Method:	jcreate_ordinal
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1ordinal
(JNIEnv *env, jobject obj, jint ordinal, jint value, jstring phrase)
{
	char *a_phrase = (*env)-> GetStringUTFChars(env, phrase, 0);
	int result;

	result = create_ordinal(ordinal, value, a_phrase);

	(*env)->ReleaseStringUTFChars(env, phrase, a_phrase);

	return result;
}

/*
* Method:	jcreate_c_primitive_object
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1primitive_1object
(JNIEnv *env,jobject obj,jint attribute,jint primitive)
{

	return create_c_primitive_object(attribute, primitive);
}

/*
* Method:	jcreate_c_quantity
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1c_1quantity
(JNIEnv *env,jobject obj,jint attribute)
{

	return create_c_quantity(attribute);
}

/*
* Method:	jcreate_cardinality_make_bounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1cardinality_1make_1bounded
(JNIEnv *env,jobject obj,jint lower,jint upper)
{

	return create_cardinality_make_bounded(lower, upper);
}

/*
* Method:	jcreate_cardinality_make_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1cardinality_1make_1unbounded
(JNIEnv *env, jobject obj)
{
	return create_cardinality_make_unbounded();
}

/*
* Method:	jcreate_cardinality_make_upper_unbounded
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1cardinality_1make_1upper_1unbounded
(JNIEnv *env,jobject obj,jint lower)
{

	return create_cardinality_make_upper_unbounded(lower);
}

/*
* Method:	jcreate_constraint_ref
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1constraint_1ref
(JNIEnv *env,jobject obj, jint attribute, jstring code)
{
	char *a_code = (*env)-> GetStringUTFChars(env, code, 0);
	int result;

	result = create_constraint_ref(attribute, a_code);

	(*env)->ReleaseStringUTFChars(env, code, a_code);
	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jset_occurrences_c_object
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jset_1occurrences_1c_1object
  (JNIEnv *env, jobject obj, jint h_c_object, jint h_integer_interval)
{
	set_occurrences_c_object(h_c_object, h_integer_interval);
	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jarchetype_slot_add_include
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1slot_1add_1include
  (JNIEnv *env, jobject obj, jint h_archetype_slot, jint h_assertion)
{
	archetype_slot_add_include(h_archetype_slot, h_assertion);
	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jarchetype_slot_add_exclude
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1slot_1add_1exclude
  (JNIEnv *env, jobject obj, jint h_archetype_slot, jint h_assertion)
{
	archetype_slot_add_exclude(h_archetype_slot, h_assertion);
	return;
}

// ------------------- assertions ------------------------
 
/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_assertion
 * Signature: (ILjava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1assertion
  (JNIEnv *env, jobject obj, jint h_an_expr)
{
	return create_assertion(h_an_expr, NULL);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_assertion_with_tag
 * Signature: (ILjava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1assertion_1with_1tag
  (JNIEnv *env, jobject obj, jint h_an_expr, jstring tag)
{
	char *a_tag = (*env)-> GetStringUTFChars(env, tag, 0);
	int result;

	result = create_assertion(h_an_expr, a_tag);

	(*env)->ReleaseStringUTFChars(env, tag, a_tag);
	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_binary_operator_node
 * Signature: (III)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1binary_1operator_1node
  (JNIEnv *env, jobject obj, jint an_operator, jint h_a_left_operand, jint h_a_right_operand)
{
	int result;

	result = create_expr_binary_operator_node(an_operator, h_a_left_operand, h_a_right_operand);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_boolean
 * Signature: (Z)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1boolean
  (JNIEnv *env, jobject obj, jboolean item)
{
	return create_expr_leaf_boolean(item);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_character
 * Signature: (C)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1character
  (JNIEnv *env, jobject obj, jchar item)
{
	return create_expr_leaf_character(item);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_constraint
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1constraint
  (JNIEnv *env, jobject obj, jint h_an_item)
{
	return create_expr_leaf_constraint(h_an_item);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_archetype_feature_call
 * Signature: (Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1archetype_1feature_1call
  (JNIEnv *env, jobject obj, jstring ref)
{
	char *a_ref = (*env)->GetStringUTFChars(env, ref, 0);
	int result;

	result = create_expr_leaf_archetype_feature_call(a_ref);

	(*env)->ReleaseStringUTFChars(env, ref, a_ref);
	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_integer
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1integer
  (JNIEnv *env, jobject obj, jint item)
{
	return create_expr_leaf_integer(item);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_object_ref
 * Signature: (Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1object_1ref
  (JNIEnv *env, jobject obj, jstring ref_path)
{
	char *a_ref_path = (*env)->GetStringUTFChars(env, ref_path, 0);
	int result;

	result = create_expr_leaf_object_ref(a_ref_path);

	(*env)->ReleaseStringUTFChars(env, ref_path, a_ref_path);
	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_real
 * Signature: (F)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1real
  (JNIEnv *env, jobject obj, jfloat item)
{
	return create_expr_leaf_real(item);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_leaf_string
 * Signature: (Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1leaf_1string
  (JNIEnv *env, jobject obj, jstring item)
{
	char *an_item = (*env)->GetStringUTFChars(env, item, 0);
	int result;

	result = create_expr_leaf_string(an_item);

	(*env)->ReleaseStringUTFChars(env, item, an_item);
	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jcreate_expr_unary_operator_node
 * Signature: (II)I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jcreate_1expr_1unary_1operator_1node
  (JNIEnv *env, jobject obj, jint an_operator, jint h_an_operand)
{
	int result;

	result = create_expr_unary_operator_node(an_operator, h_an_operand);

	return result;
}

/*
 * ------------------ ARCHETYPE --------------------
 */

/*
* Method:	jarchetype_id
*/
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1id
(JNIEnv *env,jobject obj)
{

	return (*env)->NewStringUTF(env, archetype_id());
}

/*
* Method:	jarchetype_parent_archetype_id
*/
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1parent_1archetype_1id
(JNIEnv *env,jobject obj)
{

	return (*env)->NewStringUTF(env, archetype_parent_archetype_id());
}

/*
* Method:	jarchetype_concept_code
*/
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1concept_1code
(JNIEnv *env,jobject obj)
{
	
	return (*env)->NewStringUTF(env, archetype_concept_code());
}

/*
* Method:	jarchetype_specialisation_depth
*/
JNIEXPORT jobject JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1specialisation_1depth
(JNIEnv *env,jobject obj)
{

	return archetype_specialisation_depth();
}

/*
* Method:	jarchetype_version
*/
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1version
(JNIEnv *env,jobject obj)
{

	return (*env)-> NewStringUTF(env, archetype_version());
}

/*
* Method:	jarchetype_errors
*/
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1errors
(JNIEnv *env,jobject obj)
{

	return (*env)-> NewStringUTF(env, archetype_errors());
}

/*
* Method:	jarchetype_warnings
*/
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1warnings
(JNIEnv *env,jobject obj)
{

	return (*env)-> NewStringUTF(env, archetype_warnings());
}

/*
* Method:	jarchetype_logical_paths
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
 * Method:	jarchetype_physical_paths
 */
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1physical_1paths
(JNIEnv *env, jobject obj)
{
	jobjectArray result;
	int i;
	int len = archetype_physical_paths_count();
	char **eif_array = archetype_physical_paths();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}

/*
 * Method:	jarchetype_physical_to_logical_path
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1physical_1to_1logical_1path
(JNIEnv *env, jobject obj, jstring phys_path, jstring lang)
{
	const char *a_phys_path = (*env)->GetStringUTFChars(env, phys_path, 0);
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	char *result;

	result = archetype_physical_to_logical_path(a_phys_path, a_lang);

	(*env)->ReleaseStringUTFChars(env, phys_path, a_phys_path);
	(*env)->ReleaseStringUTFChars(env, lang, a_lang);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Method:	jarchetype_convert_to_specialised
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1convert_1to_1specialised
(JNIEnv *env, jobject obj, jstring concept)
{
	const char *a_concept = (*env)->GetStringUTFChars(env, concept, 0);

	archetype_convert_to_specialised(a_concept);

	(*env)->ReleaseStringUTFChars(env, concept, a_concept);

	return;
}

/*
 * Method:	jarchetype_reset_definition
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1reset_1definition
(JNIEnv *env, jobject obj)
{
	return archetype_reset_definition();
}

/*
 * Method:	jarchetype_set_definition_node_id
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1set_1definition_1node_1id
(JNIEnv *env, jobject obj, jstring term_code)
{
	char *a_term_code = (*env)-> GetStringUTFChars(env, term_code, 0);

	archetype_set_definition_node_id(a_term_code);

	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return;
}

/*
* Method:	jarchetype_has_physical_path
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1has_1physical_1path
(JNIEnv *env,jobject obj, jstring path)
{
	char *a_path = (*env)->GetStringUTFChars(env, path, 0);
	jboolean result;

	result = archetype_has_physical_path(a_path);

	(*env)->ReleaseStringUTFChars(env, path, a_path);

	return result;
}

/*
* Method:	jarchetype_has_warnings
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1has_1warnings
(JNIEnv *env,jobject obj)
{

	return archetype_has_warnings();
}

/*
* Method:	jarchetype_is_specialised
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1is_1specialised
(JNIEnv *env,jobject obj)
{
	return archetype_is_specialised();
}

/*
* Method:	jarchetype_is_valid
*/
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1is_1valid
(JNIEnv *env,jobject obj)
{

	return archetype_is_valid();
}

/*
* Method:	jarchetype_definition
*/
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jarchetype_1definition
(JNIEnv *env,jobject obj)
{
	return	archetype_definition();
}


/*
 * ------------------ ARCHETYPE ONTOLOGY --------------------
 */
 

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_concept_code
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1concept_1code
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, ontology_concept_code());
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_constraint_codes
 * Signature: ()[Ljava/lang/String;
 */
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1constraint_1codes
  (JNIEnv *env, jobject obj)
{
	jobjectArray result;
	int i;
	int len = ontology_constraint_codes_count();
	char **eif_array = ontology_constraint_codes();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_constraint_definition
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1constraint_1definition
  (JNIEnv *env, jobject obj, jstring lang, jstring term_code)
{
	const char *a_lang = (*env)-> GetStringUTFChars(env, lang, 0);
	const char *a_term_code = (*env)-> GetStringUTFChars(env, term_code, 0);
	char *result;

	result = ontology_constraint_definition(a_lang, a_term_code);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_languages_available
 * Signature: ()[Ljava/lang/String;
 */
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1languages_1available
  (JNIEnv *env, jobject obj)
{
	jobjectArray result;
	int i;
	int len = ontology_languages_available_count();
	char **eif_array = ontology_languages_available();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_logical_path_for_physical_path
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1logical_1path_1for_1physical_1path
  (JNIEnv *env, jobject obj, jstring path, jstring lang)
{
	const char *a_path = (*env)->GetStringUTFChars(env, path, 0);
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	char *result;

	result = ontology_logical_path_for_physical_path(a_path, a_lang);

	(*env)->ReleaseStringUTFChars(env, path, a_path);
	(*env)->ReleaseStringUTFChars(env, lang, a_lang);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_primary_language
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1primary_1language
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, ontology_primary_language());
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_specialisation_depth
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1specialisation_1depth
  (JNIEnv *env, jobject obj)
{
	return ontology_specialisation_depth();
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_term_attribute_names
 * Signature: ()[Ljava/lang/String;
 */
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1term_1attribute_1names
  (JNIEnv *env, jobject obj)
{
	jobjectArray result;
	int i;
	int len = ontology_term_attribute_names_count();
	char **eif_array = ontology_term_attribute_names();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_term_binding
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1term_1binding
  (JNIEnv *env, jobject obj, jstring terminology, jstring term_code)
{
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);
	char *result;

	result = ontology_term_binding(a_terminology, a_term_code);

	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_term_codes
 * Signature: ()[Ljava/lang/String;
 */
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1term_1codes
  (JNIEnv *env, jobject obj)
{
	jobjectArray result;
	int i;
	int len = ontology_term_codes_count();
	char **eif_array = ontology_term_codes();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_term_definition
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1term_1definition
  (JNIEnv *env, jobject obj, jstring lang, jstring term_code)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);
	char *result;

	result = ontology_term_definition(a_lang, a_term_code);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_terminologies_available
 * Signature: ()[Ljava/lang/String;
 */
JNIEXPORT jobjectArray JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1terminologies_1available
  (JNIEnv *env, jobject obj)
{
	jobjectArray result;
	int i;
	int len = ontology_terminologies_available_count();
	char **eif_array = ontology_terminologies_available();

	result = (*env)->NewObjectArray(env, len, (*env)->FindClass(env, "java/lang/String"), (*env)->NewStringUTF(env, ""));

	for (i=0; i<len; i++) {
		(*env)->SetObjectArrayElement(env, result, i, (*env)->NewStringUTF(env, *(eif_array + i)));
	}

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_validity_report
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1validity_1report
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, ontology_validity_report());
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_substitute_codes
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1substitute_1codes
  (JNIEnv *env, jobject obj, jstring str, jstring lang)
{
	const char *a_str = (*env)->GetStringUTFChars(env, str, 0);
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	char *result;

	result = ontology_substitute_codes(a_str, a_lang);

	(*env)->ReleaseStringUTFChars(env, str, a_str);
	(*env)->ReleaseStringUTFChars(env, lang, a_lang);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_new_constraint_code
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1new_1constraint_1code
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, ontology_new_constraint_code());
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_new_non_specialised_term_code
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1new_1non_1specialised_1term_1code
  (JNIEnv *env, jobject obj)
{
	return (*env)->NewStringUTF(env, ontology_new_non_specialised_term_code());
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_new_specialised_term_code
 * Signature: (Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1new_1specialised_1term_1code
  (JNIEnv *env, jobject obj, jstring parent_code)
{
	const char *a_parent_code = (*env)->GetStringUTFChars(env, parent_code, 0);
	char *result;

	result = ontology_new_specialised_term_code(a_parent_code);

	(*env)->ReleaseStringUTFChars(env, parent_code, a_parent_code);

	return (*env)->NewStringUTF(env, result);
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_add_constraint_definition
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1add_1constraint_1definition
  (JNIEnv *env, jobject obj, jstring lang, jstring term)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	const char *a_term = (*env)->GetStringUTFChars(env, term, 0);

	ontology_add_constraint_definition(a_lang, a_term);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);
	(*env)->ReleaseStringUTFChars(env, term, a_term);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_add_language_available
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1add_1language_1available
  (JNIEnv *env, jobject obj, jstring lang)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);

	ontology_add_language_available(a_lang);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_add_term_binding
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1add_1term_1binding
  (JNIEnv *env, jobject obj, jstring code_phrase_str, jstring term_code)
{
	const char *a_code_phrase_str = (*env)-> GetStringUTFChars(env, code_phrase_str, 0);
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);

	ontology_add_term_binding(a_code_phrase_str, a_term_code);

	(*env)->ReleaseStringUTFChars(env, code_phrase_str, a_code_phrase_str);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_add_term_definition
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1add_1term_1definition
  (JNIEnv *env, jobject obj, jstring lang, jstring term)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	const char *a_term = (*env)->GetStringUTFChars(env, term, 0);

	ontology_add_term_definition(a_lang, a_term);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);
	(*env)->ReleaseStringUTFChars(env, term, a_term);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_initialise_term_definitions
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1initialise_1term_1definitions
  (JNIEnv *env, jobject obj, jstring term)
{
	const char *a_term = (*env)->GetStringUTFChars(env, term, 0);

	ontology_initialise_term_definitions(a_term);

	(*env)->ReleaseStringUTFChars(env, term, a_term);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_remove_term_binding
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1remove_1term_1binding
  (JNIEnv *env, jobject obj, jstring term_code, jstring terminology)
{
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);

	ontology_remove_term_binding(a_term_code, a_terminology);

	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);
	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_replace_constraint_definition
 * Signature: (Ljava/lang/String;Ljava/lang/String;Z)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1replace_1constraint_1definition
  (JNIEnv *env, jobject obj, jstring lang, jstring term, jboolean replace_translations)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	const char *a_term = (*env)->GetStringUTFChars(env, term, 0);

	ontology_replace_constraint_definition(a_lang, a_term, replace_translations);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);
	(*env)->ReleaseStringUTFChars(env, term, a_term);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_replace_term_binding
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1replace_1term_1binding
  (JNIEnv *env, jobject obj, jstring code_phrase_str, jstring term_code)
{
	const char *a_code_phrase_str = (*env)-> GetStringUTFChars(env, code_phrase_str, 0);
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);

	ontology_replace_term_binding(a_code_phrase_str, a_term_code);

	(*env)->ReleaseStringUTFChars(env, code_phrase_str, a_code_phrase_str);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_replace_term_definition
 * Signature: (Ljava/lang/String;Ljava/lang/String;Z)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1replace_1term_1definition
  (JNIEnv *env, jobject obj, jstring lang, jstring term, jboolean replace_translations)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);
	const char *a_term = (*env)->GetStringUTFChars(env, term, 0);

	ontology_replace_term_definition(a_lang, a_term, replace_translations);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);
	(*env)->ReleaseStringUTFChars(env, term, a_term);

	return;
}


/*
 * Class:     AdlJniWrapper
 * Method:    jontology_set_primary_language
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1set_1primary_1language
  (JNIEnv *env, jobject obj, jstring lang)
{
	const char *a_lang = (*env)->GetStringUTFChars(env, lang, 0);

	ontology_set_primary_language(a_lang);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);

	return;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_constraint_binding
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1constraint_1binding
  (JNIEnv *env, jobject obj, jstring terminology, jstring term_code)
{
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);
	jboolean result;

	result = ontology_has_constraint_binding(a_terminology, a_term_code);

	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_constraint_bindings
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1constraint_1bindings
  (JNIEnv *env, jobject obj, jstring terminology)
{
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);
	jboolean result;

	result = ontology_has_constraint_bindings(a_terminology);

	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_constraint_code
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1constraint_1code
  (JNIEnv *env, jobject obj, jstring constraint_code)
{
	const char *a_constraint_code = (*env)-> GetStringUTFChars(env, constraint_code, 0);
	jboolean result;

	result = ontology_has_constraint_code(a_constraint_code);

	(*env)->ReleaseStringUTFChars(env, constraint_code, a_constraint_code);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_language
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1language
  (JNIEnv *env, jobject obj, jstring lang)
{
	const char *a_lang = (*env)-> GetStringUTFChars(env, lang, 0);
	jboolean result;

	result = ontology_has_language(a_lang);

	(*env)->ReleaseStringUTFChars(env, lang, a_lang);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_path
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1path
  (JNIEnv *env, jobject obj, jstring path)
{
	const char *a_path = (*env)->GetStringUTFChars(env, path, 0);
	jboolean result;

	result =  ontology_has_path(a_path);

	(*env)->ReleaseStringUTFChars(env, path, a_path);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_term_binding
 * Signature: (Ljava/lang/String;Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1term_1binding
  (JNIEnv *env, jobject obj, jstring terminology, jstring term_code)
{
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);
	jboolean result;

	result = ontology_has_term_binding(a_terminology, a_term_code);

	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);
	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_term_bindings
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1term_1bindings
  (JNIEnv *env, jobject obj, jstring terminology)
{
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);
	jboolean result;

	result = ontology_has_term_bindings(a_terminology);

	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_terminology
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1terminology
  (JNIEnv *env, jobject obj, jstring terminology)
{
	const char *a_terminology = (*env)->GetStringUTFChars(env, terminology, 0);
	jboolean result;

	result = ontology_has_terminology(a_terminology);

	(*env)->ReleaseStringUTFChars(env, terminology, a_terminology);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_has_term_code
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1has_1term_1code
  (JNIEnv *env, jobject obj, jstring term_code)
{
	const char *a_term_code = (*env)->GetStringUTFChars(env, term_code, 0);
	jboolean result;

	result = ontology_has_term_code(a_term_code);

	(*env)->ReleaseStringUTFChars(env, term_code, a_term_code);

	return result;
}

/*
 * Class:     AdlJniWrapper
 * Method:    jontology_is_valid
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_org_openehr_archetypes_adl_1jni_1wrapper_AdlJniWrapper_jontology_1is_1valid
  (JNIEnv *env, jobject obj)
{
	return ontology_is_valid();
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
