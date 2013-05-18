note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype specialisation status roll-up builder.
				 This visitor 'rolls up' the specialisation statuses of nodes in the
				 definition tree of an archetype so that more dominant statuses percolate
				 upward. For example, if there is a subtree in which some leaf node has
				 specialisation status = added (see class SPECIALISATION_STATUSES), then
				 this will percolate up to the highest node it can. This is always a
				 node whose parent has other child subtrees of a lower rolled-up status,
				 e.g. completely inherit subtrees. The final rollup point corresponds to
				 the subtree that must be preserved to keep the leaf node with the high
				 status (added or redefined), and whose sibling trees are of different
				 statuses (typically inherited) and could be deleted in a differential form
				 archetype.
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"


class C_ROLLUP_BUILDER

inherit
	C_VISITOR
		redefine
			end_c_complex_object, end_c_attribute
		end

	SPECIALISATION_STATUSES
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

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- status of this node taking into consideration effective_specialisation_status of all sub-nodes.
		local
			spec_sts: SPECIALISATION_STATUS
		do
			if attached a_node.inferred_specialisation_status (archetype_specialisation_level) as ss then
				spec_sts := ss
				across a_node.attributes as attrs_csr loop
					if attached attrs_csr.item.inferred_rolled_up_specialisation_status as attr_ss then
						spec_sts := spec_sts.specialisation_dominant_status (attr_ss)
					end
				end
				a_node.set_inferred_rolled_up_specialisation_status (spec_sts)
			end
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		local
			spec_sts: SPECIALISATION_STATUS
		do
			if attached a_node.inferred_specialisation_status (archetype_specialisation_level) as ss then
				spec_sts := ss
				across a_node.children as child_csr loop
					if attached child_csr.item.inferred_rolled_up_specialisation_status as child_ss then
						spec_sts := spec_sts.specialisation_dominant_status (child_ss)
					end
				end
				a_node.set_inferred_rolled_up_specialisation_status (spec_sts)
			end
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
			a_node.set_inferred_rolled_up_specialisation_status (a_node.inferred_specialisation_status (archetype_specialisation_level))
		end

	start_c_reference_object (a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter an C_REFERENCE_OBJECT
		do
			a_node.set_inferred_rolled_up_specialisation_status (a_node.inferred_specialisation_status (archetype_specialisation_level))
		end

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		do
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		do
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
			a_node.set_inferred_rolled_up_specialisation_status(create {SPECIALISATION_STATUS}.make (ss_added))
		end

	start_archetype_internal_ref (a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do
		end

	start_constraint_ref (a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
		end

	start_c_domain_type (a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase (a_node: C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		do
		end

	start_c_ordinal (a_node: C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		do
		end

	start_c_quantity (a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
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
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
