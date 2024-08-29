note
	component:   "openEHR ADL Tools"
	description: "[
			 	 Serialise CADL archetype to any syntax format, i.e. where the
			 	 output reflects the tree hierarchy of the parse tree inline - nodes
			 	 are presented in the order of the tree traversal, and the semantics 
			 	 of the tree are output as language syntax keywords, symbols etc.
	             ]"
	keywords:    "serialiser, CADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MISSING_CODES_VISITOR

inherit
	C_VISITOR
		redefine
			end_c_archetype_root, end_c_complex_object, start_c_terminology_code
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

feature -- Access

	missing_codes_report: STRING_TABLE [ARCHETYPE_MISSING_CODES_REPORT]
			-- table of archetypes missing coding, keyed by path in template
		attribute
			create Result.make(0)
		end

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising a C_COMPLEX_OBJECT
		do
			if a_node.is_root then
				terminologies.extend (archetype.terminology)
				check attached archetype.parent_archetype_id as parent_id then
					archetype_report_stack.extend (
						create {ARCHETYPE_MISSING_CODES}.make (archetype.definition, archetype.archetype_id.as_string, archetype.archetype_id.as_string, opt.opt_path (a_node.path))
					)
				end
			end

			start_c_object (a_node, depth)
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising a C_COMPLEX_OBJECT
		do
			if a_node.is_root and not current_archetype_report.is_empty then
				missing_codes_report.put (current_archetype_report.as_report, opt.opt_path (a_node.path))
			end
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- start serialising an ARCHETYPE_SLOT
		do
			start_c_object (a_node, depth)
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- start serialising an ARCHETYPE_INTERNAL_REF
		do
			start_c_object (a_node, depth)
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
		do
			-- process this node within the parent terminology and report object first
			start_c_object (a_node, depth)

			-- now put its terminology on the stack
			terminologies.extend (opt.component_terminology (a_node.archetype_ref))
			archetype_report_stack.extend (
				create {ARCHETYPE_MISSING_CODES}.make (a_node, a_node.archetype_ref, archetype.archetype_id.as_string, opt.opt_path (a_node.path))
			)
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			terminologies.remove

			if not current_archetype_report.is_empty then
				missing_codes_report.put (current_archetype_report.as_report, opt.opt_path (a_node.path))
			end
			archetype_report_stack.remove
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
		do
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
		do
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising an C_PRIMITIVE_OBJECT
		do
		end

	start_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
			-- start serialising an C_TERMINOLOGY_CODE
		local
			identified_parent_term_desc: STRING
			vset: VALUE_SET
		do
			if a_node.is_constraint_value_set and then not terminology.has_any_term_binding (a_node.constraint) then
				check attached archetype.identified_parent_node (a_node) as identified_parent then
					identified_parent_term_desc := terminology.term_definition (default_language, identified_parent.node_id).text
					if terminology.value_sets.has (a_node.constraint) and attached terminology.value_sets.item (a_node.constraint) as att_vset then
						vset := att_vset
					end
					current_archetype_report.add_missing_value_set (a_node, identified_parent, terminology)
				end
			end
		end

feature {NONE} -- Implementation

	opt: OPERATIONAL_TEMPLATE
		do
			check attached {OPERATIONAL_TEMPLATE} archetype as att_opt then
				Result := att_opt
			end
		end

	start_c_object (a_node: C_OBJECT; depth: INTEGER)
		do
			if terminology.has_code (a_node.node_id) and then not terminology.has_term_binding (Loinc_terminology_id, a_node.node_id) then
				current_archetype_report.add_missing_id_code_binding (a_node, terminology.term_definition (default_language, a_node.node_id).text)
			end
		end

	archetype_report_stack: ARRAYED_STACK [ARCHETYPE_MISSING_CODES]
		attribute
			create Result.make(0)
		end

	current_archetype_report: ARCHETYPE_MISSING_CODES
		do
			Result := archetype_report_stack.item
		end

end


