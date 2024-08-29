note
	component:   "openEHR ADL Tools"
	description: "Operational template abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OPERATIONAL_TEMPLATE

inherit
	AUTHORED_ARCHETYPE
		redefine
			annotated_path, semantic_path, identified_parent_node, path_map
		end

create
	default_create, make_from_other

feature -- Access

	component_terminologies: HASH_TABLE [ARCHETYPE_TERMINOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier
		attribute
			create Result.make (0)
		end

	component_terminology (an_archetype_id: STRING): ARCHETYPE_TERMINOLOGY
			-- terminology for `an_archetype_id'
		require
			has_component_terminology (an_archetype_id)
		do
			check attached component_terminologies.item (an_archetype_id) as att_terminology then
				Result := att_terminology
			end
		end

	identified_parent_node (a_node: C_OBJECT): detachable C_COMPLEX_OBJECT
			-- return the proximal node above `a_node` that is identified in the terminology
		local
			csr, term_csr: C_OBJECT
			found: BOOLEAN
			current_terminology: ARCHETYPE_TERMINOLOGY
		do
			if has_object (a_node) then
				from csr := a_node until found loop
					-- locate proximate root point and get the right terminology
					from term_csr := a_node until attached {C_ARCHETYPE_ROOT} term_csr or term_csr.is_root loop
						check attached term_csr.parent as c_attr and then attached c_attr.parent as parent_cco then
							term_csr := parent_cco
						end
					end

					if term_csr.is_root then
						current_terminology := terminology
					else
						check attached {C_ARCHETYPE_ROOT} term_csr as car then
							current_terminology := component_terminology (car.archetype_ref)
						end
					end

					-- now walk back up and find nearest identified parent node
					from csr := a_node until current_terminology.has_code (csr.node_id) loop
						check attached csr.parent as c_attr and then attached c_attr.parent as parent_cco then
							csr := parent_cco
						end
					end

					if current_terminology.has_code (csr.node_id) then
						found := True
					end
				end

				check current_terminology.has_code (csr.node_id) and attached {C_COMPLEX_OBJECT} csr as cco then
					Result := cco
				end
			end
		end

feature -- Status Report

	has_component_terminology (an_archetype_id: STRING): BOOLEAN
			-- True if there is a component terminology for `an_archetype_id'
		do
			Result := component_terminologies.has (an_archetype_id)
		end

feature -- Modification

	add_component_terminology (a_terminology: ARCHETYPE_TERMINOLOGY; an_archetype_id: STRING)
		require
			Archetype_id_attached: not an_archetype_id.is_empty
			Terminology_is_flat: a_terminology.is_flat
		do
			component_terminologies.put (a_terminology, an_archetype_id)
		end

	merge_component_terminologies (other_opt: OPERATIONAL_TEMPLATE)
			-- merge component terminologies from `other_opt'
		do
			component_terminologies.merge (other_opt.component_terminologies)
		end

feature -- Paths

	path_map: HASH_TABLE [ARCHETYPE_CONSTRAINT, STRING]
			-- get the full path map of the archetype, including paths created by
			-- proxy objects
		do
			if attached path_map_cache as pmc then
				Result := pmc
			else
				create Result.make(0)
				across definition.path_map as paths_csr loop
					Result.put (paths_csr.item, opt_path (paths_csr.key))
				end
				path_map_cache := Result
			end
		end

	opt_path (a_phys_path: STRING): STRING
			-- generate an OPT path from an archetype physical path
			-- This is done by inserting archetype ids from C_ARCHETYPE_ROOT points
		local
			og_phys_path, og_log_path: OG_PATH
			ca_csr: C_ATTRIBUTE
			cco_csr: C_COMPLEX_OBJECT
			child_co: C_OBJECT
			finished: BOOLEAN
		do
			create og_phys_path.make_from_string (a_phys_path)
			create og_log_path.make_from_other (og_phys_path)
			from
				og_phys_path.start
				og_log_path.start
				cco_csr := definition
			until
				og_phys_path.off or finished
			loop
				if attached {C_ARCHETYPE_ROOT} cco_csr as car then
					og_log_path.item.set_object_id (opt_path_root_point_id (og_phys_path.item.object_id, car.archetype_ref))
				end
				ca_csr := cco_csr.attribute_with_name (og_phys_path.item.attr_name)

				if og_phys_path.item.is_addressable then
					child_co := ca_csr.child_with_id (og_phys_path.item.object_id)
				elseif ca_csr.has_children then
					child_co := ca_csr.children.first
				end
				if attached {C_COMPLEX_OBJECT} child_co as cco then
					cco_csr := cco
				else
					finished := True
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		end

	annotated_path (a_phys_path, a_language: STRING; with_codes: BOOLEAN): STRING
			-- generate a logical path in 'a_language' from a physical path
			-- if `with_code' then generate annotated form of each code, i.e. "code|text|"
		local
			segment_id, arch_id, id_code, log_str: STRING
			og_phys_path, og_log_path: OG_PATH
			ref_terminology: ARCHETYPE_TERMINOLOGY
		do
			ref_terminology := terminology
			create og_phys_path.make_from_string (a_phys_path)
			create og_log_path.make_from_other (og_phys_path)
			from
				og_phys_path.start
				og_log_path.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					segment_id := og_phys_path.item.object_id

					-- id-code
					if is_valid_id_code (segment_id) then
						-- id-code of object under container attribute: will be in terminology
						if ref_terminology.has_id_code (segment_id) then
							if with_codes then
								log_str := annotated_code (segment_id, ref_terminology.term_definition (a_language, segment_id).text, "")
							else
								log_str := ref_terminology.term_definition (a_language, segment_id).text
							end
							og_log_path.item.set_object_id (log_str)

						-- id-code of single-valued attribute - no terminology entry
						else
							og_log_path.item.set_object_id (segment_id)
						end

					-- assume it is a OPT root point archetype id
					else
						arch_id := opt_path_root_point_id_arch_id (segment_id)
						og_log_path.item.set_object_id (arch_id)
						check component_terminologies.has (arch_id) and then attached component_terminologies.item (arch_id) as att_ct then
							ref_terminology := att_ct
						end
					end
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		end

	semantic_path (a_phys_path, a_language: STRING): OG_PATH
			-- generate a logical path in 'a_language' from a physical path
		local
			segment_id, arch_id, id_code, log_str: STRING
			og_phys_path: OG_PATH
			ref_terminology: ARCHETYPE_TERMINOLOGY
			an_arch_id: ARCHETYPE_HRID
		do
			ref_terminology := terminology
			create og_phys_path.make_from_string (a_phys_path)
			create Result.make_from_other (og_phys_path)

			-- generate a human-readable path from the physical path
			from
				og_phys_path.start
				Result.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					segment_id := og_phys_path.item.object_id

					-- only use the object address if it is valid (it could be an archetype id) and
					-- b) in the terminology (for objects under single-valued attributes, this is optional)
					if is_valid_id_code (segment_id) then
						-- it's a code of a child node of a container attribute, so must be in terminology
						if ref_terminology.has_id_code (segment_id) then
							Result.item.set_object_id (ref_terminology.term_definition (a_language, segment_id).text)
						else
							Result.item.clear_object_id
						end

					-- TODO: now obsolete, since archetype IDs no longer in node_id field in OPTs
					else
						arch_id := opt_path_root_point_id_arch_id (segment_id)
						if archetype_id.valid_id (arch_id) then
							create an_arch_id.make_from_string (arch_id)
							Result.item.set_object_id (an_arch_id.concept_id)
							check component_terminologies.has (arch_id) and then attached component_terminologies.item (arch_id) as att_ct then
								ref_terminology := att_ct
							end
						else
							Result.item.clear_object_id
						end
					end
				else
					Result.item.clear_object_id
				end
				og_phys_path.forth
				Result.forth
			end
		end

	opt_path_root_point_id (obj_id, arch_id: STRING): STRING
		do
			Result := obj_id + ":" + arch_id
		end

	opt_path_root_point_id_node_id (segment_id: STRING): STRING
		local
			pos: INTEGER
		do
			pos := segment_id.index_of (':', 1) - 1
			if pos < 1 then
				pos := segment_id.count
			end

			Result := segment_id.substring (1, pos)
		end

	opt_path_root_point_id_arch_id (segment_id: STRING): STRING
		local
			pos: INTEGER
		do
			pos := segment_id.index_of (':', 1) + 1
			if pos > 1 then
				Result := segment_id.substring (pos, segment_id.count)
			else
				create Result.make(0)
			end
		end

end


