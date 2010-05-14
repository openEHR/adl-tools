note
	component:   "openEHR re-usable library"
	description: "Definition concepts for the basic meta-model"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_DEFINITIONS

feature -- Definitions

	Generic_left_delim: CHARACTER = '<'

	Generic_right_delim: CHARACTER = '>'

	Generic_separator: CHARACTER = ','

	Generic_constraint_delimiter: CHARACTER = ':'
			-- appears between 'T' and constraining type if there is one

	Any_type: STRING = "Any"

	Metadata_schema_name: STRING = "schema_name"
			-- dADL attribute name of logical attribute 'schema_name' in schema file;
			-- MUST correspond to attribute of same name in BMM_SCHEMA class

	Metadata_schema_release: STRING = "schema_release"
			-- dADL attribute name of logical attribute 'schema_release' in schema file;
			-- MUST correspond to attribute of same name in BMM_SCHEMA class

	Metadata_schema_lifecycle_state: STRING = "schema_lifecycle_state"
			-- dADL attribute name of logical attribute 'schema_lifecycle_state' in schema file;
			-- MUST correspond to attribute of same name in BMM_SCHEMA class

	Metadata_schema_description: STRING = "schema_description"
			-- dADL attribute name of logical attribute 'schema_description' in schema file;
			-- MUST correspond to attribute of same name in BMM_SCHEMA class

	Schema_fast_parse_attrs: ARRAY [STRING]
			-- attributes to retrieve for initial fast parse on schemas
		once
			Result := <<Metadata_schema_name, Metadata_schema_release, Metadata_schema_lifecycle_state>>
		end

feature -- Comparison

	is_well_formed_type_name (a_type_name: STRING): BOOLEAN
			-- True if the type name has a valid form, either a single name or a well-formed generic
		require
			Valid_type_name: a_type_name /= Void and then not a_type_name.is_empty
		do
			Result := well_formed_type_name_regex.matches(a_type_name)
		end

	is_well_formed_class_name (a_class_name: STRING): BOOLEAN
			-- True if the class name has a valid form
		require
			Valid_class_name: a_class_name /= Void and then not a_class_name.is_empty
		do
			Result := well_formed_class_name_regex.matches(a_class_name)
		end

	is_well_formed_generic_type_name (a_type_name: STRING): BOOLEAN
			-- True if the type name includes a generic parameters part; should be used after is_well_formed_type_name
		require
			Valid_type_name: a_type_name /= Void and then is_well_formed_class_name(a_type_name)
		do
			Result := a_type_name.has (generic_left_delim)
		end

feature -- Conversion

	type_name_as_flattened_type_list(a_type_name: STRING): ARRAYED_LIST [STRING]
			-- convert a type name to a flat set of strings
		require
			Valid_type_name: a_type_name /= Void and then is_well_formed_type_name(a_type_name)
		local
			is_gen_type: BOOLEAN
			stype: STRING
			lpos, rpos: INTEGER
		do
			create Result.make(0)
			stype := a_type_name.twin
			stype.prune_all (' ')
			if stype.has (generic_left_delim) then
				rpos := stype.index_of (generic_left_delim, 1) - 1
				is_gen_type := True
			else
				rpos := stype.count
			end
			Result.extend(a_type_name.substring(1, rpos))

			if is_gen_type then
				stype.replace_substring_all (generic_left_delim.out, Generic_separator.out)
				stype.replace_substring_all (generic_right_delim.out, Generic_separator.out)
				from
					lpos := rpos + 2
				until
					lpos > stype.count
				loop
					rpos := stype.index_of (Generic_separator, lpos) - 1
					Result.extend(stype.substring (lpos, rpos))
					lpos := rpos + 2
				end
			end
		end

feature {NONE} -- Implementation

	well_formed_type_name_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for well-formed type names
		once
			create Result.compile_case_insensitive ("[a-z][a-z0-9_]+(< *[a-z][a-z0-9_]+( *, *[a-z][a-z0-9_]+)*>)?")
		end

	well_formed_class_name_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for well-formed class names
		once
			create Result.compile_case_insensitive ("[a-z][a-z0-9_]+")
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
--| The Original Code is bmm_definitions.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2009
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
