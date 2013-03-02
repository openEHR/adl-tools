note
	component:   "Basic meta-model"
	description: "Definition concepts for the basic meta-model"
	keywords:    "basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class BMM_DEFINITIONS

inherit
	BASIC_DEFINITIONS

feature -- Software-dependent definitions

	Bmm_internal_version: STRING = "2.0"
			-- current notional version of the BMM_SCHEMA class model used in this software; used for
			-- comparison with the BMM version recorded in schema files. If no bmm_version attribute is
			-- found, the `Assumed_bmm_version' is used.

feature -- Definitions

	Ontological_path_separator: STRING = "/"

	Section_separator: CHARACTER = '-'
			-- separator between sections in an archetype identifier axis

	Schema_name_delimiter: STRING = "::"

	Package_name_delimiter: CHARACTER = '.'

	Generic_left_delim: CHARACTER = '<'

	Generic_right_delim: CHARACTER = '>'

	Generic_separator: CHARACTER = ','

	Generic_constraint_delimiter: CHARACTER = ':'
			-- appears between 'T' and constraining type if there is one

	Unknown_package_name: STRING = "(uninitialised)"

	Unknown_schema_id: STRING = "(uninitialised)"

	Unknown_schema_name: STRING = "(uninitialised)"

	Unknown_type_name: STRING = "UNKNOWN"

	Bmm_container_types: ARRAYED_LIST [STRING]
			-- built-in container types used to represent class-class 1:N relations
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("List")
			Result.extend ("Set")
			Result.extend ("Array")
		end

	Type_cat_primitive_class: STRING = "class_primitive"
	Type_cat_concrete_class: STRING = "class_concrete"
	Type_cat_concrete_class_supertype: STRING = "class_concrete_supertype"
	Type_cat_abstract_class: STRING = "class_abstract"
	Type_cat_generic_parameter: STRING = "generic_parameter"
	Type_cat_constrained_generic_parameter: STRING = "constrained_generic_parameter"

	Type_categories: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (Type_cat_primitive_class)
			Result.extend (Type_cat_concrete_class)
			Result.extend (Type_cat_abstract_class)
			Result.extend (Type_cat_generic_parameter)
			Result.extend (Type_cat_constrained_generic_parameter)
		end

	Bmm_file_match_regex: STRING = ".*\.bmm$"

	Schema_file_extension: STRING = ".bmm"

	Metadata_bmm_version: STRING = "bmm_version"
			-- dADL attribute name of logical attribute 'bmm_version' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	metadata_rm_publisher: STRING = "rm_publisher"
			-- dADL attribute name of logical attribute 'model_publisher' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	metadata_schema_name: STRING = "schema_name"
			-- dADL attribute name of logical attribute 'schema_name' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	metadata_rm_release: STRING = "rm_release"
			-- dADL attribute name of logical attribute 'model_release' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_revision: STRING = "schema_revision"
			-- dADL attribute name of logical attribute 'schema_revision' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_lifecycle_state: STRING = "schema_lifecycle_state"
			-- dADL attribute name of logical attribute 'schema_lifecycle_state' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_description: STRING = "schema_description"
			-- dADL attribute name of logical attribute 'schema_description' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_path: STRING = "schema_path"
			-- path of schema file

	Schema_fast_parse_attrs: ARRAY [STRING]
			-- attributes to retrieve for initial fast parse on schemas
		once
			Result := <<Metadata_bmm_version, Metadata_schema_revision, Metadata_schema_lifecycle_state, metadata_rm_publisher, metadata_schema_name, metadata_rm_release>>
		end

	Assumed_bmm_version: STRING = "1.0"
			-- version of BMM to assume for a schema that doesn't have the bmm_version attribute

feature -- Comparison

	valid_meta_data (a_meta_data: HASH_TABLE [STRING, STRING]): BOOLEAN
			-- True if `a_meta_data' is valid for creation of a SCHEMA_DESCRIPTOR
		do
			Result := attached a_meta_data.item (metadata_rm_publisher) and
				attached a_meta_data.item (metadata_schema_name) and
				attached a_meta_data.item (metadata_rm_release) and
				attached a_meta_data.item (Metadata_schema_path)
		end

	is_well_formed_type_name (a_type_name: STRING): BOOLEAN
			-- True if the type name has a valid form, either a single name or a well-formed generic
		require
			Valid_type_name: not a_type_name.is_empty
		do
			Result := well_formed_type_name_regex.recognizes (a_type_name)
		end

	is_well_formed_class_name (a_class_name: STRING): BOOLEAN
			-- True if the class name has a valid form
		require
			Valid_class_name: not a_class_name.is_empty
		do
			Result := well_formed_class_name_regex.recognizes (a_class_name)
		end

	is_well_formed_generic_type_name (a_type_name: STRING): BOOLEAN
			-- True if the type name is valid and includes a generic parameters part
		do
			Result := is_well_formed_type_name (a_type_name) and a_type_name.has (generic_left_delim)
		end

	bmm_version_compatible (schema_bmm_ver: STRING): BOOLEAN
			-- is the software version of the BMM (defined by the constant `Bmm_version', above)
			-- compatible with that found in the schema?
			-- Returns True if the two versions have the same major version number
		require
			Well_formed_version: schema_bmm_ver.occurrences ('.') = 1
		do
			Result := schema_bmm_ver.substring (1, schema_bmm_ver.index_of ('.', 1)-1).is_equal (Bmm_internal_version.substring (1, Bmm_internal_version.index_of ('.', 1)-1))
		end

feature -- Conversion

	create_schema_id (a_model_publisher, a_schema_name, a_model_release: STRING): STRING
			-- Derived name of schema in 3 part form model_publisher '_' a_schema_name '_' model_release.
			-- Any or all arguments can be Void or empty; for each missing element,
			-- result contains "unknown", e.g. "unknown_test_1.0"
			-- Result is lower case
		local
			mp, mn, mr: STRING
		do
			create Result.make(0)
			if a_model_publisher = Void or a_model_publisher.is_empty then
				mp := "unknown"
			else
				mp := a_model_publisher
			end
			if a_schema_name = Void or a_schema_name.is_empty then
				mn := "unknown"
			else
				mn := a_schema_name
			end
			if a_model_release = Void or a_model_release.is_empty then
				mr := "unknown"
			else
				mr := a_model_release
			end
			Result.append (mp + "_" + mn + "_" + mr)
			Result.to_lower
		ensure
			Result_not_empty: not Result.is_empty
		end

	package_base_name (a_package_name: STRING): STRING
			-- package name might be of form xxx.yyy.zzz ; we only want 'zzz'
		do
			if a_package_name.has (package_name_delimiter) then
				Result := a_package_name.split (Package_name_delimiter).last
			else
				Result := a_package_name
			end
		end

	publisher_qualified_rm_closure_key (a_rm_publisher, a_rm_closure_name: STRING): STRING
			-- lower-case form of `publisher_qualified_rm_closure_name'
		require
			Model_publisher_valid: not a_rm_publisher.is_empty
			Closure_name_valid: not a_rm_closure_name.is_empty
		do
			Result := publisher_qualified_rm_closure_name (a_rm_publisher, a_rm_closure_name).as_lower
		ensure
			Is_lower: Result.same_string (Result.as_lower)
		end

	publisher_qualified_rm_closure_name (a_rm_publisher, a_rm_closure_name: STRING): STRING
			-- mixed-case standard model-package name string, e.g. "openEHR-EHR" for UI display
			-- uses `package_base_name' to obtain terminal form of package name
		require
			Model_publisher_valid: not a_rm_publisher.is_empty
			Closure_name_valid: not a_rm_closure_name.is_empty
		do
			Result := a_rm_publisher + section_separator.out + package_base_name (a_rm_closure_name).as_upper
		end

	rm_closure_qualified_class_name (a_rm_closure_name, a_class_name: STRING): STRING
			-- generate a standard model-class name string, e.g. "ehr-observation" for use in finding RM schemas
		require
			Rm_closure_name_valid: not a_rm_closure_name.is_empty
			Class_name_valid: not a_class_name.is_empty
		do
			Result := a_rm_closure_name + section_separator.out + a_class_name
		end

	type_name_as_flat_list (a_type_name: STRING): ARRAYED_LIST [STRING]
			-- convert a type name to a flat set of strings
		require
			Valid_type_name: is_well_formed_type_name (a_type_name)
		local
			is_gen_type: BOOLEAN
			stype: STRING
			lpos, rpos: INTEGER
		do
			create Result.make(0)
			Result.compare_objects
			stype := a_type_name.twin
			stype.prune_all (' ')
			if stype.has (generic_left_delim) then
				rpos := stype.index_of (generic_left_delim, 1) - 1
				is_gen_type := True
			else
				rpos := stype.count
			end
			Result.extend (a_type_name.substring(1, rpos))

			if is_gen_type then
				stype.replace_substring_all (generic_left_delim.out, Generic_separator.out)
				stype.replace_substring_all (generic_right_delim.out, Generic_separator.out)
				from lpos := rpos + 2 until lpos > stype.count loop
					rpos := stype.index_of (Generic_separator, lpos) - 1
					Result.extend (stype.substring (lpos, rpos))
					lpos := rpos + 2
				end
			end
		ensure
			Result.object_comparison
		end

	type_name_root_type (a_type_name: STRING): STRING
			-- return the root type of `a_type_name', which is itself for non-generic types, or else
			-- the first type for generic types
		require
			Valid_type_name: is_well_formed_type_name (a_type_name)
		local
			delim_pos, i: INTEGER
		do
			delim_pos := a_type_name.index_of (generic_left_delim, 1)
			if delim_pos = 0 then
				Result := a_type_name
			else
				create Result.make(0)
				from i := 1 until a_type_name[i] = generic_left_delim or a_type_name[i] = ' ' loop
					Result.append_character (a_type_name[i])
					i := i + 1
				end
			end
		end

	type_to_class (a_type_name: STRING): STRING
			-- convert a type name which might have a generic part to a simple class name
		require
			Type_valid: not a_type_name.is_empty
		local
			gen_pos: INTEGER
		do
			gen_pos := a_type_name.substring_index (generic_left_delim.out, 1)
			if gen_pos > 0 then
				Result := a_type_name.substring (1, gen_pos-1)
				Result.right_adjust
				Result.to_upper
			else
				Result := a_type_name.as_upper
			end
		ensure
			Upper_case: Result ~ Result.as_upper
		end

feature {NONE} -- Implementation

	well_formed_type_name_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for well-formed type names down to two-levels of generic nesting
		once
			create Result.make
			Result.set_case_insensitive (True)

			--               |clname||<--------------------------------- optional generics ------------------------------------------------>|
			--                             |clname||<------ optional generics ----->|       |clname||<------ optional generics ----->|
			Result.compile ("[a-z]\w*( *< *[a-z]\w*( *< *[a-z]\w*( *, *[a-z]\w+)* *>)?( *, *[a-z]\w*( *< *[a-z]\w*( *, *[a-z]\w+)* *>)?)* *>)?")
		end

	well_formed_class_name_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for well-formed class names
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile ("[a-z]\w+")
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
