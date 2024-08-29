note
	component:   "openEHR ADL Tools"
	description: "[
				 Generic build manager. Descendants of this class are able to build some product, with a 
				 buld process that can report progress and be interrupted.
				 ]"
	keywords:    "build, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BUILD_MANAGER

inherit
	EXCEPTIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Definitions

	Progress_increment_percent: INTEGER = 3

	es_initial: INTEGER = 0
	es_is_setup: INTEGER = 1
	es_building: INTEGER = 2
	es_interrupted: INTEGER = 3
	es_completed: INTEGER = 4

	max_state: INTEGER
		once
			Result := es_completed
		end

feature -- Access

	execution_state: INTEGER

	artefact_count: INTEGER
			-- total number of artefacts to build; used to initialise progress counting

feature -- Status

	is_interrupted: BOOLEAN
			-- True if  execution_state = es_interrupted
		do
			Result := execution_state = es_interrupted
		end

	is_building: BOOLEAN
			-- True if  execution_state = es_interrupted
		do
			Result := execution_state = es_building
		end

	in_initial_state: BOOLEAN
			-- True if  execution_state = es_interrupted
		do
			Result := execution_state = es_initial
		end

feature -- Notifications

	set_console_update_agent (a_routine: attached like console_update_agent)
			-- Set `console_update_agent'.
		do
			console_update_agent := a_routine
		ensure
			console_update_agent: console_update_agent = a_routine
		end

	set_build_complete_visual_update_agent (a_routine: attached like build_complete_visual_update_agent)
			-- Set `build_complete_visual_update_agent'.
		do
			build_complete_visual_update_agent := a_routine
		ensure
			build_complete_visual_update_agent = a_routine
		end

	set_progress_agents (a_initialise_progress_agent: attached like initialise_progress_agent;
		a_set_progress_current_val_agent: attached like set_progress_current_val_agent)
			-- set agents that will be called during a build run
		do
			old_initialise_progress_agent := initialise_progress_agent
			old_set_progress_current_val_agent := set_progress_current_val_agent
			initialise_progress_agent := a_initialise_progress_agent
			set_progress_current_val_agent := a_set_progress_current_val_agent
		end

	set_new_state_change_listener (an_agent: PROCEDURE [ANY, TUPLE])
		do
			old_state_change_listener := state_change_listener
			state_change_listener := an_agent
		end

feature -- Commands

	setup_build (args: like build_args_type)
			-- set up specific build parameters
		require
			execution_state = es_initial
		do
			if valid_setup_args (args) then
				do_setup_build (args)
				change_state_to (es_is_setup)
			end
		ensure
			valid_setup_args (args) implies execution_state = es_is_setup
			Artefact_count_setup: artefact_count > 0
		end

	build_all
			-- commence build process
		require
			execution_state >= es_is_setup
		do
			start_progress
			change_state_to (es_building)
			do_build_all
			notify_build_activity
			if execution_state /= es_interrupted then
				finish_progress
				change_state_to (es_completed)
				finalise_build
			end
		ensure
			execution_state = es_interrupted or execution_state = es_initial
		end

	resume_build
			-- resume an interrupted build process
		require
			execution_state = es_interrupted
		do
			change_state_to (es_building)
			do_build_all
			notify_build_activity
			if execution_state /= es_interrupted then
				finish_progress
				change_state_to (es_completed)
				finalise_build
			end
		ensure
			execution_state = es_interrupted or execution_state = es_initial
		end

	interrupt_build
			-- Cancel building immediately.
		require
			execution_state > es_is_setup
		do
			change_state_to (es_interrupted)
			call_console_update_agent (console_interrupted_message)
		ensure
			execution_state = es_interrupted
		end

	finalise_build
			-- will be called automatically after any successfully complete build run to perform any cleanup
			-- Can also be called manually if build was interrupted and cleanup still needed
		require
			execution_state > es_initial
		do
			do_finalise_build
			change_state_to (es_initial)
		ensure
			execution_state = es_initial
		end

	build_artefact (ara: ARCH_LIB_ARCHETYPE)
			-- just build a single artefact, don't do anything else
		deferred
		end

feature {NONE} -- Commands

	do_setup_build (args: like build_args_type)
			-- set up specific build parameters
		deferred
		end

	valid_setup_args (args: like build_args_type): BOOLEAN
		do
			Result := True
		end

	do_build_all
		deferred
		end

	do_finalise_build
		do
		end

	console_start_progress_message: STRING
		deferred
		end

	console_finish_progress_message: STRING
		deferred
		end

	console_interrupted_message: STRING
		deferred
		end

	notify_build_activity
			-- generate any notifications to tell other parts of the system that compilation has occurred
		do
		end

feature {NONE} -- Implementation

	change_state_to (new_state: INTEGER)
		require
			new_state >= es_initial and new_state <= max_state
		do
			execution_state := new_state
			notify_state_change_listeners
		end

	call_console_update_agent (a_msg: STRING)
			-- Call `console_update_agent', if it is attached.
		do
			if attached console_update_agent as ua and not a_msg.is_empty then
				ua.call ([a_msg])
			end
		end

	console_update_agent: detachable PROCEDURE [ANY, TUPLE[STRING]]
			-- Called after global processing to perform GUI updates

	initialise_progress_agent: detachable PROCEDURE [ANY, TUPLE[INTEGER]]

	set_progress_current_val_agent: detachable PROCEDURE [ANY, TUPLE[INTEGER]]

	old_initialise_progress_agent: like initialise_progress_agent

	old_set_progress_current_val_agent: like set_progress_current_val_agent

	build_complete_visual_update_agent: detachable PROCEDURE [ANY, TUPLE]
			-- Called after completed build

	state_change_listener: detachable PROCEDURE [ANY, TUPLE]

	old_state_change_listener: detachable PROCEDURE [ANY, TUPLE]

	notify_state_change_listeners
		do
			if attached state_change_listener as scl then
				scl.call ([])
			end
		end

	progress_count: INTEGER

	progress_increment: INTEGER

	start_progress
		require
			artefact_count > 0
		do
			progress_count := 0
			if attached initialise_progress_agent as att_init_agent then
				progress_increment := (artefact_count * progress_increment_percent / 100).ceiling
				att_init_agent.call ([artefact_count])
			end
			call_console_update_agent (console_start_progress_message)
		end

	update_progress
		do
			if progress_increment > 0 then
				progress_count := progress_count + 1
				if attached set_progress_current_val_agent as att_set_val_agent then
					if progress_count \\ progress_increment = 0 then
						att_set_val_agent.call ([progress_count])
					end
				end
			end
		end

	finish_progress
		do
			if attached set_progress_current_val_agent as att_set_val_agent then
				att_set_val_agent.call ([0])
			end
			call_console_update_agent (console_finish_progress_message)
			if attached build_complete_visual_update_agent as ua then
				ua.call ([])
			end
		end

	build_args_type: TUPLE
		do
			create Result
		end

end
