note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_ADL_FACTORY

inherit
	SHARED_C_FACTORY
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

	make
		do
		end

feature -- Date/Time Routines

	is_valid_iso8601_date_constraint_pattern (a_str: POINTER): BOOLEAN
			-- True if string literal like "yyyy-MM-dd"
			-- with XX or ?? allowed in MM or dd slots
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_date_string (a_str: POINTER): BOOLEAN
			-- True if string in form "yyyy-MM-dd"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date(c_a_str.string)
		end

	is_valid_iso8601_date_time_constraint_pattern (a_str: POINTER): BOOLEAN
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date_time_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_date_time_string (a_str: POINTER): BOOLEAN
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_date_time(c_a_str.string)
		end

	is_valid_iso8601_duration_string (a_str: POINTER): BOOLEAN
			-- True if string in form "PnYnMnWnDTnHnMnS"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_duration(c_a_str.string)
		end

	is_valid_iso8601_duration_constraint_pattern (a_str: POINTER): BOOLEAN
			-- True if string literal like PYMWDTHMS
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_duration_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_time_constraint_pattern (a_str: POINTER): BOOLEAN
			-- True if string literal like "hh:mm:ss[.ssss]"
			-- with XX or ?? allowed in mm or ss slots
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_time_constraint_pattern(c_a_str.string)
		end

	is_valid_iso8601_time_string (a_str: POINTER): BOOLEAN
			-- True if string in form "hh:mm:ss[.ssss]"
			-- REQUIRE
			-- a_str /= void
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)
			Result := constraint_model_factory.valid_iso8601_time(c_a_str.string)
		end

feature -- Primitive Object Creation

	create_integer_interval_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): INTEGER
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_integer_interval(constraint_model_factory.create_integer_interval_make_bounded(
				a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_integer_interval_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): INTEGER
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_integer_interval(constraint_model_factory.create_integer_interval_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_integer_interval_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): INTEGER
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_integer_interval(constraint_model_factory.create_integer_interval_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_real_interval_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): INTEGER
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_real_interval(constraint_model_factory.create_real_interval_make_bounded(a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_real_interval_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): INTEGER
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_real_interval(constraint_model_factory.create_real_interval_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_real_interval_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): INTEGER
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_real_interval(constraint_model_factory.create_real_interval_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_c_integer_make_bounded (a_lower, an_upper: INTEGER; include_lower, include_upper: BOOLEAN): INTEGER
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_integer_make_bounded(a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_c_integer_make_lower_unbounded (an_upper: INTEGER; include_upper: BOOLEAN): INTEGER
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_integer_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_c_integer_make_upper_unbounded (a_lower: INTEGER; include_lower: BOOLEAN): INTEGER
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_integer_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_c_real_make_bounded (a_lower, an_upper: REAL; include_lower, include_upper: BOOLEAN): INTEGER
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_real_make_bounded(a_lower, an_upper, include_lower, include_upper), Result)
		end

	create_c_real_make_lower_unbounded (an_upper: REAL; include_upper: BOOLEAN): INTEGER
			-- create Result from -infinity to `an_upper'
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_real_make_lower_unbounded(an_upper, include_upper), Result)
		end

	create_c_real_make_upper_unbounded (a_lower: REAL; include_lower: BOOLEAN): INTEGER
			-- create Result from `a_lower' to +infinity
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_real_make_upper_unbounded(a_lower, include_lower), Result)
		end

	create_c_boolean_make_true: INTEGER
			-- create Result allowing True only
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_boolean_make_true, Result)
		end

	create_c_boolean_make_false: INTEGER
			-- create Result allowing False only
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_boolean_make_false, Result)
		end

	create_c_boolean_make_true_false: INTEGER
			-- create Result allowing True and False
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_boolean_make_true_false, Result)
		end

	create_c_string_make_any: INTEGER
			-- create Result completely open
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_any, Result)
		end

	create_c_string_make_from_string (a_str: POINTER): INTEGER
			-- create Result from a single string
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_from_string(c_a_str.string), Result)
		end

	create_c_string_make_from_regexp (a_str: POINTER): INTEGER
			-- create Result from a regular expression
		local
			c_a_str: BASE_C_STRING
		do
			create c_a_str.make_by_pointer (a_str)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_from_regexp(c_a_str.string), Result)
		end

	create_c_string_make_from_string_list (a_str_lst: ARRAY [POINTER]): INTEGER
			-- create Result from a list of strings
			-- REQUIRE
			-- lst /= void
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_string_make_from_string_list(c_array_string_to_eif_list (a_str_lst)), Result)
		end

	create_c_date_make_bounded (a_lower, an_upper: POINTER): INTEGER
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_string(an_upper)
			-- valid_order: iso8601_string_to_date(a_lower) <= iso8601_string_to_date(an_upper)
		local
			c_a_lower, c_an_upper: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_bounded (c_a_lower.string, c_an_upper.string), Result)
		end

	create_c_date_make_lower_unbounded (an_upper: POINTER): INTEGER
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_string(an_upper)
		local
			c_an_upper: BASE_C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_lower_unbounded (c_an_upper.string), Result)
		end

	create_c_date_make_upper_unbounded (a_lower: POINTER): INTEGER
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_string(a_lower)
		local
			c_a_lower: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_upper_unbounded (c_a_lower.string), Result)
		end

	create_c_date_make_pattern (a_pattern: POINTER): INTEGER
			-- create Result from an ISO8601-based pattern like "yyyy-mm-??"
			-- REQUIRE
			-- pattern_valid: a_pattern /= void and then is_valid_iso8601_date_constraint_pattern(a_pattern)
		local
			c_a_pattern: BASE_C_STRING
		do
			create c_a_pattern.make_by_pointer (a_pattern)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_pattern (c_a_pattern.string), Result)
		end

	create_c_date_make_unbounded: INTEGER
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_make_unbounded, Result)
		end

	create_c_date_time_make_bounded (a_lower, an_upper: POINTER): INTEGER
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_time_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_time_string(an_upper)
			-- valid_order: iso8601_string_to_date_time(a_lower) <= iso8601_string_to_date_time(an_upper)
		local
			c_a_lower, c_an_upper: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_bounded (c_a_lower.string, c_an_upper.string), Result)
		end

	create_c_date_time_make_lower_unbounded (an_upper: POINTER; include_upper: BOOLEAN): INTEGER
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_date_time_string(an_upper)
		local
			c_an_upper: BASE_C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_lower_unbounded (c_an_upper.string), Result)
		end

	create_c_date_time_make_upper_unbounded (a_lower: POINTER): INTEGER
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_date_time_string(a_lower)
		local
			c_a_lower: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_upper_unbounded (c_a_lower.string), Result)
		end

	create_c_date_time_make_pattern (a_pattern: POINTER): INTEGER
			-- create Result from an ISO8601-based pattern like "yyyy-mm-dd hh:??:XX"
			-- REQUIRE
			-- pattern_valid: a_pattern /= void and then is_valid_iso8601_date_time_constraint_pattern(a_pattern)
		local
			c_a_pattern: BASE_C_STRING
		do
			create c_a_pattern.make_by_pointer (a_pattern)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_pattern (c_a_pattern.string), Result)
		end

	create_c_date_time_make_unbounded: INTEGER
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_date_time_make_unbounded, Result)
		end

	create_c_time_make_bounded (a_lower, an_upper: POINTER): INTEGER
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_time_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_time_string(an_upper)
			-- valid_order: iso8601_string_to_time(a_lower) <= iso8601_string_to_time(an_upper)
		local
			c_a_lower, c_an_upper: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_bounded (c_a_lower.string, c_an_upper.string), Result)
		end

	create_c_time_make_lower_unbounded (an_upper: POINTER): INTEGER
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_time_string(an_upper)
		local
			c_an_upper: BASE_C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_lower_unbounded (c_an_upper.string), Result)
		end

	create_c_time_make_upper_unbounded (a_lower: POINTER): INTEGER
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_time_string(a_lower)
		local
			c_a_lower: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_upper_unbounded (c_a_lower.string), Result)
		end

	create_c_time_make_pattern (a_pattern: POINTER): INTEGER
			-- create Result from an ISO8601-based pattern like "hh:mm:??"
			-- REQUIRE
			-- pattern_valid: a_pattern /= void and then is_valid_iso8601_time_constraint_pattern(a_pattern)
		local
			c_a_pattern: BASE_C_STRING
		do
			create c_a_pattern.make_by_pointer (a_pattern)

			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_pattern (c_a_pattern.string), Result)
		end

	create_c_time_make_unbounded: INTEGER
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive(constraint_model_factory.create_c_time_make_unbounded, Result)
		end

	create_c_duration_make_bounded (a_lower, an_upper: POINTER; include_lower, include_upper: BOOLEAN): INTEGER
			-- create Result with both limits set from ISO8601 strings
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_duration_string(a_lower)
			-- upper_valid: an_upper /= void and then is_valid_iso8601_duration_string(an_upper)
			-- valid_order: iso8601_string_to_duration(a_lower) <= iso8601_string_to_duration(an_upper)
		local
			c_a_lower, c_an_upper: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive (constraint_model_factory.create_c_duration_make (Void, c_a_lower.string, c_an_upper.string, include_lower, include_upper), Result)
		end

	create_c_duration_make_lower_unbounded (an_upper: POINTER; include_upper: BOOLEAN): INTEGER
			-- create Result from -infinity to `an_upper' in ISO8601 string form
			-- REQUIRE
			-- upper_valid: an_upper /= void and then is_valid_iso8601_duration_string(an_upper)
		local
			c_an_upper: BASE_C_STRING
		do
			create c_an_upper.make_by_pointer (an_upper)

			Result := new_handle
			put_c_primitive (constraint_model_factory.create_c_duration_make (Void, Void, c_an_upper.string, False, include_upper), Result)
		end

	create_c_duration_make_upper_unbounded (a_lower: POINTER; include_lower: BOOLEAN): INTEGER
			-- create Result from `a_lower' in ISO8601 string form, to +infinity
			-- REQUIRE
			-- lower_valid: a_lower /= void and then is_valid_iso8601_duration_string(a_lower)
		local
			c_a_lower: BASE_C_STRING
		do
			create c_a_lower.make_by_pointer (a_lower)

			Result := new_handle
			put_c_primitive (constraint_model_factory.create_c_duration_make (Void, c_a_lower.string, Void, include_lower, False), Result)
		end

	create_c_duration_make_unbounded: INTEGER
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_c_primitive (constraint_model_factory.create_c_duration_make (Void, Void, Void, False, False), Result)
		end

feature -- Domain object creation

	create_c_code_phrase_from_pattern (h_parent_c_attribute: INTEGER; a_term_constraint: POINTER): INTEGER
			-- create a "term" node from term in string form "terminology(version)::code_phrase, code_phrase, ..."
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- term_constraint_valid: a_term_constraint /= void
		local
			c_a_term_constraint: BASE_C_STRING
		do
			create c_a_term_constraint.make_by_pointer (a_term_constraint)

			Result := new_handle
			put_c_code_phrase(constraint_model_factory.create_c_code_phrase_from_pattern(c_attribute(h_parent_c_attribute), c_a_term_constraint.string), Result)
		end

	create_c_ordinal (h_parent_c_attribute: INTEGER): INTEGER
			-- create an empty "ordinal" node.
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- Populate it using create_ordinal in this factory, then
			-- C_ORDINAL.add_item(an_ordinal)
		do
			Result := new_handle
			put_c_ordinal(constraint_model_factory.create_c_dv_ordinal(c_attribute(h_parent_c_attribute)), Result)
		end

	create_ordinal (h_c_ordinal: INTEGER; a_value: INTEGER; a_symbol_code_phrase: POINTER)
			-- create an ORDINAL from an integer value, and a symbol defined as a term
			-- string of the usual form, i.e. "[ttt::code]", and add it to h_c_ordinal's object
			-- REQUIRE
			-- c_ordinal_valid: has_c_ordinal(h_c_ordinal)
			-- a_symbol_valid: a_symbol_code_phrase /= void
		local
			c_a_symbol_code_phrase: BASE_C_STRING
		do
			create c_a_symbol_code_phrase.make_by_pointer (a_symbol_code_phrase)

			c_ordinal(h_c_ordinal).add_item(constraint_model_factory.create_ordinal(a_value, c_a_symbol_code_phrase.string))
		end

	create_c_primitive_object (h_parent_c_attribute: INTEGER; h_c_primitive: INTEGER): INTEGER
			-- h_c_primitive is BASE_C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- h_c_primitive_valid: has_c_primitive(h_c_primitive) /= void
		do
			Result := new_handle
			put_c_primitive_object(constraint_model_factory.create_c_primitive_object(
				c_attribute(h_parent_c_attribute),
				c_primitive(h_c_primitive)), Result)
		end

	create_c_quantity (h_parent_c_attribute: INTEGER): INTEGER
			-- create an empty C_QUANTITY node.
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
		do
			Result := new_handle
			put_c_quantity(constraint_model_factory.create_c_dv_quantity(c_attribute(h_parent_c_attribute)), Result)
		end

	create_cardinality_make_bounded (a_lower, an_upper: INTEGER): INTEGER
			-- create Result with both limits set
			-- REQUIRE
			-- valid_order: a_lower <= an_upper
		do
			Result := new_handle
			put_cardinality(constraint_model_factory.create_cardinality_make_bounded(a_lower, an_upper), Result)
		end

	create_cardinality_make_unbounded: INTEGER
			-- create Result as unbounded interval
		do
			Result := new_handle
			put_cardinality(constraint_model_factory.create_cardinality_make_unbounded, Result)
		end

	create_cardinality_make_upper_unbounded (a_lower: INTEGER): INTEGER
			-- create Result from `a_lower' to +infinity
			-- REQUIRE
		do
			Result := new_handle
			put_cardinality(constraint_model_factory.create_cardinality_make_upper_unbounded(a_lower), Result)
		end

feature -- Archetype Node Creation

	create_archetype_internal_ref (h_parent_c_attribute: INTEGER; a_type_name, a_path: POINTER): INTEGER
			-- create a "use" node using C_ATTRIBUTE referred to by h_parent_c_attribute handle
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- a_type_name_valid: a_type_name /= void
			-- a_path_valid: a_path /= void
		local
			c_a_type_name, c_a_path: BASE_C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)
			create c_a_path.make_by_pointer (a_path)

			Result := new_handle
			put_archetype_internal_ref(constraint_model_factory.create_archetype_internal_ref(c_attribute(h_parent_c_attribute),
				c_a_type_name.string, c_a_path.string), Result)
		end

	create_archetype_slot_anonymous (h_parent_c_attribute: INTEGER; a_type_name: POINTER): INTEGER
			-- create a new non-identified archetype slot using C_ATTRIBUTE referred to by h_parent_c_attribute handle
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void and then not a_type_name.is_empty
		local
			c_a_type_name: BASE_C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)

			Result := new_handle
			put_archetype_slot(constraint_model_factory.create_archetype_slot_anonymous(
					c_attribute(h_parent_c_attribute), c_a_type_name.string), Result)
		end

	create_archetype_slot_identified (h_parent_c_attribute: INTEGER; a_type_name, a_node_id: POINTER): INTEGER
			-- create a new non-identified archetype slot using C_ATTRIBUTE referred to by h_parent_c_attribute handle
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void and then not a_type_name.is_empty
		local
			c_a_type_name, c_a_node_id: BASE_C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)
			create c_a_node_id.make_by_pointer (a_node_id)

			Result := new_handle
			put_archetype_slot(constraint_model_factory.create_archetype_slot_identified (
					c_attribute(h_parent_c_attribute), c_a_type_name.string, c_a_node_id.string), Result)
		end

	create_c_attribute_multiple (h_parent_c_complex_object: INTEGER; an_attr_name: POINTER; h_cardinality: INTEGER): INTEGER
			-- create a C_ATTRIBUTE with a simple name like "text" or "description" using last-created C_COMPLEX_OBJECT
			--	and last-created CARDINALITY
			-- REQUIRE
			-- parent_valid: has_c_complex_object(h_parent_c_complex_object)
			-- an_attr_name_valid: an_attr_name /= void
			-- cardinality_valid: has_cardinality(h_cardinality)
		local
			c_an_attr_name: BASE_C_STRING
		do
			create c_an_attr_name.make_by_pointer (an_attr_name)

			Result := new_handle
			put_c_attribute(constraint_model_factory.create_c_attribute_multiple (
				c_complex_object(h_parent_c_complex_object),
				c_an_attr_name.string, cardinality(h_cardinality)), Result)
		end

	create_c_attribute_single (h_parent_c_complex_object: INTEGER; an_attr_name: POINTER): INTEGER
			-- create a C_ATTRIBUTE node with a simple name like "text" or "description"
			-- REQUIRE
			-- parent_valid: has_c_complex_object(h_parent_c_complex_object)
			-- an_attr_name_valid: an_attr_name /= void
		local
			c_an_attr_name: BASE_C_STRING
		do
			create c_an_attr_name.make_by_pointer (an_attr_name)

			Result := new_handle
			put_c_attribute(constraint_model_factory.create_c_attribute_single(c_complex_object(h_parent_c_complex_object), c_an_attr_name.string), Result)
		end

	create_c_complex_object_anonymous (h_parent_c_attribute: INTEGER; a_type_name: POINTER): INTEGER
			-- create a new non-identified object node
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void
		local
			c_a_type_name: BASE_C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)

			Result := new_handle
			put_c_complex_object(constraint_model_factory.create_c_complex_object_anonymous(c_attribute(h_parent_c_attribute), c_a_type_name.string), Result)
		end

	create_c_complex_object_identified (h_parent_c_attribute: INTEGER; a_type_name, a_node_id: POINTER): INTEGER
			-- create a new identified object node
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- type_name_valid: a_type_name /= void
			-- node_id_valid: a_node_id /= void
		local
			c_a_type_name, c_a_node_id: BASE_C_STRING
		do
			create c_a_type_name.make_by_pointer (a_type_name)
			create c_a_node_id.make_by_pointer (a_node_id)

			Result := new_handle
			put_c_complex_object(constraint_model_factory.create_c_complex_object_identified(
				c_attribute(h_parent_c_attribute), c_a_type_name.string, c_a_node_id.string), Result)
		end

	create_constraint_ref (h_parent_c_attribute: INTEGER; a_code: POINTER): INTEGER
			-- create a "term" node from term in string form "ac0039"
			-- REQUIRE
			-- parent_valid: has_c_attribute(h_parent_c_attribute)
			-- code_valid: a_code /= void
		local
			c_a_code: BASE_C_STRING
		do
			create c_a_code.make_by_pointer (a_code)

			Result := new_handle
			put_constraint_ref(constraint_model_factory.create_constraint_ref(c_attribute(h_parent_c_attribute), c_a_code.string), Result)
		end

	set_occurrences_c_object(h_c_object, h_integer_interval: INTEGER)
			-- set_occurrences for any C_OBJECT
		do
			c_object(h_c_object).set_occurrences(integer_interval(h_integer_interval))
		end

	archetype_slot_add_include(h_archetype_slot, h_assertion: INTEGER)
			-- add_include to an ARCHETYPE_SLOT
		do
			archetype_slot(h_archetype_slot).add_include(assertion(h_assertion))
		end

	archetype_slot_add_exclude(h_archetype_slot, h_assertion: INTEGER)
			-- add_exclude to an ARCHETYPE_SLOT
		do
			archetype_slot(h_archetype_slot).add_exclude(assertion(h_assertion))
		end

feature -- Assertions

	create_assertion (h_an_expr: INTEGER): INTEGER
			-- make assertion with an expression
			-- REQUIRE
			-- expr_valid: an_expr /= void
		do
			Result := new_handle
			put_assertion(constraint_model_factory.create_assertion(expr_item(h_an_expr), void), Result)
		end

	create_assertion_with_tag (h_an_expr: INTEGER; a_tag: POINTER): INTEGER
			-- make assertion with an expression and tag
			-- REQUIRE
			-- tag_valid: a_tag /= void and then a_tag.is_empty
			-- expr_valid: an_expr /= void
		local
			c_a_tag: BASE_C_STRING
		do
			create c_a_tag.make_by_pointer (a_tag)
			Result := new_handle
			put_assertion(constraint_model_factory.create_assertion(
				expr_item(h_an_expr), c_a_tag.string), Result)
		end

	create_expr_binary_operator_node (an_operator: INTEGER; h_a_left_operand, h_a_right_operand: INTEGER): INTEGER
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

	create_expr_unary_operator_node (an_operator: INTEGER; h_an_operand: INTEGER): INTEGER
			-- REQUIRE
			-- an_operator_exists: an_operator /= void and then not an_operator.is_empty
			-- an_operand_exists: an_operand /= void
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_unary_operator_node(
				create {OPERATOR_KIND}.make(an_operator),
				expr_item(h_an_operand)), Result)
		end

	create_expr_leaf_boolean (an_item: BOOLEAN): INTEGER
			-- node is a boolean value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_boolean(an_item), Result)
		end

	create_expr_leaf_character (an_item: CHARACTER): INTEGER
			-- node is a character value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_character(an_item), Result)
		end

	create_expr_leaf_constraint (h_an_item: INTEGER): INTEGER
			-- node is a constraint on a primitive type; can only be used with "matches" function
			-- an_item is BASE_C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
			-- REQUIRE
			-- item_exists: an_item /= void
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_constraint(
				c_primitive(h_an_item)), Result)
		end

	create_expr_leaf_archetype_feature_call (a_ref: POINTER): INTEGER
			-- leaf node represents a feature call on Archetype object itself
			-- REQUIRE
			-- ref_exists: a_ref /= void and then not a_ref.is_empty
		local
			c_a_ref: BASE_C_STRING
		do
			create c_a_ref.make_by_pointer (a_ref)
			Result := new_handle
			put_expr_item (constraint_model_factory.create_expr_leaf_archetype_ref (c_a_ref.string), Result)
		end

	create_expr_leaf_integer (an_item: INTEGER): INTEGER
			-- node is an integer value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_integer(an_item), Result)
		end

	create_expr_leaf_object_ref (a_ref_path: POINTER): INTEGER
			-- node refers to an object in the runtime data
			-- REQUIRE
			-- ref_exists: a_ref_path /= void and then not a_ref_path.is_empty
		local
			c_a_ref_path: BASE_C_STRING
		do
			create c_a_ref_path.make_by_pointer (a_ref_path)
			Result := new_handle
			put_expr_item (constraint_model_factory.create_expr_leaf_archetype_definition_ref (c_a_ref_path.string), Result)
		end

	create_expr_leaf_real (an_item: REAL): INTEGER
			-- node is a real value
		do
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_real(an_item), Result)
		end

	create_expr_leaf_string (an_item: POINTER): INTEGER
			-- node is a string value
			-- REQUIRE
			-- item_exists: an_item /= void
		local
			c_an_item: BASE_C_STRING
		do
			create c_an_item.make_by_pointer (an_item)
			Result := new_handle
			put_expr_item(constraint_model_factory.create_expr_leaf_string(c_an_item.string), Result)
		end

end



