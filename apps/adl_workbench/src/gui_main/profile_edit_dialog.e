note
	component:   "openEHR Archetype Project"
	description: "[
				 Helper dialog for the user to create or update a REPOSITORY_PROFILE. This dialog is associated with the main 
				 parent dialog, whose state it updates.
				 ]"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class
	PROFILE_EDIT_DIALOG

inherit
	PROFILE_EDIT_DIALOG_IMP

	GUI_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_new, make_edit

feature -- Definition

	New_profile_name: STRING = "new_profile"

feature {NONE} -- Initialization

	make_edit (a_parent_dialog: attached REPOSITORY_DIALOG; an_existing_profile: attached STRING)
			-- make with a ref to the parent dialog so we can share state, and the
			-- name of the profile being edited
		require
			a_parent_dialog.rep_profiles_copy.has_profile (an_existing_profile)
		do
			default_create
			parent_dialog := a_parent_dialog
			profile_name_text.set_text (an_existing_profile)
			reference_path_text.set_text (parent_dialog.rep_profiles_copy.profile (an_existing_profile).reference_repository)
			if parent_dialog.rep_profiles_copy.profile (an_existing_profile).has_work_repository then
				work_path_text.set_text (parent_dialog.rep_profiles_copy.profile (an_existing_profile).work_repository)
			end
			initial_profile_name := an_existing_profile
		end

	make_new (a_parent_dialog: attached REPOSITORY_DIALOG; a_ref_path, a_work_path: attached STRING)
			-- make with a ref to the object that this dialog and its parent are working on
		do
			default_create
			parent_dialog := a_parent_dialog
			profile_name_text.set_text (New_profile_name)
			reference_path_text.set_text (a_ref_path)
			work_path_text.set_text (a_work_path)
			is_new_profile := True
		end

	user_initialization
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			set_icon_pixmap (adl_workbench_ico)
			cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (cancel_button)
			set_default_push_button (ok_button)
			reference_path_text.focus_in_actions.extend (agent on_select_all (reference_path_text))
			work_path_text.focus_in_actions.extend (agent on_select_all (work_path_text))

			-- set default values for profile name and paths; use `set_initial_values' to change
			reference_path_text.set_text (user_config_file_directory)
		end

feature -- Events

	on_ok
			-- Called by `select_actions' of `profile_edit_dialog_ok_button'.
		local
			prof_name: STRING
			a_prof: REPOSITORY_PROFILE
			error_dialog: EV_INFORMATION_DIALOG
		do
			is_valid := False

			-- validate profilename: must not contain whitespace
			prof_name := profile_name_text.text
			if prof_name.has (' ') then
				prof_name.replace_substring_all (" ", "_")
				profile_name_text.set_text (prof_name)
			end

			-- now validate the name with respect to existing profiles			
			-- first see if it is unique
			if is_new_profile and parent_dialog.rep_profiles_copy.has_profile (prof_name) then
				create error_dialog.make_with_text (create_message_content ("duplicate_profile", <<prof_name>>))
				error_dialog.show_modal_to_window (Current)

			else
				-- now validate the paths, remembering that the paths could have been set just by the user typing directly in the fields
				-- first, the reference path
				if not directory_exists (reference_path_text.text) then
					create error_dialog.make_with_text (create_message_line ("ref_repo_not_found", <<reference_path_text.text>>))
					error_dialog.show_modal_to_window (Current)

				elseif not work_path_text.text.is_empty then -- now work path			
					if directory_exists (work_path_text.text) then
						if not (work_path_text.text.starts_with (reference_path_text.text) or reference_path_text.text.starts_with (work_path_text.text)) then
							is_valid := True
						else
							create error_dialog.make_with_text (create_message_line ("work_repo_not_valid", <<work_path_text.text, reference_path_text.text>>))
							error_dialog.show_modal_to_window (Current)
						end
					else
						create error_dialog.make_with_text (create_message_line ("work_repo_not_found", <<work_path_text.text>>))
						error_dialog.show_modal_to_window (Current)
					end
				else -- there was no work path
					is_valid := True
				end
			end

			if is_valid then
				if is_new_profile then
					create a_prof
					a_prof.set_reference_repository (reference_path_text.text)
					if not work_path_text.text.is_empty then
						a_prof.set_work_repository (work_path_text.text)
					end
					parent_dialog.rep_profiles_copy.put_profile (a_prof, prof_name)
					has_changed_profiles := True
				else -- in edit existing situation, only do something if the paths have changed
					-- if existing profile name was changed
					if not prof_name.same_string (initial_profile_name) then
						parent_dialog.rep_profiles_copy.rename_profile (initial_profile_name, prof_name)
						has_changed_profiles := True
					end

					a_prof := parent_dialog.rep_profiles_copy.profile (prof_name)
					if not a_prof.reference_repository.same_string (reference_path_text.text) then
						a_prof.set_reference_repository (reference_path_text.text)
						has_changed_profiles := True
					end
					if a_prof.has_work_repository and then not a_prof.work_repository.same_string (work_path_text.text) then
						a_prof.set_work_repository (work_path_text.text)
						has_changed_profiles := True
					end
				end
				parent_dialog.set_selected_profile_key(prof_name)
				hide
			end
		end

	on_select_all (text: EV_TEXT_FIELD)
			-- Select all text in `text', if any.
		do
			if text /= Void and then text.text_length > 0 then
				text.select_all
			end
		end

feature -- Access

	parent_dialog: attached REPOSITORY_DIALOG
			-- ref to the object that this dialog and its parent are working on

	is_new_profile: BOOLEAN
			-- True if the profile being specifide in this dialog is to be treated as a new entry
			-- in `rep_profiles_copy'

	initial_profile_name: STRING
			-- copy of profile name if editing an existing one, used for checking if a rename has occurred in `on_ok'

feature -- Status Report

	is_valid: BOOLEAN
			-- result of validation in `on_ok'

	has_changed_profiles: BOOLEAN
			-- True if this dialog has caused a change to the repository profiles copy in the parent diaog

feature {NONE} -- Implementation

	get_reference_repository_path
			-- Display a dialog for the user to select a new Reference Repository.
		local
			new_path: STRING
		do
			reference_path_text.set_text (get_directory (reference_path_text.text, Current))
		end

	get_work_repository_path
			-- Display a dialog for the user select the Work Repository.
		local
			def_path: STRING
		do
			if work_path_text.text.is_empty then
				def_path := reference_path_text.text
			else
				def_path := work_path_text.text
			end
			work_path_text.set_text (get_directory (def_path, Current))
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
