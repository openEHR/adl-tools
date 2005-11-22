/*
 * component:   "openEHR ADL Reference Parser"
 * description: "Wrapper class for JNI-ised Eiffel reference parser"
 * keywords:    "ADL, archetype, JNI, wrapper"
 *
 * author:      "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
 * contributors:"Raju Kalidindi <Kalidindi.Raju@mayo.edu>"
 * support:     "Thomas Beale <Thomas.Beale@OceanInformatics.biz>"
 * copyright:   "Copyright (c) 2004,2005 Ocean Informatics Australia, Mayo Clinic"
 * license:     "See notice at bottom of class"
 *
 * file:        "$Source$"
 * revision:    "$Revision$"
 * last_change: "$Date$"
 */

package org.openehr.archetypes.adl_jni_wrapper;

public class AdlJniWrapper
{
	// ================= ADL_INTERFACE ============

	// -------------- general ---------------
	// constructor
	public native void 
	jmake();

	// Version of openEHR source from which this component was built
	public native String 
	jopenehr_version();

	// True if exception was encountered from ADL parser
	public native boolean 
	jexception_encountered();

	// Reset parser after exception
	public native void 
	jreset();

	// String status of last command
	public native String 
	jstatus();

	// Set directory for looking for archetypes
	public native void 
	jset_current_directory (String a_dir);

	// -------------- archetype load, parse, save ------------
	// Open the archetype in file file_path
	// REQUIRE
	//	file_path_valid: file_path /= Void and then not file_path.is_empty
	public native void 
	jopen_adl_file(String file_path);

	// Archetype source has been loaded
	public native boolean 
	jarchetype_source_loaded();

	// Archetype has been parsed successfully into object structure
	public native boolean 
	jarchetype_available();

	// Archetype is valid
	public native boolean 
	jarchetype_valid();

	// Create a new archetype
	// REQUIRE
	//  info_model_originator_valid: a_im_originator /= void and then not a_im_originator.is_empty
	//  info_model_name_valid: a_im_name /= void and then not a_im_name.is_empty
	//  info_model_entity_valid: a_im_entity /= void and then not a_im_entity.is_empty
	//  primary_language_valid: a_primary_language /= void and then not a_primary_language.is_empty
	public native void 
	jcreate_new_archetype(String a_im_originator, String a_im_name, String a_im_entity, String a_primary_language);

	// True if serialiser format a_format exists
	public native boolean 
	jhas_archetype_serialiser_format(String a_format);

	public native String[]
	jarchetype_serialiser_formats();

	// True if archetype file has changed on disk due to external editing
	public native boolean 
	jfile_changed_on_disk();

	// Parse the archetype which has been loaded
	// REQUIRE
	//  jarchetype_source_loaded
	public native void 
	jparse_archetype();

	// True if last parse succeeded
	public native boolean 
	jparse_succeeded();

	// reload archetype text from same file as previous open_adl_file call
	public native void 
	jresync_file();

	// Save archetype to file file_path, in format save_format; save_formats = "adl", "html", "xml", "owl"
	public native void 
	jsave_archetype(String file_path, String save_format);

	// Returns True if save succeeded
	public native boolean 
	jsave_succeeded();

	// serialise Archetype to string, in format serialise_format = "adl", "html", "xml", "owl"
	public native void 
	jserialise_archetype(String save_format);

	// Archetype in form of serialised string, e.g. ADL, HTML, etc
	public native String 
	jserialised_archetype();

	// convert the current archetype to a specialised version of itself
	public native void 
	jspecialise_archetype (String specialised_domain_concept);



	// ================== OBJECT FACTORY ====================

	// --------------- Date/Time Routines ---------------
	// True if string literal like "yyyy-MM-dd"
	// with XX or ?? allowed in MM or dd slots
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_date_constraint_pattern (String a_str);

	// True if string in form "yyyy-MM-dd"
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_date_string (String a_str);

	// True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_date_time_constraint_pattern (String a_str);

	// True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_date_time_string (String a_str);

	// True if string in form "PnDnHnMnS"
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_duration_string (String a_str);

	// True if string literal like "hh:mm:ss[.ssss]"
	// with XX or ?? allowed in mm or ss slots
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_time_constraint_pattern (String a_str);

	// True if string in form "hh:mm:ss[.ssss]"
	// REQUIRE
	// a_str /= void
	public native boolean 
	jis_valid_iso8601_time_string (String a_str);
	
	// ------------- Primitive Object Creation --------------------

	// create Result allowing False only
	public native int 
	jcreate_c_boolean_make_false();

	// create Result allowing True only
	public native int 
	jcreate_c_boolean_make_true();

	// create Result allowing True and False
	public native int 
	jcreate_c_boolean_make_true_false();

	// create Result with both limits set from ISO8601 strings
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_date_string(a_lower)
	// upper_valid: an_upper /= void and then is_valid_iso8601_date_string(an_upper)
	// valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
	public native int 
	jcreate_c_date_make_bounded (String a_lower, String an_upper);

	// create Result from -infinity to `an_upper' in ISO8601 string form
	// REQUIRE
	// upper_valid: an_upper /= void and then is_valid_iso8601_date_string(an_upper)
	public native int 
	jcreate_c_date_make_lower_unbounded (String an_upper);

	// create Result from an ISO8601-based pattern like "yyyy-mm-??"
	// REQUIRE
	// pattern_valid: a_pattern /= void and then is_valid_iso8601_date_constraint_pattern(a_pattern)
	public native int 
	jcreate_c_date_make_pattern (String a_pattern);

	// create Result as unbounded interval
	public native int 
	jcreate_c_date_make_unbounded();

	// create Result from `a_lower' in ISO8601 string form, to +infinity
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_date_string(a_lower)
	public native int 
	jcreate_c_date_make_upper_unbounded (String a_lower);

	// create Result with both limits set from ISO8601 strings
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_date_time_string(a_lower)
	// upper_valid: an_upper /= void and then is_valid_iso8601_date_time_string(an_upper)
	// valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
	public native int 
	jcreate_c_date_time_make_bounded (String a_lower, String an_upper);

	// create Result from -infinity to `an_upper' in ISO8601 string form
	// REQUIRE
	// upper_valid: an_upper /= void and then is_valid_iso8601_date_time_string(an_upper)
	public native int 
	jcreate_c_date_time_make_lower_unbounded (String an_upper, boolean include_upper);

	// create Result from an ISO8601-based pattern like "yyyy-mm-dd hh:??:XX"
	// REQUIRE
	// pattern_valid: a_pattern /= void and then is_valid_iso8601_date_time_constraint_pattern(a_pattern)
	public native int 
	jcreate_c_date_time_make_pattern (String a_pattern);

	// create Result as unbounded interval
	public native int 
	jcreate_c_date_time_make_unbounded();

	// create Result from `a_lower' in ISO8601 string form, to +infinity
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_date_time_string(a_lower)
	public native int 
	jcreate_c_date_time_make_upper_unbounded (String a_lower);

	// create Result with both limits set from ISO8601 strings
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_duration_string(a_lower)
	// upper_valid: an_upper /= void and then is_valid_iso8601_duration_string(an_upper)
	// valid_order: iso8601_string_to_duration(a_lower) <= iso8601_string_to_duration(an_upper)
	public native int 
	jcreate_c_duration_make_bounded (String a_lower, String an_upper, boolean include_lower, boolean include_upper);

	// create Result from -infinity to `an_upper' in ISO8601 string form
	// REQUIRE
	// upper_valid: an_upper /= void and then is_valid_iso8601_duration_string(an_upper)
	public native int 
	jcreate_c_duration_make_lower_unbounded (String an_upper, boolean include_upper);

	// create Result as unbounded interval
	public native int 
	jcreate_c_duration_make_unbounded();

	// create Result from `a_lower' in ISO8601 string form, to +infinity
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_duration_string(a_lower)
	public native int 
	jcreate_c_duration_make_upper_unbounded (String a_lower, boolean include_lower);

	// create Result with both limits set
	// REQUIRE
	// valid_order: a_lower <= an_upper
	public native int 
	jcreate_c_integer_make_bounded (int a_lower, int an_upper, boolean include_lower, boolean include_upper);

	// create Result from -infinity to `an_upper'
	public native int 
	jcreate_c_integer_make_lower_unbounded (int an_upper, boolean include_upper);

	// create Result as unbounded interval
	public native int 
	jcreate_c_integer_make_unbounded();

	// create Result from `a_lower' to +infinity
	public native int 
	jcreate_c_integer_make_upper_unbounded (int a_lower, boolean include_lower);

	// create Result with both limits set
	// REQUIRE
	// valid_order: a_lower <= an_upper
	public native int 
	jcreate_c_real_make_bounded (float a_lower, float an_upper, boolean include_lower, boolean include_upper);

	// create Result from -infinity to `an_upper'
	public native int 
	jcreate_c_real_make_lower_unbounded (float an_upper, boolean include_upper);

	// create Result as unbounded interval
	public native int 
	jcreate_c_real_make_unbounded();

	// create Result from `a_lower' to +infinity
	public native int 
	jcreate_c_real_make_upper_unbounded (float a_lower, boolean include_lower);

	// create Result completely open
	public native int 
	jcreate_c_string_make_any();

	// create Result from a regular expression
	public native int 
	jcreate_c_string_make_from_regexp (String a_str);

	// create Result from a single string
	public native int 
	jcreate_c_string_make_from_string (String a_str);

	// create Result from a list of strings
	// REQUIRE
	// lst /= void
	public native int 
	jcreate_c_string_make_from_string_list (String[] a_str_lst);

	// create Result with both limits set from ISO8601 strings
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_time_string(a_lower)
	// upper_valid: an_upper /= void and then is_valid_iso8601_time_string(an_upper)
	// valid_order: iso8601_string_to_time(a_lower) <= iso8601_string_to_time(an_upper)
	public native int 
	jcreate_c_time_make_bounded (String a_lower, String an_upper);

	// create Result from -infinity to `an_upper' in ISO8601 string form
	// REQUIRE
	// upper_valid: an_upper /= void and then is_valid_iso8601_time_string(an_upper)
	public native int 
	jcreate_c_time_make_lower_unbounded (String an_upper);

	// create Result from an ISO8601-based pattern like "hh:mm:??"
	// REQUIRE
	// pattern_valid: a_pattern /= void and then is_valid_iso8601_time_constraint_pattern(a_pattern)
	public native int 
	jcreate_c_time_make_pattern (String a_pattern);

	// create Result as unbounded interval
	public native int 
	jcreate_c_time_make_unbounded();

	// create Result from `a_lower' in ISO8601 string form, to +infinity
	// REQUIRE
	// lower_valid: a_lower /= void and then is_valid_iso8601_time_string(a_lower)
	public native int 
	jcreate_c_time_make_upper_unbounded (String a_lower);

	// create Result with both limits set
	// REQUIRE
	// valid_order: a_lower <= an_upper
	public native int 
	jcreate_integer_interval_make_bounded (int a_lower, int an_upper, boolean include_lower, boolean include_upper);

	// create Result from -infinity to `an_upper'
	public native int 
	jcreate_integer_interval_make_lower_unbounded (int an_upper, boolean include_upper);

	// create Result from `a_lower' to +infinity
	public native int 
	jcreate_integer_interval_make_upper_unbounded (int a_lower, boolean include_lower);

	// create Result with both limits set
	// REQUIRE
	// valid_order: a_lower <= an_upper
	public native int 
	jcreate_real_interval_make_bounded (float a_lower, float an_upper, boolean include_lower, boolean include_upper);

	// create Result from -infinity to `an_upper'
	public native int 
	jcreate_real_interval_make_lower_unbounded (float an_upper, boolean include_upper);

	// create Result from `a_lower' to +infinity
	public native int 
	jcreate_real_interval_make_upper_unbounded (float a_lower, boolean include_lower);
	
	// create Result with unbounded interval
	public native int
	jcreate_real_interval_make_unbounded ();
	
	// ----------------- Object Factory Status -------------------

	// True if a_handle is a valid handle to a previously created ARCHETYPE_INTERNAL_REF
	public native boolean 
	jhas_archetype_internal_ref (int a_handle);

	// True if a_handle is a valid handle to a previously created ARCHETYPE_SLOT
	public native boolean 
	jhas_archetype_slot (int a_handle);

	// True if a_handle is a valid handle to a previously created C_ATTRIBUTE
	public native boolean 
	jhas_c_attribute (int a_handle);

	// True if a_handle is a valid handle to a previously created C_CODED_TERM
	public native boolean 
	jhas_c_coded_term (int a_handle);

	// True if a_handle is a valid handle to a previously created C_COMPLEX_OBJECT
	public native boolean 
	jhas_c_complex_object (int a_handle);

	// True if a_handle is a valid handle to a previously created C_ORDINAL
	public native boolean 
	jhas_c_ordinal (int a_handle);

	// True if a_handle is a valid handle to a previously created C_QUANTITY
	public native boolean 
	jhas_c_quantity (int a_handle);

	// True if a_handle is a valid handle to a previously created CARDINALITY
	public native boolean 
	jhas_cardinality (int a_handle);

	// True if a_handle is a valid handle to a previously created CONSTRAINT_REF
	public native boolean 
	jhas_constraint_ref (int a_handle);


	// ------------------ Archetype Node Creation ---------------------

	public native int 
	jcreate_archetype_internal_ref (int h_parent_c_attribute, String a_type_name, String a_path);

	public native int 
	jcreate_archetype_slot_anonymous (int h_parent_c_attribute, String a_type_name);

	public native int 
	jcreate_archetype_slot_identified (int h_parent_c_attribute, String a_type_name, String a_node_id);

	public native int 
	jcreate_c_attribute_multiple (int h_parent_c_complex_object, String an_attr_name, int h_cardinality);

	public native int 
	jcreate_c_attribute_single (int h_parent_c_complex_object, String an_attr_name);

	public native int 
	jcreate_c_coded_term_from_pattern (int h_parent_c_attribute, String a_term_constraint);

	public native int
	jcreate_c_coded_term_from_terminology_id (int h_parent_c_attribute, String a_terminology_id);

	public native int 
	jcreate_c_complex_object_anonymous (int h_parent_c_attribute, String a_type_name);

	public native int 
	jcreate_c_complex_object_identified (int h_parent_c_attribute, String a_type_name, String a_node_id);

	public native int 
	jcreate_c_ordinal (int h_parent_c_attribute);

	public native int 
	jcreate_ordinal (int h_c_ordinal, int a_value, String a_symbol_code_phrase);

	public native int 
	jcreate_c_primitive_object (int h_parent_c_attribute, int h_c_primitive);

	public native int 
	jcreate_c_quantity (int h_parent_c_attribute);

	public native int 
	jcreate_cardinality_make_bounded (int a_lower, int an_upper);

	public native int 
	jcreate_cardinality_make_unbounded();

	public native int 
	jcreate_cardinality_make_upper_unbounded (int a_lower);

	public native int 
	jcreate_constraint_ref (int h_parent_c_attribute, String a_code);

	// ---------------------------ARCHETYPE_SLOT--------------------------
	
	public native boolean
	jarchetype_slot_has_includes(int h_archetype_slot);
	
	public native boolean
	jarchetype_slot_has_excludes(int h_archetype_slot);
	
	public native int
	jarchetype_slot_includes_count(int h_archetype_slot);
	
	public native int
	jarchetype_slot_includes_get(int h_archetype_slot, int i_th);
	
	public native int
	jarchetype_slot_excludes_count(int h_archetype_slot);
	
	public native int
	jarchetype_slot_excludes_get(int h_archetype_slot, int i_th);
	
	public native void
	jarchetype_slot_add_include(int h_archetype_slot, int h_assertion);

	public native void
	jarchetype_slot_add_exclude(int h_archetype_slot, int h_assertion);

//	public native void
//	jc_complex_object_add_invariant(int h_c_complex_object, int h_assertion);

	// ---------------------- assertions ---------------------

	public native int
	jcreate_assertion (int h_an_expr);

	public native int
	jcreate_assertion_with_tag (int h_an_expr, String a_tag);

	//public native int
	//jcreate_expr_binary_operator_boolean (String an_operator, int h_a_left_operand, int h_a_right_operand);
	
	public native int
	jcreate_expr_binary_operator_node (int an_operator, int h_a_left_operand, int h_a_right_operand);

	public native int
	jcreate_expr_leaf_attribute_ref (String a_ref_path);

	public native int
	jcreate_expr_leaf_boolean (boolean an_item);

	public native int
	jcreate_expr_leaf_character (char an_item);

	public native int
	jcreate_expr_leaf_constraint (int h_an_item);
	
	public native int
	jcreate_expr_leaf_feature_call (String a_ref);

	public native int
	jcreate_expr_leaf_integer (int an_item);

	public native int
	jcreate_expr_leaf_object_ref (String a_ref_path);

	public native int
	jcreate_expr_leaf_real (float an_item);

	public native int
	jcreate_expr_leaf_string (String an_item);

	public native int
	jcreate_expr_unary_operator_node (int an_operator, int h_an_operand);


	// ================== ARCHETYPE ====================

	// the archetype id as a string
	public native String
	jarchetype_id();
	
	// the parent archetype id as a string, for specialised archetypes
	public native String
	jarchetype_parent_archetype_id();
	
	public native void
	jarchetype_set_parent_archetype_id(String id);
	
	// archetype concept
	public native String
	jarchetype_concept_code();

	public native void
	jarchetype_set_concept(String a_code);
	
	// archetype specialisation depth; 0 for non-specialised (top-level) archetypes
	public native int
	jarchetype_specialisation_depth();

	// archetype version
	public native String
	jarchetype_version();

	// errors from last validation 
	public native String
	jarchetype_errors();

	// warnings from last validation 
	public native String
	jarchetype_warnings();
	
	public native int
	jarchetype_logical_paths_count();
	
	// logical path set, i.e. with term definitions substituted
	public native String[]
	jarchetype_logical_paths (String a_lang);

	// physical path set, i.e. with term codes
	public native String[]
	jarchetype_physical_paths();

	// convert a physical path from archetype to its logical equivalent, in the given language
	public native String
	jarchetype_physical_to_logical_path (String a_phys_path, String a_lang);

	// convert current archetype to a specialised version of itself (by one level) with specialised concept
	public native void
	jarchetype_convert_to_specialised (String a_spec_concept);

	// reset the current definition to empty, withiut disturbing rest of archetype
	public native String
	jarchetype_reset_definition();

	// True if archetype has physical path a_path
	public native boolean
	jarchetype_has_physical_path (String a_path);

	// set node_id of archetype root node
	public native void
	jarchetype_set_definition_node_id(String a_term_code);

	// True if archetype has warnings from last validation
	public native boolean
	jarchetype_has_warnings();

	// True if archetype is specialised
	public native boolean
	jarchetype_is_specialised();

	// True if archetype is valid. If not, look at errors and warnings
	public native boolean
	jarchetype_is_valid();
	
	// Archetype definition handle
	public native int
	jarchetype_definition();

	// ------------------ archetype ontology --------------------

	public native String 
	jontology_concept_code();

	public native String[]
	jontology_constraint_codes();

	public native String
	jontology_constraint_definition (String a_lang, String a_term_code);

	public native int
	jontology_constraint_definitions_count();

	public native String[]
	jontology_languages_available();

	public native String
	jontology_logical_path_for_physical_path (String a_path, String a_lang);

	public native String 
	jontology_primary_language();

	public native int 
	jontology_specialisation_depth();

	public native String[]
	jontology_term_attribute_names();

	public native String
	jontology_term_binding (String a_terminology, String a_term_code);
	
	public native String
	jontology_term_binding_code_string (String a_terminology, String a_term_code);
	
	public native int
	jontology_term_binding_for_terminology_count(String a_terminology);
	
	public native String[]
	jontology_term_binding_for_terminology_codes(String a_terminology);

	public native String[]
	jontology_term_codes();

	public native String
	jontology_term_definition (String a_lang, String a_term_code);

	public native String[]
	jontology_terminologies_available();

	public native String
	jontology_validity_report();
	
	public native String
	jontology_substitute_codes (String a_str, String a_lang);

	public native String
	jontology_new_constraint_code();

	public native String
	jontology_new_non_specialised_term_code();

	public native String
	jontology_new_specialised_term_code (String a_parent_code);

	public native void
	jontology_add_constraint_definition (String a_lang, String a_term);

	public native void 
	jontology_add_language_available (String a_lang);

	public native void 
	jontology_add_term_binding (String a_code_phrase_str, String a_term_code);

	public native void 
	jontology_add_term_definition (String a_lang, String a_term);

	public native void 
	jontology_initialise_term_definitions (String a_term);

	public native void 
	jontology_remove_term_binding (String a_term_code, String a_terminology);

	public native void 
	jontology_replace_constraint_definition (String a_lang, String a_term, boolean replace_translations);

	public native void 
	jontology_replace_term_binding (String a_code_phrase_str, String a_term_code);

	public native void 
	jontology_replace_term_definition (String a_lang, String a_term, boolean replace_translations);

	public native void 
	jontology_set_primary_language (String a_lang);
	
	public native boolean 
	jontology_has_constraint_binding (String a_terminology, String a_term_code);

	public native boolean 
	jontology_has_constraint_bindings (String a_terminology);

	public native String
	jontology_constraint_binding(String a_terminology, String a_term_code);

	public native int
	jontology_constraint_bindings_count();
	
	public native boolean 
	jontology_has_constraint_code (String a_constraint_code);

	public native boolean 
	jontology_has_language (String a_lang);

	public native boolean 
	jontology_has_path (String a_path);

	public native boolean 
	jontology_has_term_binding (String a_terminology, String a_term_code);

	public native boolean 
	jontology_has_term_bindings (String a_terminology);

	public native boolean 
	jontology_has_term_code (String a_term_code);

	public native boolean 
	jontology_has_terminology (String a_terminology);

	public native boolean 
	jontology_is_valid();

	public native void
	jontology_clear_terminology();
	
	public native void
	jontology_add_binding_terminology(String a_terminology);
	
	public native void
	jontology_set_language(String a_language);
	
	public native String
	jontology_language();
	
	public native int
	jontology_term_definitions_count();
	
	// ----------------------------C_OBJECT-------------------------------
	
	public native String
	jc_object_node_id(int h);
	
	public native void
	jc_object_set_object_id(int h, String id);
	
	public native String
	jc_object_rm_type_name(int h);
	
	public native String
	jc_object_generating_type(int h);
	
	public native boolean
	jc_object_any_allowed(int h);
	
	public native void
	jc_object_set_any_allowed(int h);
	
	public native int
	jc_object_occurrences(int h);
	
	public native void
	jc_object_set_occurrences(int h_c_object, int h_integer_interval);
	
	
	// -------------------------C_COMPLEX_OBJECT--------------------------
	
	public native int
	jc_complex_object_attributes_count(int h_parent);
	
	public native int
	jc_complex_object_attributes_get(int h_parent, int i_th);
	
	public native String[]
	jc_complex_object_all_paths(int h_parent);
	
	public native int
	jc_complex_object_attribute_at_path(int h_parent, String path);
	
	public native boolean
	jc_complex_object_has_attribute(int h_parent, String attribute);
	
	// ---------------------------C_ATTRIBUTE-----------------------------
	
	public native int
	jc_attributes_count();
	
	public native int
	jc_attribute_children_count(int h_attribute);
	
	public native int
	jc_attribute_children_get(int h_attribute, int i_th);
	
	public native String
	jc_attribute_rm_attribute_name(int h_attribute);
	
	public native void
	jc_attribute_set_cardinality(int h_attribute, int h_cardinality);
	
	// ----------------------------CARDINALITY----------------------------
	
	public native void
	jcardinality_set_unordered(int h_cardinality);

	// ----------------------------INTEGER_INTERVAL-----------------------
	
	public native boolean
	jinteger_interval_upper_unbounded(int h_cardinality);

	public native boolean
	jinteger_interval_lower_unbounded(int h_cardinality);
	
	public native int
	jinteger_interval_upper(int h_cardinality);

	public native int
	jinteger_interval_lower(int h_cardinality);
	
	// ---------------------------REAL_INTERVAL (OE_INTERVAL[REAL])-------
	
	public native boolean
	jreal_interval_upper_unbounded(int h_cardinality);

	public native boolean
	jreal_interval_lower_unbounded(int h_cardinality);
	
	public native float
	jreal_interval_upper(int h_cardinality);

	public native float
	jreal_interval_lower(int h_cardinality);

	public native String
	jreal_interval_upper_string(int h_cardinality);

	public native String
	jreal_interval_lower_string(int h_cardinality);
	
	// -----------------------ARCHETYPE_INTERNAL_REF----------------------
	
	public native String
	jarchetype_internal_ref_target_path(int h);
	
	// ---------------------------C_PRIMITIVE-----------------------------
	
	public native int
	jc_primitive_item(int h);
	
	public native String
	jc_primitive_item_as_string(int h);
	
	// ---------------------------C_QUANTITY------------------------------
	
	public native void
	jc_quantity_add_unit_constraint(int h, String units, int h_interval);
	
	public native String
	jc_quantity_property(int h);
	
	public native void
	jc_quantity_set_property(int h, String property);
	
	public native int
	jc_quantity_list_count(int h);
	
	public native int
	jc_quantity_list_get(int h, int i_th);
	
	public native boolean
	jc_quantity_has_assumed_value(int h);
	
	public native String
	jc_quantity_assumed_value_units(int h);
	
	public native float
	jc_quantity_assumed_value_magnitude(int h);
	
	// -------------------------C_QUANTITY_ITEM---------------------------
	
	public native boolean
	jc_quantity_item_any_magnitude_allowed(int h);
	
	public native String
	jc_quantity_item_units(int h);
	
	public native int
	jc_quantity_item_magnitude(int h);
	
	// ---------------------------C_INTEGER-------------------------------
	
	public native int
	jc_integer_interval(int h);
	
	// ---------------------------C_STRING--------------------------------
	
	public native void
	jc_string_add_string(int h_string, String str);
	
	public native int
	jc_string_strings_count(int h_string);
	
	public native String[]
	jc_string_strings(int h_string);

	// ---------------------------C_CODED_TERM----------------------------
	
	public native String
	jc_coded_term_as_string(int h_coded_term);
	
	public native boolean
	jc_coded_term_has_assumed_value(int h_coded_term);
	
	public native void
	jc_coded_term_set_assumed_value(int h_coded_term, String assumed);
	
	public native String
	jc_coded_term_assumed_value(int h_coded_term);

	// ---------------------------ASSERTION-------------------------------
	
	public native int
	jassertion_get_expression(int h_assertion);
	
	// ---------------------------EXPR_ITEM-------------------------------
	
	public native String
	jexpr_item_generating_type(int h_expr_item);
	
	public native String
	jexpr_binary_operator_right_operand_out(int h_expr_item);
	
	// --------------------------CONSTRAINT_REF---------------------------
	
	public native String
	jconstraint_ref_target(int h_c_ref);

	// ---------------------------C_DATE_TIME-----------------------------
	
	public native String
	jc_date_time_pattern(int h);
	
	// ----------------------------C_TIME---------------------------------
	
	public native String
	jc_time_pattern(int h);
	
	// ---------------------------OE_C_DATE-------------------------------
	
	public native String
	jc_date_pattern(int h);
	
	// --------------------------C_BOOLEAN--------------------------------
	
	public native boolean
	jc_boolean_true_valid(int h);
	
	public native boolean
	jc_boolean_false_valid(int h);
	
	// ---------------------------C_ORDINAL-------------------------------
	
	public native int
	jc_ordinal_items_count(int h);
	
	public native int
	jc_ordinal_items_get(int h, int i_th);
	
	// ---------------------------ORDINAL---------------------------------
	
	public native int
	jordinal_value(int h);
	
	public native String
	jordinal_symbol_as_string(int h);
	
	// -------------------------------------------------------------------
	static {	
		System.loadLibrary("adl_java_lib");
	}
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
 *  The Original Code is AdlJniWrapper.java
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
