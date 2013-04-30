note
	component:   "Basic meta-model"
	description: "[
				 Subtype of BMM_PROPERTY_DEFINITION that represents a container type based on one of the 
				 inbuilt types List <>, Set <>, Array <>.
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class BMM_CONTAINER_PROPERTY

inherit
	BMM_PROPERTY_DEFINITION
		redefine
			type, make, display_name
		end

create
	make

feature -- Initialisation

	make (a_name: STRING; a_type: like type; is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag: BOOLEAN)
		do
			precursor (a_name, a_type, is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag)
			create cardinality.make_open
		end

feature -- Access

	display_name: STRING
			-- name of this attribute to display in screen form, grid etc
		do
			Result := name.twin
			Result.append (": " + type.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
		end

	cardinality: detachable MULTIPLICITY_INTERVAL

	type: BMM_CONTAINER_TYPE_REFERENCE
			-- type of the contained type

feature -- Modification

	set_cardinality (a_cardinality: MULTIPLICITY_INTERVAL)
		do
			cardinality := a_cardinality
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
--| The Original Code is bmm_container_attribute_definition.e.
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
