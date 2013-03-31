note
	component:   "openEHR Archetype Project"
	description: "[
				 Helper dialog for the user to create or update a REPOSITORY_PROFILE. This dialog is associated with the main 
				 parent dialog, whose state it updates.
				 ]"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	REPOSITORY_EDIT_DIALOG

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

	New_repository_name: STRING = "new_repository"

feature {NONE} -- Initialization

	make_edit (a_repo_cfg_table: REPOSITORY_CONFIG_TABLE; an_existing_repo: STRING)
			-- Make with a reference to the table of repositories and the name of the repository being edited.
		require
			a_repo_cfg_table.has_repository (an_existing_repo)
		do
			initial_repository_name := an_existing_repo
			repo_config_table := a_repo_cfg_table
			default_create
		ensure
			repositories_set: repo_config_table = a_repo_cfg_table
			Existing_repository: not is_new_repository
		end

	make_new (a_repo_cfg_table: REPOSITORY_CONFIG_TABLE)
			-- Make with a reference to the table of repositories being edited.
		do
			repo_config_table := a_repo_cfg_table
			default_create
		ensure
			repositories_set: repo_config_table = a_repo_cfg_table
			New_repository: is_new_repository
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

			-- ============ repository name text control ============
			create repository_name_ctl.make (get_text (ec_repo_cfg_name_text), agent :STRING do Result := repository_name end, 0, 0, True)
			ev_root_container.extend (repository_name_ctl.ev_root_container)
			ev_root_container.disable_item_expand (repository_name_ctl.ev_root_container)
			gui_controls.extend (repository_name_ctl)

			-- ============ Reference path ============
			create ref_dir_setter.make (get_text (ec_ref_repo_dir_text), agent :STRING do Result := ref_dir end, 0, 0)
			ev_root_container.extend (ref_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (ref_dir_setter.ev_root_container)
			gui_controls.extend (ref_dir_setter)

			-- ============ Work path ============
			create work_dir_setter.make (get_text (ec_work_repo_dir_text), agent :detachable STRING do Result := work_dir end, 0, 0)
			work_dir_setter.set_default_directory_agent (agent :STRING do Result := ref_dir end)
			ev_root_container.extend (work_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (work_dir_setter.ev_root_container)
			gui_controls.extend (work_dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			set_title (get_text (ec_repo_cfg_edit_dialog_title))
			set_icon_pixmap (adl_workbench_logo)
			set_minimum_width (600)
			extend (ev_root_container)

			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
--			show_actions.extend (agent (repository_name_ctl.ev_data_control).set_focus)
		end

feature -- Events

	on_ok
		local
			a_repo_cfg: REPOSITORY_CONFIG
			error_dialog: EV_INFORMATION_DIALOG
		do
			is_valid := False

			-- set working variables
			repository_name := repository_name_ctl.data_control_text
			if repository_name.has (' ') then
				repository_name.replace_substring_all (" ", "_")
			end
			ref_dir := ref_dir_setter.data_control_text
			work_dir := work_dir_setter.data_control_text

			-- now validate the name with respect to existing repositories			
			-- first see if it is non-empty and unique
			if repository_name.is_empty then
				create error_dialog.make_with_text (get_text (ec_empty_repo_cfg))
				error_dialog.show_modal_to_window (Current)

			elseif repository_name /~ initial_repository_name and repo_config_table.has_repository (repository_name) then
				create error_dialog.make_with_text (get_msg (ec_duplicate_repo_cfg, <<repository_name>>))
				error_dialog.show_modal_to_window (Current)

			else
				-- now validate the paths, remembering that the paths could have been set just by the user typing directly in the fields
				-- first, the reference path
				if not directory_exists (ref_dir) then
					create error_dialog.make_with_text (get_msg_line ("ref_repo_not_found", <<ref_dir>>))
					error_dialog.show_modal_to_window (Current)

				elseif attached work_dir as wd and then not wd.is_empty then -- now work path			
					if directory_exists (wd) then
						if not (work_dir.starts_with (ref_dir) or ref_dir.starts_with (wd)) then
							is_valid := True
						else
							create error_dialog.make_with_text (get_msg_line ("work_repo_not_valid", <<wd, ref_dir>>))
							error_dialog.show_modal_to_window (Current)
						end
					else
						create error_dialog.make_with_text (get_msg_line ("work_repo_not_found", <<wd>>))
						error_dialog.show_modal_to_window (Current)
					end
				else -- there was no work path
					is_valid := True
				end
			end

			if is_valid then
				if is_new_repository then
					create a_repo_cfg.make (ref_dir, work_dir)
					repo_config_table.put_repository (a_repo_cfg, repository_name)
					has_changed_repository := True

				else -- in edit existing situation, only do something if the paths have changed
					-- if existing repository name was changed
					if repository_name /~ initial_repository_name and attached initial_repository_name as irn then
						repo_config_table.rename_repository (irn, repository_name)
						has_changed_repository := True
					end
					a_repo_cfg := repo_config_table.repository (repository_name)
					if a_repo_cfg.reference_path /~ ref_dir then
						a_repo_cfg.set_reference_path (ref_dir)
						has_changed_repository := True
					end
					if a_repo_cfg.work_path /~ work_dir and attached work_dir as wd then
						a_repo_cfg.set_work_path (wd)
						has_changed_repository := True
					end
				end
				hide
			end
		end

feature -- Access

	repo_config_table: REPOSITORY_CONFIG_TABLE
			-- Profiles being edited, as a table of {{ref_path, working path}, prof_name}.

	initial_repository_name: detachable STRING
			-- copy of repository name if editing an existing one, used for checking if a rename has occurred in `on_ok'

	initial_ref_dir: STRING
			-- initial value of reference directory, based on whether `initial_repository_name' was set

	initial_work_dir: detachable STRING
			-- initial value of work directory, based on whether `initial_repository_name' was set

	repository_name: STRING
			-- current value of repository name based on choosing so far

	ref_dir: STRING
			-- current value of reference directory setting based on choosing so far

	work_dir: detachable STRING
			-- current value of work directory setting based on choosing so far

feature -- Status Report

	is_new_repository: BOOLEAN
			-- True if the repository being specified in this dialog is to be treated as a new entry in `repo_config_table'.
		do
			Result := not attached initial_repository_name
		end

	is_valid: BOOLEAN
			-- result of validation in `on_ok'

	has_changed_repository: BOOLEAN
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
			if is_new_repository then
				if repo_config_table.has_current_repository then
					initial_ref_dir := repo_config_table.current_reference_repository_path
					initial_work_dir := repo_config_table.current_work_repository_path
				else
					initial_ref_dir := user_config_file_directory
				end
				repository_name := New_repository_name.twin
			else
				check attached initial_repository_name as irn and then attached repo_config_table.repository (irn) as repo then
					initial_ref_dir := repo.reference_path
					if repo.has_work_path and then attached repo.work_path as wr then
						initial_work_dir := wr
					end
				end
				repository_name := initial_repository_name.twin
			end

			-- set current values
			ref_dir := initial_ref_dir.twin
			if attached initial_work_dir as iwd then
				work_dir := iwd.twin
			end
		end

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	repository_name_ctl: EVX_SINGLE_LINE_TEXT_CONTROL

	ref_dir_setter, work_dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
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
--| The Original Code is profile_edit_dialog.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
