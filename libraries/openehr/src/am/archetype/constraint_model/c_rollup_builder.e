indexing
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
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ROLLUP_BUILDER

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			end_c_complex_object, end_c_attribute, start_c_leaf_object, start_c_reference_object
		end

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

feature -- Initialisation

	initialise(an_ontology: ARCHETYPE_ONTOLOGY; an_archetype_specialisation_level: INTEGER) is
			-- set ontology required for interpreting meaning of object nodes
			-- archetype is required as well since it contains the xref tables that are
			-- populated by this visitor
		require
			Ontology_valid: an_ontology /= Void
			Archetype_specialisation_level_valid: an_archetype_specialisation_level >= 0
		do
			initialise_visitor(an_ontology)
			archetype_specialisation_level := an_archetype_specialisation_level
		end

feature -- Visitor

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- status of this node taking into consideration effective_specialisation_status of
			-- all sub-nodes.
		local
			spec_sts: SPECIALISATION_STATUS
		do
			spec_sts := a_node.specialisation_status (archetype_specialisation_level)
			from
				a_node.attributes.start
			until
				a_node.attributes.off -- or spec_sts.value < ss_inherited
			loop
				spec_sts := spec_sts.specialisation_dominant_status(a_node.attributes.item.rolled_up_specialisation_status)
				a_node.attributes.forth
			end
			a_node.set_rolled_up_specialisation_status(spec_sts)
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- exit an C_ATTRIBUTE
		local
			spec_sts: SPECIALISATION_STATUS
		do
			spec_sts := a_node.specialisation_status (archetype_specialisation_level)
			from
				a_node.children.start
			until
				a_node.children.off -- or spec_sts.value < ss_inherited
			loop
				spec_sts := spec_sts.specialisation_dominant_status(a_node.children.item.rolled_up_specialisation_status)
				a_node.children.forth
			end
			a_node.set_rolled_up_specialisation_status(spec_sts)
		end

	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER) is
			-- enter an C_LEAF_OBJECT
		do
			a_node.set_rolled_up_specialisation_status(a_node.specialisation_status (archetype_specialisation_level))
		end

	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER) is
			-- enter an C_REFERENCE_OBJECT
		do
			a_node.set_rolled_up_specialisation_status(a_node.specialisation_status (archetype_specialisation_level))
		end

feature {NONE} -- Implementation

	archetype_specialisation_level: INTEGER
			-- specialisation level of the archetype whose definition structure
			-- this object processes

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
