note
	component:   "openEHR re-usable library"
	description: "Persistent form of BMM_GENERIC_TYPE_REFERENCE"
	keywords:    "Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_BMM_GENERIC_TYPE_REFERENCE

inherit
	P_BMM_TYPE_REFERENCE

feature -- Access (attributes from schema)

	root_type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	generic_parameters: ARRAYED_LIST [STRING]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- FIXME: currently the code below is limited to handling only 1 level of generic parameter nesting

	bmm_generic_type_reference: BMM_GENERIC_TYPE_REFERENCE

feature -- Factory

	create_bmm_generic_type_reference (a_bmm_schema: BMM_SCHEMA)
		local
			a_root_class_def: BMM_CLASS_DEFINITION
		do
			a_root_class_def := a_bmm_schema.class_definition (root_type)
			create bmm_generic_type_reference.make (a_root_class_def)
			from generic_parameters.start until generic_parameters.off loop
				if a_bmm_schema.has_class_definition (generic_parameters.item) then -- it is a real class name
					bmm_generic_type_reference.add_generic_parameter (a_bmm_schema.class_definition (generic_parameters.item))
				else -- it is an open generic parameter like 'T', 'U' etc
					bmm_generic_type_reference.add_generic_parameter (a_root_class_def.generic_parameters.item (generic_parameters.item))
				end
				generic_parameters.forth
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (root_type)
			Result.append_character (Generic_left_delim)
			from generic_parameters.start until generic_parameters.off loop
				Result.append (generic_parameters.item)
				if not generic_parameters.islast then
					Result.append_character (generic_separator)
				end
				generic_parameters.forth
			end
			Result.append_character (Generic_right_delim)
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
