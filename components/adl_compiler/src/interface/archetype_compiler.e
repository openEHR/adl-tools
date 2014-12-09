note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype compiler interface. This object knows how to compile a system of archetypes
				 found in the ARCHETYPE_CATALOG.
				 ]"
	keywords:    "compiler, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_COMPILER

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_ARCHETYPE_SERIALISERS
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

feature -- Definitions

	max_dependency_depth: INTEGER = 20

feature {NONE} -- Initialisation

	make
		do
		end

feature -- Access

	total_count: INTEGER
			-- total count of artefacts compiled in this run

	valid_count: INTEGER
			-- validated artefacts compiled in this run

	warning_count: INTEGER
			-- validated artefacts with warnings compiled in this run

	error_count: INTEGER
			-- error count of artefacts compiled in this run

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
			call_console_update_action ("************* interrupted *************%N")
		ensure
			interrupted: is_interrupt_requested
		end

feature -- Modification

	set_update_compilation_status (a_update_compilation_status_agt: attached like update_compilation_status)
		do
			update_compilation_status := a_update_compilation_status_agt
		end

	set_full_compile_visual_update_action (a_routine: attached like full_compile_visual_update_action)
			-- Set `full_compile_visual_update_action'.
		do
			full_compile_visual_update_action := a_routine
		ensure
			full_compile_visual_update_action_set: full_compile_visual_update_action = a_routine
		end

	set_console_update_action (a_routine: attached like console_update_action)
			-- Set `console_update_action'.
		do
			console_update_action := a_routine
		ensure
			console_update_action_set: console_update_action = a_routine
		end

	set_archetype_visual_update_action (a_routine: attached like archetype_visual_update_action)
			-- Set `archetype_visual_update_action'.
		do
			archetype_visual_update_action := a_routine
		ensure
			archetype_visual_update_action_set: archetype_visual_update_action = a_routine
		end

feature -- Commands

	reset
		do
			if not is_interrupt_requested then
				total_count := 0
				valid_count := 0
				warning_count := 0
				error_count := 0
			end
		end

	build_all
			-- Build the whole system, but not artefacts that seem to be built already.
		do
			reset
			is_full_build_completed := False
			is_building := True
			call_console_update_action (get_msg_line (ec_compiler_building_system, Void))
			do_all (agent check_file_system_currency (False, ?))
			do_all (agent build_archetype (?, 0))
			is_full_build_completed := not is_interrupt_requested
			is_building := False
			call_console_update_action (get_msg_line (ec_compiler_finished_building_system, Void))
			if is_full_build_completed then
				call_full_compile_visual_update_action
			end
		end

	rebuild_all
			-- Rebuild the whole system from scratch, regardless of previous attempts.
		do
			reset
			is_full_build_completed := False
			is_building := True
			call_console_update_action(get_msg_line (ec_compiler_rebuilding_system, Void))
			do_all (agent check_file_system_currency (True, ?))
			do_all (agent build_archetype (?, 0))
			is_full_build_completed := not is_interrupt_requested
			is_building := False
			call_console_update_action (get_msg_line (ec_compiler_finished_rebuilding_system, Void))
			if is_full_build_completed then
				call_full_compile_visual_update_action
			end
		end

	build_subtree (aci: ARCH_LIB_ITEM)
			-- Build the sub-system at and below `aci', but not artefacts that seem to be built already.
		do
			reset
			is_building := True
			call_console_update_action (get_msg_line (ec_compiler_building_subtree, Void))
			do_subtree (aci, agent check_file_system_currency (False, ?))
			do_subtree (aci, agent build_archetype (?, 0))
			is_building := False
			call_console_update_action (get_msg_line (ec_compiler_finished_building_subtree, Void))
		end

	rebuild_subtree (aci: ARCH_LIB_ITEM)
			-- Rebuild the sub-system at and below `aci' from scratch, regardless of previous attempts.
		do
			reset
			is_building := True
			call_console_update_action (get_msg_line (ec_compiler_rebuilding_subtree, Void))
			do_subtree (aci, agent check_file_system_currency (True, ?))
			do_subtree (aci, agent build_archetype (?, 0))
			call_console_update_action (get_msg_line (ec_compiler_finished_rebuilding_subtree, Void))
			is_building := False
		end

	build_lineage (ara: ARCH_LIB_ARCHETYPE_ITEM; dependency_depth: INTEGER)
			-- Build the archetypes in the lineage containing `ara', except those that seem to be built already.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
			-- dependency depth indicates how many dependency relationships away from original artefact
		do
			is_building := True
			do_lineage (ara, agent check_file_system_currency (False, ?))
			do_lineage (ara, agent build_archetype (?, dependency_depth))
			is_building := False
		end

	rebuild_lineage (ara: ARCH_LIB_ARCHETYPE_ITEM; dependency_depth: INTEGER)
			-- Rebuild the archetypes in the lineage containing `ara'.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		do
			is_building := True
			do_lineage (ara, agent check_file_system_currency (True, ?))
			do_lineage (ara, agent build_archetype (?, dependency_depth))
			is_building := False
		end

	export_all (an_export_dir, a_syntax: STRING)
			-- Generate `a_syntax' serialisation of archetypes under `an_export_dir' from all archetypes that have already been built.
		do
			call_console_update_action (get_msg_line (ec_compiler_export, <<a_syntax, an_export_dir>>))
			do_all (agent export_archetype (an_export_dir, a_syntax, False, ?))
			call_console_update_action (get_msg_line (ec_compiler_finished_export, Void))
		end

	build_and_export_all (an_export_dir, a_syntax: STRING)
			-- Generate `a_syntax' serialisation of archetypes under `an_export_dir' from the whole system, building each archetype as necessary.
		do
			is_full_build_completed := False
			is_building := True
			reset
			call_console_update_action (get_msg_line (ec_compiler_build_and_export, <<a_syntax, an_export_dir>>))
			do_all (agent export_archetype (an_export_dir, a_syntax, True, ?))
			is_full_build_completed := not is_interrupt_requested
			is_building := False
			call_console_update_action (get_msg_line (ec_compiler_finished_build_and_export, Void))
		end

feature {NONE} -- Implementation

	do_all (action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE_ITEM]])
			-- Perform `action' on the sub-system at and below `subtree'.
		do
			is_interrupt_requested := False
			current_library.do_all_archetypes (action)
		end

	do_subtree (subtree: ARCH_LIB_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE_ITEM]])
			-- Perform `action' on the sub-system at and below `subtree'.
		do
			is_interrupt_requested := False
			current_library.do_archetypes (subtree, action)
		end

	do_lineage (ara: ARCH_LIB_ARCHETYPE_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE_ITEM]])
			-- Build the archetypes in the lineage containing `ara', possibly from scratch.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
		do
			current_library.do_archetype_lineage(ara, action)
		end

	check_file_system_currency (from_scratch: BOOLEAN; ara: ARCH_LIB_ARCHETYPE_ITEM)
			-- check archetype for anything that would require recompilation:
			-- * editing changes, including anything that might cause reparenting
			-- * user request to start from scratch
		do
			if not is_interrupt_requested then
				if ara.compile_attempted then
					if ara.file_mgr.is_source_modified then
						ara.signal_source_edited
						if ara.semantic_location_changed then
							current_library.update_archetype_id (ara)
							-- FIXME - the directory data structure on which we are now traversing has changed;
							-- could cause problems...
						end
					elseif from_scratch then
						ara.signal_from_scratch
					end
				end
			end
		end

	build_archetype (ara: ARCH_LIB_ARCHETYPE_ITEM; dependency_depth: INTEGER)
			-- Build `ara' only if `from_scratch' is true, or if it is has changed since it was last validly built.
		local
			exception_encountered: BOOLEAN
			build_status, exc_trace_str: STRING
		do
			create build_status.make_empty
			if dependency_depth <= max_dependency_depth then
				if not is_interrupt_requested then
					if not exception_encountered then
						ara.check_compilation_currency
						if not ara.is_in_terminal_compilation_state then
							if global_error_reporting_level = Error_type_debug then
								call_console_update_action (get_msg_line (ec_compiler_compiling_archetype, <<ara.artefact_type.type_name.as_upper, ara.id.physical_id>>))
							end

							-- first phase
							ara.compile

							-- second phase - needed if there are suppliers (i.e. slot-fillers or plain
							-- external references) to compile first
							if ara.compilation_state = Cs_suppliers_known then
								across ara.suppliers_index as suppliers_csr loop
									-- allow supplier loops, so avoid cycling back into current archetype
									if suppliers_csr.item /= ara then
										build_lineage (suppliers_csr.item, dependency_depth+1)
									end
								end

								-- continue compilation - remaining steps after suppliers compilation
								ara.signal_suppliers_compiled
								ara.compile
							end

							update_counts (ara)
							call_archetype_visual_update_action (ara)

							if global_error_reporting_level = Error_type_debug then
								call_debug_update_action (ara.errors.as_string, dependency_depth)
							end

						elseif global_error_reporting_level = Error_type_debug then
							if ara.is_valid then
								if not ara.errors.is_empty then
									build_status := get_msg_line (ec_compiler_already_attempted_validated_with_warnings, <<ara.artefact_type.type_name.as_upper, ara.id.physical_id, ara.error_strings>>)
								else
									build_status := get_msg_line (ec_compiler_already_attempted_validated, <<ara.artefact_type.type_name.as_upper, ara.id.physical_id>>)
								end
							else
								build_status := get_msg_line (ec_compiler_already_attempted_failed, <<ara.artefact_type.type_name.as_upper, ara.id.physical_id, ara.error_strings>>)
							end
							call_debug_update_action (build_status, dependency_depth)
						end
					else
						ara.signal_exception
						update_counts (ara)
						call_archetype_visual_update_action (ara)
						if global_error_reporting_level = Error_type_debug then
							call_debug_update_action (ara.error_strings, dependency_depth)
						end
					end
				end
			else
				ara.signal_exception
				update_counts (ara)
				call_archetype_visual_update_action (ara)
				call_console_update_action (get_msg_line (ec_compiler_infinite_regress, <<ara.id.physical_id, dependency_depth.out>>))
			end
		rescue
			if attached exception_trace as et then
				exc_trace_str := et
			else
				create exc_trace_str.make_from_string ("(Exception trace not available)")
			end
			call_console_update_action (get_msg (ec_compile_exception, <<ara.qualified_name, exception.out, exc_trace_str>>))
			exception_encountered := True
			retry
		end

	export_archetype (an_export_dir, a_syntax: STRING; build_too: BOOLEAN; ara: ARCH_LIB_ARCHETYPE_ITEM)
			-- Generate serialised output under `an_export_dir' from `ara', optionally building it first if necessary.
		require
			has_serialiser_format (a_syntax)
		local
			filename, exc_trace_str: STRING
			exception_encountered: BOOLEAN
		do
			if not exception_encountered  then
				if not is_interrupt_requested then
					if build_too then
						build_archetype (ara, 0)
					end

					if ara.is_valid then
						check attached file_system.pathname (an_export_dir, ara.id.physical_id) as pn and then attached archetype_file_extensions.item (a_syntax) as ext then
							filename := pn + ext
						end
						ara.save_flat_as (filename, a_syntax)
					end
				end
			end
		rescue
			if attached exception_trace as et then
				exc_trace_str := et
			else
				create exc_trace_str.make_from_string ("(Exception trace not available)")
			end
			call_console_update_action (get_msg (ec_export_exception, <<ara.qualified_name, exception.out, exc_trace_str>>))
			exception_encountered := True
			retry
		end

	call_full_compile_visual_update_action
			-- Call `full_compile_visual_update_action', if it is attached.
		do
			if attached full_compile_visual_update_action as ua then
				ua.call ([])
			end
		end

	call_console_update_action (a_msg: STRING)
			-- Call `console_update_action', if it is attached.
		do
			if attached console_update_action as ua then
				ua.call ([a_msg])
			end
		end

	call_debug_update_action (a_msg: STRING; dependency_depth: INTEGER)
			-- Call `console_update_action', with a build status of an archetype, indented according to its dependency level
		do
			if attached console_update_action as ua then
				ua.call ([create {STRING}.make_filled ('%T', dependency_depth) + a_msg])
			end
		end

	call_archetype_visual_update_action (ara: ARCH_LIB_ARCHETYPE_ITEM)
			-- Call `archetype_visual_update_action', if it is attached.
		do
			if attached archetype_visual_update_action as ua then
				ua.call ([ara])
			end
			update_compilation_status.call ([total_count, valid_count, warning_count, error_count])
		end

	full_compile_visual_update_action: detachable PROCEDURE [ANY, TUPLE]
			-- Called after complete build

	console_update_action: detachable PROCEDURE [ANY, TUPLE[STRING]]
			-- Called after global processing to perform GUI updates

	archetype_visual_update_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE_ITEM]]
			-- Called after processing each archetype (to perform GUI updates during processing).

	update_compilation_status: detachable PROCEDURE [ANY, TUPLE [a_total, a_valid_count, a_warn_count, an_err_count: INTEGER]]
			-- update the compilation status text
		note
			option: stable
		attribute
		end

	update_counts (ara: ARCH_LIB_ARCHETYPE_ITEM)
			-- update compilation counts
		do
			total_count := total_count + 1
			if ara.is_valid then
				if not ara.errors.is_empty then
					warning_count := warning_count + 1
				else
					valid_count := valid_count + 1
				end
			else
				error_count := error_count + 1
			end
		end

end



