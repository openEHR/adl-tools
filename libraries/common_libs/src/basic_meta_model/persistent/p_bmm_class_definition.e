note
	component:   "openEHR re-usable library"
	description: "Definition of dADL persistent form of an instance of BMM_CLASS_DEFINITION"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class P_BMM_CLASS_DEFINITION

inherit
	P_BMM_TYPE_SPECIFIER

	DT_CONVERTIBLE

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
		do
			create ancestors.make (0)
			ancestors.compare_objects
		end

feature -- Access

	uid: INTEGER
			-- unique id generated for later comparison during merging, in order to detect if two classes are the same
			-- Assigned in post-load processing

	name: STRING
			-- name of the class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

	generic_parameter_defs: detachable HASH_TABLE [P_BMM_GENERIC_PARAMETER_DEFINITION, STRING]
			-- list of generic parameter definitions
			-- FIXME: this won't function correctly unless ordering is guaranteed;
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	ancestors: ARRAYED_LIST [STRING]
			-- list of immediate inheritance parents FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	properties: HASH_TABLE [P_BMM_PROPERTY_DEFINITION, STRING]
			-- list of attributes defined in this class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Access

	source_schema_id: STRING
			-- reference to original source schema defining this class
		attribute
			create Result.make_from_string (Unknown_schema_id)
		end

	bmm_class_definition: detachable BMM_CLASS_DEFINITION
		note
			option: transient
		attribute
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_generic: BOOLEAN
			-- True if this class is a generic class
		do
			Result := attached generic_parameter_defs
		end

	is_override: BOOLEAN
			-- True if this class definition overrides one found in an included schema

feature -- Modification

	set_uid (val: INTEGER)
		do
			uid := val
		end

	set_is_override
			-- set `is_override'
		do
			is_override := True
		end

	set_source_schema_id (an_id: STRING)
			-- set source schema id
		do
			source_schema_id := an_id
		end

feature -- Factory

	create_bmm_class_definition
			-- add remaining model elements from `' to `bmm_class_definition'
		do
			create bmm_class_definition.make (name, is_abstract)
			bmm_class_definition.set_source_schema_id (source_schema_id)
		end

	populate_bmm_class_definition (a_bmm_schema: BMM_SCHEMA)
			-- add remaining model elements from `' to `bmm_class_definition'
		do
			if attached bmm_class_definition as bmm_class_def then
				-- populate references to ancestor classes; should be every class except Any
				if attached ancestors then
					across ancestors as ancs_csr loop
						if attached a_bmm_schema.class_definition (ancs_csr.item) as class_def then
							bmm_class_def.add_ancestor (class_def)
						end
					end
				end

				-- create generic parameters
				if attached generic_parameter_defs then
					across generic_parameter_defs as gen_parm_defs_csr loop
						gen_parm_defs_csr.item.create_bmm_generic_parameter_definition (a_bmm_schema)
						if attached gen_parm_defs_csr.item.bmm_generic_parameter_definition as bm_gen_parm_def then
							bmm_class_def.add_generic_parameter (bm_gen_parm_def)
						end
					end
				end

				-- populate properties
				across properties as props_csr loop
					props_csr.item.create_bmm_property_definition (a_bmm_schema, bmm_class_def)
					if attached props_csr.item.bmm_property_definition as bmm_prop_def then
						bmm_class_def.add_property (bmm_prop_def)
					end
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
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
--| The Original Code is bmm_model.e.
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
