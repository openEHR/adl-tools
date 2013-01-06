note
	component:   "openEHR Archetype Project"
	description: "Perform post compilation updates of the differential archetype AOM structure."
	keywords:    "constraint model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class AOM_POST_COMPILE_PROCESSOR

inherit
	ADL_SYNTAX_CONVERTER
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature {ADL15_ENGINE} -- Initialisation

	initialise (aca: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- set target
		require
			aca.is_valid
		do
			target_descriptor := aca
			rm_schema := an_rm_schema
			target := aca.differential_archetype
			target_flat := aca.flat_archetype
		end

feature -- Access

	target_descriptor: ARCH_CAT_ARCHETYPE

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being processed

	target_flat: FLAT_ARCHETYPE
		-- flat_parent of `target'

	rm_schema: BMM_SCHEMA

feature -- Commands

	execute
		do
			if target.has_invariants then
				update_assertions
			end
		end

feature {NONE} -- Implementation

	update_assertions
			-- update ASSERTION EXPR_ITEM_LEAF object reference nodes with proper type names
			-- obtained from the AOM objects pointed to
		require
			target.has_invariants
		local
			ref_rm_type_name, tail_path: STRING
			bmm_class: BMM_CLASS_DEFINITION
			bmm_prop: BMM_PROPERTY_DEFINITION
		do
			across target.invariants_index as ref_path_csr loop
				-- get a matching path from archetype - has to be there, either exact or partial
				if attached target_flat.matching_path (ref_path_csr.key) as arch_path then
					ref_rm_type_name := target_flat.c_object_at_path (arch_path).rm_type_name
					-- if it was a partial match, we have to obtain the real RM type by going into the RM
					if arch_path.count < ref_path_csr.key.count then
						tail_path := ref_path_csr.key.substring (arch_path.count+1, ref_path_csr.key.count)
						bmm_class := rm_schema.class_definition (ref_rm_type_name)
						bmm_prop := bmm_class.property_definition_at_path (create {OG_PATH}.make_from_string (tail_path))
						ref_rm_type_name := bmm_prop.type.root_class
					end
				end
				across ref_path_csr.item as expr_leaf_csr loop
					expr_leaf_csr.item.update_type (ref_rm_type_name)
				end
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
