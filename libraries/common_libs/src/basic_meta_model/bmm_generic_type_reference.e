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

feature -- Initialisation

feature -- Access

	root_type: BMM_CLASS_DEFINITION
			-- optional type to which this paramter conforms

	generic_parameters: ARRAYED_LIST [BMM_TYPE_SPECIFIER]
			-- generic parameters of the root_type in this type specifier

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- Note: can include repeats, e.g. HASH_TABLE [STRING, STRING] => HASH_TABLE, STRING, STRING
		do
			create Result.make(0)
			Result.compare_objects
			Result.extend (root_type.name)
			from
				generic_parameters.start
			until
				generic_parameters.off
			loop
				Result.append(generic_parameters.item.flattened_type_list)
				generic_parameters.forth
			end
		end

feature -- Status Report

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (root_type.name)
			Result.append_character (Generic_left_delim)
			from
				generic_parameters.start
			until
				generic_parameters.off
			loop
				Result.append(generic_parameters.item.as_type_string)
				if not generic_parameters.islast then
					Result.append_character(generic_separator)
				end
				generic_parameters.forth
			end
			Result.append_character (Generic_right_delim)
		end

	as_flattened_type_string: STRING
			-- string form of the type for matching in archetypes - i.e. ignoring container type names
		do
			Result := as_type_string
		end

invariant
	Root_type_exists: root_type /= Void
	Generic_parameters_valid: generic_parameters /= Void

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
