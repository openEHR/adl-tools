note
	component:   "openEHR ADL Tools"
	description: "Outermost editor context for editing a whole archetype."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_ED_CONTEXT

create
	make, make_editable

feature -- Initialisation

	make (aca: ARCH_CAT_ARCHETYPE_EDITABLE; an_rm_schema: BMM_SCHEMA; differential_view_flag: BOOLEAN)
		do
			source := aca
			create ed_context.make (source, an_rm_schema, differential_view_flag)
			build_context
		end

	make_editable (aca: ARCH_CAT_ARCHETYPE_EDITABLE; an_rm_schema: BMM_SCHEMA; an_undo_redo_chain: UNDO_REDO_CHAIN)
		do
			source := aca
			create ed_context.make_editable (source, an_rm_schema, an_undo_redo_chain)
			build_context
		end

feature -- Access

	source: ARCH_CAT_ARCHETYPE_EDITABLE

	ed_context: ARCH_ED_CONTEXT_STATE

	definition_context: C_COMPLEX_OBJECT_ED_CONTEXT
			-- definition editing context

	assertion_contexts: ARRAYED_LIST [ASSERTION_ED_CONTEXT]
			-- assertion editing contexts

feature {NONE} -- Implementation

	build_context
		do
			definition_context := build_definition_context (ed_context.archetype.definition.representation)
			create assertion_contexts.make (0)
			build_assertions
		end

	build_definition_context (og_root: OG_OBJECT_NODE): C_COMPLEX_OBJECT_ED_CONTEXT
			-- build a C_COMPLEX_OBJECT_ED_CONTEXT from any part of an archetype definition tree
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			c_ed_context_builder: C_OBJECT_ED_CONTEXT_BUILDER
		do
			create c_ed_context_builder.make (ed_context)
			create a_c_iterator.make (og_root, c_ed_context_builder)
			a_c_iterator.do_all
			check attached c_ed_context_builder.root_node as rn then
				Result := rn
			end
		end

	build_assertions
			-- build `assertion_contexts'
		local
			assn_iterator: EXPR_VISITOR_ITERATOR
			assn_ed_context_builder: ASSERTION_ED_CONTEXT_BUILDER
		do
			if ed_context.archetype.has_rules then
				create assn_ed_context_builder.make (ed_context)
				across ed_context.archetype.rules as inv_csr loop
					create assn_iterator.make (inv_csr.item, assn_ed_context_builder)
					assn_iterator.do_all
					check attached assn_ed_context_builder.root_node as rn then
						assertion_contexts.extend (rn)
					end
				end
			end
		end

end


