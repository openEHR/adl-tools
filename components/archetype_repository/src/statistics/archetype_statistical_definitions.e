note
	component:   "openEHR ADL Tools"
	description: "Statistical metric names and other definitions for stats gathering"
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_STATISTICAL_DEFINITIONS

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ADL_MESSAGES_IDS
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

	Id_code_count: STRING
		once
			Result := get_text (ec_arch_stats_id_codes_text)
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

	Archetype_metric_names: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (Object_node_count)
			Result.extend (Archetypable_node_count)
			Result.extend (Archetype_data_value_node_count)
			Result.extend (Id_code_count)
			Result.extend (At_code_count)
			Result.extend (Ac_code_count)
			Result.extend (At_code_bindings_count)
			Result.extend (Ac_code_bindings_count)
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

	Library_metric_names: ARRAY [STRING]
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


