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

create
	make_open, make_from_string, make_from_regexp, make_from_string_list, make_any

feature -- Definitions

	Regex_any_string: STRING = ".*"

	default_delimiter: CHARACTER = '/'

	alternative_delimiter: CHARACTER = '^'

	Regexp_compile_error: STRING = "regexp COMPILE ERROR"

feature -- Initialization

	make_open
			-- make completely open
		do
			default_create
			is_open := True
		end

	make_from_string (str: STRING)
			-- make from a single string
		do
			default_create
			create strings.make(0)
			strings.compare_objects
			strings.extend (str)
		ensure
			strings_attached: strings /= Void
			not_open: not is_open
			str_valid: valid_value (str)
		end

	make_from_regexp (str: STRING; using_default_delimiter: BOOLEAN)
			-- make from a regular expression contained in 'str' (not including delimiters);
			-- if `using_default_delimiter' is True, the '/' delimiter is being used,
			-- else the '^' delimiter is being used
		do
			default_create
			regexp := str.twin
			regexp_default_delimiter := using_default_delimiter
			create regexp_parser.make
			regexp_parser.set_case_insensitive (True)
			regexp_parser.compile (regexp)
			if not regexp_parser.is_compiled then
				regexp := Regexp_compile_error.twin
			end
		ensure
			strings_void: not attached strings
			not_open: not is_open
			regexp.is_equal(str) xor regexp.is_equal (Regexp_compile_error)
		end

	make_from_string_list (lst: LIST[STRING])
		require
			not lst.is_empty
		do
			default_create
			create strings.make (0)
			strings.compare_objects
			strings.fill (lst)
		ensure
			strings_attached: attached strings
			not_open: not is_open
		end

	make_any
			-- make using an open regex, i.e. ".*"
		do
			regexp := Regex_any_string
		end

feature -- Access

	strings: detachable ARRAYED_LIST [STRING]
			-- representation of constraint as allowed values for the constrained string

	regexp: detachable STRING
			-- representation of constraint as PERL-compliant regexp pattern

	prototype_value: STRING
			-- 	generate a default value from this constraint object
		do
			if attached strings then
				if is_open then
					Result := "*"
				elseif strings.count > 0 then
					Result := strings.first
				else
					create Result.make_empty
				end
			elseif attached regexp then
				create Result.make_empty
				-- FIXME - what is default from regexp?
			else
				create Result.make_empty
			end
		end

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
			elseif attached strings as strs then
				Result := strs.has (a_value)
			elseif attached regexp_parser as rep then
				Result := rep.recognizes (a_value)
			end
		end

	regexp_default_delimiter: BOOLEAN
			-- if True, the '/' delimiter is being used,
			-- else the '^' delimiter is being used		

feature -- Modification

	set_open
		do
			is_open := True
		end

	add_string (str: STRING)
		do
			strings.extend (str)
		ensure
			extended: strings.count = old strings.count + 1
			str_valid: valid_value (str)
		end

feature -- Output

	as_string: STRING
		do
			create Result.make_empty

			if attached strings as strs then
				across strs as strings_csr loop
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
			if attached strings as strs then
				across strs as strings_csr loop
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
	strings_regexp_mutex: strings /= Void xor regexp /= Void

end


