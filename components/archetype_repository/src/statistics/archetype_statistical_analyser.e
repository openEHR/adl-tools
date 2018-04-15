note
	component:   "openEHR ADL Tools"
	description: "Statistical analyser for archetypes."
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_STATISTICAL_ANALYSER

inherit
	ARCHETYPE_STATISTICAL_DEFINITIONS

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		end

create
	make, make_specialised

feature -- Initialisation

	make (an_archetype: ARCHETYPE; an_rm: BMM_MODEL)
		local
			aom_profile: AOM_PROFILE
		do
			target := an_archetype
			ref_model := an_rm

			if aom_profiles_access.has_profile_for_rm_schema (ref_model.schema_id) then
				aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.schema_id)
				archetype_parent_class := aom_profile.archetype_parent_class
				archetype_data_value_parent_class := aom_profile.archetype_data_value_parent_class
			end

			create stats.make (ref_model)
		end

	make_specialised (an_archetype: ARCHETYPE; a_flat_parent: ARCHETYPE; an_rm_schema: BMM_MODEL)
		require
			a_flat_parent.is_flat
		do
			make (an_archetype, an_rm_schema)
			flat_parent := a_flat_parent
		end

feature -- Access

	target: ARCHETYPE
			-- differential archetype

	flat_parent: detachable ARCHETYPE

	stats: ARCHETYPE_STATISTICAL_REPORT

feature -- Commands

	analyse
		local
			def_it: C_ITERATOR
		do
			-- add archetype-level counts
			stats.increment_archetype_metric (target.terminology.id_codes.count, Id_code_count)
			stats.increment_archetype_metric (target.terminology.value_codes.count, At_code_count)
			stats.increment_archetype_metric (target.terminology.value_set_codes.count, Ac_code_count)
			if not target.terminology.term_bindings.is_empty then
				across target.terminology.term_bindings as bindings_for_terminology_csr loop
					across bindings_for_terminology_csr.item as bindings_list loop
						if is_value_set_code (bindings_list.key) then
							stats.increment_archetype_metric (1, Ac_code_bindings_count)
						else
							stats.increment_archetype_metric (1, At_code_bindings_count)
						end
					end
				end
			end

			-- add node-level counts
			total_node_count := 0
			locatable_node_count := 0
			data_value_node_count := 0

			create def_it.make (target.definition)
			def_it.do_all (agent node_enter, agent node_exit)

			stats.archetype_metrics_item (Object_node_count).update (total_node_count)
			stats.archetype_metrics_item (Archetypable_node_count).update (locatable_node_count)
			stats.archetype_metrics_item (Archetype_data_value_node_count).update (data_value_node_count)
		end

feature {NONE} -- Implementation

	ref_model: BMM_MODEL
			-- schema for the `target'			

	archetype_data_value_parent_class: detachable STRING

	archetype_parent_class: detachable STRING

	node_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			stat_accums: ARRAYED_LIST [RM_CLASS_STATISTICS]
			a_class_stat_accum, an_attr_stat_accum: RM_CLASS_STATISTICS
			apa: ARCHETYPE_PATH_ANALYSER
			ca, ca_parent_flat: C_ATTRIBUTE
			path_in_flat: STRING
			co_type_name: STRING
			bmm_class_def: detachable BMM_CLASS
			is_root_flag: BOOLEAN
		do
			if attached {C_OBJECT} a_c_node as co then
				-- capture total node count
				total_node_count := total_node_count + 1

				-- capture LOCATABLE node count
				if attached archetype_parent_class as apc and then
					ref_model.is_descendant_of (co.rm_type_name, apc)
				then
					locatable_node_count := locatable_node_count + 1
				elseif attached archetype_data_value_parent_class as dvpc and then
					ref_model.is_descendant_of (co.rm_type_name, dvpc)
				then
					data_value_node_count := data_value_node_count + 1
				end

				-- capture node specific info
				create stat_accums.make (0)
				create a_class_stat_accum.make (co.rm_type_name, co.is_root)
				stat_accums.extend (a_class_stat_accum)
				if attached {C_COMPLEX_OBJECT} co as cco then
					across cco.attributes as attrs_csr loop
						ca := attrs_csr.item
						if not ca.has_differential_path then
							a_class_stat_accum.add_rm_attribute_occurrence (ca.rm_attribute_name)
						elseif attached flat_parent as att_flat_parent then
							-- this is the case of constraint at a path, as found in specialised archetypes -
							-- it is an attribute for a different RM object type
							create apa.make_from_string (ca.rm_attribute_path)

							path_in_flat := apa.path_at_level (att_flat_parent.specialisation_depth)
							if att_flat_parent.has_attribute_path (path_in_flat) then
								ca_parent_flat := att_flat_parent.attribute_at_path (path_in_flat)
								check attached ca_parent_flat.parent as att_parent_co then
									co_type_name := att_parent_co.rm_type_name
									is_root_flag := att_parent_co.is_root
								end
							else
								bmm_class_def := ref_model.class_definition_at_path (target.definition.rm_type_name, path_in_flat)
								co_type_name := bmm_class_def.name
								is_root_flag := False
							end
							create an_attr_stat_accum.make (co_type_name, is_root_flag)
							an_attr_stat_accum.add_rm_attribute_occurrence (ca.rm_attribute_name)
							stat_accums.extend (an_attr_stat_accum)
						end
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


