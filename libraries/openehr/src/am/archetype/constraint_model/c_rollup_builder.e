note
	component:   "openEHR ADL Tools"
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
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		do
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- status of this node taking into consideration effective_specialisation_status of all sub-nodes.
		local
			spec_sts: INTEGER
		do
			spec_sts := a_node.specialisation_status
			across a_node.attributes as attrs_csr loop
				spec_sts := specialisation_dominant_status (spec_sts, attrs_csr.item.rolled_up_specialisation_status)
			end
			a_node.set_rolled_up_specialisation_status (spec_sts)
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		do
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		local
			spec_sts: INTEGER
		do
			spec_sts := a_node.specialisation_status
			across a_node.children as child_csr loop
				spec_sts := specialisation_dominant_status (spec_sts, child_csr.item.rolled_up_specialisation_status)
			end
			a_node.set_rolled_up_specialisation_status (spec_sts)
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
			a_node.set_rolled_up_specialisation_status (a_node.specialisation_status)
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
			a_node.set_rolled_up_specialisation_status (ss_added)
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		do
			a_node.set_rolled_up_specialisation_status (a_node.specialisation_status)
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		do
			a_node.set_rolled_up_specialisation_status (a_node.specialisation_status)
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
			a_node.set_rolled_up_specialisation_status (a_node.specialisation_status)
		end

end


