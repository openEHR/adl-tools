note
	component:   "openEHR Archetype Project"
	description: "Abstract model of any archetype constraint"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
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

	HASHABLE

feature -- Access

	parent: ARCHETYPE_CONSTRAINT

	path: STRING
			-- path to this object in the tree with respect to root
		do
			Result := representation.path.as_string
		end

	path_to_node (a_node: ARCHETYPE_CONSTRAINT): STRING
			-- path from this node to `a_node'
		do
			Result := representation.path_to_node (a_node.representation).as_string
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := path.hash_code
		end

feature -- Source Control

	specialisation_level: INTEGER
			-- specialisation level of this node within archetype

	set_specialisation_level (a_level: INTEGER)
			-- set specialisation level of this node within archetype
		require
			a_level > 0
		do
			specialisation_level := a_level
		end

	specialisation_status: INTEGER
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Determined from initial parse, and subsequent editing on structure

	set_specialisation_status_added
		do
			specialisation_status := ss_added
		end

	set_specialisation_status_redefined
		do
			specialisation_status := ss_redefined
		end

	set_specialisation_status_inherited
		do
			specialisation_status := ss_inherited
		end

	set_specialisation_status (a_spec_status: INTEGER)
		require
			valid_specialisation_status (a_spec_status)
		do
			specialisation_status := a_spec_status
		end

	inferred_specialisation_status (archetype_specialisation_level: INTEGER): SPECIALISATION_STATUS
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Values are: defined_here; redefined, added, unknown.
			-- USED ONLY FOR DIFFing legacy flat form into differential form
		require
			valid_specialisation_level: archetype_specialisation_level >= 0
		deferred
		end

	inferred_rolled_up_specialisation_status: SPECIALISATION_STATUS
			-- status of this node taking into consideration effective_specialisation_status of
			-- all sub-nodes. Used to roll up nodes on visualisation, and also to decide which
			-- subtree to remove to convert an archetype to differential form
			-- USED ONLY FOR DIFFing legacy flat form into differential form
		note
			option: transient
		attribute
		end

	set_inferred_rolled_up_specialisation_status (a_status: SPECIALISATION_STATUS)
			-- USED ONLY FOR DIFFing legacy flat form into differential form
		require
			valid_specialisation_status: valid_specialisation_status (a_status.value)
		do
			inferred_rolled_up_specialisation_status := a_status
		end

feature -- Status report

	is_path_compressible: BOOLEAN
			-- flag to indicate this node is in a specialised archetype and makes no structural changes
			-- to the corresponding node in the flat parent, and therefore, this node can be compressed.
			-- Note that congruent node_id definition is allowed, since node ids are not lost in paths.

	is_leaf: BOOLEAN
			-- True if this node is a terminal node
		do
			Result := representation.is_leaf
		end

	is_root: BOOLEAN
			-- True if this node is a top node
		do
			Result := representation.is_root
		end

	is_prohibited: BOOLEAN
			-- True if node is prohibited, i.e. excluded
		deferred
		end

feature -- Comparison

	node_congruent_to (other: attached like Current; an_rm_schema: attached BMM_SCHEMA): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same constraints as `other'.
		deferred
		end

	node_conforms_to (other: attached like Current; an_rm_schema: attached BMM_SCHEMA): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- An error message can be obtained by calling node_conformance_failure_reason
		deferred
		end

feature -- Modification

	set_is_path_compressible
			-- set `is_path_compressible'
		do
			is_path_compressible := True
		end

feature {ARCHETYPE_CONSTRAINT} -- Modification

	set_parent (a_node: attached like parent)
			-- set parent
		do
			parent := a_node
		end

feature -- Representation

	representation: attached OG_ITEM
		note
			option: transient
		attribute
		end

feature {OG_ITEM} -- Implementation

	set_representation (a_rep: like representation)
		do
			representation := a_rep
		ensure
			Representation_set: representation = a_rep
		end

feature -- Duplication

	safe_deep_twin: like Current
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

invariant
	Specialisation_status_validity: valid_specialisation_status (specialisation_status)

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
