note
	component:   "openEHR ADL Tools"
	description: "[
				 Constrainer type for instances of STRING. Multiple constraints in a tuple can be
				 accommodated. Each tuple member is a list of STRINGs, where each of those strings can be:
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
			default_create, constraint, assumed_value, as_string, i_th_tuple_constraint_as_string
		end

create
	make, make_value, make_value_list, make_any, default_create

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
			tuple_constraint.extend (create {like constraint}.make (0))
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

	make_any
			-- make using an open regex, i.e. ".*"
		do
			make_value (Regex_any_string)
		end

feature -- Access

	i_th_tuple_constraint (i: INTEGER): like Current
			-- obtain i-th tuple constraint item
		do
			create Result.make (tuple_constraint.i_th (i).deep_twin)
		end

	constraint: ARRAYED_LIST [STRING]
			-- <precursor>
		do
			Result := tuple_constraint.first
		end

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

feature -- Status Report

	is_regex_string (a_str: STRING): BOOLEAN
			-- True if this constraint is a regular expression, i.e. starts and ends with '/'
		do
			Result := a_str.item(1) = Regex_delimiter and a_str.item(a_str.count) = Regex_delimiter
		end

	valid_value (a_value: STRING): BOOLEAN
		local
			a_constraint: like constraint
			regexp_parser: RX_PCRE_REGULAR_EXPRESSION
		do
			from tuple_constraint.start until tuple_constraint.off or Result loop
				a_constraint := tuple_constraint.item
				from a_constraint.start until a_constraint.off or Result loop
					if is_regex_string (a_constraint.item) then
						create regexp_parser.make
						regexp_parser.set_case_insensitive (True)
						regexp_parser.compile (a_constraint.item.substring (2, a_constraint.item.count - 1))
						if regexp_parser.is_compiled then
							Result := regexp_parser.recognizes (a_value)
						end
					else
						Result := a_constraint.item.is_equal (a_value)
					end
					a_constraint.forth
				end
				tuple_constraint.forth
			end
		end

	valid_assumed_value (a_value: STRING): BOOLEAN
		do
			Result := valid_value (a_value)
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
			Result := constraint_as_string (constraint)
			if attached assumed_value then
				Result.append("; %"" + assumed_value.out + "%"")
			end
		end

	as_string_clean (cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			Result := constraint_as_string_clean (constraint, cleaner)
			if attached assumed_value then
				Result.append ("; %"" + cleaner.item ([assumed_value.out]) + "%"")
			end
		end

	i_th_tuple_constraint_as_string (i: INTEGER): STRING
			-- serialised form of i-th tuple constraint of this object
		do
			create Result.make(0)
			Result.append_character ('%"')
			Result.append (constraint_as_string (constraint))
			Result.append_character ('%"')
		end

	i_th_tuple_constraint_as_string_clean (i: INTEGER; cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			create Result.make(0)
			Result.append_character ('%"')
			Result.append (constraint_as_string_clean (tuple_constraint.i_th (i), cleaner))
			Result.append_character ('%"')
		end

feature {NONE} -- Implementation

	c_equal_constraint (a_constraint, other_constraint: like constraint): BOOLEAN
			-- <precursor>
		do
			Result := across a_constraint as constraint_csr all other_constraint.has (constraint_csr.item) end
		end

	constraint_as_string (a_constraint: like constraint): STRING
			-- generate `constraint' as string
		do
			create Result.make(0)
			across a_constraint as strings_csr loop
				if not strings_csr.is_first then
					Result.append (", ")
				end
				Result.append_character ('%"')
				Result.append (strings_csr.item)
				Result.append_character ('%"')
			end
		end

	constraint_as_string_clean (a_constraint: like constraint; cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			create Result.make(0)
			across a_constraint as strings_csr loop
				if not strings_csr.is_first then
					Result.append(", ")
				end
				Result.append_character ('%"')
				Result.append (cleaner.item ([strings_csr.item]))
				Result.append_character ('%"')
			end
		end

	do_constraint_conforms_to (a_constraint, other_constraint: like constraint): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := across a_constraint as constraint_csr all other_constraint.has (constraint_csr.item) end
		end

end


