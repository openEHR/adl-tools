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

create
	make, make_constrained

feature -- Initialisation

	make (a_name: STRING; any_type_def: BMM_CLASS_DEFINITION)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			any_class_definition := any_type_def
		end

	make_constrained (a_name: STRING; a_conforms_to_type: BMM_CLASS_DEFINITION)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			conforms_to_type := a_conforms_to_type
		end

feature -- Access (attributes from schema)

	name: STRING
			-- name of the parameter, e.g. 'T' etc

	conforms_to_type: detachable BMM_CLASS_DEFINITION
			-- optional conformance constraint derived from `conforms_to_type'

	inheritance_precursor: detachable BMM_GENERIC_PARAMETER_DEFINITION
			-- if set, is the corresponding generic parameter definition in an ancestor class

	semantic_class: BMM_CLASS_DEFINITION
			-- the 'design' class of this type, ignoring containers, multiplicity etc.
		do
			if is_constrained then
				Result := conforms_to_type
			else
				Result := any_class_definition
			end
		end

feature -- Access

	flattened_conforms_to_type: detachable BMM_CLASS_DEFINITION
			-- get any ultimate type conformance constraint on this generic parameter due to inheritance
		do
			if attached conforms_to_type then
				Result := conforms_to_type
			elseif attached inheritance_precursor then
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

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if is_constrained then
				Result := Type_cat_constrained_generic_parameter
			else
				Result := Type_cat_generic_parameter
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			if is_constrained then
				Result := conforms_to_type.type_substitutions
			else
				Result := any_class_definition.type_substitutions
			end
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN = True
			-- True if there are types subsitutable for this one according to the model

	is_constrained: BOOLEAN
			-- True if this generic parameter has a type constraint
		do
			Result := attached flattened_conforms_to_type
		end

feature -- Modification

	set_inheritance_precursor (a_gen_parm_def: attached BMM_GENERIC_PARAMETER_DEFINITION)
			-- set `inheritance_precursor'
		do
			inheritance_precursor := a_gen_parm_def
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make_empty
			Result.append (name)
			if is_constrained then
				Result.append_character (Generic_constraint_delimiter)
				Result.append_character (' ')
				Result.append (flattened_conforms_to_type.as_type_string)
			end
		end

	as_flattened_type_string: STRING
		do
			Result := as_type_string
		end

feature {NONE} -- Implementation

	any_class_definition: BMM_CLASS_DEFINITION

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
