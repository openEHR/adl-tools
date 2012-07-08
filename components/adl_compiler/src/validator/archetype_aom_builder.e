note
	component:   "openEHR Archetype Project"
	description: "Perform post parse construction of the AOM structure."
	keywords:    "constraint model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_AOM_BUILDER

inherit
	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

feature {ADL15_ENGINE} -- Initialisation

	initialise (an_archetype: ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- set target
		do
			rm_schema := an_rm_schema
			target := an_archetype
		ensure
			target_set: attached target
		end

feature -- Access

	target: ARCHETYPE
			-- differential archetype being processed

	rm_schema: BMM_SCHEMA

feature -- Commands

	execute
		local
			bmm_prop_def: BMM_PROPERTY_DEFINITION
			cref_list: ARRAYED_LIST [CONSTRAINT_REF]
		do
			-- populate CONSTRAINT_REF rm_type_name
			from target.accodes_index.start until target.accodes_index.off loop
				cref_list := target.accodes_index.item_for_iteration
				from cref_list.start until cref_list.off loop
					bmm_prop_def := rm_schema.property_definition (cref_list.item.parent.parent.rm_type_name, cref_list.item.parent.rm_attribute_name)
					cref_list.item.set_rm_type_name (bmm_prop_def.type.root_class)
					cref_list.forth
				end
				target.accodes_index.forth
			end
		end

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
--| The Original Code is archetype_aom_builder.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
