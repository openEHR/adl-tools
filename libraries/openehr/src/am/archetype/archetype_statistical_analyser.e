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

inherit
	ARCHETYPE_STATISTICAL_DEFINITIONS

create
	make

feature -- Initialisation

	make (a_target_descriptor: ARCH_CAT_ARCHETYPE; in_differential_mode: BOOLEAN)
		do
			target_descriptor := a_target_descriptor
			if in_differential_mode then
				target := a_target_descriptor.differential_archetype
			else
				target := a_target_descriptor.flat_archetype
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
			create def_it.make (target.definition)
			def_it.do_all (agent node_enter, agent node_exit)

			-- finalise
			stats.compute_metrics
		end

feature {NONE} -- Implementation

	node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			stat_accum: RM_CLASS_STATISTICS
		do
			if attached {C_OBJECT} a_c_node as co then
				create stat_accum.make (co.rm_type_name, co.is_root)
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
				stats.add_rm_class_stats (stat_accum)
			end
		end

	node_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
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
