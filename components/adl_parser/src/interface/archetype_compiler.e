indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype compiler interface. This object knows how to compile a system of archetypes
				 found in the ARCHETYPE_DIRECTORY.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://svn.openehr.org/ref_impl_eiffel/BRANCHES/specialisation/components/adl_parser/src/interface/archetype_parser.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2007-10-02 16:49:19 +0100 (Tue, 02 Oct 2007) $"

class ARCHETYPE_COMPILER

inherit
	SHARED_ARCHETYPE_DIRECTORY

	SHARED_ARCHETYPE_PARSER
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_RESOURCES
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make is
		do
			create status.make_empty
		end

feature -- Access

	status: STRING
			-- Last status of compiler.

	visual_update_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]]
			-- Called after processng each archetype (to perform GUI updates during processing).

feature -- Status

	is_interrupted: BOOLEAN
			-- Should building be cancelled immediately?

feature -- Status Setting

	interrupt
			-- Cancel building immediately.
		do
			is_interrupted := True
			status.append ("************* interrupted *************%N")
			call_visual_update_action (Void)
		ensure
			interrupted: is_interrupted
			status_set: not status.is_empty
		end

feature -- Commands

	set_visual_update_action (value: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]])
			-- Set `visual_update_action'.
		do
			visual_update_action := value
		ensure
			visual_update_action_set: visual_update_action = value
		end

	build_all
			-- Rebuild the whole system, but don't rebuild artefacts that seem to be built already.
		do
			process_subtree ("building system", False, archetype_directory.directory)
		end

	rebuild_all
			-- Force rebuild of the whole system from scratch, regardless of previous attempts.
		do
			process_subtree ("rebuilding system from scratch", True, archetype_directory.directory)
		end

	build_subtree
			-- Rebuild the sub-system at and below `archetype_directory.selected_node',
			-- but don't rebuild artefacts that seem to be built already.
		do
			process_subtree ("building sub-system", False, archetype_directory.selected_node)
		end

	rebuild_subtree
			-- Force rebuild the sub-system at and below `archetype_directory.selected_node',
			-- regardless of previous attempts.
		do
			process_subtree ("rebuilding sub-system from scratch", True, archetype_directory.selected_node)
		end

	build_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- build just the archetypes that need to be rebuilt in the lineage containing ara, down as far
			-- as ara, and not including sibling branches (since this would create errors in unrelated archetypes)
		require
			ara_attached: ara /= Void
		do
			is_interrupted := False
			status.wipe_out
			force := False
			process_lineage (ara)
		end

	rebuild_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- Force rebuild of the archetypes in the lineage containing `ara'.
		require
			ara_attached: ara /= Void
		do
			is_interrupted := False
			status.wipe_out
			force := True
			process_lineage (ara)
		end

feature {NONE} -- Implementation

	process_subtree (message: STRING; from_scratch: BOOLEAN; subtree: TWO_WAY_TREE [ARCH_REP_ITEM])
			-- Rebuild the whole system, but don't rebuild artefacts that seem to be built already.
		do
			status := "=============== " + message + " ===============%N"
			call_visual_update_action (Void)
			force := from_scratch
			is_interrupted := False
			archetype_directory.do_subtree (subtree, agent process_one_archetype_node, Void)
		end

	process_one_archetype_node (node: TWO_WAY_TREE [ARCH_REP_ITEM])
			-- Process `node', if an archetype is attached to it.
		require
			node_attached: node /= Void
		local
			ara: ARCH_REP_ARCHETYPE
		do
			ara ?= node.item

			if ara /= Void then
				process_one_archetype (ara)
			end
		end

	process_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- build just the archetypes that need to be rebuilt in the lineage containing ara, down as far
			-- as ara, and not including sibling branches (since this would create errors in unrelated archetypes)
		require
			ara_attached: ara /= Void
		local
			arch_lin: ARRAYED_LIST [ARCH_REP_ARCHETYPE]
			failed: BOOLEAN
		do
			from
				arch_lin := ara.archetype_lineage
				arch_lin.start
			until
				arch_lin.off -- or failed
			loop
				process_one_archetype (arch_lin.item)
				-- failed := not arch_lin.item.is_valid
				arch_lin.forth
			end
		end

	process_one_archetype (ara: ARCH_REP_ARCHETYPE) is
			-- Agent routine for processing one archetype.
		require
			ara_attached: ara /= Void
		do
			if not is_interrupted then
				if force or not ara.is_parsed then
					status := "------------- compiling " + ara.id.value + " -------------%N"
					call_visual_update_action (ara)
					archetype_parser.set_target (ara)
					archetype_parser.parse_archetype
					status := (archetype_parser.status)

					if archetype_parser.archetype_valid then
						archetype_parser.save_archetype_differential
						status.append (archetype_parser.status)
					end

					call_visual_update_action (ara)
				end
			end
		end

	call_visual_update_action (ara: ARCH_REP_ARCHETYPE)
			-- Call `visual_update_action', if it is attached.
		do
			if visual_update_action /= Void then
				visual_update_action.call ([ara])
			end
		end

	force: BOOLEAN
			-- If True, force processing even if archetype appears to be properly compiled already.

invariant
	status_attached: status /= Void

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
--| The Original Code is archetype_compiler.e.
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
