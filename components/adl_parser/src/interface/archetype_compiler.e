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

	build_completed: BOOLEAN
			-- True if last attempt to build a subtree succeeded

	status: STRING
			-- Last status of compiler.

	visual_update_action: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]]
			-- Called after processing each archetype (to perform GUI updates during processing).

feature -- Status

	is_interrupted: BOOLEAN
			-- Should building be cancelled immediately?

feature -- Status Setting

	interrupt
			-- Cancel building immediately.
		do
			is_interrupted := True
			status.append ("************* interrupted *************%N")
		ensure
			interrupted: is_interrupted
			status_set: not status.is_empty
		end

feature -- Commands

	set_visual_update_action (value: PROCEDURE [ANY, TUPLE [ARCH_REP_ARCHETYPE]]) is
			-- Set `visual_update_action'.
		do
			visual_update_action := value
		ensure
			visual_update_action_set: visual_update_action = value
		end

	build_all
			-- Build the whole system, but not artefacts that seem to be built already.
		do
			do_subtree (archetype_directory.directory, agent build_archetype (False, ?), "building system")
		end

	rebuild_all
			-- Rebuild the whole system from scratch, regardless of previous attempts.
		do
			do_subtree (archetype_directory.directory, agent build_archetype (True, ?), "rebuilding system from scratch")
		end

	build_subtree
			-- Build the sub-system at and below `archetype_directory.selected_node', but not artefacts that seem to be built already.
		do
			do_subtree (archetype_directory.selected_node, agent build_archetype (False, ?), "building sub-system")
		end

	rebuild_subtree
			-- Rebuild the sub-system at and below `archetype_directory.selected_node' from scratch, regardless of previous attempts.
		do
			do_subtree (archetype_directory.selected_node, agent build_archetype (True, ?), "rebuilding sub-system from scratch")
		end

	build_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- Build the archetypes in the lineage containing `ara', except those that seem to be built already.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		require
			ara_attached: ara /= Void
		do
			do_lineage (ara, agent build_archetype (False, ?))
		end

	rebuild_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- Rebuild the archetypes in the lineage containing `ara'.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		require
			ara_attached: ara /= Void
		do
			do_lineage (ara, agent build_archetype (True, ?))
		end

	export_all_html (html_export_directory: STRING) is
			-- Generate HTML under `html_export_directory' from all archetypes that have already been built.
		require
			directory_attached: html_export_directory /= Void
		do
			do_subtree (archetype_directory.directory, agent export_archetype_html (html_export_directory, False, ?), "exporting built system as html")
		end

	build_and_export_all_html (html_export_directory: STRING) is
			-- Generate HTML under `html_export_directory' from the whole system, building each archetype as necessary.
		require
			directory_attached: html_export_directory /= Void
		do
			do_subtree (archetype_directory.directory, agent export_archetype_html (html_export_directory, True, ?), "building system and exporting as html")
		end

feature {NONE} -- Implementation

	do_subtree (subtree: TWO_WAY_TREE [ARCH_REP_ITEM]; action: PROCEDURE [ANY, TUPLE [!ARCH_REP_ARCHETYPE]]; message: STRING) is
			-- Display `message' and perform `action' on the sub-system at and below `subtree'.
		require
			action_attached: action /= Void
			message_attached: message /= Void
		do
			status := create_message ("compiler_status", <<message>>)
			call_visual_update_action (Void)
			is_interrupted := False
			build_completed := False
			archetype_directory.do_subtree (subtree, agent do_if_archetype (?, action), Void)
			status := create_message ("compiler_finished_status", <<message>>)
			call_visual_update_action (Void)
			if not is_interrupted then
				build_completed := True
			end
		end

	do_lineage (ara: ARCH_REP_ARCHETYPE; action: PROCEDURE [ANY, TUPLE [!ARCH_REP_ARCHETYPE]]) is
			-- Build the archetypes in the lineage containing `ara', possibly from scratch.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		require
			ara_attached: ara /= Void
			action_attached: action /= Void
		do
			status.wipe_out
			is_interrupted := False
			ara.archetype_lineage.do_all (action)
		end

	do_if_archetype (item: ARCH_REP_ITEM; action: PROCEDURE [ANY, TUPLE [!ARCH_REP_ARCHETYPE]]) is
			-- If `item' is an archetype, perform `action' on it.
		do
			if {ara: !ARCH_REP_ARCHETYPE} item then
				action.call ([ara])
			end
		end

	build_archetype (from_scratch: BOOLEAN; ara: !ARCH_REP_ARCHETYPE) is
			-- Build `ara' only if `from_scratch' is true, or if it is has changed since it was last validly built.
		do
			if not is_interrupted then
				if from_scratch or ara.is_out_of_date then
					status := create_message("compiler_compiling_archetype", <<ara.id.value>>)
					call_visual_update_action (ara)
					ara.parse_archetype
					status := ara.compiler_status.twin
					if ara.is_valid and not ara.has_differential_file then
						ara.save_differential
						status.append (ara.status)
					end
				elseif ara.has_compiler_status then
					status := create_message ("compiler_already_attempted", <<ara.compiler_status>>)
				end
				call_visual_update_action (ara)
			end
		end

	export_archetype_html (html_export_directory: STRING; build_too: BOOLEAN; ara: !ARCH_REP_ARCHETYPE) is
			-- Generate HTML under `html_export_directory' from `ara', optionally building it first if necessary.
		require
			directory_attached: html_export_directory /= Void
		local
			filename: STRING
		do
			if not is_interrupted then
				if build_too then
					build_archetype (False, ara)
				end

				if ara.is_valid then
					filename := file_system.pathname (html_export_directory, ara.relative_path) + ".html"
					file_system.recursive_create_directory (file_system.dirname (filename))
					ara.save_flat_as (filename, "html")
					status := ara.status
					call_visual_update_action (ara)
				end
			end
		end

	call_visual_update_action (ara: ARCH_REP_ARCHETYPE) is
			-- Call `visual_update_action', if it is attached.
		do
			if visual_update_action /= Void then
				visual_update_action.call ([ara])
			end
		end

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
