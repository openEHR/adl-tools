note
	component:   "Basic meta-model"
	description: "Abstract idea of specifying a type either by definition or by reference."
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

deferred class BMM_TYPE_SPECIFIER

inherit
	BMM_MODEL_ELEMENT

feature -- Access

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
		deferred
		end

	root_class: STRING
			-- root class of type
		do
			Result := flattened_type_list.first
		end

	semantic_class: BMM_CLASS_DEFINITION
			-- main design class for this type, from which properties etc can be extracted
		deferred
		end

	type_category: STRING
			-- generate a type category of main target type from Type_category_xx values
		deferred
		end

	type_substitutions: ARRAYED_SET [STRING]
		deferred
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		deferred
		end

feature -- Output

	as_type_string: STRING
			-- formal string form of the type
		deferred
		end

	as_display_type_string: STRING
			-- name of the type; if constrained, in the form "T: CONSTRAINER_TYPE"
		do
			Result := as_type_string
		end

	as_conformance_type_string: STRING
			-- name of the this type in form allowing other type to be conformance tested against it;
			-- if constrained, then return the constrainer type, else just return Any
		do
			Result := as_type_string
		end

invariant
	type_category_valid: Type_categories.has (type_category)

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
--| The Original Code is bmm_type_specifier.e.
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
