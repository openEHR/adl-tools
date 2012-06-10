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

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	PROFILE_EDIT_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		undefine
			is_equal, default_create, copy
		end

create
	make_new, make_edit

feature -- Definition

	New_profile_name: STRING = "new_profile"

feature {NONE} -- Initialization

	make_edit (profiles: attached REPOSITORY_PROFILE_CONFIG; an_existing_profile: attached STRING)
			-- Make with a reference to the table of profiles and the name of the profile being edited.
		require
			profiles.has_profile (an_existing_profile)
		do
			initial_profile_name := an_existing_profile
			rep_profiles := profiles
			default_create
		ensure
			rep_profiles_set: rep_profiles = profiles
			Existing_profile: not is_new_profile
		end

	make_new (profiles: attached REPOSITORY_PROFILE_CONFIG)
			-- Make with a reference to the table of profiles being edited.
		do
			rep_profiles := profiles
			default_create
		ensure
			rep_profiles_set: rep_profiles = profiles
			New_profile: is_new_profile
		end

	initialize
			-- Initialize `Current'.
		do
			initialise_dirs

			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- window characteristics
			set_title (get_text ("profile_edit_dialog_title"))
			set_icon_pixmap (adl_workbench_icon)

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			extend (ev_root_container)

			-- ============ profile name text control ============
			create profile_name_ctl.make (get_text ("profile_name_text"), agent :STRING do Result := profile_name end, 0, 600, True, True)
			ev_root_container.extend (profile_name_ctl.ev_root_container)
			ev_root_container.disable_item_expand (profile_name_ctl.ev_root_container)
			gui_controls.extend (profile_name_ctl)

			-- ============ Reference path ============
			create ref_dir_setter.make (get_text ("ref_repo_dir_text"), agent :STRING do Result := ref_dir end, 0, 0)
			ev_root_container.extend (ref_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (ref_dir_setter.ev_root_container)
			gui_controls.extend (ref_dir_setter)

			-- ============ Work path ============
			create work_dir_setter.make (get_text ("work_repo_dir_text"), agent :STRING do Result := work_dir end, 0, 0)
			work_dir_setter.set_default_directory_agent (agent :STRING do Result := ref_dir end)
			ev_root_container.extend (work_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (work_dir_setter.ev_root_container)
			gui_controls.extend (work_dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
--			show_actions.extend (agent (profile_name_ctl.ev_data_control).set_focus)
		end

feature -- Events

	on_ok
		local
			a_prof: REPOSITORY_PROFILE
			error_dialog: EV_INFORMATION_DIALOG
		do
			is_valid := False

			-- set working variables
			profile_name := profile_name_ctl.data_control_text
			if profile_name.has (' ') then
				profile_name.replace_substring_all (" ", "_")
			end
			ref_dir := ref_dir_setter.data_control_text
			work_dir := work_dir_setter.data_control_text

			-- now validate the name with respect to existing profiles			
			-- first see if it is non-empty and unique
			if profile_name.is_empty then
				create error_dialog.make_with_text (get_text ("empty_profile"))
				error_dialog.show_modal_to_window (Current)

			elseif profile_name /~ initial_profile_name and rep_profiles.has_profile (profile_name) then
				create error_dialog.make_with_text (get_msg ("duplicate_profile", <<profile_name>>))
				error_dialog.show_modal_to_window (Current)

			else
				-- now validate the paths, remembering that the paths could have been set just by the user typing directly in the fields
				-- first, the reference path
				if not directory_exists (ref_dir) then
					create error_dialog.make_with_text (get_msg_line ("ref_repo_not_found", <<ref_dir>>))
					error_dialog.show_modal_to_window (Current)

				elseif not work_dir.is_empty then -- now work path			
					if directory_exists (work_dir) then
						if not (work_dir.starts_with (ref_dir) or ref_dir.starts_with (work_dir)) then
							is_valid := True
						else
							create error_dialog.make_with_text (get_msg_line ("work_repo_not_valid", <<work_dir, ref_dir>>))
							error_dialog.show_modal_to_window (Current)
						end
					else
						create error_dialog.make_with_text (get_msg_line ("work_repo_not_found", <<work_dir>>))
						error_dialog.show_modal_to_window (Current)
					end
				else -- there was no work path
					is_valid := True
				end
			end

			if is_valid then
				if is_new_profile then
					create a_prof
					a_prof.set_reference_repository (ref_dir)
					if not work_dir.is_empty then
						a_prof.set_work_repository (work_dir)
					end
					rep_profiles.put_profile (a_prof, profile_name)
					has_changed_profile := True

				else -- in edit existing situation, only do something if the paths have changed
					-- if existing profile name was changed
					if profile_name /~ initial_profile_name then
						rep_profiles.rename_profile (initial_profile_name, profile_name)
						has_changed_profile := True
					end
					a_prof := rep_profiles.profile (profile_name)
					if a_prof.reference_repository /~ ref_dir then
						a_prof.set_reference_repository (ref_dir)
						has_changed_profile := True
					end
					if a_prof.work_repository /~ work_dir then
						a_prof.set_work_repository (work_dir)
						has_changed_profile := True
					end
				end
				hide
			end
		end

feature -- Access

	rep_profiles: attached REPOSITORY_PROFILE_CONFIG
			-- Profiles being edited, as a table of {{ref_path, working path}, prof_name}.

	initial_profile_name: STRING
			-- copy of profile name if editing an existing one, used for checking if a rename has occurred in `on_ok'

	initial_ref_dir: attached STRING
			-- initial value of reference directory, based on whether `initial_profile_name' was set

	initial_work_dir: STRING
			-- initial value of work directory, based on whether `initial_profile_name' was set

	profile_name: STRING
			-- current value of profile name based on choosing so far

	ref_dir: STRING
			-- current value of reference directory setting based on choosing so far

	work_dir: STRING
			-- current value of work directory setting based on choosing so far

feature -- Status Report

	is_new_profile: BOOLEAN
			-- True if the profile being specified in this dialog is to be treated as a new entry in `rep_profiles'.
		do
			Result := not attached initial_profile_name
		end

	is_valid: BOOLEAN
			-- result of validation in `on_ok'

	has_changed_profile: BOOLEAN
			-- True if this dialog has caused a change to `rep_profiles'.

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do if not an_item.is_readonly then an_item.enable_active end end)
		end

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.do_populate end)
		end

	initialise_dirs
		do
			-- set initial values
			if is_new_profile then
				if rep_profiles.has_current_profile then
					initial_ref_dir := rep_profiles.current_reference_repository_path
					initial_work_dir := rep_profiles.current_work_repository_path
				else
					initial_ref_dir := user_config_file_directory
				end
				profile_name := New_profile_name.twin
			else
				initial_ref_dir := rep_profiles.profile (initial_profile_name).reference_repository
				if rep_profiles.profile (initial_profile_name).has_work_repository then
					initial_work_dir := rep_profiles.profile (initial_profile_name).work_repository
				end
				profile_name := initial_profile_name.twin
			end

			-- set current values
			ref_dir := initial_ref_dir.twin
			if attached initial_work_dir then
				work_dir := initial_work_dir.twin
			else
				create work_dir.make_empty
			end
		end

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [GUI_DATA_CONTROL]

	profile_name_ctl: GUI_SINGLE_LINE_TEXT_CONTROL

	ref_dir_setter, work_dir_setter: GUI_DIRECTORY_SETTER

	ok_cancel_buttons: GUI_OK_CANCEL_CONTROLS

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
