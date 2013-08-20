note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype cross-reference table validator. The ARCHEYPE class has a number of
				 xref tables it uses to keep track of the codes in the ontology and where they
				 are used in the archetype definition; these tables are used to test validity,
				 e.g. if a code is mentioned in the definition but not defined in the ontology
				 etc. This object is used in a traversal to populate the xref tables.
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_XREF_BUILDER

inherit
	C_VISITOR


	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_archetype: ARCHETYPE)
		do
			initialise (an_archetype)
		end

feature -- Visitor

	start_c_object (a_node: C_OBJECT; depth: INTEGER)
			-- enter a C_OBJECT
		do
			if a_node.is_addressable and is_valid_code (a_node.node_id) then
				if not archetype.id_atcodes_index.has (a_node.node_id) then
					archetype.id_atcodes_index.put (create {ARRAYED_LIST [C_OBJECT]}.make(0), a_node.node_id)
				end
				archetype.id_atcodes_index.item (a_node.node_id).extend (a_node)
			end
		end

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter a C_COMPLEX_OBJECT
		do
			start_c_object (a_node, depth)
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do
			start_c_object (a_node, depth)
			archetype.slot_index.extend (a_node)
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
			if not archetype.suppliers_index.has (a_node.archetype_id) then
				archetype.suppliers_index.put (create {ARRAYED_LIST[C_ARCHETYPE_ROOT]}.make(0), a_node.archetype_id)
			end
			archetype.suppliers_index.item (a_node.archetype_id).extend (a_node)
		end

	start_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do
			start_c_object (a_node, depth)
			if not archetype.use_node_index.has (a_node.target_path) then
				archetype.use_node_index.put (create {ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]}.make(0), a_node.target_path)
			end
			archetype.use_node_index.item (a_node.target_path).extend (a_node)
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do
			if not archetype.accodes_index.has(a_node.target) then
				archetype.accodes_index.put (create {ARRAYED_LIST [CONSTRAINT_REF]}.make(0), a_node.target)
			end
			archetype.accodes_index.item (a_node.target).extend (a_node)
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE; see if it has a differential path, in which case there may be at-codes
			-- referenced there not visible elsewhere in the structure; these need to be found and added to
			-- the id_atcodes list
		local
			og_path: OG_PATH
		do
			if attached a_node.differential_path as dp then
				create og_path.make_from_string (dp)
				across og_path as path_csr loop
					if path_csr.item.is_addressable and is_valid_code (path_csr.item.object_id) then
						if not archetype.id_atcodes_index.has (path_csr.item.object_id) then
							archetype.id_atcodes_index.put (create {ARRAYED_LIST[ARCHETYPE_CONSTRAINT]}.make(0), path_csr.item.object_id)
						end
						archetype.id_atcodes_index.item (path_csr.item.object_id).extend (a_node)
					end
				end

			end
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_reference_object (a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
			if attached {C_TERMINOLOGY_CODE} a_node as ctc then
				start_c_object (a_node, depth)
				if not ctc.any_allowed and then (ctc.is_local and ctc.code_count > 0) then
					across ctc.code_list as code_list_csr loop
						if not archetype.data_atcodes_index.has (code_list_csr.item) then
							archetype.data_atcodes_index.put (create {ARRAYED_LIST [C_OBJECT]}.make(0), code_list_csr.item)
						end
						archetype.data_atcodes_index.item (code_list_csr.item).extend (ctc)
					end
				end
			end
		end

end


