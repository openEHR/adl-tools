note
	component:   "openEHR Common Archetype Model"
	description: "Constrainer type for instances of STRING"
	keywords:    "archetype, string, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class C_STRING

inherit
	C_PRIMITIVE

create
	make_any, make_from_string, make_from_regexp, make_from_string_list

feature -- Definitions

	default_delimiter: CHARACTER = '/'

	alternative_delimiter: CHARACTER = '^'

	Regexp_compile_error: STRING = "regexp COMPILE ERROR"

feature -- Initialization

	make_any
			-- make completely open
		do
			is_open := True
		end

	make_from_string (str: STRING)
			-- make from a single string
		do
			create strings.make(0)
			strings.extend(str)
			strings.compare_objects
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
			regexp := str.twin
			regexp_default_delimiter := using_default_delimiter
			create regexp_parser.make
			regexp_parser.set_case_insensitive (True)
			regexp_parser.compile (regexp)
			if not regexp_parser.is_compiled then
				regexp := Regexp_compile_error.twin
			end
		ensure
			strings_void: strings = Void
			not_open: not is_open
			regexp.is_equal(str) xor regexp.is_equal (Regexp_compile_error)
		end

	make_from_string_list (lst: LIST[STRING])
		do
			create strings.make (0)
			strings.fill (lst)
			strings.compare_objects
		ensure
			strings_attached: attached strings
			not_open: not is_open
		end

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

feature -- Status Report

	valid_value (a_value: STRING): BOOLEAN
		do
			if is_open then
				Result := True
			elseif attached strings then
				Result := strings.has (a_value)
			elseif attached regexp_parser as rexpp then
				Result := rexpp.recognizes (a_value)
			end
		end

	regexp_default_delimiter: BOOLEAN
			-- if True, the '/' delimiter is being used,
			-- else the '^' delimiter is being used		

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			-- FIXME: TO BE IMPLEMENTED
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)

			if attached strings as strs then
				across strs as strings_csr loop
					if strings_csr.target_index > 1 then
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
					if strings_csr.target_index > 1 then
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

	regexp_parser: detachable RX_PCRE_REGULAR_EXPRESSION
		note
			option: transient
		attribute
		end

invariant
	strings_regexp_mutex: strings /= Void xor regexp /= Void

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
--| The Original Code is c_string.e.
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
