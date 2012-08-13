note
	component:   "openEHR Archetype Project"
	description: "Outermost editor context for editing a whole archetype."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCH_ED_CONTEXT

create
	make

feature -- Initialisation

	make (aca: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA; differential_view_flag: BOOLEAN)
		do
			target_descriptor := aca
			in_differential_view := differential_view_flag
			if in_differential_view then
				target := target_descriptor.differential_archetype
			else
				target := target_descriptor.flat_archetype
			end
			rm_schema := an_rm_schema

--			build_definition

			create assertion_contexts.make (0)
			build_assertions
		end

feature -- Access

	target_descriptor: ARCH_CAT_ARCHETYPE

	target: ARCHETYPE
			-- archetype being edited, created as a copy of an original

	definition_context: C_COMPLEX_OBJECT_ED_CONTEXT
			-- definition editing context

	assertion_contexts: ARRAYED_LIST [ASSERTION_ED_CONTEXT]
			-- assertion editing contexts

feature -- Status Report

	in_differential_view: BOOLEAN

	in_reference_model_mode_changed: BOOLEAN

	in_reference_model_mode: BOOLEAN

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA

	build_definition
			-- build `definition_context'
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			c_ed_context_builder: C_OBJECT_ED_CONTEXT_BUILDER
		do
			create c_ed_context_builder.make (target, in_reference_model_mode, rm_schema, target_descriptor.flat_archetype.ontology)
			create a_c_iterator.make (target.definition.representation, c_ed_context_builder)
			a_c_iterator.do_all

			definition_context := c_ed_context_builder.root_node
		end

	build_assertions
			-- build `assertion_contexts'
		local
			assn_iterator: EXPR_VISITOR_ITERATOR
			assn_ed_context_builder: ASSERTION_ED_CONTEXT_BUILDER
		do
			if target.has_invariants then
				create assn_ed_context_builder.make (target, rm_schema, target_descriptor.flat_archetype.ontology)
				across target.invariants as inv_csr loop
					create assn_iterator.make (inv_csr.item, assn_ed_context_builder)
					assn_iterator.do_all
					assertion_contexts.extend (assn_ed_context_builder.root_node)
				end
			end
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
--| The Original Code is arch_ed_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
