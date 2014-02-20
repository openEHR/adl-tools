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
			default_create, constraint, c_congruent_to, c_conforms_to, assumed_value, as_string
		end

create
	make, make_value, make_value_list, make_regex_any, default_create

feature -- Definitions

	Regex_any_string: STRING = "/.*/"

	Regex_delimiter: CHARACTER = '/'

	Regex_literal_delimiter: STRING = "\/"

	Invalid_regex_message: STRING = "invalid regex"

feature -- Initialization

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
			if is_single and is_regex_string (constraint_single) then
				Result := constraint_single.substring (2, constraint_single.count - 1)
			end
		end

	constraint_single: STRING
			-- return the first and only constrain value
		do
			Result := constraint.first
		end

feature -- Status Report

	is_single: BOOLEAN
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
			-- <precursor>
			-- Lists have to be identical, only the order may be different
		do
			Result := precursor (other) and
				constraint.count = other.constraint.count and then
				across constraint as constraint_csr all other.constraint.has (constraint_csr.item) end
		end

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- <precursor>
			-- `constraint' has to be a subset of other.constraint
		do
			Result := precursor (other, rm_type_conformance_checker) and
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
				end
				Result.append (cleaner.item ([strings_csr.item]))
				if not is_regex_string (strings_csr.item) then
					Result.append_character ('%"')
				end
			end
		end

end


