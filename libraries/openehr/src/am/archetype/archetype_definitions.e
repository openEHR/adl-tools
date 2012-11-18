note
	component:   "openEHR Archetype Project"
	description: "[
				 Basic archetype definitions
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_DEFINITIONS

feature -- Syntax Elements

	Archetype_any_constraint: STRING = "*"

	Archetype_slot_closed: STRING = "closed"

feature -- Definitions

	Syntax_type_adl: STRING = "adl"
			-- Name of native ADL syntax type.

	Syntax_type_adl_html: STRING = "html"
			-- Name of web publishing syntax type.

	Syntax_type_dadl: STRING = "dadl"
			-- Name of native dADL syntax type.

	Syntax_type_xml: STRING = "xml"
			-- Name of XML syntax type.

	Syntax_type_json: STRING = "json"
			-- Name of JSON syntax type.

	Syntax_type_yaml: STRING = "yaml"
			-- Name of YAML syntax type.

	File_ext_archetype_web_page: STRING = ".html"
			-- Extension of web page containing ADL syntax

	File_ext_archetype_adl14: STRING = ".adl"
			-- Extension for legacy flat form archetype files in ADL 1.4 syntax

	File_ext_archetype_flat: STRING = ".adlf"
			-- Extension for legacy flat form archetype files in ADL syntax

	File_ext_archetype_source: STRING = ".adls"
			-- Extension for source form (differential) archetype files in ADL 1.5 syntax

	File_ext_archetype_adl_diff: STRING = ".adlx"
			-- Extension for use with source/flat diff; we don't want to use
			-- the legitimate extension on these files because one is source
			-- and one is flat, and diff tools need to see the same extension;
			-- also we don't want users to get confused about what kind of files
			-- these are

	File_ext_dadl: STRING = ".dadl"
			-- Default extension for dADL format files that don't have some other extension

	File_ext_xml_default: STRING = ".xml"
			-- Default extension for XML format archetype files that don't have some other extension

	File_ext_json_default: STRING = ".json"
			-- Default extension for JSON format archetype files that don't have some other extension

	File_ext_yaml_default: STRING = ".yaml"
			-- Default extension for YAML format archetype files that don't have some other extension

	Adl_versions: ARRAYED_LIST [STRING]
			-- list of ADL versions known in this tool
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("1.4")
			Result.extend ("1.4.1")
			Result.extend ("1.5")
		end

	Latest_adl_version: STRING
			-- return current latest known ADL version in this tool
		once
			Result := Adl_versions.last
		end

	archetype_term_keys: ARRAYED_LIST [STRING]
			-- set of 'key's of an ARCHETYPE_TERM, currently 'text' and 'description'
		once
			Result := (create {ARCHETYPE_TERM}.default_create).Keys
		end

	Archetype_lifecycle_states: ARRAYED_LIST [STRING]
			-- list of archetype authoring lifecycle states
			-- TODO: obtain from openEHR terminology
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("Initial")
			Result.extend ("Draft")
			Result.extend ("Review")
			Result.extend ("Approved")
			Result.extend ("Obsolete")
			Result.extend ("Superseded")
		end

	Unknown_value: STRING = "(Unknown)"

	c_object_constraint_types: HASH_TABLE [STRING, STRING]
			-- C_OBJECT meanings keyed by class-names (meanings are message tags to be converted to
			-- natural language via calls to get_text ())
		once
			create Result.make (0)
			Result.put ("c_type_complex_object", "C_COMPLEX_OBJECT")
			Result.put ("c_type_primitive_object", "C_PRIMITIVE_OBJECT")
			Result.put ("c_type_internal_reference", "ARCHETYPE_INTERNAL_REF")
			Result.put ("c_type_external_constraint_reference", "C_CONSTRAINT_REF")
			Result.put ("c_type_archetype_reference", "C_ARCHETYPE_ROOT")
			Result.put ("c_type_slot", "ARCHETYPE_SLOT")
			Result.put ("c_type_quantity", "C_DV_QUANTITY")
			Result.put ("c_type_ordinal", "C_DV_ORDINAL")
			Result.put ("c_type_code_phrase", "C_CODE_PHRASE")
		end

	occurrences_default_list: HASH_TABLE [MULTIPLICITY_INTERVAL, STRING]
		local
			mult_int: MULTIPLICITY_INTERVAL
		once
			create Result.make (0)
			create mult_int.make_optional
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_mandatory
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_prohibited
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_upper_unbounded (0)
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_upper_unbounded (1)
			Result.put (mult_int, mult_int.as_string)
		end

feature -- Comparison

	valid_adl_version (a_ver: attached STRING): BOOLEAN
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_string: not a_ver.is_empty
		local
			str: STRING
		do
			str := a_ver.twin
			str.prune_all ('.')
			Result := str.is_integer and a_ver.item(1) /= '.' and a_ver.item (a_ver.count) /= '.'
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
--| The Original Code is adl_node_control.e.
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
