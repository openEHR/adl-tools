indexing
	component:   "openEHR Archetype Project"
	description: "[
			 C wrapper for CONSTRAINT_MODEL_FACTORY (flattened). In this wrapper, the following
			 transformations are made:
			 	- incoming C String arguments are converted to Eiffel Strings
			 	- C String return values are converted from Eiffel STRINGs to C Strings
				- all arguments and return values of complex object types (i.e. types other 
				  than String, Integer, Boolean, Real, Char) are replaced by Integer handles,
				  which are keys to the objects maintained in the single instance of this 
				  class.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ADL_FACTORY

inherit
	SHARED_CONSTRAINT_MODEL_FACTORY
		export
			{NONE} all
		end
	
	SHARED_ADL_OBJECTS
		export
			{NONE} all;
			{ANY} has_c_attribute, has_archetype_internal_ref, 
			has_archetype_slot, has_c_complex_object, has_constraint_ref			
		end
	
	C_WRAPPER_TOOLS
		export
			{NONE} all
		end

feature -- Initialisation

	make is
		do
		end

feature -- Date/Time Routines

	is_valid_iso8601_date_constraint_pattern (a_str: POINTER): BOOLEAN is
			-- True if string literal like "yyyy-MM-dd"
			-- with XX or ?? allowed in MM or dd slots
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_date_string (a_str: POINTER): BOOLEAN is
			-- True if string in form "yyyy-MM-dd"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date(c_a_str.string)
		end

	is_valid_iso8601_date_time_constraint_pattern (a_str: POINTER): BOOLEAN is
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date_time_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_date_time_string (a_str: POINTER): BOOLEAN is
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date_time(c_a_str.string)
		end

	is_valid_iso8601_duration_string (a_str: POINTER): BOOLEAN is
			-- True if string in form "PnYnMnWnDTnHnMnS"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_duration(c_a_str.string)
		end

	is_valid_iso8601_duration_constraint_pattern (a_str: POINTER): BOOLEAN is
			-- True if string literal like PYMWDTHMS
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_duration_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_time_constraint_pattern (a_str: POINTER): BOOLEAN is
			-- True if string literal like "hh:mm:ss[.ssss]"
			-- with XX or ?? allowed in mm or ss slots
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_time_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_time_string (a_str: POINTER): BOOLEAN is
			-- True if string in form "hh:mm:ss[.ssss]"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_time(c_a_str.string)
		end

feature -- Primitive Object Creation

	create_integer_interval_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): INTEGER is
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_integer_interval(constraint_model_factory.create_integer_interval_make_bounded(
				a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_integer_interval_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): INTEGER is
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_integer_interval(constraint_model_factory.create_integer_interval_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_integer_interval_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): INTEGER is
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_integer_interval(constraint_model_factory.create_integer_interval_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_real_interval_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): INTEGER is
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_real_interval(constraint_model_factory.create_real_interval_make_bounded(a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_real_interval_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): INTEGER is
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_real_interval(constraint_model_factory.create_real_interval_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_real_interval_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): INTEGER is
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_real_interval(constraint_model_factory.create_real_interval_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_c_integer_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): INTEGER is
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_integer_make_bounded(a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_c_integer_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): INTEGER is
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_integer_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_c_integer_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): INTEGER is
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_integer_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_c_real_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): INTEGER is
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_real_make_bounded(a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_c_real_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): INTEGER is
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_real_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_c_real_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): INTEGER is
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_real_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_c_boolean_make_true: INTEGER is
			-- create Result allowing True only
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_boolean_make_true, Result)
		end

	create_c_boolean_make_false: INTEGER is
			-- create Result allowing False only
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_boolean_make_false, Result)
		end

	create_c_boolean_make_true_false: INTEGER is
			-- create Result allowing True and False
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_boolean_make_true_false, Result)
		end
	
	create_c_string_make_any: INTEGER is
			-- create Result completely open
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_any, Result)
		end

	create_c_string_make_from_string (a_str: POINTER): INTEGER is
			-- create Result from a single string
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_from_string(c_a_str.string), Result)
		end

	create_c_string_make_from_regexp (a_str: POINTER): INTEGER is
			-- create Result from a regular expression
		local
			c_a_str: C_STRING
		do
			create c_a_str.make_by_pointer (a_str)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_from_regexp(c_a_str.string), Result)
		end

	create_c_string_make_from_string_list (a_str_lst: ARRAY [POINTER]): INTEGER is
			-- create Result from a list of strings
			-- REQUIRE
			-- lst /= void
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_from_string_list(c_array_string_to_eif_list (a_str_lst)), Result)
		end
	
	create_c_date_make_bounded (a_lower, an_upper: POINTER): INTEGER is
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_string(an_upper)
			-- valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
		local
			c_a_lower, c_an_upper: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_bounded (c_a_lower.string, c_an_upper.string), Result)
		end

	create_c_date_make_lower_unbounded (an_upper: POINTER): INTEGER is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_string(an_upper)
		local
			c_an_upper: C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_lower_unbounded (c_an_upper.string), Result)
		end

	create_c_date_make_upper_unbounded (a_lower: POINTER): INTEGER is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_string(a_lower)
		local
			c_a_lower: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_upper_unbounded (c_a_lower.string), Result)
		end

	create_c_date_make_pattern (a_pattern: POINTER): INTEGER is
			-- create Result from an ISO8601-based pattern like "yyyy-mm-??"
			-- REQUIRE
			-- pattern_valid: a_pattern /= void and then is_valid_iso8601_date_constraint_pattern(a_pattern)
		local
			c_a_pattern: C_STRING
		do
			create c_a_pattern.make_by_pointer (a_pattern)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_pattern (c_a_pattern.string), Result)
		end

	create_c_date_make_unbounded: INTEGER is
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_unbounded, Result)
		end

	create_c_date_time_make_bounded (a_lower, an_upper: POINTER): INTEGER is
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_time_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_time_string(an_upper)
			-- valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
		local
			c_a_lower, c_an_upper: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_bounded (c_a_lower.string, c_an_upper.string), Result)
		end

	create_c_date_time_make_lower_unbounded (an_upper: POINTER; include_upper: BOOLEAN): INTEGER is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_time_string(an_upper)
		local
			c_an_upper: C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_lower_unbounded (c_an_upper.string), Result)
		end

	create_c_date_time_make_upper_unbounded (a_lower: POINTER): INTEGER is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_time_string(a_lower)
		local
			c_a_lower: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_upper_unbounded (c_a_lower.string), Result)
		end

	create_c_date_time_make_pattern (a_pattern: POINTER): INTEGER is
			-- create Result from an ISO8601-based pattern like "yyyy-mm-dd hh:??:XX"
			-- REQUIRE
			-- pattern_valid: a_pattern /= void and then is_valid_iso8601_date_time_constraint_pattern(a_pattern)
		local
			c_a_pattern: C_STRING
		do
			create c_a_pattern.make_by_pointer (a_pattern)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_pattern (c_a_pattern.string), Result)
		end

	create_c_date_time_make_unbounded: INTEGER is
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_unbounded, Result)
		end
	
	create_c_time_make_bounded (a_lower, an_upper: POINTER): INTEGER is
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_time_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_time_string(an_upper)
			-- valid_order: iso8601_string_to_time(a_lower) <= iso8601_string_to_time(an_upper)
		local
			c_a_lower, c_an_upper: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_bounded (c_a_lower.string, c_an_upper.string), Result)
		end

	create_c_time_make_lower_unbounded (an_upper: POINTER): INTEGER is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_time_string(an_upper)
		local
			c_an_upper: C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_lower_unbounded (c_an_upper.string), Result)
		end

	create_c_time_make_upper_unbounded (a_lower: POINTER): INTEGER is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_time_string(a_lower)
		local
			c_a_lower: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_upper_unbounded (c_a_lower.string), Result)
		end

	create_c_time_make_pattern (a_pattern: POINTER): INTEGER is
			-- create Result from an ISO8601-based pattern like "hh:mm:??"
			-- REQUIRE
			-- pattern_valid: a_pattern /= void and then is_valid_iso8601_time_constraint_pattern(a_pattern)
		local
			c_a_pattern: C_STRING
		do
			create c_a_pattern.make_by_pointer (a_pattern)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_pattern (c_a_pattern.string), Result)
		end

	create_c_time_make_unbounded: INTEGER is
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_unbounded, Result)
		end
	
	create_c_duration_make_bounded (a_lower, an_upper: POINTER; include_lower, include_upper: BOOLEAN): INTEGER is
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_duration_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_duration_string(an_upper)
			-- valid_order: iso8601_string_to_duration(a_lower) <= iso8601_string_to_duration(an_upper)
		local
			c_a_lower, c_an_upper: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_duration_make_bounded (c_a_lower.string, c_an_upper.string, include_lower, include_upper), Result)
		end

	create_c_duration_make_lower_unbounded (an_upper: POINTER; include_upper: BOOLEAN): INTEGER is
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_duration_string(an_upper)
		local
			c_an_upper: C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_duration_make_lower_unbounded (c_an_upper.string, include_upper), Result)
		end

	create_c_duration_make_upper_unbounded (a_lower: POINTER; include_lower: BOOLEAN): INTEGER is
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_duration_string(a_lower)
		local
			c_a_lower: C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_duration_make_upper_unbounded (c_a_lower.string, include_lower), Result)
		end

	create_c_duration_make_unbounded: INTEGER is
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_duration_make_unbounded, Result)
		end

feature -- Domain object creation

	create_c_coded_term_from_pattern (h_parent_c_attribute: INTEGER; a_term_constraint: POINTER): INTEGER is
			-- create a "term" node from term in string form "terminology(version)::code_phrase, code_phrase, ..."
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- term_constraint_valid: a_term_constraint /= void
		local
			c_a_term_constraint: C_STRING
		do
			create c_a_term_constraint.make_by_pointer (a_term_constraint)

			Result := new_handle
			put_c_coded_term(constraint_model_factory.create_c_coded_term_from_pattern(c_attribute(h_parent_c_attribute), c_a_term_constraint.string), Result)
		end

	create_c_ordinal (h_parent_c_attribute: INTEGER): INTEGER is
			-- create an empty "ordinal" node.
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- Populate it using create_ordinal in this factory, then
			-- C_ORDINAL.add_item(an_ordinal)
		do
			Result := new_handle
			put_c_ordinal(constraint_model_factory.create_c_ordinal(c_attribute(h_parent_c_attribute)), Result)
		end

	create_ordinal (h_c_ordinal: INTEGER; a_value: INTEGER; a_symbol_code_phrase: POINTER) is
			-- create an ORDINAL from an integer value, and a symbol defined as a term
			-- string of the usual form, i.e. "[ttt::code]", and add it to h_c_ordinal's object
			-- REQUIRE
			-- c_ordinal_valid: has_c_ordinal(h_c_ordinal)
			-- a_symbol_valid: a_symbol_code_phrase /= void
		local
			c_a_symbol_code_phrase: C_STRING
		do
			create c_a_symbol_code_phrase.make_by_pointer (a_symbol_code_phrase)

			c_ordinal(h_c_ordinal).add_item(constraint_model_factory.create_ordinal(a_value, c_a_symbol_code_phrase.string))
		end

	create_c_primitive_object (h_parent_c_attribute: INTEGER; h_c_primitive: INTEGER): INTEGER is
			-- h_c_primitive is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- h_c_primitive_valid: has_c_primitive(h_c_primitive) /= void
		do
			Result := new_handle
			put_c_primitive_object(constraint_model_factory.create_c_primitive_object(
				c_attribute(h_parent_c_attribute), 
				c_primitive(h_c_primitive)), Result)
		end

	create_c_quantity (h_parent_c_attribute: INTEGER): INTEGER is
			-- create an empty C_QUANTITY node.
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
		do
			Result := new_handle
			put_c_quantity(constraint_model_factory.create_c_quantity(c_attribute(h_parent_c_attribute)), Result)
		end

	create_cardinality_make_bounded (a_lower, an_upper: INTEGER): INTEGER is
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_cardinality(constraint_model_factory.create_cardinality_make_bounded(a_lower, an_upper), Result)
		end

	create_cardinality_make_unbounded: INTEGER is
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_cardinality(constraint_model_factory.create_cardinality_make_unbounded, Result)
		end

	create_cardinality_make_upper_unbounded (a_lower: INTEGER): INTEGER is
			-- create Result from `a_lower' to +infinity
			-- REQUIRE
		do
			Result := new_handle
			put_cardinality(constraint_model_factory.create_cardinality_make_upper_unbounded(a_lower), Result)
		end

feature -- Archetype Node Creation

	create_archetype_internal_ref (h_parent_c_attribute: INTEGER; a_type_name, a_path: POINTER): INTEGER is
			-- create a "use" node using C_ATTRIBUTE referred to by h_parent_c_attribute handle
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- a_type_name_valid: a_type_name /= void
			-- a_path_valid: a_path /= void
		local
			c_a_type_name, c_a_path: C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)
			create c_a_path.make_by_pointer (a_path)

			Result := new_handle
			put_archetype_internal_ref(constraint_model_factory.create_archetype_internal_ref(c_attribute(h_parent_c_attribute), 
				c_a_type_name.string, c_a_path.string), Result)
		end

	create_archetype_slot_anonymous (h_parent_c_attribute: INTEGER; a_type_name: POINTER): INTEGER is
			-- create a new non-identified archetype slot using C_ATTRIBUTE referred to by h_parent_c_attribute handle
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void and then not a_type_name.is_empty
		local
			c_a_type_name: C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)

			Result := new_handle
			put_archetype_slot(constraint_model_factory.create_archetype_slot_anonymous(
					c_attribute(h_parent_c_attribute), c_a_type_name.string), Result)
		end

	create_archetype_slot_identified (h_parent_c_attribute: INTEGER; a_type_name, a_node_id: POINTER): INTEGER is
			-- create a new non-identified archetype slot using C_ATTRIBUTE referred to by h_parent_c_attribute handle
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void and then not a_type_name.is_empty
		local
			c_a_type_name, c_a_node_id: C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)
			create c_a_node_id.make_by_pointer (a_node_id)

			Result := new_handle
			put_archetype_slot(constraint_model_factory.create_archetype_slot_identified (
					c_attribute(h_parent_c_attribute), c_a_type_name.string, c_a_node_id.string), Result)
		end

	create_c_attribute_multiple (h_parent_c_complex_object: INTEGER; an_attr_name: POINTER; h_cardinality: INTEGER): INTEGER is
			-- create a C_ATTRIBUTE with a simple name like "text" or "description" using last-created C_COMPLEX_OBJECT
			--	and last-created CARDINALITY
			-- REQUIRE
			-- parent_valid: has_c_complex_object(h_parent_c_complex_object)
			-- an_attr_name_valid: an_attr_name /= void
			-- cardinality_valid: has_cardinality(h_cardinality)
		local
			c_an_attr_name: C_STRING
		do
			create c_an_attr_name.make_by_pointer (an_attr_name)

			Result := new_handle
			put_c_attribute(constraint_model_factory.create_c_attribute_multiple (
				c_complex_object(h_parent_c_complex_object), 
				c_an_attr_name.string, cardinality(h_cardinality)), Result)
		end

	create_c_attribute_single (h_parent_c_complex_object: INTEGER; an_attr_name: POINTER): INTEGER is
			-- create a C_ATTRIBUTE node with a simple name like "text" or "description"
			-- REQUIRE
			-- parent_valid: has_c_complex_object(h_parent_c_complex_object)
			-- an_attr_name_valid: an_attr_name /= void
		local
			c_an_attr_name: C_STRING
		do
			create c_an_attr_name.make_by_pointer (an_attr_name)

			Result := new_handle
			put_c_attribute(constraint_model_factory.create_c_attribute_single(c_complex_object(h_parent_c_complex_object), c_an_attr_name.string), Result)
		end

	create_c_complex_object_anonymous (h_parent_c_attribute: INTEGER; a_type_name: POINTER): INTEGER is
			-- create a new non-identified object node
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void
		local
			c_a_type_name: C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)

			Result := new_handle
			put_c_complex_object(constraint_model_factory.create_c_complex_object_anonymous(c_attribute(h_parent_c_attribute), c_a_type_name.string), Result)
		end

	create_c_complex_object_identified (h_parent_c_attribute: INTEGER; a_type_name, a_node_id: POINTER): INTEGER is
			-- create a new identified object node
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void
			-- node_id_valid: a_node_id /= void
		local
			c_a_type_name, c_a_node_id: C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)
			create c_a_node_id.make_by_pointer (a_node_id)

			Result := new_handle
			put_c_complex_object(constraint_model_factory.create_c_complex_object_identified(
				c_attribute(h_parent_c_attribute), c_a_type_name.string, c_a_node_id.string), Result)
		end

	create_constraint_ref (h_parent_c_attribute: INTEGER; a_code: POINTER): INTEGER is
			-- create a "term" node from term in string form "ac0039"
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- code_valid: a_code /= void
		local
			c_a_code: C_STRING
		do
			create c_a_code.make_by_pointer (a_code)

			Result := new_handle
			put_constraint_ref(constraint_model_factory.create_constraint_ref(c_attribute(h_parent_c_attribute), c_a_code.string), Result)
		end

	set_occurrences_c_object(h_c_object, h_integer_interval: INTEGER) is
			-- set_occurrences for any C_OBJECT
		do
			c_object(h_c_object).set_occurrences(integer_interval(h_integer_interval))
		end
		
	archetype_slot_add_include(h_archetype_slot, h_assertion: INTEGER) is
			-- add_include to an ARCHETYPE_SLOT
		do
			archetype_slot(h_archetype_slot).add_include(assertion(h_assertion))
		end

	archetype_slot_add_exclude(h_archetype_slot, h_assertion: INTEGER) is
			-- add_exclude to an ARCHETYPE_SLOT
		do
			archetype_slot(h_archetype_slot).add_exclude(assertion(h_assertion))
		end

feature -- Assertions
	
	create_assertion (h_an_expr: INTEGER): INTEGER is
			-- make assertion with an expression
			-- REQUIRE
			-- expr_valid: an_expr /= void
		do
			Result := new_handle
			put_assertion(constraint_model_factory.create_assertion(expr_item(h_an_expr), void), Result)
		end

	create_assertion_with_tag (h_an_expr: INTEGER; a_tag: POINTER): INTEGER is
			-- make assertion with an expression and tag
			-- REQUIRE
			-- tag_valid: a_tag /= void and then a_tag.is_empty
			-- expr_valid: an_expr /= void
		local
			c_a_tag: C_STRING
		do
			create c_a_tag.make_by_pointer (a_tag)
			Result := new_handle
			put_assertion(constraint_model_factory.create_assertion(
				expr_item(h_an_expr), c_a_tag.string), Result)
		end

	create_expr_binary_operator_node (an_operator: INTEGER; h_a_left_operand, h_a_right_operand: INTEGER): INTEGER is
			-- REQUIRE
			-- an_operator_exists: {OPERATOR_KIND}.is_valid_operator(an_operator)
			-- a_left_operand_exists: a_left_operand /= void
			-- a_right_operand_exists: a_right_operand /= void
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_binary_operator_node(
				create {OPERATOR_KIND}.make(an_operator),
				expr_item(h_a_left_operand), expr_item(h_a_right_operand)), Result)
		end

	create_expr_unary_operator_node (an_operator: INTEGER; h_an_operand: INTEGER): INTEGER is
			-- REQUIRE
			-- an_operator_exists: an_operator /= void and then not an_operator.is_empty
			-- an_operand_exists: an_operand /= void
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_unary_operator_node(
				create {OPERATOR_KIND}.make(an_operator),
				expr_item(h_an_operand)), Result)
		end

	create_expr_leaf_boolean (an_item: BOOLEAN): INTEGER is
			-- node is a boolean value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_boolean(an_item), Result)
		end

	create_expr_leaf_character (an_item: CHARACTER): INTEGER is
			-- node is a character value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_character(an_item), Result)
		end

	create_expr_leaf_constraint (h_an_item: INTEGER): INTEGER is
			-- node is a constraint on a primitive type; can only be used with "matches" function
			-- an_item is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
			-- REQUIRE
			-- item_exists: an_item /= void
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_constraint(
				c_primitive(h_an_item)), Result)
		end

	create_expr_leaf_archetype_feature_call (a_ref: POINTER): INTEGER is
			-- leaf node represents a feature call on Archetype object itself
			-- REQUIRE
			-- ref_exists: a_ref /= void and then not a_ref.is_empty
		local
			c_a_ref: C_STRING
		do
			create c_a_ref.make_by_pointer (a_ref)
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_archetype_feature_call(c_a_ref.string), Result)
		end

	create_expr_leaf_integer (an_item: INTEGER): INTEGER is
			-- node is an integer value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_integer(an_item), Result)
		end

	create_expr_leaf_object_ref (a_ref_path: POINTER): INTEGER is
			-- node refers to an object in the runtime data
			-- REQUIRE
			-- ref_exists: a_ref_path /= void and then not a_ref_path.is_empty
		local
			c_a_ref_path: C_STRING
		do
			create c_a_ref_path.make_by_pointer (a_ref_path)
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_object_ref(c_a_ref_path.string), Result)
		end

	create_expr_leaf_real (an_item: REAL): INTEGER is
			-- node is a real value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_real(an_item), Result)
		end

	create_expr_leaf_string (an_item: POINTER): INTEGER is
			-- node is a string value
			-- REQUIRE
			-- item_exists: an_item /= void
		local
			c_an_item: C_STRING
		do
			create c_an_item.make_by_pointer (an_item)
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_string(c_an_item.string), Result)
		end

end



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_interface.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
