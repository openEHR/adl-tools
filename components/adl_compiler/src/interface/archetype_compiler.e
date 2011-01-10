note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype compiler interface. This object knows how to compile a system of archetypes
				 found in the ARCHETYPE_DIRECTORY.
				 ]"
	keywords:    "compiler, archetype, ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://svn.openehr.org/ref_impl_eiffel/BRANCHES/specialisation/components/adl_parser/src/interface/archetype_parser.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2007-10-02 16:49:19 +0100 (Tue, 02 Oct 2007) $"

class ARCHETYPE_COMPILER

inherit
	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_APP_RESOURCES
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPILATION_STATES
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

	make
		do
			is_interrupt_requested := True
		end

feature -- Access

	global_visual_update_action: PROCEDURE [ANY, TUPLE[STRING]]
			-- Called after global processing to perform GUI updates

	archetype_visual_update_action: PROCEDURE [ANY, TUPLE [STRING, ARCH_REP_ARCHETYPE, INTEGER]]
			-- Called after processing each archetype (to perform GUI updates during processing).

feature -- Status

	is_full_build_completed: BOOLEAN
			-- True if last attempt to build the whole system succeeded

	is_building: BOOLEAN
			-- is building underway?

	is_interrupt_requested: BOOLEAN
			-- Should building be cancelled immediately?

feature -- Status Setting

	signal_interrupt
			-- Cancel building immediately.
		do
			is_interrupt_requested := True
			call_global_visual_update_action ("************* interrupted *************%N")
		ensure
			interrupted: is_interrupt_requested
		end

feature -- Modification

	set_global_visual_update_action (a_routine: attached PROCEDURE [ANY, TUPLE[STRING]])
			-- Set `global_visual_update_action'.
		do
			global_visual_update_action := a_routine
		ensure
			global_visual_update_action_set: global_visual_update_action = a_routine
		end

	set_archetype_visual_update_action (a_routine: attached PROCEDURE [ANY, TUPLE [STRING, ARCH_REP_ARCHETYPE, INTEGER]])
			-- Set `archetype_visual_update_action'.
		do
			archetype_visual_update_action := a_routine
		ensure
			archetype_visual_update_action: archetype_visual_update_action = a_routine
		end

feature -- Commands

	build_all
			-- Build the whole system, but not artefacts that seem to be built already.
		do
			is_full_build_completed := False
			is_building := True
			call_global_visual_update_action(create_message_line ("compiler_building_system", Void))
			do_all (agent check_file_system_currency (False, ?))
			do_all (agent build_archetype (?, 0))
			is_full_build_completed := not is_interrupt_requested
			is_building := False
			call_global_visual_update_action(create_message_line ("compiler_finished_building_system", Void))
		end

	rebuild_all
			-- Rebuild the whole system from scratch, regardless of previous attempts.
		do
			is_full_build_completed := False
			is_building := True
			call_global_visual_update_action(create_message_line ("compiler_rebuilding_system", Void))
			do_all (agent check_file_system_currency (True, ?))
			do_all (agent build_archetype (?, 0))
			is_full_build_completed := not is_interrupt_requested
			is_building := False
			call_global_visual_update_action(create_message_line ("compiler_finished_rebuilding_system", Void))
		end

	build_subtree
			-- Build the sub-system at and below `archetype_directory.selected_node', but not artefacts that seem to be built already.
		do
			is_building := True
			call_global_visual_update_action(create_message_line ("compiler_building_subtree", Void))
			do_subtree (current_arch_dir.selected_item, agent check_file_system_currency (False, ?))
			do_subtree (current_arch_dir.selected_item, agent build_archetype (?, 0))
			is_building := False
			call_global_visual_update_action(create_message_line ("compiler_finished_building_subtree", Void))
		end

	rebuild_subtree
			-- Rebuild the sub-system at and below `archetype_directory.selected_node' from scratch, regardless of previous attempts.
		do
			is_building := True
			call_global_visual_update_action(create_message_line ("compiler_rebuilding_subtree", Void))
			do_subtree (current_arch_dir.selected_item, agent check_file_system_currency (True, ?))
			do_subtree (current_arch_dir.selected_item, agent build_archetype (?, 0))
			call_global_visual_update_action(create_message_line ("compiler_finished_rebuilding_subtree", Void))
			is_building := False
		end

	build_lineage (ara: attached ARCH_REP_ARCHETYPE; dependency_depth: INTEGER)
			-- Build the archetypes in the lineage containing `ara', except those that seem to be built already.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
			-- dependency depth indicates how many dependency relationships away from original artefact
		do
			is_building := True
			do_lineage (ara, agent check_file_system_currency (False, ?))
			do_lineage (ara, agent build_archetype (?, dependency_depth))
			is_building := False
		end

	rebuild_lineage (ara: attached ARCH_REP_ARCHETYPE; dependency_depth: INTEGER)
			-- Rebuild the archetypes in the lineage containing `ara'.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		do
			is_building := True
			do_lineage (ara, agent check_file_system_currency (True, ?))
			do_lineage (ara, agent build_archetype (?, dependency_depth))
			is_building := False
		end

	export_all_html (a_html_export_directory: attached STRING)
			-- Generate HTML under `html_export_directory' from all archetypes that have already been built.
		do
			call_global_visual_update_action(create_message_line ("compiler_export_html", Void))
			do_all (agent export_archetype_html (a_html_export_directory, False, ?))
			call_global_visual_update_action(create_message_line ("compiler_finished_export_html", Void))
		end

	build_and_export_all_html (a_html_export_directory: attached STRING)
			-- Generate HTML under `html_export_directory' from the whole system, building each archetype as necessary.
		do
			is_full_build_completed := False
			is_building := True
			call_global_visual_update_action(create_message_line ("compiler_build_and_export_html", Void))
			do_all (agent export_archetype_html (a_html_export_directory, True, ?))
			is_full_build_completed := not is_interrupt_requested
			is_building := False
			call_global_visual_update_action(create_message_line ("compiler_finished_build_and_export_html", Void))
		end

feature {NONE} -- Implementation

	do_all (action: attached PROCEDURE [ANY, TUPLE [attached ARCH_REP_ARCHETYPE]])
			-- Perform `action' on the sub-system at and below `subtree'.
		do
			is_interrupt_requested := False
			current_arch_dir.do_all_archetypes (action)
		end

	do_subtree (subtree: ARCH_REP_ITEM; action: attached PROCEDURE [ANY, TUPLE [attached ARCH_REP_ARCHETYPE]])
			-- Perform `action' on the sub-system at and below `subtree'.
		do
			is_interrupt_requested := False
			current_arch_dir.do_archetypes (subtree, action)
		end

	do_lineage (ara: attached ARCH_REP_ARCHETYPE; action: attached PROCEDURE [ANY, TUPLE [attached ARCH_REP_ARCHETYPE]])
			-- Build the archetypes in the lineage containing `ara', possibly from scratch.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		do
			is_interrupt_requested := False
			current_arch_dir.do_archetype_lineage(ara, action)
		end

	check_file_system_currency (from_scratch: BOOLEAN; ara: attached ARCH_REP_ARCHETYPE)
			-- check archetype for anything that would require recompilation:
			-- * editing changes, including anything that might cause reparenting
			-- * user request to start from scratch
		do
			if not is_interrupt_requested then
				if ara.compile_attempted then
					if ara.is_source_modified then
						ara.signal_source_edited
						if ara.ontology_location_changed then
							current_arch_dir.update_archetype_id(ara)
							-- FIXME - the directory data structure on which we are now traversing has changed;
							-- could cause problems...
						end
					elseif from_scratch then
						ara.signal_from_scratch
					end
				end
			end
		end

	build_archetype (ara: attached ARCH_REP_ARCHETYPE; dependency_depth: INTEGER)
			-- Build `ara' only if `from_scratch' is true, or if it is has changed since it was last validly built.
		local
			exception_encountered: BOOLEAN
			build_status: STRING
		do
			if not is_interrupt_requested then
				if not exception_encountered then
					ara.check_compilation_currency
					if not ara.is_in_terminal_compilation_state then
						build_status := create_message_line("compiler_compiling_archetype", <<ara.artefact_name.as_upper, ara.id.value>>)
						call_archetype_visual_update_action (build_status, ara, dependency_depth)

						-- first phase
						ara.compile

						-- second phase - needed if there are suppliers (i.e. slot-fillers or plain
						-- external references) to compile first
						if ara.compilation_state = Cs_suppliers_known then
							from ara.suppliers_index.start until ara.suppliers_index.off loop
								build_lineage (ara.suppliers_index.item_for_iteration, dependency_depth+1)
								ara.suppliers_index.forth
							end

							-- continue compilation - remaining steps after suppliers compilation
							ara.signal_suppliers_compiled
							ara.compile
						end
						build_status := ara.errors.as_string

					elseif ara.is_valid then
						if not ara.errors.is_empty then
							build_status := create_message_line ("compiler_already_attempted_validated_with_warnings", <<ara.artefact_name.as_upper, ara.id.value, ara.errors.as_string>>)
						else
							build_status := create_message_line ("compiler_already_attempted_validated", <<ara.artefact_name.as_upper, ara.id.value>>)
						end
					else
						build_status := create_message_line ("compiler_already_attempted_failed", <<ara.artefact_name.as_upper, ara.id.value, ara.errors.as_string>>)
					end
					build_status.append (ara.status)
					call_archetype_visual_update_action (build_status, ara, dependency_depth)
				else
					ara.signal_exception
					call_archetype_visual_update_action (billboard.content, ara, dependency_depth)
					billboard.clear
				end
			end
		rescue
			post_error(Current, "build_archetype", "compile_exception", <<ara.ontological_name, exception.out, exception_trace>>)
			exception_encountered := True
			retry
		end

	export_archetype_html (a_html_export_directory: STRING; build_too: BOOLEAN; ara: attached ARCH_REP_ARCHETYPE)
			-- Generate HTML under `html_export_directory' from `ara', optionally building it first if necessary.
		require
			directory_attached: a_html_export_directory /= Void
		local
			filename: STRING
		do
			if not is_interrupt_requested then
				if build_too then
					build_archetype (ara, 0)
				end

				if ara.is_valid then
					filename := file_system.pathname (a_html_export_directory, ara.relative_path) + Archetype_web_page_extension
					file_system.recursive_create_directory (file_system.dirname (filename))
					ara.save_flat_as (filename, Archetype_web_syntax)
					call_archetype_visual_update_action (ara.status, ara, 0)
				end
			end
		end

	call_global_visual_update_action (msg: STRING)
			-- Call `global_visual_update_action', if it is attached.
		do
			if global_visual_update_action /= Void then
				global_visual_update_action.call ([msg])
			end
		end

	call_archetype_visual_update_action (msg: STRING; ara: ARCH_REP_ARCHETYPE; dependency_depth: INTEGER)
			-- Call `archetype_visual_update_action', if it is attached.
		do
			if archetype_visual_update_action /= Void then
				archetype_visual_update_action.call ([msg, ara, dependency_depth])
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
