note
	component:   "openEHR ADL Tools"
	description: "[
				 Constrainer type for instances of STRING in the form of a list of STRINGs, where each of those 
				 strings can be:
				 	* a normal string, e.g. 'abbsndf'
				 	* a regex string using // delimiters, e.g. '/[0-9]+/'
				 	* a literal regex string, delimited using \/\/, e.g. '\/[0-9]\/'
				 The last option allows regex strings to be normal values rather than constraint specifications,
				 in case the intention is to constraint some data item to be a regex string.
				 ]"
	keywords:    "archetype, string, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_STRING

inherit
	C_PRIMITIVE_OBJECT
		redefine
			default_create, make, constraint, c_congruent_to, c_conforms_to, assumed_value, as_string, as_enumeration_string, enter_subtree, exit_subtree
		end

create
	make, make_value, make_value_list, make_regex_any, make_example, default_create

feature -- Definitions

	Regex_any_string: STRING = "/.*/"

	Regex_delimiter: CHARACTER = '/'

	Regex_literal_delimiter: STRING = "\/"

	Invalid_regex_message: STRING = "invalid regex"

feature {NONE} -- Initialization

	default_create
			-- set `rm_type_name'
			-- the same as the C_XX clas name with the "C_" removed, but for some types e.g. Date/time types
			-- it is not true.
		do
			precursor
			create constraint.make (0)
			constraint.compare_objects
		end

	make_value (str: STRING)
			-- make from a single string
		local
			regexp_parser: RX_PCRE_REGULAR_EXPRESSION
		do
			default_create
			if is_regex_string (str) then
				create regexp_parser.make
				regexp_parser.set_case_insensitive (True)
				regexp_parser.compile (str.substring (2, str.count - 1))
				if not regexp_parser.is_compiled then
					constraint.extend (Invalid_regex_message)
				else
					constraint.extend (str)
				end
			else
				constraint.extend (str)
			end
		end

	make_value_list (list: LIST[STRING])
		require
			not list.is_empty
		do
			default_create
			constraint.fill (list)
		end

	make_regex_any
			-- make using an open regex, i.e. ".*" enclosed in "//"
		do
			make_value (Regex_any_string)
		end

	make (a_constraint: like constraint)
		do
			precursor (a_constraint)
			constraint.compare_objects
		end

	make_example
		do
			make_regex_any
		end

feature -- Access

	constraint: ARRAYED_LIST [STRING]
			-- <precursor>

	prototype_value: STRING
			-- 	generate a default value from this constraint object
		do
			if is_regex_string (constraint.first) then
				create Result.make_empty
				-- FIXME - what is default from regexp?
			else
				create Result.make_from_string (constraint.first)
			end
		end

	assumed_value: detachable STRING

	constraint_regex: detachable STRING
			-- return the regex string value in the first constraint,
			-- minus any enclosing //
		do
			if is_single_value and is_regex_string (single_value) then
				Result := single_value.substring (2, single_value.count - 1)
			end
		end

	single_value: STRING
			-- single value if single-valued
		do
			Result := constraint.first
		end

feature -- Status Report

	is_single_value: BOOLEAN
			-- True if this constraint has only a single string
		do
			Result := constraint.count = 1
		end

	is_matches_any_regex: BOOLEAN
			-- True if this constraint contains a single regex constraint matching any (i.e. /.*/)
		do
			Result := attached constraint_regex as att_regex and then att_regex.is_equal (regex_any_pattern)
		end

	is_regex_string (a_str: STRING): BOOLEAN
			-- True if this constraint is a regular expression, i.e. starts and ends with '/'
		do
			Result := a_str.count >= 2 and then (a_str.item(1) = Regex_delimiter and a_str.item (a_str.count) = Regex_delimiter)
		end

	valid_value (a_value: STRING): BOOLEAN
		local
			regexp_parser: RX_PCRE_REGULAR_EXPRESSION
		do
			from constraint.start until constraint.off or Result loop
				if is_regex_string (constraint.item) then
					create regexp_parser.make
					regexp_parser.set_case_insensitive (True)
					regexp_parser.compile (constraint.item.substring (2, constraint.item.count - 1))
					if regexp_parser.is_compiled then
						Result := regexp_parser.recognizes (a_value)
					end
				else
					Result := constraint.item.is_equal (a_value)
				end
				constraint.forth
			end
		end

	valid_assumed_value (a_value: STRING): BOOLEAN
		do
			Result := valid_value (a_value)
		end

feature -- Comparison

	c_congruent_to (other: like Current): BOOLEAN
			-- True if `constraint' is identical to other.constraint
		do
			Result := precursor (other) and
				constraint.count = other.constraint.count and then
				across constraint as str_csr all other.constraint.i_th (str_csr.cursor_index).is_equal (str_csr.item) end
		end

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if `constraint' is a strict subset of other.constraint
		do
			Result := precursor (other, rm_type_conformance_checker) and
				constraint.count < other.constraint.count and
				across constraint as constraint_csr all other.constraint.has (constraint_csr.item) end
		end

feature -- Modification

	add_string (str: STRING)
		do
			constraint.extend (str)
		ensure
			extended: constraint.count = old constraint.count + 1
		end

feature -- Output

	as_string: STRING
			-- seriaised form of this object, with no modifications; use `as_string_clean' to
			-- apply a cleaner function
		do
			Result := constraint_as_string
			if attached assumed_value as av then
				Result.append("; ")
				if not is_regex_string (av) then
					Result.append_character ('%"')
				end
				Result.append (av)
				if not is_regex_string (av) then
					Result.append_character ('%"')
				end
			end
		end

	as_string_clean (cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			Result := constraint_as_string_clean (cleaner)
			if attached assumed_value as av then
				Result.append("; ")
				if not is_regex_string (av) then
					Result.append_character ('%"')
				end
				Result.append (cleaner.item ([av]))
				if not is_regex_string (av) then
					Result.append_character ('%"')
				end
			end
		end

	as_enumeration_string (enum_map: HASH_TABLE [STRING, STRING]): STRING
			-- for an enumerated type, generate a set of strings corresponding to the values in `enum_map'
			-- whose keys are enumeration values in string form
		do
			create Result.make (0)
			across constraint as vals_csr loop
				check attached enum_map.item (vals_csr.item) as enum_item_name then
					Result.append (enum_item_name)
				end
				if not vals_csr.is_last then
					Result.append (", ")
				end
			end
		end

feature {NONE} -- Implementation

	constraint_as_string: STRING
			-- generate `constraint' as string
		do
			create Result.make(0)
			across constraint as strings_csr loop
				if not strings_csr.is_first then
					Result.append (", ")
				end
				if not is_regex_string (strings_csr.item) then
					Result.append_character ('%"')
				end
				Result.append (strings_csr.item)
				if not is_regex_string (strings_csr.item) then
					Result.append_character ('%"')
				end
			end
		end

	constraint_as_string_clean (cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			create Result.make(0)
			across constraint as strings_csr loop
				if not strings_csr.is_first then
					Result.append(", ")
				end
				if not is_regex_string (strings_csr.item) then
					Result.append_character ('%"')
					Result.append (cleaner.item ([strings_csr.item]))
					Result.append_character ('%"')
				else
					Result.append (strings_csr.item)
				end
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_c_string (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_string (Current, depth)
		end

end


