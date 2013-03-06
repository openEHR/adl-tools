note
	component:   "openEHR Archetype Project"
	description: "Statistical analyser for archetypes."
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ARCHETYPE_STATISTICAL_ANALYSER

inherit
	ARCHETYPE_STATISTICAL_DEFINITIONS

create
	make

feature -- Initialisation

	make (a_target_descriptor: ARCH_CAT_ARCHETYPE; in_differential_mode: BOOLEAN)
		require
			a_target_descriptor.is_valid
		do
			target_descriptor := a_target_descriptor
			check attached a_target_descriptor.differential_archetype as diff_arch and attached a_target_descriptor.flat_archetype as flat_arch then
				if in_differential_mode then
					target := diff_arch
				else
					target := flat_arch
				end
			end
			create stats.make (target_descriptor.rm_schema)
		end

feature -- Access

	target_descriptor: ARCH_CAT_ARCHETYPE
			-- target descriptor

	target: ARCHETYPE
			-- differential archetype

	stats: ARCHETYPE_STATISTICAL_REPORT

feature -- Commands

	analyse
		local
			def_it: C_ITERATOR
		do
			-- add archetype-level counts
			stats.increment_archetype_metric (target.ontology.term_codes.count, At_code_count)
			stats.increment_archetype_metric (target.ontology.constraint_codes.count, Ac_code_count)
			if not target.ontology.term_bindings.is_empty then
				from target.ontology.term_bindings.start until target.ontology.term_bindings.off loop
					stats.increment_archetype_metric (target.ontology.term_bindings.item_for_iteration.count, At_code_bindings_count)
					target.ontology.term_bindings.forth
				end
			end
			if not target.ontology.constraint_bindings.is_empty then
				from target.ontology.constraint_bindings.start until target.ontology.constraint_bindings.off loop
					stats.increment_archetype_metric (target.ontology.constraint_bindings.item_for_iteration.count, Ac_code_bindings_count)
					target.ontology.constraint_bindings.forth
				end
			end

			-- add node-level counts
			total_node_count := 0
			locatable_node_count := 0
			data_value_node_count := 0

			create def_it.make (target.definition)
			def_it.do_all (agent node_enter, agent node_exit)

			stats.archetype_metrics.item (Object_node_count).update (total_node_count)
			stats.archetype_metrics.item (Archetypable_node_count).update (locatable_node_count)
			stats.archetype_metrics.item (Archetype_data_value_node_count).update (data_value_node_count)
		end

feature {NONE} -- Implementation

	node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			stat_accums: ARRAYED_LIST [RM_CLASS_STATISTICS]
			a_class_stat_accum, an_attr_stat_accum: RM_CLASS_STATISTICS
			apa: ARCHETYPE_PATH_ANALYSER
			flat_parent: FLAT_ARCHETYPE
			ca: C_ATTRIBUTE
		do
			if attached {C_OBJECT} a_c_node as co then
				-- capture total node count
				total_node_count := total_node_count + 1

				-- capture LOCATABLE node count
				if attached target_descriptor.rm_schema.archetype_parent_class as apc and then
					target_descriptor.rm_schema.is_descendant_of (co.rm_type_name, apc)
				then
					locatable_node_count := locatable_node_count + 1
				elseif attached target_descriptor.rm_schema.archetype_data_value_parent_class as dvpc and then
					target_descriptor.rm_schema.is_descendant_of (co.rm_type_name, dvpc)
				then
					data_value_node_count := data_value_node_count + 1
				end

				-- capture node specific info
				create stat_accums.make (0)
				create a_class_stat_accum.make (co.rm_type_name, co.is_root)
				stat_accums.extend (a_class_stat_accum)
				if attached {C_COMPLEX_OBJECT} co as cco then
					from cco.attributes.start until cco.attributes.off loop
						ca := cco.attributes.item
						if not ca.has_differential_path then
							a_class_stat_accum.add_rm_attribute_occurrence (ca.rm_attribute_name)
						else
							-- this is the case of constraint at a path, as found in specialised archetypes -
							-- it is an attribute for a different RM object type
							create apa.make_from_string (ca.rm_attribute_path)
							flat_parent := target_descriptor.specialisation_parent.flat_archetype
							if attached {C_ATTRIBUTE} flat_parent.definition.c_attribute_at_path (apa.path_at_level (flat_parent.specialisation_depth)) as ca_parent_flat then
								create an_attr_stat_accum.make (ca_parent_flat.parent.rm_type_name, ca_parent_flat.parent.is_root)
								an_attr_stat_accum.add_rm_attribute_occurrence (ca_parent_flat.rm_attribute_name)
								stat_accums.extend (an_attr_stat_accum)
							end
						end
						cco.attributes.forth
					end
				elseif attached {C_DOMAIN_TYPE} co as cdt then
					a_class_stat_accum.add_rm_attribute_occurrences (cdt.constrained_rm_attributes)
				end
				stat_accums.do_all (agent (a_stat_accum: RM_CLASS_STATISTICS) do stats.add_rm_class_stats (a_stat_accum) end)
			end
		end

	node_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

	total_node_count: INTEGER
			-- count of nodes in this archetype

	locatable_node_count: INTEGER
			-- count of nodes inheriting from bmm_schema.archetype_parent_class (e.g. LOCATABLE)

	data_value_node_count: INTEGER
			-- count of nodes inheriting from bmm_schema.archetype_data_value_parent_class (e.g. DATA_VALUE)
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
