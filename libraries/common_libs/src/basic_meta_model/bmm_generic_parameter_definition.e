note
	component:   "openEHR re-usable library"
	description: "[
				 Definition of a generic parameter in a class definition of a generic type.
				 ]"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_GENERIC_PARAMETER_DEFINITION

inherit
	BMM_TYPE_SPECIFIER

feature -- Access

	name: STRING
			-- name of the parameter, e.g. 'T' etc

	conforms_to_type: BMM_CLASS_DEFINITION
			-- optional conformance constraint

	flattened_conforms_to_type: BMM_CLASS_DEFINITION
			-- get any ultimate type conformance constraint on this generic parameter due to inheritance
		do
			if conforms_to_type /= Void then
				Result := conforms_to_type
			elseif inheritance_precursor /= Void then
				Result := inheritance_precursor.flattened_conforms_to_type
			end
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we output "ANY" if there is no constraint
		do
			create Result.make(0)
			Result.compare_objects
			if not is_constrained then
				Result.extend (Any_type)
			else
				Result.append (flattened_conforms_to_type.flattened_type_list)
			end
		end

	inheritance_precursor: BMM_GENERIC_PARAMETER_DEFINITION
			-- if set, is the corresponding generic parameter definition in an ancestor class

feature -- Status Report

	is_constrained: BOOLEAN
			-- True if this generic parameter has a type constraint
		do
			Result := flattened_conforms_to_type /= Void
		end

feature -- Modification

	set_inheritance_precursor (a_gen_parm_def: BMM_GENERIC_PARAMETER_DEFINITION)
			-- set `inheritance_precursor'
		require
			a_gen_parm_def /= Void
		do
			inheritance_precursor := a_gen_parm_def
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make(0)
			Result.append(name)
			if is_constrained then
				Result.append_character(Generic_constraint_delimiter)
				Result.append(conforms_to_type.as_type_string)
			end
		end

	as_flattened_type_string: STRING
			-- string form of the type for matching in archetypes - i.e. ignoring container type names
		do
			Result := as_type_string
		end

feature {NONE} -- Implementation

	owning_class: BMM_CLASS_DEFINITION

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
--| The Original Code is bmm_generic_type_definition.e.
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
