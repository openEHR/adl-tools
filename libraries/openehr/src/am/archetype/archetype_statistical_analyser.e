note
	component:   "openEHR Archetype Project"
	description: "Statistical analyser for archetypes."
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_STATISTICAL_ANALYSER

create
	make

feature -- Definitions

	Object_node_count: STRING = "object_node_count"

	Archetypable_node_count: STRING = "archetypable_node_count"

	Archetype_data_value_node_count: STRING = "archetype_data_value_node_count"

	At_code_count: STRING = "at_code_count"

	Ac_code_count: STRING = "ac_code_count"

	At_code_bindings_count: STRING = "At_code_bindings_count"

	Ac_code_bindings_count: STRING = "Ac_code_bindings_count"

	Summed_result_metric_names: ARRAY [STRING]
		once
			Result := <<Object_node_count, Archetypable_node_count, Archetype_data_value_node_count, At_code_count, Ac_code_count, At_code_bindings_count, Ac_code_bindings_count>>
		end

feature -- Initialisation

	make (a_target_descriptor: ARCH_CAT_ARCHETYPE)
		do
			target_descriptor := a_target_descriptor
			target := a_target_descriptor.differential_archetype
			bmm_schema := target_descriptor.rm_schema
			reset
		end

feature -- Access

	target_descriptor: ARCH_CAT_ARCHETYPE
			-- target descriptor

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype

	rm_class_table: HASH_TABLE [RM_CLASS_STATISTICS, STRING]
			-- counts of all RM classes

	summed_results: HASH_TABLE [INTEGER, STRING]
			-- table of summed values, keyed by meaning, suitable for direct display

feature -- Commands

	analyse
		local
			def_it: C_ITERATOR
		do
			reset
			create def_it.make (target.definition)
			def_it.do_until_surface (agent node_enter, agent node_test)
			finalise_summation
		end

feature {NONE} -- Implementation

	bmm_schema: BMM_SCHEMA

	reset
		do
			create rm_class_table.make (0)
			create summed_results.make (0)
			Summed_result_metric_names.do_all (
				agent (metric_name: STRING)
					do
						summed_results.put (0, metric_name)
					end
			)
		end

	node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			stat_accum: RM_CLASS_STATISTICS
		do
			if attached {C_OBJECT} a_c_node as co then
				create stat_accum.make (co.rm_type_name)
				if attached {C_COMPLEX_OBJECT} co as cco then
					cco.attributes.do_all (
						agent (ca: C_ATTRIBUTE; a_stat_accum: RM_CLASS_STATISTICS)
							do
								a_stat_accum.add_rm_attribute_occurrence (ca.rm_attribute_name)
							end (?, stat_accum)
					)
				elseif attached {C_DOMAIN_TYPE} co as cdt then
					stat_accum.add_rm_attribute_occurrences (cdt.report_rm_attributes)
				end
				add_rm_class_stats (stat_accum)
			end
		end

	add_rm_class_stats (a_stat_accum: RM_CLASS_STATISTICS)
		do
			if rm_class_table.has (a_stat_accum.rm_class_name) then
				rm_class_table.item (a_stat_accum.rm_class_name).merge (a_stat_accum)
			else
				rm_class_table.put (a_stat_accum, a_stat_accum.rm_class_name)
			end
		end

	finalise_summation
		do
			from rm_class_table.start until rm_class_table.off loop
				summed_results.force (summed_results.item (Object_node_count) + rm_class_table.item_for_iteration.rm_class_count, Object_node_count)
				if bmm_schema.is_descendant_of (rm_class_table.item_for_iteration.rm_class_name, bmm_schema.archetype_parent_class) then
					summed_results.force (summed_results.item (Archetypable_node_count) + rm_class_table.item_for_iteration.rm_class_count, Archetypable_node_count)
				end
				if bmm_schema.is_descendant_of (rm_class_table.item_for_iteration.rm_class_name, bmm_schema.archetype_data_value_parent_class) then
					summed_results.force (summed_results.item (Archetype_data_value_node_count) + rm_class_table.item_for_iteration.rm_class_count, Archetype_data_value_node_count)
				end
				rm_class_table.forth
			end
			summed_results.force (target.ontology.term_codes.count, At_code_count)
			summed_results.force (target.ontology.constraint_codes.count, Ac_code_count)
			if not target.ontology.term_bindings.is_empty then
				summed_results.force (target.ontology.term_bindings.iteration_item (0).count, At_code_bindings_count)
			end
			if not target.ontology.constraint_bindings.is_empty then
				summed_results.force (target.ontology.constraint_bindings.iteration_item (0).count, Ac_code_bindings_count)
			end
		end

	node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
		do
			Result := True
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
--| The Original Code is archetype_phase_2_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007-2011
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
