note
	component:   "openEHR re-usable library"
	description: "Concept of a constraint on a type"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_GENERIC_TYPE_REFERENCE

inherit
	BMM_TYPE_REFERENCE

feature -- Access (attributes from schema)

	root_type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	generic_parameters: ARRAYED_LIST [STRING]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- FIXME: currently the code below is limited to handling 1 level of generic parameter, i.e no further generics

feature -- Access (attributes derived in post-schema processing)

	root_type_def: BMM_CLASS_DEFINITION
			-- root type

	generic_parameter_defs: ARRAYED_LIST [BMM_TYPE_SPECIFIER]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- Note: can include repeats, e.g. HASH_TABLE [STRING, STRING] => HASH_TABLE, STRING, STRING
		do
			create Result.make(0)
			Result.compare_objects
			Result.extend (root_type)
			from generic_parameter_defs.start until generic_parameter_defs.off loop
				Result.append(generic_parameter_defs.item.flattened_type_list)
				generic_parameter_defs.forth
			end
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		local
			has_abstract_gen_parms: BOOLEAN
		do
			from generic_parameter_defs.start until generic_parameter_defs.off loop
				if not generic_parameter_defs.item.type_category.is_equal (Type_cat_concrete_class) then
					has_abstract_gen_parms := True
				end
				generic_parameter_defs.forth
			end
			if root_type_def.is_abstract and has_abstract_gen_parms then
				Result := Type_cat_abstract_class
			else
				Result := Type_cat_concrete_class
			end
		end

feature -- Commands

	finalise_build (a_bmmm: attached BMM_SCHEMA; a_class_def: attached BMM_CLASS_DEFINITION; a_prop_def: attached BMM_PROPERTY_DEFINITION; errors: ERROR_ACCUMULATOR)
		do
			if a_bmmm.has_class_definition(root_type) then
				root_type_def := a_bmmm.class_definition (root_type)
				create generic_parameter_defs.make (0)
				from generic_parameters.start until generic_parameters.off loop
					if a_bmmm.has_class_definition(generic_parameters.item) then
						generic_parameter_defs.extend(a_bmmm.class_definition(generic_parameters.item))
					elseif root_type_def.is_generic then
						if attached root_type_def.generic_parameter_defs then
							if root_type_def.generic_parameter_defs.has(generic_parameters.item) then
								generic_parameter_defs.extend(root_type_def.generic_parameter_defs.item (generic_parameters.item))
							else
								errors.add_error ("BMM_GPGPU", <<a_bmmm.schema_id, a_class_def.name, a_prop_def.name, root_type_def.name, generic_parameters.item>>, Void)
							end
						else
							errors.add_error ("BMM_GPGPM", <<a_bmmm.schema_id, root_type_def.name>>, Void)
						end
					else
						errors.add_error ("BMM_GPGPT", <<a_bmmm.schema_id, a_class_def.name, a_prop_def.name, generic_parameters.item>>, Void)
					end
					generic_parameters.forth
				end
			else
				errors.add_error ("BMM_GPRT", <<a_bmmm.schema_id, a_class_def.name, a_prop_def.name, root_type>>, Void)
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (root_type)
			Result.append_character (Generic_left_delim)
			from generic_parameter_defs.start until generic_parameter_defs.off loop
				Result.append(generic_parameter_defs.item.as_type_string)
				if not generic_parameter_defs.islast then
					Result.append_character(generic_separator)
				end
				generic_parameter_defs.forth
			end
			Result.append_character (Generic_right_delim)
		end

	as_flattened_type_string: STRING
			-- string form of the type for matching in archetypes - i.e. ignoring container type names
		do
			Result := as_type_string
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
