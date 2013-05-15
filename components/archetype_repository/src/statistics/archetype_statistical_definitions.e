note
	component:   "openEHR Archetype Project"
	description: "Statistical metric names and other definitions for stats gathering"
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class ARCHETYPE_STATISTICAL_DEFINITIONS

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all;
		end

feature -- Definitions

	Object_node_count: STRING
		once
			Result := get_text (ec_arch_stats_object_nodes_text)
		end

	Archetypable_node_count: STRING
		once
			Result := get_text (ec_arch_stats_archetypable_nodes_text)
		end

	Archetype_data_value_node_count: STRING
		once
			Result := get_text (ec_arch_stats_data_value_nodes_text)
		end

	At_code_count: STRING
		once
			Result := get_text (ec_arch_stats_at_codes_text)
		end

	Ac_code_count: STRING
		once
			Result := get_text (ec_arch_stats_ac_codes_text)
		end

	At_code_bindings_count: STRING
		once
			Result := get_text (ec_arch_stats_at_code_bindings_text)
		end

	Ac_code_bindings_count: STRING
		once
			Result := get_text (ec_arch_stats_ac_code_bindings_text)
		end

	Archetype_metric_names: ARRAY [STRING]
		once
			Result := <<Object_node_count,
				Archetypable_node_count,
				Archetype_data_value_node_count,
				At_code_count,
				Ac_code_count,
				At_code_bindings_count,
				Ac_code_bindings_count
			>>
		end

	Total_archetype_count: STRING
		once
			Result := get_text (ec_arch_stats_total_archetypes_text)
		end

	Valid_archetype_count: STRING
		once
			Result := get_text (ec_arch_stats_valid_archetypes_text)
		end
			-- count of valid archetypes

	Specialised_archetype_count: STRING
			-- Count of specialised archetype descriptors in directory.
		once
			Result := get_text (ec_arch_stats_specialised_archetypes_text)
		end

	Client_archetype_count: STRING
			-- Count of slot-containing archetype descriptors in directory.
		once
			Result := get_text (ec_arch_stats_client_archetypes_text)
		end

	Supplier_archetype_count: STRING
			-- Count of archetype descriptors for archetypes used in slots in directory.
		once
			Result := get_text (ec_arch_stats_supplier_archetypes_text)
		end

	Catalogue_metric_names: ARRAY [STRING]
		once
			Result := <<Valid_archetype_count, Specialised_archetype_count, Client_archetype_count, Supplier_archetype_count>>
		end

	Rm_primitive_group_key: STRING
			-- name of group of RM breakdown stats based on classs that are primtiive types
		once
			Result := get_text (ec_arch_stats_primitive_text)
		end

	Rm_non_primitive_group_key: STRING
			-- name of group of RM breakdown stats based on classs that are non-primtiive types
		once
			Result := get_text (ec_arch_stats_non_primitive_text)
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
--| The Original Code is archetype_statistical_definitions.e.
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
