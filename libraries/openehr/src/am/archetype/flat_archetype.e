note
	component:   "openEHR ADL Tools"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class FLAT_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			ontology
		end

create
	make, make_all, make_from_other

create {ARCHETYPE_FLATTENER}
	make_specialised, make_non_specialised

feature {ARCHETYPE_FLATTENER} -- Initialisation

	make_non_specialised (a_diff: DIFFERENTIAL_ARCHETYPE)
			-- initialise from a differential archetype
		do
			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin,
					a_diff.uid,
					a_diff.description.safe_deep_twin,
					a_diff.definition.deep_twin, a_diff.ontology.to_flat)
			if attached a_diff.translations as a_diff_trans then
				translations := a_diff_trans.deep_twin
			end
			if attached a_diff.invariants as a_diff_invs then
				invariants := a_diff_invs.deep_twin
			end
			if attached a_diff.annotations as a_diff_annots then
				annotations := a_diff_annots.safe_deep_twin
			end
			rebuild
			is_generated := True
		ensure
			Generated: is_generated
			Top_level: not is_specialised
		end

	make_specialised (a_diff: DIFFERENTIAL_ARCHETYPE; a_flat_parent: FLAT_ARCHETYPE)
			-- initialise from a differential archetype and its flat parent, as preparation
			-- for generating a flat archetype. The items from the differential are used
			-- except for the definition, invariants and annotations, which are the flat
			-- parent versions, so that the differential definition can be overlaid on
			-- it by a merging process. The ontology is converted to a form ready for
			-- overlaying as well.
		local
			desc: like description
		do
			-- basic identifying info, and language from from child
			-- definition comes from parent, waiting for flattening of child on top
			-- ontology comes from child, waiting for parent items to be merged on top
			if attached a_diff.description as orig_desc then
				desc := orig_desc.safe_deep_twin
			end
			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin, a_diff.uid, desc,
					a_flat_parent.definition.deep_twin,
					a_diff.ontology.to_flat)
			definition.set_node_id (a_diff.definition.node_id.twin)

			-- other metadata is created from parent, with child meta-data
			-- merged on top, overwriting any values of the same key
			other_metadata := a_flat_parent.other_metadata

			-- translations are what is available in the child archetype
			if attached a_diff.translations as a_diff_trans then
				translations := a_diff_trans.deep_twin
			end

			-- invariants starts with what is in the parent archetype and
			-- child invariants are merged
			if attached a_flat_parent.invariants as parent_invs then
				invariants := parent_invs.deep_twin
			end

			-- annotations starts with what is in the parent archetype and
			-- child annotations are merged
			if attached a_flat_parent.annotations as parent_annots then
				annotations := parent_annots.safe_deep_twin
			end

			rebuild
			is_generated := True
		ensure
			Generated: is_generated
			Specialised: is_specialised
		end

feature -- Access

	ontology: FLAT_ARCHETYPE_ONTOLOGY

feature -- Factory

	to_differential: DIFFERENTIAL_ARCHETYPE
			-- generate differential form of archetype if specialised, to be in differential form,
			-- based on inspecting each node's `specialisation_level'
		require
			is_generated
		local
			def_it: C_ITERATOR
		do
--			if not is_specialised then
				create Result.make_all (artefact_type, Latest_adl_version, archetype_id, parent_archetype_id,
					is_controlled, uid, other_metadata, original_language, translations, description, definition, invariants,
					ontology.to_differential, annotations)
--			else
--				-- ======= deal with main archetype =======

--				-- ======= description =======

--				-- ======= definition =========
--				create diff_added_obj_nodes.make (0)
--				create diff_added_attr_nodes.make (0)
--				create diff_redefined_obj_nodes.make (0)
--				create diff_redefined_attr_nodes.make (0)
--				create diff_redefined_id_nodes.make (0)
--				create def_it.make (definition)

--				-- extract the added nodes first
--				def_it.do_at_surface (agent node_diff_extract_additions,
--					agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := a_c_node.specialisation_status = ss_added end
--				)

--				-- now find redefined nodes
--				def_it.do_until_surface (agent node_diff_extract_redefinitions,
--					agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := a_c_node.specialisation_status /= ss_added end
--				)

--				-- ======= rules section =======

--				-- ======= ontology =======

--				-- ======= annotations =======

--			end
		end

	node_diff_extract_additions (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- record all added nodes & paths (including sibling order markers, which remain in the
			-- in-memory flat)
		local
			node_path: STRING
		do
			node_path := a_c_node.path
			if attached {C_OBJECT} a_c_node as co then
				if not diff_added_obj_nodes.has (node_path) then
					diff_added_obj_nodes.put (create {ARRAYED_LIST [C_OBJECT]}.make (0), node_path)
				end
				diff_added_obj_nodes.item (node_path).extend (co)
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if not diff_added_attr_nodes.has (node_path) then
					diff_added_attr_nodes.put (create {ARRAYED_LIST [C_ATTRIBUTE]}.make (0), node_path)
				end
				diff_added_attr_nodes.item (node_path).extend (ca)
			end
		end

	node_diff_extract_redefinitions (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			ss: INTEGER
		do
			ss := a_c_node.specialisation_status
			if attached {C_OBJECT} a_c_node as co then
				-- solely node_id was redefined
				if ss = {SPECIALISATION_STATUSES}.ss_id_redefined then
					diff_redefined_id_nodes.put (co.node_id, co.path)

				-- occurrences and/or rm_type (C_COMPLEX_OBJECT case), and/or other redefinitions for
				-- other C_OBJECT subtypes - just remember the node
				elseif ss = {SPECIALISATION_STATUSES}.ss_redefined then
					diff_redefined_obj_nodes.put (co, co.path)
				end

			-- must be redefined cardinality and/or existence
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				diff_redefined_attr_nodes.put (ca, ca.path)
			end
		end

	diff_added_obj_nodes: detachable HASH_TABLE [ARRAYED_LIST [C_OBJECT], STRING]

	diff_added_attr_nodes: detachable HASH_TABLE [ARRAYED_LIST [C_ATTRIBUTE], STRING]

	diff_redefined_obj_nodes: detachable HASH_TABLE [C_OBJECT, STRING]

	diff_redefined_attr_nodes: detachable HASH_TABLE [C_ATTRIBUTE, STRING]

	diff_redefined_id_nodes: detachable HASH_TABLE [STRING, STRING]
			-- table of redefined node_id keyed by path; these correspond to C_OBJECT nodes whose
			-- only redefinition was in the id, and which appeared in the orginal differential in
			-- compressed paths

	diff_nodes: detachable HASH_TABLE [C_ATTRIBUTE, STRING]
			-- table of C_ATTRIBUTEs keyed by path, each is one of:
			--	* redefined - changed cardinality is only possible change
			-- 	* added new, with child C_OBJECTs
			--	* compressed path C_ATTRIBUTEs, containing added/redefined C_OBJECTs

	debug_node_diff_enter (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			s: STRING
			ss: INTEGER
		do
			create s.make_filled ('-', depth*4)
			s.append ("> ")

			ss := a_c_node.specialisation_status
			if attached {C_OBJECT} a_c_node as co then
				s.append (co.rm_type_name)
				if co.is_addressable then
					s.append ("[" + co.node_id + "|" + ontology.term_definition (original_language.code_string, co.node_id).text + "]")
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				s.append (ca.rm_attribute_name)
			end

			if attached specialisation_status_symbols.item (ss) as spec_sym then
				s.append_character (' ')
				s.append (spec_sym)
			end

			s.append_character ('%N')
			io.put_string (s)
		end

	node_diff_exit (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
		do
		end

end


