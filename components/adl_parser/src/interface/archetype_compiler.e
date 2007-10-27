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

feature -- Initialisation

	make is
		do
			create status.make (0)
		end

feature -- Access

	status: STRING
			-- Last status of compiler.

	visual_update_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]]
			-- Called after processng each archetype (to perform GUI updates during processing).

feature -- Commands

	set_visual_update_action (value: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]])
			-- Set `visual_update_action'.
		do
			visual_update_action := value
		end

	build_all
			-- Rebuild the whole system, but don't rebuild artefacts that seem to already be built.
		do
			status.wipe_out
			status.append ("=============== building system ===============%N")
			force := False
			archetype_directory.do_all_archetype (agent process_one_archetype, visual_update_action)
		end

	rebuild_all
			-- Force rebuild the whole system from scratch, regardless of previous previous attempts.
		do
			status.wipe_out
			status.append ("=============== rebuilding system from scratch ===============%N")
			force := True
			archetype_directory.do_all_archetype (agent process_one_archetype, visual_update_action)
		end

	build_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- build just the archetypes that need to be rebuilt in the lineage containing ara, down as far
			-- as ara, and not including sibling branches (since this would create errors in unrelated archetypes)
		require
			ara /= Void
		do
			status.wipe_out
			force := False
			process_lineage (ara)
		end

	rebuild_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- force rebuild of the archetypes in the lineage containing ara
		require
			ara /= Void
		do
			status.wipe_out
			force := True
			process_lineage (ara)
		end

feature {NONE} -- Implementation

	process_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- build just the archetypes that need to be rebuilt in the lineage containing ara, down as far
			-- as ara, and not including sibling branches (since this would create errors in unrelated archetypes)
		local
			arch_lin: ARRAYED_LIST [ARCH_REP_ARCHETYPE]
		do
			from
				arch_lin := ara.archetype_lineage
				arch_lin.start
			until
				arch_lin.off
			loop
				process_one_archetype (arch_lin.item)

				if visual_update_action /= Void then
					visual_update_action.call ([arch_lin.item])
				end

				arch_lin.forth
			end
		end

	process_one_archetype (ara: ARCH_REP_ARCHETYPE) is
			-- agent routine for processing one archetype
		do
			if force or not ara.is_parsed then
				status.append ("------------- compiling " + ara.id.value + " -------------%N")
				archetype_parser.set_target (ara)
				archetype_parser.parse_archetype
				status.append (archetype_parser.status)

				if archetype_parser.archetype_valid then
					archetype_parser.save_archetype_differential
					status.append (archetype_parser.status)
				end
			end
		end

	force: BOOLEAN
			-- If True, force processing even if archetype appears to be properly compiled already.

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
