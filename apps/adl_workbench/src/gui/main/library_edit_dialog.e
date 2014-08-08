note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper dialog for the user to create or update a REPOSITORY_PROFILE. This dialog is associated with the main 
				 parent dialog, whose state it updates.
				 ]"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	LIBRARY_EDIT_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		undefine
			is_equal, default_create, copy
		end

create
	make_new, make_edit

feature -- Definition

	New_library_name: STRING = "new_library"

feature {NONE} -- Initialization

	make_edit (a_repo_cfg_table: REPOSITORIES_TABLE; an_existing_repo: STRING)
			-- Make with a reference to the table of repositories and the name of the library being edited.
		require
			a_repo_cfg_table.has_repository (an_existing_repo)
		do
			initial_library_name := an_existing_repo
			repo_config_table := a_repo_cfg_table
			default_create
		ensure
			repositories_set: repo_config_table = a_repo_cfg_table
			Existing_library: not is_new_library
		end

	make_new (a_repo_cfg_table: REPOSITORIES_TABLE)
			-- Make with a reference to the table of repositories being edited.
		do
			repo_config_table := a_repo_cfg_table
			default_create
		ensure
			repositories_set: repo_config_table = a_repo_cfg_table
			New_library: is_new_library
		end

	create_interface_objects
			-- Initialize `Current'.
		do
			initialise_dirs

			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ library name text control ============
			create library_name_ctl.make (get_text (ec_library_cfg_name_text), agent :STRING do Result := library_name end, 0, 0, True)
			ev_root_container.extend (library_name_ctl.ev_root_container)
			ev_root_container.disable_item_expand (library_name_ctl.ev_root_container)
			gui_controls.extend (library_name_ctl)

			-- ============ Reference path ============
			create ref_dir_setter.make (get_text (ec_ref_library_dir_text), agent :STRING do Result := ref_dir end, 0, 0)
			ref_dir_setter.set_default_directory_agent (agent :STRING do Result := application_startup_directory end)
			ev_root_container.extend (ref_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (ref_dir_setter.ev_root_container)
			gui_controls.extend (ref_dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			set_title (get_text (ec_library_cfg_edit_dialog_title))
			set_icon_pixmap (adl_workbench_logo)
			set_minimum_width (600)
			extend (ev_root_container)

			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
--			show_actions.extend (agent (library_name_ctl.ev_data_control).set_focus)
		end

feature -- Events

	on_ok
		local
			a_repo_cfg: REPOSITORY_CONFIG
			error_dialog: EV_INFORMATION_DIALOG
		do
			is_valid := False

			-- set working variables
			library_name := library_name_ctl.data_control_text
			if library_name.has (' ') then
				library_name.replace_substring_all (" ", "_")
			end
			ref_dir := ref_dir_setter.data_control_text

			-- now validate the name with respect to existing repositories			
			-- first see if it is non-empty and unique
			if library_name.is_empty then
				create error_dialog.make_with_text (get_text (ec_empty_library_cfg))
				error_dialog.show_modal_to_window (Current)

			elseif library_name /~ initial_library_name and repo_config_table.has_repository (library_name) then
				create error_dialog.make_with_text (get_msg (ec_duplicate_library_cfg, <<library_name>>))
				error_dialog.show_modal_to_window (Current)

			else
				-- now validate the paths, remembering that the paths could have been set just by the user typing directly in the fields
				-- first, the reference path
				if not directory_exists (ref_dir) then
					create error_dialog.make_with_text (get_msg_line (ec_ref_library_not_found, <<ref_dir>>))
					error_dialog.show_modal_to_window (Current)

				else -- there was no work path
					is_valid := True
				end
			end

			if is_valid then
				if is_new_library then
					create a_repo_cfg.make (ref_dir)
					repo_config_table.put_repository (a_repo_cfg, library_name)
					has_changed_library := True

				else -- in edit existing situation, only do something if the paths have changed
					-- if existing library name was changed
					if library_name /~ initial_library_name and attached initial_library_name as irn then
						repo_config_table.rename_repository (irn, library_name)
						has_changed_library := True
					end
					a_repo_cfg := repo_config_table.repository (library_name)
					if a_repo_cfg.reference_path /~ ref_dir then
						a_repo_cfg.set_reference_path (ref_dir)
						has_changed_library := True
					end
				end
				hide
			end
		end

feature -- Access

	repo_config_table: REPOSITORIES_TABLE
			-- Profiles being edited, as a table of {{ref_path, working path}, prof_name}.

	initial_library_name: detachable STRING
			-- copy of library name if editing an existing one, used for checking if a rename has occurred in `on_ok'

	initial_ref_dir: STRING
			-- initial value of reference directory, based on whether `initial_library_name' was set

	library_name: STRING
			-- current value of library name based on choosing so far

	ref_dir: STRING
			-- current value of reference directory setting based on choosing so far

feature -- Status Report

	is_new_library: BOOLEAN
			-- True if the library being specified in this dialog is to be treated as a new entry in `repo_config_table'.
		do
			Result := not attached initial_library_name
		end

	is_valid: BOOLEAN
			-- result of validation in `on_ok'

	has_changed_library: BOOLEAN
			-- True if this dialog has caused a change to `repo_config_table'.

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
		end

	initialise_dirs
		do
			-- set initial values
			if is_new_library then
				if repo_config_table.has_current_repository then
					initial_ref_dir := repo_config_table.current_reference_repository_path
				else
					initial_ref_dir := user_config_file_directory
				end
				library_name := New_library_name.twin
			else
				check attached initial_library_name as irn and then attached repo_config_table.repository (irn) as repo then
					initial_ref_dir := repo.reference_path
				end
				library_name := initial_library_name.twin
			end

			-- set current values
			ref_dir := initial_ref_dir.twin
		end

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	library_name_ctl: EVX_SINGLE_LINE_TEXT_CONTROL

	ref_dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


