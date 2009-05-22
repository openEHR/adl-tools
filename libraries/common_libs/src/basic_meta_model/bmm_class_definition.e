note
	component:   "openEHR re-usable library"
	description: "[
				 Definition of a class in an object model. A class is type that may be open 
				 or closed in terms of other types mentioned within.
				 ]"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_CLASS_DEFINITION

inherit
	BMM_TYPE_SPECIFIER

	DT_CONVERTIBLE

feature -- Initialisation

	make_dt
			-- make in a safe way for DT building purposes
		do
			create properties.make (0)
			create ancestors.make (0)
		end

feature -- Access

	name: STRING
			-- name of the class

	generic_parameters: HASH_TABLE [BMM_GENERIC_PARAMETER_DEFINITION, STRING]
			-- list of generic parameter definitions
			-- FIXME: this won't function correctly unless ordering is guaranteed;
			-- use DS_HASH_TABLE - but not yet supported by DT_OBJECT_CONVERTER

	ancestors: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			-- list of immediate inheritance parents

	properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of attributes defined in this class

	flat_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- list of all attributes due to current and ancestor classes
		do
			if flat_properties_cache = Void then
				create flat_properties_cache.make(0)
				if ancestors /= Void then
					from
						ancestors.start
					until
						ancestors.off
					loop
						flat_properties_cache.merge (ancestors.item.flat_properties)
						if properties /= Void then
							flat_properties_cache.merge (properties)
						end
						ancestors.forth
					end
				end
			end
			Result := flat_properties_cache
		ensure
			Result_exists: Result /= Void
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
		do
			create Result.make(0)
			Result.extend (name)
			if is_generic then
				from
					generic_parameters.start
				until
					generic_parameters.off
				loop
					Result.append(generic_parameters.item_for_iteration.flattened_type_list)
					generic_parameters.forth
				end
			end
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type

	is_generic: BOOLEAN
			-- True if this class is a generic class

	has_property (a_prop_name: STRING): BOOLEAN
			-- True if a_prop_name valid in this type, due to this type definition, or any ancestor
		require
			Attr_name_valid: a_prop_name /= Void and then not a_prop_name.is_empty
		do
			Result := flat_properties.has (a_prop_name)
		end

	has_ancestor (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the ancestor classes
		require
			Class_name_valid: a_class_name /= Void and then not a_class_name.is_empty
		do
			if ancestors /= Void then
				from ancestors.start until ancestors.off or Result loop
					Result := ancestors.item.name.is_equal(a_class_name) or else ancestors.item.has_ancestor (a_class_name)
					ancestors.forth
				end
			end
		end

feature -- Commands

	dt_finalise
			-- synchronise structures after creation by DT deserialiser
		do
			-- connect attribute defs with parent attribute defs

			-- connect generic parm defs with defs in parent classes if any
			-- first find a direct ancestor that has generic parameters
			if is_generic and ancestors /= Void then
				from ancestors.start until ancestors.off or ancestors.item.is_generic loop
					ancestors.forth
				end
				if not ancestors.off then
					from generic_parameters.start until generic_parameters.off loop
						if ancestors.item.generic_parameters.has (generic_parameters.key_for_iteration) then
							generic_parameters.item_for_iteration.set_inheritance_precursor(ancestors.item.generic_parameters.item(generic_parameters.key_for_iteration))
						end
						generic_parameters.forth
					end
				end
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		local
			i: INTEGER
		do
			create Result.make(0)
			Result.append(name)
			if is_generic then
				Result.append_character (generic_left_delim)
				from
					generic_parameters.start
					i := 1
				until generic_parameters.off loop
					Result.append(generic_parameters.item_for_iteration.as_type_string)
					if i < generic_parameters.count then
						Result.append_character(generic_separator)
					end
					generic_parameters.forth
					i := i + 1
				end
				Result.append_character (generic_right_delim)
			end
		end

	as_flattened_type_string: STRING
			-- name of the type
		do
			Result := as_type_string
		end

feature {BMM_CLASS_DEFINITION} -- Implementation

	flat_properties_cache: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			-- reference list of all attributes due to inheritance flattening of this type

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
			-- FIXME: not in use, since no serialisatoin back out at this stage
		end

invariant
	Properties_exists: properties /= Void
	Ancestors_exists: ancestors /= Void
	Generic_validity: is_generic implies generic_parameters /= Void and then not generic_parameters.is_empty

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
