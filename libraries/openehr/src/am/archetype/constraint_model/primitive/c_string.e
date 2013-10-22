note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of STRING"
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
			default_create, assumed_value
		end

create
	make_open, make_simple, make_from_regexp, make_list, make_any, default_create

feature -- Definitions

	Regex_any_string: STRING = ".*"

	default_delimiter: CHARACTER = '/'

	alternative_delimiter: CHARACTER = '^'

	Invalid_regex_message: STRING = "invalid regex"

feature -- Initialization

	default_create
		do
			precursor
			create list.make(0)
		end

	make_open
			-- make completely open
		do
			default_create
			is_open := True
		end

	make_simple (str: STRING)
			-- make from a single string
		do
			default_create
			list.extend (str)
		ensure
			not_open: not is_open
			str_valid: valid_value (str)
		end

	make_from_regexp (str: STRING; using_default_delimiter: BOOLEAN)
			-- make from a regular expression contained in 'str' (not including delimiters);
			-- if `using_default_delimiter' is True, the '/' delimiter is being used,
			-- else the '^' delimiter is being used
		local
			s: STRING
		do
			default_create
			s := str.twin
			regexp := s
			regexp_default_delimiter := using_default_delimiter
			create regexp_parser.make
			regexp_parser.set_case_insensitive (True)
			regexp_parser.compile (s)
			if not regexp_parser.is_compiled then
				regexp := Invalid_regex_message
			end
		ensure
			not_open: not is_open
		end

	make_list (lst: LIST[STRING])
		require
			not lst.is_empty
		do
			default_create
			list.compare_objects
			list.fill (lst)
		ensure
			not_open: not is_open
		end

	make_any
			-- make using an open regex, i.e. ".*"
		do
			default_create
			regexp := Regex_any_string
		end

feature -- Access

	list: ARRAYED_LIST [STRING]
			-- representation of constraint as allowed values for the constrained string

	regexp: detachable STRING
			-- representation of constraint as PERL-compliant regexp pattern

	list_count: INTEGER
			-- number of individual constraint items
		do
			Result := list.count
		end

	i_th_constraint (i: INTEGER): STRING
			-- obtain i-th constraint item
		do
			Result := list.i_th (i)
		end

	prototype_value: STRING
			-- 	generate a default value from this constraint object
		do
			if is_open then
				Result := "*"
			elseif not list.is_empty then
				Result := list.first
			elseif attached regexp then
				create Result.make_empty
				-- FIXME - what is default from regexp?
			else
				create Result.make_empty
			end
		end

	assumed_value: detachable STRING

	regexp_delimiter: CHARACTER
			-- return correct delimiter according to `regexp_default_delimiter'
		do
			if regexp_default_delimiter then
				Result := default_delimiter
			else
				Result := alternative_delimiter
			end
		end

feature -- Status Report

	is_open: BOOLEAN
			-- values other than those in 'items' are allowed

	is_regexp: BOOLEAN
			-- True if this constraint is a regular expression
		do
			Result := attached regexp
		end

	valid_value (a_value: STRING): BOOLEAN
		do
			if is_open then
				Result := True
			elseif not list.is_empty then
				Result := list.has (a_value)
			elseif attached regexp_parser as rep then
				Result := rep.recognizes (a_value)
			end
		end

	regexp_default_delimiter: BOOLEAN
			-- if True, the '/' delimiter is being used,
			-- else the '^' delimiter is being used		

feature -- Modification

	merge_tuple (other: like Current)
			-- merge the constraints of `other' into this constraint object. We just add items to
			-- the end of lists of constraints in the subtypes, since the constraints may represent
			-- a tuple vector, in which case duplicates are allowed
		do
			list.append (other.list)
		end

	set_open
		do
			is_open := True
		end

	add_string (str: STRING)
		do
			list.extend (str)
		ensure
			extended: list.count = old list.count + 1
			str_valid: valid_value (str)
		end

feature {P_C_STRING} -- Modification

	set_constraint (a_strings: detachable ARRAYED_LIST [STRING];
			a_regexp: detachable STRING;
			a_is_open: BOOLEAN;
			a_regexp_default_delimiter: BOOLEAN)
		do
			if attached a_strings as strs then
				list := strs
			end
			regexp := a_regexp
			is_open := a_is_open
			regexp_default_delimiter := a_regexp_default_delimiter
		end

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			if not list.is_empty then
				across list as strings_csr loop
					if not strings_csr.is_first then
						Result.append (", ")
					end
					Result.append_character ('%"')
					Result.append (strings_csr.item)
					Result.append_character ('%"')
				end
				if is_open then
					Result.append(", ...")
				end
			elseif attached regexp as rexp then
				Result.append_character (regexp_delimiter)
				Result.append (rexp)
				Result.append_character (regexp_delimiter)
			end
			if attached assumed_value then
				Result.append("; %"" + assumed_value.out + "%"")
			end
		end

	clean_as_string (cleaner: FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		do
			create Result.make(0)
			if not list.is_empty then
				across list as strings_csr loop
					if not strings_csr.is_first then
						Result.append(", ")
					end
					Result.append_character ('%"')
					Result.append (cleaner.item ([strings_csr.item]))
					Result.append_character ('%"')
				end
				if is_open then
					Result.append (", ...")
				end
			elseif attached regexp as rexp then
				Result.append_character (regexp_delimiter)
				Result.append (rexp)
				Result.append_character (regexp_delimiter)
			end
			if attached assumed_value then
				Result.append ("; %"" + cleaner.item ([assumed_value.out]) + "%"")
			end
		end

feature {NONE} -- Implementation

	do_node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			-- FIXME: TO BE IMPLEMENTED
		end

	regexp_parser: detachable RX_PCRE_REGULAR_EXPRESSION
		note
			option: transient
		attribute
		end

invariant
	strings_regexp_mutex: not list.is_empty xor regexp /= Void

end


