note
	component:   "openEHR Archetype Project"
	description: "Visitor to generate editor context tree from C_XX structure"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_OBJECT_ED_CONTEXT_BUILDER

inherit
	C_VISITOR
		redefine
			end_c_archetype_root,
			end_c_complex_object,
			end_c_attribute
		end

create
	make

feature -- Initialisation

	make (an_archetype: ARCHETYPE; rm_mode_flag: BOOLEAN; an_rm_schema: BMM_SCHEMA; a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY)
		do
			initialise (an_archetype)
			create obj_node_stack.make (0)
			rm_schema := an_rm_schema
			flat_ontology := a_flat_ontology
		end

feature -- Access

	root_node: C_COMPLEX_OBJECT_ED_CONTEXT

	flat_ontology: FLAT_ARCHETYPE_ONTOLOGY
			-- access to archetype flat ontology

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter n C_COMPLEX_OBJECT
		local
			ed_node: C_COMPLEX_OBJECT_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			obj_node_stack.extend (ed_node)
			if a_node.is_root then
				root_node := ed_node
			else
				attr_node_stack.item.add_child (ed_node)
			end
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit a C_COMPLEX_OBJECT
		do
			obj_node_stack.remove
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			ed_node: ARCHETYPE_SLOT_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			ed_node: C_ATTRIBUTE_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			obj_node_stack.item.add_attribute (ed_node)
			attr_node_stack.extend (ed_node)
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			attr_node_stack.remove
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_reference_object (a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
			start_c_complex_object (a_node, depth)
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			end_c_complex_object (a_node, depth)
		end

	start_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		local
			ed_node: ARCHETYPE_INTERNAL_REF_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		local
			ed_node: CONSTRAINT_REF_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		local
			ed_node: C_PRIMITIVE_OBJECT_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

	start_c_domain_type (a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase (a_node: C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		local
			ed_node: C_CODE_PHRASE_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

	start_c_ordinal (a_node: C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		local
			ed_node: C_DV_ORDINAL_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

	start_c_quantity (a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		local
			ed_node: C_DV_QUANTITY_ED_CONTEXT
		do
			create ed_node.make (a_node, archetype, flat_ontology, rm_schema)
			attr_node_stack.item.add_child (ed_node)
		end

feature {NONE} -- Implementation

	obj_node_stack: ARRAYED_STACK [C_COMPLEX_OBJECT_ED_CONTEXT]

	attr_node_stack: ARRAYED_STACK [C_ATTRIBUTE_ED_CONTEXT]

	rm_schema: BMM_SCHEMA

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
--| The Original Code is c_object_ed_context_builder.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
