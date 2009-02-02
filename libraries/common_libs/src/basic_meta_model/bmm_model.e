indexing
	component:   "openEHR re-usable library"
	description: "Basic Meta-model model abstraction"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_MODEL

inherit
	DT_CONVERTIBLE

feature -- Initialisation

	make_dt is
			-- make in a safe way for DT building purposes
		local
			x: BMM_SINGLE_ATTRIBUTE
			y: BMM_MULTIPLE_ATTRIBUTE
			z: BMM_SINGLE_CONSTRAINED_ATTRIBUTE
			w: BMM_MULTIPLE_CONSTRAINED_ATTRIBUTE
		do

		end

feature -- Access

	model_name: STRING
			-- name of the model

	model_release: STRING
			-- release identifier of the model

	primitive_types: HASH_TABLE [BMM_PRIMITIVE_TYPE, STRING]
			-- types like Integer, Boolean etc

	class_definitions: HASH_TABLE [BMM_CLASS, STRING]
			-- constructed classes

	type_definition (a_type_name: STRING): BMM_TYPE is
			-- retrieve the type definition for `a_type_name' from either `primitive_types' or `classes'
		require
			Type_name_valid: a_type_name /= Void and then has_type(a_type_name)
		do
			if primitive_types.has (a_type_name) then
				Result := primitive_types.item (a_type_name)
			else
				Result := class_definitions.item (a_type_name)
			end
		ensure
			Result_exists: Result /= Void
		end

feature -- Status Report

	has_type (a_type_name: STRING): BOOLEAN is
			-- True if the type `a_type_name' is know in either `primitive_types' or `classes'
		require
			Type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			Result := primitive_types.has (a_type_name) or class_definitions.has (a_type_name)
		end

	is_sub_type_of (a_sub_type, a_parent_type: STRING): BOOLEAN is
			-- True if `a_subclass' is a sub-class in the model of `a_parent_type'
		require
			Sub_type_valid: a_sub_type /= Void not a_sub_type.is_empty
			Parent_type_valid: a_parent_type /= Void and then has_type (a_parent_type)
		do
			Result := True
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING] is
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
