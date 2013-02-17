note
	component:   "openEHR re-usable library"
	description: "Persistent form of BMM_GENERIC_PARAMETER_DEFINITION"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class P_BMM_GENERIC_PARAMETER_DEFINITION

inherit
	P_BMM_TYPE_SPECIFIER

feature -- Access (attributes from schema)

	name: STRING
			-- name of the parameter, e.g. 'T' etc
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	conforms_to_type: detachable STRING
			-- optional conformance constraint
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	bmm_generic_parameter_definition: detachable BMM_GENERIC_PARAMETER_DEFINITION
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_generic_parameter_definition (a_bmm_schema: BMM_SCHEMA)
		do
			if attached conforms_to_type as conf_type and then attached a_bmm_schema.class_definition (conf_type) as class_def_conf_type then
				create bmm_generic_parameter_definition.make_constrained (name, class_def_conf_type, a_bmm_schema.any_class_definition)
			else
				create bmm_generic_parameter_definition.make (name, a_bmm_schema.any_class_definition)
			end
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
