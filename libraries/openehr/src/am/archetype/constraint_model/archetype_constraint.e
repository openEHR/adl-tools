indexing
	component:   "openEHR Archetype Project"
	description: "Abstract model of any archetype constraint"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ARCHETYPE_CONSTRAINT

inherit
	VISITABLE

	SPECIALISATION_STATUSES
		export
			{NONE} all;
			{ANY} valid_specialisation_status
		end

feature -- Access

	invalid_reason: STRING

	parent: ARCHETYPE_CONSTRAINT

	path: STRING is
			-- path to this object in the tree with respect to root
		do
			create Result.make(0)
			Result := representation.path.as_string
		end

	is_mergeable: BOOLEAN
			-- flag to indicate this node is in a specialised archetype can be merged with the
			-- corresponding node in the parent archetype. If False, it means that there is
			-- either no corresponding parent (this is a node introduced new in this archetype)
			-- or that this node should just completely replace rather than be merged with
			-- its parent counterpart. Here, 'merging' means the piece-wise process of taking
			-- elements of this node, including its children and overlaying them on the flat
			-- parent node.

feature -- Source Control

	specialisation_status (archetype_specialisation_level: INTEGER): SPECIALISATION_STATUS is
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are: defined_here; redefined, added, unknown
		require
			valid_specialisation_level: archetype_specialisation_level >= 0
		deferred
		end

	rolled_up_specialisation_status: SPECIALISATION_STATUS
			-- status of this node taking into consideration effective_specialisation_status of
			-- all sub-nodes. Used to roll up nodes on visualisation, and also to decide which
			-- subtree to remove to convert an archetype to differential form

	set_rolled_up_specialisation_status (a_status: SPECIALISATION_STATUS) is
		require
			valid_specialisation_status: valid_specialisation_status(a_status.value)
		do
			rolled_up_specialisation_status := a_status
		end

feature -- Status Report

	is_leaf: BOOLEAN is
			-- True if this node is a terminal node
		do
			Result := representation.is_leaf
		end

	is_root: BOOLEAN is
			-- True if this node is a top node
		do
			Result := representation.is_root
		end

	is_addressable: BOOLEAN is
			-- True if this node has a non-anonymous node_id
		do
			Result := representation.is_addressable
		end

	is_valid: BOOLEAN is
			-- True if node valid; if False, reason in `invalid_reason'
		deferred
		ensure
			not Result implies invalid_reason /= Void and then not invalid_reason.is_empty
		end

feature -- Comparison

	node_congruent_to (other: like Current): BOOLEAN is
			-- True if this node on its own (ignoring any subparts) expresses the same constraints as `other'.
		require
			other /= Void
		deferred
		end

	node_conforms_to (other: like Current): BOOLEAN is
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- An error message can be obtained by calling node_conformance_failure_reason
		require
			other /= Void
		deferred
		end

feature -- Modification

	set_is_congruent is
			-- set `is_mergeable'
		do
			is_mergeable := True
		end

feature {ARCHETYPE_CONSTRAINT} -- Modification

	set_parent(a_node: like parent) is
			-- set parent
		require
			Node_exists: a_node /= Void
		do
			parent := a_node
		end

feature -- Representation

	representation: !OG_ITEM

feature {OG_ITEM} -- Implementation

	set_representation(a_rep: like representation) is
			--
		do
			representation := a_rep
		ensure
			Representation_set: representation = a_rep
		end

feature -- Duplication

	safe_deep_twin: like Current is
			-- safe version of deep_twin that Voids `parent' first so as not to clone backwards up tree
		local
			p: like parent
			og_p: OG_NODE
		do
			p := parent
			parent := Void

			og_p := representation.parent
			representation.set_root
			Result := deep_twin

			parent := p
			representation.set_parent (og_p)
		ensure
			Result.parent = Void
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
--| The Original Code is cadl_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
