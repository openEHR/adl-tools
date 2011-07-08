note
	component:   "openEHR re-usable library"
	description: "Subtype of BMM_GENERIC_TYPE_SPECIFIER that specifies containers with one generic parameter."
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_CONTAINER_TYPE_REFERENCE

inherit
	BMM_TYPE_REFERENCE

feature -- Access (attributes from schema)

	type: STRING
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	container_type: STRING
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access (attributes derived in post-schema processing)

	type_def: BMM_CLASS_DEFINITION
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER

	container_type_def: BMM_CLASS_DEFINITION
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE_SPECIFIER

feature -- Access

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make(0)
			Result.compare_objects
			Result.append (type_def.flattened_type_list)
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if type_def.is_abstract or container_type_def.is_abstract then
				Result := Type_cat_abstract_class
			elseif has_type_substitutions then
				Result := Type_cat_concrete_class_supertype
			else
				Result := Type_cat_concrete_class
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		local
			cont_sub_type_list, item_sub_type_list: ARRAYED_LIST [STRING]
		do
			cont_sub_type_list := container_type_def.type_substitutions
			if cont_sub_type_list.is_empty then
				cont_sub_type_list.extend (container_type_def.name)
			end

			item_sub_type_list := type_def.type_substitutions
			if item_sub_type_list.is_empty then
				item_sub_type_list.extend (type_def.name)
			end

			create Result.make (0)
			from cont_sub_type_list.start until cont_sub_type_list.off loop
				from item_sub_type_list.start until item_sub_type_list.off loop
					Result.extend (cont_sub_type_list.item + generic_left_delim.out + item_sub_type_list.item + generic_right_delim.out)
					item_sub_type_list.forth
				end
				cont_sub_type_list.forth
			end
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		do
			Result := container_type_def.has_type_substitutions or type_def.has_type_substitutions
		end

feature -- Conversion

	as_generic_type_specifier: BMM_GENERIC_TYPE_REFERENCE
		do
			-- create Result.make(container_type, <<type>>)
		end

feature -- Commands

	finalise_build (a_bmmm: attached BMM_SCHEMA; a_class_def: attached BMM_CLASS_DEFINITION; a_prop_def: attached BMM_PROPERTY_DEFINITION; errors: ERROR_ACCUMULATOR)
		do
			bmm_model := a_bmmm
			if bmm_model.has_class_definition(type) then
				type_def := bmm_model.class_definition (type)
				if bmm_model.has_class_definition(container_type) then
					container_type_def := bmm_model.class_definition (container_type)
				else
					errors.add_error ("BMM_CPCT", <<bmm_model.schema_id, a_class_def.name, a_prop_def.name, container_type>>, Void)
				end
			else
				errors.add_error ("BMM_CPTV", <<bmm_model.schema_id, a_class_def.name, a_prop_def.name, type>>, Void)
			end
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			create Result.make (0)
			Result.append (container_type + Generic_left_delim.out + type + Generic_right_delim.out)
		end

	as_flattened_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (type_def.as_type_string)
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
