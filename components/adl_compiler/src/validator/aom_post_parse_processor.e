note
	component:   "openEHR Archetype Project"
	description: "Perform post parse construction of the AOM structure."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class AOM_POST_PARSE_PROCESSOR

inherit
	ADL_SYNTAX_CONVERTER
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature {ADL15_ENGINE} -- Initialisation

	initialise (ara: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA)
			-- set target_descriptor
			-- initialise reporting variables
		do
			rm_schema := an_rm_schema
			target_descriptor := ara
			target := ara.differential_archetype
			if ara.is_specialised then
				arch_parent_flat := target_descriptor.specialisation_parent.flat_archetype
			end
		ensure
			target_descriptor_set: target_descriptor = ara
			target_set: attached target
		end

feature -- Access

	target_descriptor: ARCH_CAT_ARCHETYPE
			-- differential archetype being validated

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being processed

	arch_parent_flat: detachable FLAT_ARCHETYPE

	rm_schema: BMM_SCHEMA

feature -- Commands

	execute
		do
			update_constraint_refs
		end

feature {NONE} -- Implementation

	update_constraint_refs
			-- populate CONSTRAINT_REF rm_type_name
		local
			bmm_prop_def: BMM_PROPERTY_DEFINITION
			proximal_ca: C_ATTRIBUTE
			proximal_co: C_COMPLEX_OBJECT
			apa: ARCHETYPE_PATH_ANALYSER
		do
			across target.accodes_index as ac_codes_csr loop
				across ac_codes_csr.item as cref_list_csr loop
					proximal_ca := cref_list_csr.item.parent
					if proximal_ca.has_differential_path then
						create apa.make_from_string (proximal_ca.differential_path)
						if attached {C_COMPLEX_OBJECT} arch_parent_flat.c_object_at_path (apa.path_at_level (arch_parent_flat.specialisation_depth)) as cco then
							proximal_co := cco
						end
					else
						proximal_co := proximal_ca.parent
					end
					bmm_prop_def := rm_schema.property_definition (proximal_co.rm_type_name, proximal_ca.rm_attribute_name)
					cref_list_csr.item.set_rm_type_name (bmm_prop_def.type.root_class)
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
