note
	component:   "openEHR ADL Tools"
	description: "VCS command runner for repositories dialog window"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_COMMAND_RUNNER

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_parent_dialog: REPOSITORY_DIALOG)
			-- make with reverse ref to owning dialog
		do
			parent_dialog := a_parent_dialog
			repository_action := agent do_nothing
		end

feature -- Actions

	do_action (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE; an_action: PROCEDURE [ANY, TUPLE])
			-- perform action on repository
		require
			a_rep_if.has_repository_tool
		do
			repository_interface := a_rep_if
			repository_action := an_action
			do_repository_action
		end

feature {NONE} -- Implementation

	do_repository_action
			-- lauch repository action
		do
			-- set status update to agent that will do live update from to the grid status cell
			old_stdout_agent := stdout_agent
			set_stdout_agent (agent parent_dialog.update_grid_install_status)
			old_stderr_agent := stderr_agent
			set_stderr_agent (agent parent_dialog.update_grid_install_status)

			parent_dialog.ok_cancel_buttons.disable_sensitive
			do_with_wait_cursor (parent_dialog,
				agent
					do
						repository_action.call ([])
						do_repository_action_poll_agent.set_interval (External_process_poll_period)
					end
			)
		end

	do_repository_action_poll_agent: EV_TIMEOUT
			-- Timer to check if process is still running
		once
			create Result
			Result.actions.extend (
				agent
					do
						if live_processes.is_empty then
							do_repository_action_poll_agent.set_interval (0)
							do_repository_action_finalise
						else
							do_repository_action_poll_agent.set_interval (External_process_poll_period)
						end
					end
			)
		end

	do_repository_action_finalise
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			if last_command_result.succeeded then
				repository_interface.reload_repository_definition
				parent_dialog.populate_grid
			elseif last_command_result.did_not_run then
				create info_dialog.make_with_text (get_msg (ec_external_command_did_not_execute, Void))
				info_dialog.show_modal_to_window (parent_dialog)
			else
				create info_dialog.make_with_text (get_msg (ec_external_command_failed, <<last_command_result.command_line, last_command_result.stderr>>))
				info_dialog.show_modal_to_window (parent_dialog)
			end

			-- reset command output
			if attached old_stdout_agent as att_agt then
				set_stdout_agent (att_agt)
			end
			if attached old_stderr_agent as att_agt then
				set_stderr_agent (att_agt)
			end
			parent_dialog.ev_live_status_text.set_text ("")

			parent_dialog.ok_cancel_buttons.enable_sensitive
		end

	old_stdout_agent: like stdout_agent

	old_stderr_agent: like stderr_agent

	repository_interface: detachable ARCHETYPE_REPOSITORY_INTERFACE

	repository_action: PROCEDURE [ANY, TUPLE]

	parent_dialog: REPOSITORY_DIALOG

end


