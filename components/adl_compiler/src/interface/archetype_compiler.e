note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype compiler interface. This object knows how to compile a system of archetypes
				 found in the ARCHETYPE_LIBRARY.
				 ]"
	keywords:    "compiler, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_COMPILER

inherit
	BUILD_MANAGER
		redefine
			notify_build_activity, build_args_type
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
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

	Max_dependency_depth: INTEGER = 20

feature {NONE} -- Initialisation

	make
		do
		end

feature -- Notifications

	set_update_compilation_status (a_update_compilation_status_agt: attached like update_compilation_status)
		do
			update_compilation_status := a_update_compilation_status_agt
		end

	set_archetype_visual_update_agent (a_routine: attached like archetype_visual_update_agent)
			-- Set `archetype_visual_update_agent' to `a_routine'. This is an agent that will be called
			-- whenever an archetype compilation is attempted. Can be used to
		do
			archetype_visual_update_agent := a_routine
		ensure
			archetype_visual_update_agent_set: archetype_visual_update_agent = a_routine
		end

feature -- Commands

	build_artefact (ara: ARCH_LIB_ARCHETYPE)
			-- top entry point into a compile run
		do
			run_list.wipe_out
			build_lineage (ara, 0)
		end

feature {NONE} -- Build State

	from_scratch: BOOLEAN
			-- build parameter indicating to rebuild all archetypes from scratch

	run_list: ARRAYED_SET[ARCH_LIB_ARCHETYPE]
			-- list of archetypes attempted in the current compile run
		attribute
			create Result.make (0)
		end

feature {NONE} -- Commands

	console_start_progress_message: STRING
		do
			Result := get_text ({ADL_MESSAGES_IDS}.ec_compiler_building_system)
		end

	console_finish_progress_message: STRING
		do
			Result := get_msg ({ADL_MESSAGES_IDS}.ec_compiler_finished_building_system, <<current_library.archetype_count.out,
					current_library.compile_valid_count.out, current_library.compile_warnings_count.out,
					current_library.compile_errors_count.out>>)
		end

	console_interrupted_message: STRING
		do
			Result := get_text ({ADL_MESSAGES_IDS}.ec_compiler_interrupted)
		end

	do_setup_build (args: like build_args_type)
			-- set up specific build parameters
		do
			from_scratch := args.from_scratch
			artefact_count := current_library.archetype_count
		end

	do_build_all
			-- Build the whole system, but not artefacts that seem to be built already.
		do
			run_list.wipe_out
			current_library.do_all_archetypes (agent check_file_system_currency (?))
			current_library.do_all_archetypes (agent build_archetype (?, 0))
		end

	notify_build_activity
			-- generate any notifications to tell other parts of the system that compilation has occurred
		do
			current_library.notify_compile_activity
		end

feature {NONE} -- Implementation

	check_file_system_currency (ara: ARCH_LIB_ARCHETYPE)
			-- check archetype for anything that would require recompilation:
			-- * editing changes, including anything that might cause reparenting
			-- * user request to start from scratch
		do
			if not is_interrupted then
				if ara.compile_attempted then
					if ara.file_mgr.is_source_modified then
						ara.signal_source_edited
						if ara.semantic_parent_changed then
							current_library.rename_archetype (ara)
							-- FIXME - the directory data structure on which we are now traversing has changed;
							-- could cause problems...
						end
					elseif from_scratch then
						ara.signal_from_scratch
					end
				end
			end
		end

	build_lineage (ara: ARCH_LIB_ARCHETYPE; dependency_depth: INTEGER)
			-- Build the archetypes in the lineage containing `ara', except those that seem to be built already.
			-- Go down as far as `ara'. Don't build sibling branches since this would create errors in unrelated archetypes.
			-- dependency depth indicates how many dependency relationships away from original artefact
		local
			prev_state: INTEGER
		do
			prev_state := execution_state
			change_state_to (es_building)
			current_library.do_archetype_lineage (ara, agent check_file_system_currency (?))
			current_library.do_archetype_lineage (ara, agent build_archetype (?, dependency_depth))
			change_state_to (prev_state)
			notify_build_activity
		end

	build_archetype (ara: ARCH_LIB_ARCHETYPE; dependency_depth: INTEGER)
			-- Build `ara' if `from_scratch' is true, or if it is has changed since it was last successfully built.
		local
			exception_encountered: BOOLEAN
			build_status, exc_trace_str: STRING
		do
			create build_status.make_empty
			run_list.extend (ara)

			if dependency_depth <= max_dependency_depth then
				if not is_interrupted then
					if not exception_encountered then
						ara.check_compilation_currency
						if not ara.is_in_terminal_compilation_state then
							if not compiler_quiet then
								call_console_update_agent (get_msg_line ({ADL_MESSAGES_IDS}.ec_compiler_compiling_archetype, <<ara.artefact_type.as_upper, ara.id.physical_id>>))
							end

							-- first phase: compile self; populate suppliers list
							ara.compile

							-- check for id change due to compilation of ADL 1.4 archetype
							if ara.id_changed then
								current_library.move_archetype (ara)
							end

							-- second phase - needed if there are suppliers (i.e. slot-fillers or plain
							-- external references) to compile
							if ara.compilation_state = Cs_validated_self then
								across ara.suppliers_index as suppliers_csr loop
									-- avoid recompiling same artefacts again due to cycles in dependency graph
									if not run_list.has (suppliers_csr.item) then
										build_lineage (suppliers_csr.item, dependency_depth + 1)
									end
								end

								-- determine if we get to final validation state, depending on situation with supplier compilation
								ara.signal_suppliers_compiled

								-- if we are validated, then all suppliers are valid;
								-- Now go and perform operations that can only be done when the suppliers are successfully compiled
								if ara.compilation_state = Cs_validated_closure then
									ara.compile
								end
							end

							call_archetype_visual_update_agent (ara)
							update_progress

							if global_error_reporting_level = Error_type_debug then
								call_debug_update_agent (ara.errors.as_string, dependency_depth)
							end

						elseif global_error_reporting_level = Error_type_debug then
							if ara.is_valid then
								if ara.errors.has_warnings then
									build_status := get_msg_line ({ADL_MESSAGES_IDS}.ec_compiler_already_attempted_validated_with_warnings, <<ara.artefact_type.as_upper, ara.id.physical_id, ara.error_strings>>)
								else
									build_status := get_msg_line ({ADL_MESSAGES_IDS}.ec_compiler_already_attempted_validated, <<ara.artefact_type.as_upper, ara.id.physical_id>>)
								end
							else
								build_status := get_msg_line ({ADL_MESSAGES_IDS}.ec_compiler_already_attempted_failed, <<ara.artefact_type.as_upper, ara.id.physical_id, ara.error_strings>>)
							end
							call_debug_update_agent (build_status, dependency_depth)
						end
					else
						ara.signal_exception
						call_archetype_visual_update_agent (ara)
						if global_error_reporting_level = Error_type_debug then
							call_debug_update_agent (ara.error_strings, dependency_depth)
						end
					end
				end
			else
				ara.signal_exception
				call_archetype_visual_update_agent (ara)
				call_console_update_agent (get_msg_line ({ADL_MESSAGES_IDS}.ec_compiler_infinite_regress, <<ara.id.physical_id, dependency_depth.out>>))
			end
		rescue
			if attached exception_trace as et then
				exc_trace_str := et
			else
				create exc_trace_str.make_from_string (get_text ({ADL_MESSAGES_IDS}.ec_compiler_exception_trace_unavailable))
			end
			call_console_update_agent (get_msg ({ADL_MESSAGES_IDS}.ec_compile_exception, <<ara.qualified_name, exception.out, exc_trace_str>>))
			exception_encountered := True
			retry
		end

	archetype_visual_update_agent: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]]
			-- Called after processing each archetype (to perform GUI updates during processing).

	call_debug_update_agent (a_msg: STRING; dependency_depth: INTEGER)
			-- Call `console_update_agent', with a build status of an archetype, indented according to its dependency level
		do
			if attached console_update_agent as ua then
				ua.call ([create {STRING}.make_filled ('%T', dependency_depth) + a_msg])
			end
		end

	call_archetype_visual_update_agent (ara: ARCH_LIB_ARCHETYPE)
			-- Call `archetype_visual_update_agent', if it is attached.
		do
			if attached archetype_visual_update_agent as ua then
				ua.call ([ara])
			end
		--	update_compilation_status.call ([total_count, valid_count, warning_count, error_count])
		end

	update_compilation_status: detachable PROCEDURE [ANY, TUPLE [a_total, a_valid_count, a_warn_count, an_err_count: INTEGER]]
			-- update the compilation status text
		note
			option: stable
		attribute
		end

	build_args_type: TUPLE [from_scratch: BOOLEAN]
		do
			create Result
		end

end
