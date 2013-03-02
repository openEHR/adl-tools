note
	component:   "Basic meta-model"
	description: "Type reference that specifies containers with one generic parameter."
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class BMM_CONTAINER_TYPE_REFERENCE

inherit
	BMM_TYPE_REFERENCE
		redefine
			as_conformance_type_string
		end

create
	make

feature -- Initialisation

	make (a_type, a_container_type: BMM_CLASS_DEFINITION)
		do
			type := a_type
			container_type := a_container_type
		end

feature -- Access

	type: BMM_CLASS_DEFINITION
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER

	container_type: BMM_CLASS_DEFINITION
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE_SPECIFIER

	semantic_class: BMM_CLASS_DEFINITION
			-- the 'design' type of this type, ignoring containers, multiplicity etc.
		do
			Result := type
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make (0)
			Result.compare_objects
			Result.append (type.flattened_type_list)
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if type.is_abstract or container_type.is_abstract then
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
			cont_sub_type_list := container_type.type_substitutions
			if cont_sub_type_list.is_empty then
				cont_sub_type_list.extend (container_type.name)
			end

			item_sub_type_list := type.type_substitutions
			if item_sub_type_list.is_empty then
				item_sub_type_list.extend (type.name)
			end

			create Result.make (0)
			across cont_sub_type_list as cont_sub_types_csr loop
				across item_sub_type_list as item_sub_types_csr loop
					Result.extend (cont_sub_types_csr.item + generic_left_delim.out + item_sub_types_csr.item + generic_right_delim.out)
				end
			end
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		do
			Result := container_type.has_type_substitutions or type.has_type_substitutions
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			create Result.make_empty
			Result.append (container_type.name + Generic_left_delim.out + type.name + Generic_right_delim.out)
		end

	as_conformance_type_string: STRING
			-- name of the this type in form allowing other type to be conformance tested against it;
			-- Remove generic container type, i.e. 'List <ELEMENT>' becomes 'ELEMENT'
		do
			create Result.make_empty
			Result.append (type.name)
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
