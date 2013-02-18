note
	component:   "openEHR Archetype Project"
	description: "Statistical report data container for archetypes."
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_STATISTICAL_REPORT

inherit
	ARCHETYPE_STATISTICAL_DEFINITIONS

create
	make

feature -- Initialisation

	make (a_bmm_schema: BMM_SCHEMA)
		do
			bmm_schema :=  a_bmm_schema
			create archetype_metrics.make (0)
			Archetype_metric_names.do_all (
				agent (metric_name: STRING)
					do
						archetype_metrics.put (create {STATISTICAL_DATUM}.make (metric_name), metric_name)
					end
			)

			-- set up the RM class breakdown tables according to major base class groups, found in BMM_SCHEMA. If
			-- no 'LOCATABLE' or equivalent class declared, create a default table. Additionally create a
			-- primitive types table (for nodes that archetype RM types like String, Integer etc), since this can
			-- always be detected
			create rm_grouped_class_table.make (0)
			create default_rm_class_table.make (0)
			if bmm_schema.has_archetype_parent_class then
				rm_grouped_class_table.put (default_rm_class_table, bmm_schema.archetype_parent_class)
			else
				rm_grouped_class_table.put (default_rm_class_table, "Any")
			end
			if bmm_schema.has_archetype_data_value_parent_class then
				rm_grouped_class_table.put (create {HASH_TABLE [RM_CLASS_STATISTICS, STRING]}.make(0), bmm_schema.archetype_data_value_parent_class)
			end
			rm_grouped_class_table.put (create {HASH_TABLE [RM_CLASS_STATISTICS, STRING]}.make(0), Rm_primitive_group_key)
		end

feature -- Access

	archetype_metrics: HASH_TABLE [STATISTICAL_DATUM, STRING]
			-- other archetype metrics (not relating to RM), keyed by metric name

	rm_grouped_class_table: HASH_TABLE [HASH_TABLE [RM_CLASS_STATISTICS, STRING], STRING]
			-- table of grouped stats of all RM classes, keyed by class name, with
			-- each group keyed by a base class name, e.g. 'LOCATABLE', 'DATA_VALUE', 'Any' etc

	bmm_schema: BMM_SCHEMA

feature -- Modification

	add_rm_class_stats (a_stat_accum: RM_CLASS_STATISTICS)
		local
			rm_class_table: HASH_TABLE [RM_CLASS_STATISTICS, STRING]
		do
			if bmm_schema.is_primitive_type (a_stat_accum.rm_class_name) then
				rm_class_table := rm_grouped_class_table.item (Rm_primitive_group_key)
			elseif bmm_schema.has_archetype_parent_class and then bmm_schema.is_descendant_of (a_stat_accum.rm_class_name, bmm_schema.archetype_parent_class) then
				rm_class_table := rm_grouped_class_table.item (bmm_schema.archetype_parent_class)
			elseif bmm_schema.has_archetype_data_value_parent_class and then bmm_schema.is_descendant_of (a_stat_accum.rm_class_name, bmm_schema.archetype_data_value_parent_class) then
				rm_class_table := rm_grouped_class_table.item (bmm_schema.archetype_data_value_parent_class)
			else
				rm_class_table := default_rm_class_table
			end
			if rm_class_table.has (a_stat_accum.rm_class_name) then
				rm_class_table.item (a_stat_accum.rm_class_name).merge (a_stat_accum)
			else
				rm_class_table.put (a_stat_accum, a_stat_accum.rm_class_name)
			end
		end

	increment_archetype_metric (a_val: INTEGER; a_metric_name: STRING)
			-- add `a_val' to `archetype_metrics'
		require
			archetype_metrics.has (a_metric_name)
		do
			archetype_metrics.item (a_metric_name).update (a_val)
		end

	merge (other: like Current)
			-- merge another stats report into this one, creating aggregated statistics
		require
			other.bmm_schema = bmm_schema
		local
			merged_class_stats: RM_CLASS_STATISTICS
			rm_class_table: HASH_TABLE [RM_CLASS_STATISTICS, STRING]
		do
			-- archetype metrics table
			across other.archetype_metrics as metrics_csr loop
				archetype_metrics.item (metrics_csr.key).merge (metrics_csr.item)
			end

			-- rm class table
			across other.rm_grouped_class_table as other_grouped_table_csr loop
				if rm_grouped_class_table.has (other_grouped_table_csr.key) then
					rm_class_table := rm_grouped_class_table.item (other_grouped_table_csr.key)
					across other.rm_grouped_class_table.item_for_iteration as other_table_csr loop
						if rm_class_table.has (other_table_csr.key) then
							merged_class_stats := rm_class_table.item (other_table_csr.key).deep_twin
							merged_class_stats.merge (other_table_csr.item)
							rm_class_table.force (merged_class_stats, other_table_csr.key)
						else
							rm_class_table.put (other_table_csr.item.deep_twin, other_table_csr.key)
						end
					end
				else
					rm_grouped_class_table.put (other_grouped_table_csr.item.deep_twin, other_grouped_table_csr.key)
				end
			end
		end

feature -- Copying

	duplicate: like Current
			-- safe duplicate with full copies of states, but reference copy of `bmm_schema'
		do
			create Result.make (bmm_schema)
			Result.archetype_metrics.copy (archetype_metrics.deep_twin)
			Result.rm_grouped_class_table.copy (rm_grouped_class_table.deep_twin)
		end

feature {NONE} -- Implementation

	default_rm_class_table: HASH_TABLE [RM_CLASS_STATISTICS, STRING]

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
