indexing
	component:   "openEHR Archetype Project"
	description: "Service interface to an object model access for types and attributes mentioned in archetypes"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class MODEL_ACCESS

feature {NONE} -- Initialisation

feature -- Access

	ancestor_types_of (a_type: STRING): ARRAYED_LIST [STRING] is
			-- return all ancestor types of `a_type' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: a_type /= Void and then has_type (a_type)
		do
			create Result.make(0)
			-- FIXME: TO BE IMPLEMENTED
		ensure
			Result_exists: Result /= Void
		end

feature -- Status Report

	model_loaded: BOOLEAN
			-- True if a model is available to interrogate

feature -- Validation

	is_sub_type_of (a_sub_type, a_parent_type: STRING): BOOLEAN is
			-- True if `a_subclass' is a sub-class in the model of `a_parent_type'
		require
			Sub_type_valid: a_sub_type /= Void and then has_type (a_sub_type)
			Parent_type_valid: a_parent_type /= Void and then has_type (a_parent_type)
		do
			-- FIXME: TO BE IMPLEMENTED
			Result := True
		end

	has_attribute (a_type, an_attribute: STRING): BOOLEAN is
			-- True if `a_type' has an attribute named `an_attribute'
		require
			Type_valid: a_type /= Void and then not a_type.is_empty
			Attribute_valid: an_attribute /= Void and then not an_attribute.is_empty
		do
			-- FIXME: TO BE IMPLEMENTED
			Result := True
		end

	has_type (a_type: STRING): BOOLEAN is
			-- True if `a_type' exists in the model
		require
			Type_valid: a_type /= Void and then not a_type.is_empty
		do
			-- FIXME: TO BE IMPLEMENTED
			Result := True
		end

feature -- Status Setting

feature -- Commands

feature -- Comparison

feature -- Modification

feature {NONE} -- Implementation

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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
