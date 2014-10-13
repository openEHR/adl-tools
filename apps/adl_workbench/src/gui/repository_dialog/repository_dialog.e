note
	component:   "openEHR ADL Tools"
	description: "Repositories dialog window. This dialog is non-modal, i.e. changes are instant, but uses model dialogs to gather information."
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	REPOSITORY_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		undefine
			is_equal, default_create, copy
		end

	SHARED_ARCHETYPE_REPOSITORY_INTERFACES
		export
			{NONE} all;
			{ANY} archetype_repository_interfaces
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_EXTERNAL_TOOL_INTERFACES
		export
			{NONE} all;
			{ANY} is_checkout_area, tool_supported
		undefine
			copy, default_create
		end

	EVX_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	EXTERNAL_TOOL_DEFINITIONS
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	Available_remote_repositories: HASH_TABLE [REPOSITORY_REMOTE_PROXY, STRING]
			-- URLs of available online repositories. Hardwired for now, replace in future by a
			-- web service lookup
		local
			a_proxy: REPOSITORY_REMOTE_PROXY
		once ("PROCESS")
			create Result.make (0)
			create a_proxy.make_key ("openEHR-reference repository", "https://github.com/openEHR/adl-archetypes.git", Git_tool_name)
			Result.put (a_proxy, a_proxy.remote_url)

			create a_proxy.make_key ("openEHR-CKM mirror", "https://github.com/openEHR/CKM-mirror.git", Git_tool_name)
			Result.put (a_proxy, a_proxy.remote_url)

--		use for testing
--			create a_proxy.make_key ("CIMI-CIMI archetypes", "file:///cygdrive/c/project/CIMI/opencimi/archetypes", Git_tool_name)
			create a_proxy.make_key ("CIMI-CIMI archetypes", "https://github.com/opencimi/archetypes.git", Git_tool_name)
			Result.put (a_proxy, a_proxy.remote_url)
		end

	Grid_display_name_col: INTEGER = 1
	Grid_status_col: INTEGER = 2
	Grid_vcs_branch_col: INTEGER = 3
	Grid_vcs_status_col: INTEGER = 4
	Grid_description_col: INTEGER = 5
	Grid_maintainer_col: INTEGER = 6
	Grid_validation_col: INTEGER = 7
	Grid_edit_col: INTEGER = 8
	Grid_max_cols: INTEGER
		once
			Result := Grid_edit_col
		end

	Grid_col_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text (ec_repository_grid_display_name_col_title), Grid_display_name_col)
			Result.put (get_text (ec_repository_grid_status_col_title), grid_status_col)
			Result.put (get_text (ec_repository_grid_vcs_branch_col_title), grid_vcs_branch_col)
			Result.put (get_text (ec_repository_grid_vcs_status_col_title), grid_vcs_status_col)
			Result.put (get_text (ec_repository_grid_description_col_title), grid_description_col)
			Result.put (get_text (ec_repository_grid_maintainer_col_title), Grid_maintainer_col)
			Result.put (get_text (ec_repository_grid_validation_col_title), Grid_validation_col)
			Result.put (get_text (ec_repository_grid_edit_col_title), grid_edit_col)
		end

	frame_height: INTEGER = 100

	Max_form_height: INTEGER = 400
	Max_form_width: INTEGER = 800

	Grid_expansion_factor: REAL = 1.2

feature {NONE} -- Initialisation

	create_interface_objects
			-- Initialize `Current'.
		do
			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- ============ root container ============
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ top label ============
			create ev_cell_1
			ev_cell_1.set_minimum_height (10)
			ev_root_container.extend (ev_cell_1)

			create ev_label_1
			ev_label_1.set_text (get_text (ec_repository_dialog_header_label))
			ev_root_container.extend (ev_label_1)

			create ev_cell_2
			ev_cell_2.set_minimum_height (10)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ main grid ============
			create evx_grid.make (True, False, True, True)
			evx_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			evx_grid.set_maximum_dimensions (0, Max_form_width)
			ev_root_container.extend (evx_grid.ev_grid)
			evx_grid.ev_grid.pointer_button_press_item_actions.extend (agent grid_item_event_handler)

			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

			-- ============ new repository button ============
			create ev_hbox_new_repo
			ev_root_container.extend (ev_hbox_new_repo)
			create new_repo_button.make (Void, Void, get_text (ec_repository_dir_button_text), get_text (ec_repository_dir_button_tooltip), agent on_add_repository, Void)
			ev_hbox_new_repo.extend (new_repo_button.ev_button)
			ev_hbox_new_repo.disable_item_expand (new_repo_button.ev_button)
			create ev_cell_3
			ev_hbox_new_repo.extend (ev_cell_3)

			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

			-- live status text
			create ev_live_status_text
			ev_live_status_text.set_minimum_height (25)
			ev_live_status_text.disable_edit
			ev_live_status_text.set_text ("")
			ev_live_status_text.align_text_left
			ev_root_container.extend (ev_live_status_text)
			ev_root_container.disable_item_expand (ev_live_status_text)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent on_cancel)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor
			extend (ev_root_container)
			set_title (get_text (ec_repository_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- Connect events.
		--	show_actions.extend (agent grid.set_focus)

			-- add a reload button to the left of Ok/ Cancel
			ok_cancel_buttons.add_button (get_text (ec_rm_schema_dialog_reload_button_text), agent reload)

			original_current_library_selected := current_library_name.twin

			enable_edit
			do_populate
			ev_root_container.refresh_now
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	original_current_library_selected: STRING
			-- value of `current_library_name' on entry

feature -- Status

	current_library_removed: BOOLEAN
			-- True if current library removed; requires a new library to be selected

	current_library_changed: BOOLEAN
			-- True if current library changed in any way requiring a refresh

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	reload
			-- alow user reload after manual changes while correcting schemas
		do
			do_with_wait_cursor (Current, agent do_reload)
		end

	do_reload
			-- allow user reload after manual changes while correcting schemas
		do
			archetype_repository_interfaces.reload
			do_populate
		end

feature {NONE} -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		do
			if not archetype_library_interfaces.is_empty and
				(original_current_library_selected.is_empty or else
				 not archetype_library_interfaces.has (original_current_library_selected))
			then
				set_current_library_name (archetype_library_interfaces.keys.first)
				current_library_changed := True
			end

			hide
		end

	on_cancel
			-- Set shared settings from the dialog widgets.
		do
			hide
		end

feature {REPOSITORY_COMMAND_RUNNER} -- Implementation

	old_stdout_agent: like stdout_agent

	old_stderr_agent: like stderr_agent

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			populate_grid
		end

	populate_grid
			-- Set the grid from shared settings.
		local
			parent_row: EV_GRID_ROW
		do
			-- get rid of previously defined rows
			evx_grid.wipe_out

			-- create row containing widgets for each library
			across archetype_repository_interfaces as rep_interfaces_csr loop
				evx_grid.add_row (rep_interfaces_csr.item)

				check attached evx_grid.last_row as att_row then
					parent_row := att_row
				end

				-- repository row
				populate_archetype_repository_grid_row (parent_row, rep_interfaces_csr.item)

				-- now do the libraries under the repository
				across rep_interfaces_csr.item.library_interfaces as lib_interfaces_csr loop
					evx_grid.set_last_row (parent_row)
					evx_grid.add_sub_row_to_last_row (Void)
					check attached evx_grid.last_row as att_row then
						populate_archetype_library_grid_row (att_row, lib_interfaces_csr.item)
					end
				end
				if parent_row.is_expandable then
					parent_row.expand
				end
			end

			-- see if the default repositories are there; if not, add them
			across Available_remote_repositories as arch_reps_csr loop
				if not archetype_repository_interfaces.has_remote_repository (arch_reps_csr.key) then
					evx_grid.add_row (arch_reps_csr.item)
					check attached evx_grid.last_row as att_row then
						parent_row := att_row
					end
					populate_remote_repository_grid_row (parent_row, arch_reps_csr.item)
				end
			end

			-- make the columnn content visible
			evx_grid.set_column_titles (Grid_col_names.linear_representation)
			evx_grid.resize_columns_to_content
			evx_grid.resize_viewable_area_to_content
		end

	populate_archetype_repository_grid_row (a_grid_row: EV_GRID_ROW; a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- first time populate of repository grid row
		local
			col_icon: detachable EV_PIXMAP
			errors: ERROR_ACCUMULATOR
			tooltip: STRING
		do
			evx_grid.set_last_row (a_grid_row)

			-- column 1: display name & repo icon
			if a_rep_if.has_remote_repository then
				col_icon := get_icon_pixmap ("tool/" + a_rep_if.remote_repository_type)
			else
				col_icon := get_icon_pixmap ("tool/file_system")
			end
			create tooltip.make_empty
			tooltip.append (" local: " + a_rep_if.local_directory + "%N")
			tooltip.append ("remote: " + a_rep_if.remote_url + "%N")
			evx_grid.update_last_row_label_col (Grid_display_name_col, a_rep_if.key, tooltip, Void, col_icon)

			-- column 2 - repository status
			evx_grid.update_last_row_label_col (Grid_status_col, get_text (ec_repository_status_installed), Void, Void, Void)

			-- column 3 - checked out branch
			if a_rep_if.has_remote_repository then
				evx_grid.update_last_row_label_col (Grid_vcs_branch_col, a_rep_if.checked_out_branch, Void, Void, Void)
			else
				evx_grid.update_last_row_label_col (Grid_vcs_branch_col, "", Void, Void, Void)
			end

			-- column 4 - VCS sync status
			evx_grid.update_last_row_label_col (Grid_vcs_status_col, "", vcs_status_tooltip (a_rep_if.synchronisation_status), Void, vcs_status_icon (a_rep_if.synchronisation_status))

			-- column 5 - repository description
			evx_grid.update_last_row_label_col (Grid_description_col, a_rep_if.repository_definition.description, Void, Void, Void)

			-- column 6 - maintainer
			evx_grid.update_last_row_label_col (Grid_maintainer_col, a_rep_if.repository_definition.maintainer, Void, Void, Void)

			-- column 7 - validation
			errors := a_rep_if.errors
			if errors.has_errors then
				col_icon := get_icon_pixmap ("tool/errors")
			elseif errors.has_warnings then
				col_icon := get_icon_pixmap ("tool/info")
			else
				col_icon := get_icon_pixmap ("tool/star")
			end
			evx_grid.update_last_row_label_col (Grid_validation_col, "         ", Void, Void, col_icon)
			if not evx_grid.has_last_row_pointer_button_press_actions (Grid_validation_col) then
				evx_grid.add_last_row_pointer_button_press_actions (Grid_validation_col, agent show_repository_validation (a_rep_if))
			end

			-- column 8 - create edit button and add to row
			evx_grid.update_last_row_label_col (Grid_edit_col, get_text (ec_edit), Void, Ev_grid_text_link_colour, Void)
			if not evx_grid.has_last_row_pointer_button_press_actions (Grid_edit_col) then
				evx_grid.add_last_row_pointer_button_press_actions (Grid_edit_col, agent edit_repository_definition (a_grid_row, a_rep_if))
			end
		end

	populate_remote_repository_grid_row (a_grid_row: EV_GRID_ROW; a_rem_proxy: REPOSITORY_REMOTE_PROXY)
			-- populate for a repository that only has a remote proxy
		local
			text_col: detachable EV_COLOR
		do
			evx_grid.set_last_row (a_grid_row)

			-- column 1: display name & repo icon
			evx_grid.update_last_row_label_col (Grid_display_name_col, a_rem_proxy.remote_key, a_rem_proxy.remote_url, Repository_remote_proxy_color, get_icon_pixmap ("tool/" + a_rem_proxy.remote_type))

			-- column 2 - repository status
			if tool_supported (a_rem_proxy.remote_type) then
				text_col := Ev_grid_text_link_colour
			else
				text_col := Void
			end
			evx_grid.update_last_row_label_col (Grid_status_col, get_text (ec_repository_status_install), Void, text_col, Void)

			-- only make the link live if the tool is supported
			if tool_supported (a_rem_proxy.remote_type) and not evx_grid.has_last_row_pointer_button_press_actions (Grid_status_col) then
				evx_grid.add_last_row_pointer_button_press_actions (Grid_status_col, agent install_repository (a_grid_row, a_rem_proxy))
			end

			-- column 3 - (blank)
			evx_grid.update_last_row_label_col (Grid_vcs_branch_col, "", Void, Void, Void)

			-- column 4 - (blank)
			evx_grid.update_last_row_label_col (Grid_vcs_status_col, "", Void, Void, Void)

			-- column 5 - (blank)
			evx_grid.update_last_row_label_col (Grid_description_col, "", Void, Void, Void)

			-- column 6 - (blank)
			evx_grid.update_last_row_label_col (Grid_maintainer_col, "", Void, Void, Void)

			-- column 7 - (blank)
			evx_grid.update_last_row_label_col (Grid_validation_col, "", Void, Void, Void)

			-- column 8 - (blank)
			evx_grid.update_last_row_label_col (Grid_edit_col, "", Void, Void, Void)
		end

	install_repository (a_grid_row: EV_GRID_ROW; a_rem_proxy: REPOSITORY_REMOTE_PROXY)
			-- find or create local repository corresponding to existing remote repository, details in `a_rem_proxy'
		require
			tool_supported (a_rem_proxy.remote_type)
		local
			repo_install_dialog: REPOSITORY_INSTALL_DIALOG
			verify_dialog: EV_QUESTION_DIALOG
			repo_name: STRING
		do
			repo_name := repository_name_from_url (a_rem_proxy.remote_url, a_rem_proxy.remote_type)
			create repo_install_dialog.make_fixed_url (a_rem_proxy.remote_url)
			repo_install_dialog.show_modal_to_window (Current)

			if repo_install_dialog.is_valid then
				if not repo_install_dialog.user_requires_repository_clone then
					on_associate_repository (repo_install_dialog.local_directory)
				else
					create verify_dialog.make_with_text (get_msg (ec_repository_clone_dir_confirm_text,
						<<repo_name, a_rem_proxy.remote_url, repo_install_dialog.local_directory>>))
					verify_dialog.set_buttons (<<get_text (ec_yes_response), get_text (ec_no_response)>>)
					verify_dialog.show_modal_to_window (Current)
					if verify_dialog.selected_button.same_string (get_text (ec_yes_response)) then
						do_clone_repository (repo_install_dialog.local_directory, a_rem_proxy)
					end
				end
			end
		end

	update_grid_install_status (a_text: STRING)
			-- live update status cell during install
		do
			ev_application.do_once_on_idle (agent ev_live_status_text.set_text (utf8_to_utf32 (a_text)))
		end

	populate_archetype_library_grid_row (a_grid_row: EV_GRID_ROW; a_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- create and populate row for `a_lib_if'
		local
			col_text, col_tooltip: STRING
			col_icon: detachable EV_PIXMAP
			errors: ERROR_ACCUMULATOR
		do
			evx_grid.set_last_row (a_grid_row)

			-- column 1 - name + check box to indicate loaded on top-level schemas
			create col_tooltip.make_from_string (a_lib_if.library_path)
			if a_lib_if.is_remote then
				col_icon := get_icon_pixmap ("tool/archetype_library_remote")
				if attached a_lib_if.library_definition.remote as att_rem then
					col_tooltip.append (get_msg (ec_archetype_library_grid_name_col_tooltip, <<att_rem.url, att_rem.custodian>>))
				end
			else
				col_icon := get_icon_pixmap ("tool/archetype_library")
			end
			evx_grid.update_last_row_label_col (Grid_display_name_col, a_lib_if.key, col_tooltip, Void, col_icon)

			-- column 2 - (blank)
			evx_grid.update_last_row_label_col (Grid_description_col, "", Void, Void, Void)

			-- column 3 - (blank)
			evx_grid.update_last_row_label_col (Grid_vcs_branch_col, "", Void, Void, Void)

			-- column 4 - (blank)
			evx_grid.update_last_row_label_col (Grid_vcs_status_col, "", Void, Void, Void)

			-- column 5 - library dscription
			if attached a_lib_if.library_definition as att_lib_def then
				col_text := att_lib_def.description
			else
				col_text := "(unknown)"
			end
			evx_grid.update_last_row_label_col (Grid_description_col, col_text, Void, Void, Void)

			-- column 6 - maintainer
			if attached a_lib_if.library_definition as att_lib_def then
				col_text := att_lib_def.maintainer
			else
				col_text := "(unknown)"
			end
			evx_grid.update_last_row_label_col (Grid_maintainer_col, col_text, Void, Void, Void)

			-- column 7 - validation
			errors := a_lib_if.errors
			if errors.has_errors then
				col_icon := get_icon_pixmap ("tool/errors")
			elseif errors.has_warnings then
				col_icon := get_icon_pixmap ("tool/info")
			else
				col_icon := Void
			end
			evx_grid.update_last_row_label_col (Grid_validation_col, "         ", Void, Void, col_icon)
			if not evx_grid.has_last_row_pointer_button_press_actions (Grid_validation_col) then
				evx_grid.add_last_row_pointer_button_press_actions (Grid_validation_col, agent show_library_validation (a_lib_if))
			end

			-- column 8 - create edit button and add to row
			evx_grid.update_last_row_label_col (Grid_edit_col, get_text (ec_edit), Void, Ev_grid_text_link_colour, Void)
			if not evx_grid.has_last_row_pointer_button_press_actions (Grid_edit_col) then
				evx_grid.add_last_row_pointer_button_press_actions (Grid_edit_col, agent edit_library_definition (a_grid_row, a_lib_if))
			end
		end

feature {REPOSITORY_COMMAND_RUNNER} -- Actions

	on_add_repository
			-- add a new repository, either by:
			--	* association of existing checkout to its remote location
			--	* clone from a remote location
			--	* create a new local repository, unconnected to any remote
		local
			repo_install_dialog: REPOSITORY_INSTALL_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			new_repo_dialog: EV_QUESTION_DIALOG
			repo_dir, repo_url: STRING
			verify_dialog: EV_QUESTION_DIALOG
		do
			create repo_install_dialog.make
			repo_install_dialog.show_modal_to_window (Current)
			if repo_install_dialog.is_valid then
				repo_dir := repo_install_dialog.local_directory
				repo_url := repo_install_dialog.repository_url

				if not repo_dir.is_empty and then file_system.directory_exists (repo_dir) then
					-- if there is a repostory at this path, then see if it can be added
					if archetype_repository_interfaces.repository_exists_at_path (repo_dir) then
						if archetype_repository_interfaces.valid_candidate_repository (repo_dir) then
							if is_checkout_area (repo_dir) then
								-- existing clone
								on_associate_repository (repo_dir)
							else
								-- existing local repository
								do_add_local_repository (repo_dir)
							end
						else
							create error_dialog.make_with_text (get_msg (ec_repository_dir_contains_duplicate, <<repo_dir, archetype_repository_interfaces.last_duplicate_key_path>>))
							error_dialog.show_modal_to_window (Current)
						end

					-- user wants to create a new repository by cloning a remote
					elseif not repo_url.is_empty then
						create verify_dialog.make_with_text (get_msg (ec_repository_clone_dir_confirm_text, <<"???", repo_url, repo_dir>>))
						verify_dialog.set_buttons (<<get_text (ec_yes_response), get_text (ec_no_response)>>)
						verify_dialog.show_modal_to_window (Current)
						if verify_dialog.selected_button.same_string (get_text (ec_yes_response)) then
							do_clone_repository (repo_dir, create {REPOSITORY_REMOTE_PROXY}.make (repo_url, Git_tool_name))
						end

					-- valid path for new local repository to be created; will cause creation of new repo meta-data file
					elseif archetype_repository_interfaces.valid_new_repository_path (repo_dir) then
						create new_repo_dialog.make_with_text_and_actions (get_msg (ec_repository_create_new_question_text, <<repo_dir>>),
							<<agent do_create_new_local_repository (repo_dir), agent do end, agent do end>>)
						new_repo_dialog.show_modal_to_window (Current)
					else
						create error_dialog.make_with_text (get_msg (ec_repository_dir_in_existing_path, <<repo_dir>>))
						error_dialog.show_modal_to_window (Current)
					end
				else
					create error_dialog.make_with_text (get_msg (ec_repository_dir_invalid, <<repo_dir>>))
					error_dialog.show_modal_to_window (Current)
				end
			end
		end

	on_associate_repository (repo_dir: STRING)
			-- add an existing repository that has a local checkout
		require
			archetype_repository_interfaces.repository_exists_at_path (repo_dir) and is_checkout_area (repo_dir)
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			set_last_user_selected_directory (repo_dir)
			if archetype_repository_interfaces.valid_candidate_repository (repo_dir) then
				ok_cancel_buttons.disable_sensitive
				do_with_wait_cursor (Current,
					agent (a_dir: STRING)
						do
							archetype_repository_interfaces.extend_associate_with_remote (a_dir)
						end (repo_dir)
				)
				if last_command_result.succeeded then
					populate_grid
					add_repository_path_with_key (repo_dir, archetype_repository_interfaces.item (repo_dir).key)

				elseif last_command_result.did_not_run then
					create error_dialog.make_with_text (get_msg (ec_external_command_did_not_execute, <<last_command_result.command_line>>))
					error_dialog.show_modal_to_window (Current)

				else
					create error_dialog.make_with_text (get_msg (ec_external_command_failed, <<last_command_result.command_line, last_command_result.stderr>>))
					error_dialog.show_modal_to_window (Current)

				end
				ok_cancel_buttons.enable_sensitive
			else
				create error_dialog.make_with_text (get_msg (ec_repository_dir_contains_duplicate, <<repo_dir, archetype_repository_interfaces.last_duplicate_key_path>>))
				error_dialog.show_modal_to_window (Current)
			end
		end

	do_clone_repository (repo_parent_dir: STRING; a_rem_proxy: REPOSITORY_REMOTE_PROXY)
			-- clone an existing remote repository to a new checkout
		local
			error_dialog: EV_INFORMATION_DIALOG
			repo_name: STRING
		do
			repo_name := repository_name_from_url (a_rem_proxy.remote_url, a_rem_proxy.remote_type)
			clone_repository_dir := file_system.pathname (repo_parent_dir, repo_name)
			clone_repository_url := a_rem_proxy.remote_url

			-- set status update to agent that will do live update from to the grid status cell
			old_stdout_agent := stdout_agent
			set_stdout_agent (agent update_grid_install_status)
			old_stderr_agent := stderr_agent
			set_stderr_agent (agent update_grid_install_status)

			-- if there is a repostory at this path, then see if it can be added
			if archetype_repository_interfaces.valid_clone_directory (repo_parent_dir, a_rem_proxy.remote_url, a_rem_proxy.remote_type) then
				set_last_user_selected_directory (repo_parent_dir)
				ok_cancel_buttons.disable_sensitive
				do_with_wait_cursor (Current,
					agent (a_parent_dir, a_repo_type: STRING)
						do
							archetype_repository_interfaces.extend_checkout_from_remote (a_parent_dir, clone_repository_url, a_repo_type)
							clone_repository_poll_agent.set_interval (External_process_poll_period)
						end (repo_parent_dir, a_rem_proxy.remote_type)
				)
			else
				create error_dialog.make_with_text (get_msg (ec_repository_clone_dir_invalid,
					<<repo_parent_dir, a_rem_proxy.remote_url, repo_name>>))
				error_dialog.show_modal_to_window (Current)
			end
		end

	clone_repository_dir: STRING
		attribute
			create Result.make_empty
		end

	clone_repository_url: STRING
		attribute
			create Result.make_empty
		end

	clone_repository_poll_agent: EV_TIMEOUT
			-- Timer to check if process is still running
		once
			create Result
			Result.actions.extend (
				agent
					do
						if live_processes.is_empty then
							clone_repository_poll_agent.set_interval (0)
							do_clone_repository_finalise
						else
							clone_repository_poll_agent.set_interval (External_process_poll_period)
						end
					end
			)
		end

	do_clone_repository_finalise
			-- finalise clone an existing remote repository to a new checkout
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if last_command_result.succeeded then
				do_with_wait_cursor (Current,
					agent
						do
							archetype_repository_interfaces.extend_checkout_from_remote_finalise (clone_repository_url)
							populate_grid
							add_repository_path_with_key (clone_repository_dir, archetype_repository_interfaces.item (clone_repository_dir).key)
						end
				)
			elseif last_command_result.did_not_run then
				create error_dialog.make_with_text (get_msg (ec_external_command_did_not_execute, <<last_command_result.command_line>>))
				error_dialog.show_modal_to_window (Current)
			else
				create error_dialog.make_with_text (get_msg (ec_external_command_failed, <<last_command_result.command_line, last_command_result.stderr>>))
				error_dialog.show_modal_to_window (Current)
			end
			ok_cancel_buttons.enable_sensitive

			-- reset command output
			if attached old_stdout_agent as att_agt then
				set_stdout_agent (att_agt)
			end
			if attached old_stderr_agent as att_agt then
				set_stderr_agent (att_agt)
			end
			ev_live_status_text.set_text ("")
		end

	edit_repository_definition (a_grid_row: EV_GRID_ROW; a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- launch edit dialog
		local
			pf: PROCESS_FACTORY
			ed_proc: PROCESS
			orig_time_stamp: INTEGER
		do
			orig_time_stamp := file_system.file_time_stamp (a_rep_if.repository_definition_file_path)
			create pf
			ed_proc := pf.process_launcher_with_command_line (text_editor_command + " %"" + a_rep_if.repository_definition_file_path + "%"", Void)
			ed_proc.launch
			ed_proc.wait_for_exit

			if file_system.file_time_stamp (a_rep_if.repository_definition_file_path) > orig_time_stamp then
				a_rep_if.reload_repository_definition
				populate_archetype_repository_grid_row (a_grid_row, a_rep_if)
			end
		end

	edit_library_definition (a_grid_row: EV_GRID_ROW; a_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- launch editor
		local
			pf: PROCESS_FACTORY
			ed_proc: PROCESS
			orig_time_stamp: INTEGER
		do
			orig_time_stamp := file_system.file_time_stamp (a_lib_if.library_definition_file_path)
			create pf
			ed_proc := pf.process_launcher_with_command_line (text_editor_command + " %"" + a_lib_if.library_definition_file_path + "%"", Void)
			ed_proc.launch
			ed_proc.wait_for_exit

			if file_system.file_time_stamp (a_lib_if.library_definition_file_path) > orig_time_stamp then
				archetype_library_interfaces.reload (a_lib_if)
				populate_archetype_library_grid_row (a_grid_row, a_lib_if)
			end
		end

	do_add_local_repository (a_repo_dir: STRING)
			-- add a local repository, and repopulate
		do
			archetype_repository_interfaces.extend (a_repo_dir)
			add_repository_path_with_key (a_repo_dir, archetype_repository_interfaces.last_repository_interface.key)
			populate_grid
		end

	do_create_new_local_repository (a_repo_dir: STRING)
			-- create a new local repository, save it, and repopulate
		do
			archetype_repository_interfaces.extend_create_local (a_repo_dir)
			add_repository_path_with_key (a_repo_dir, archetype_repository_interfaces.last_repository_interface.key)
			populate_grid
		end

	show_repository_validation (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- display info dialog with validity report
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			if a_rep_if.errors.has_errors_or_warnings then
				create info_dialog.make_with_text (a_rep_if.errors.as_string)
				info_dialog.show_modal_to_window (Current)
			end
		end

	show_library_validation (a_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- display info dialog with validity report
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			if a_lib_if.errors.has_errors_or_warnings then
				create info_dialog.make_with_text (a_lib_if.errors.as_string)
				info_dialog.show_modal_to_window (Current)
			end
		end

	grid_item_event_handler (x,y, button: INTEGER; an_ev_grid_item: detachable EV_GRID_ITEM)
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				if attached an_ev_grid_item then
					if attached {ARCHETYPE_REPOSITORY_INTERFACE} an_ev_grid_item.row.data as ari then
						build_repository_context_menu (ari)
					end
				end
			end
		end

	build_repository_context_menu (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- creates the context menu for a right click action for an ARCHETYPE_REPOSITORY_INTERFACE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			create menu

			-- add new library
			create an_mi.make_with_text_and_action (get_text (ec_repository_add_new_library), agent add_new_library (a_rep_if))
			an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_library"))
	    	menu.extend (an_mi)

			-- add new library here (at top of repository) - only if there are no libraries below
			if not a_rep_if.has_libraries then
				create an_mi.make_with_text_and_action (get_text (ec_repository_add_new_library_here), agent add_new_library_here (a_rep_if))
				an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_library"))
		    	menu.extend (an_mi)
			end

			-- VCS pull
			if a_rep_if.has_repository_tool and a_rep_if.synchronisation_status = vcs_status_pull_required then
				create an_mi.make_with_text_and_action (get_text (ec_repository_vcs_pull), agent repository_vcs_pull (a_rep_if))
				an_mi.set_pixmap (get_icon_pixmap ("tool/" + a_rep_if.remote_repository_type))
		    	menu.extend (an_mi)
			end

			-- VCS commit
			if a_rep_if.has_repository_tool and a_rep_if.synchronisation_status = vcs_status_files_not_committed then
				create an_mi.make_with_text_and_action (get_text (ec_repository_vcs_commit), agent repository_vcs_commit (a_rep_if))
				an_mi.set_pixmap (get_icon_pixmap ("tool/" + a_rep_if.remote_repository_type))
		    	menu.extend (an_mi)
			end

			-- VCS push
			if a_rep_if.has_repository_tool and a_rep_if.synchronisation_status = vcs_status_push_required then
				create an_mi.make_with_text_and_action (get_text (ec_repository_vcs_push), agent repository_vcs_push (a_rep_if))
				an_mi.set_pixmap (get_icon_pixmap ("tool/" + a_rep_if.remote_repository_type))
		    	menu.extend (an_mi)
			end

			-- checkout other branch
			if a_rep_if.has_repository_tool and then a_rep_if.available_branches.count > 1 then
				create an_mi.make_with_text_and_action (get_text (ec_repository_checkout_branch), agent repository_checkout_branch (a_rep_if))
				an_mi.set_pixmap (get_icon_pixmap ("tool/" + a_rep_if.remote_repository_type))
		    	menu.extend (an_mi)
			end

			-- remove
			create an_mi.make_with_text_and_action (get_text (ec_repository_remove_menu_text), agent repository_remove (a_rep_if))
		   	menu.extend (an_mi)

			menu.show
		end

	add_new_library (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- add a new library definition file at a user-chosen directory
		local
			lib_dir_dialog: EV_DIRECTORY_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			lib_path: STRING
		do
			create lib_dir_dialog
			lib_dir_dialog.set_title (get_text (ec_repository_add_new_library))
			lib_dir_dialog.set_start_directory (a_rep_if.local_directory)
			lib_dir_dialog.show_modal_to_window (Current)
			lib_path := lib_dir_dialog.directory
			if not lib_path.is_empty then
				if a_rep_if.valid_new_library_path (lib_path) then
					a_rep_if.add_new_library (lib_path, False)
					populate_grid
				else
					create error_dialog.make_with_text (get_msg (ec_repository_invalid_library_path, <<lib_path>>))
					error_dialog.show_modal_to_window (Current)
				end
			end
		end

	add_new_library_here (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
		do
			a_rep_if.add_new_library_here (False)
			populate_grid
		end

	repository_vcs_pull (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- do a git pull on `a_rep_if' repository
		do
			command_runner.do_action (a_rep_if, agent a_rep_if.pull_from_remote)
		end

	repository_vcs_commit (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- do a git pull on `a_rep_if' repository
		local
			commit_dialog: REPOSITORY_COMMIT_DIALOG
		do
			create commit_dialog.make (a_rep_if.key)
			commit_dialog.show_modal_to_window (Current)
			if commit_dialog.is_valid then
				command_runner.do_action (a_rep_if, agent a_rep_if.stage)
				if last_command_result.succeeded then
					command_runner.do_action (a_rep_if, agent a_rep_if.commit (commit_dialog.message))
				end
			end
		end

	repository_checkout_branch (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- do a git checkout branch on `a_rep_if' repository
		local
			checkout_dialog: REPOSITORY_CHECKOUT_DIALOG
			branches: ARRAYED_LIST [STRING]
		do
			branches := a_rep_if.available_branches
			branches.prune (a_rep_if.checked_out_branch)
			create checkout_dialog.make (branches)
			checkout_dialog.show_modal_to_window (Current)
			if checkout_dialog.is_valid then
				command_runner.do_action (a_rep_if, agent a_rep_if.checkout_branch (checkout_dialog.branch_name))
			end
		end

	repository_vcs_push (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- do a git pull on `a_rep_if' repository
		do
			command_runner.do_action (a_rep_if, agent a_rep_if.push_to_remote)
		end

	repository_remove (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- remove `a_rep_if' repository
		local
			verify_dialog: EV_QUESTION_DIALOG
		do
			create verify_dialog.make_with_text (get_msg (ec_repository_remove_confirm_text, <<a_rep_if.key>>))
			verify_dialog.set_buttons (<<get_text (ec_yes_response), get_text (ec_no_response)>>)
			verify_dialog.show_modal_to_window (Current)
			if verify_dialog.selected_button.same_string (get_text (ec_yes_response)) then
				archetype_repository_interfaces.remove (a_rep_if)
				populate_grid
				if not archetype_library_interfaces.has (original_current_library_selected) then
					forget_current_library_name
					current_library_removed := True
				end
				remove_repository (a_rep_if.key)
			end
		end

	ev_cell_1, ev_cell_2, ev_cell_3: EV_CELL

	ev_label_1: EV_LABEL

	ev_live_status_text: EV_TEXT_FIELD

	evx_grid: EVX_GRID

	new_repo_button: EVX_BUTTON

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	ev_hbox_new_repo: EV_HORIZONTAL_BOX

	command_runner: REPOSITORY_COMMAND_RUNNER
		once ("PROCESS")
			create Result.make (Current)
		end

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


