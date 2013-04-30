note
	component:   "openEHR re-usable library"
	description: "Persistent form of BMM_GENERIC_TYPE_REFERENCE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class P_BMM_GENERIC_TYPE_REFERENCE

inherit
	P_BMM_TYPE_REFERENCE

feature -- Access (attributes from schema)

	root_type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	generic_parameters: ARRAYED_LIST [STRING]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- FIXME: currently the code below is limited to handling only 1 level of generic parameter nesting
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	bmm_generic_type_reference: detachable BMM_GENERIC_TYPE_REFERENCE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_generic_type_reference (a_bmm_schema: BMM_SCHEMA)
		local
			new_bmm_generic_type_reference: BMM_GENERIC_TYPE_REFERENCE
		do
			if attached a_bmm_schema.class_definition (root_type) as a_root_class_def then
				create new_bmm_generic_type_reference.make (a_root_class_def)
				bmm_generic_type_reference := new_bmm_generic_type_reference
				across generic_parameters as gen_parms_csr loop
					-- if it is a real class name
					if a_bmm_schema.has_class_definition (gen_parms_csr.item) and attached a_bmm_schema.class_definition (gen_parms_csr.item) as gen_class_def then
						new_bmm_generic_type_reference.add_generic_parameter (gen_class_def)

					-- else it is an open generic parameter like 'T', 'U' etc
					elseif attached a_root_class_def.generic_parameters.item (gen_parms_csr.item) as gen_parm_def then
						new_bmm_generic_type_reference.add_generic_parameter (gen_parm_def)
					end
				end
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
