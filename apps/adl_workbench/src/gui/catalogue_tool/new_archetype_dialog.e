note
	component:   "openEHR Archetype Project"
	description: "Dialog to ask for details of a new archetype - directory path and concept name."
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	NEW_ARCHETYPE_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} standard_is_equal, deep_twin, is_deep_equal
		undefine
			is_equal, default_create, copy
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

create
	make, make_specialised

feature {NONE} -- Initialization

	make (a_start_dir: STRING; an_id_template: ARCHETYPE_ID; a_source: ARCHETYPE_CATALOGUE)
			-- Make with a an initial directory
		do
			archetype_directory := a_start_dir
			archetype_id := an_id_template
			source := a_source
			default_create
		ensure
			archetype_directory_set: archetype_directory = a_start_dir
			Id_set: archetype_id = an_id_template
		end

	make_specialised (a_start_dir: STRING; an_id_template, a_parent_id: ARCHETYPE_ID; a_source: ARCHETYPE_CATALOGUE)
			-- Make with a an initial directory and a parent id
		do
			parent_archetype_id := a_parent_id
			make (a_start_dir, an_id_template, a_source)
		ensure
			archetype_directory_set: archetype_directory = a_start_dir
			Id_set: archetype_id = an_id_template
			Parent_id_set: parent_archetype_id = a_parent_id
		end

	create_interface_objects
			-- Initialize `Current'.
		do
			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ archetype id data entry control ============
			create archetype_id_ctl.make_linked (archetype_id, get_text ("archetype_id_label_text"),
				agent :STRING do Result := archetype_id.domain_concept end,
				agent (a_str: STRING) do archetype_id.set_domain_concept (a_str) end,
				Void, Void
			)
			archetype_id_ctl.set_validity_agents (agent archetype_id.valid_domain_concept, agent get_msg ("invalid_archetype_id_concept_err", ?))
			ev_root_container.extend (archetype_id_ctl.ev_root_container)
			ev_root_container.disable_item_expand (archetype_id_ctl.ev_root_container)
			gui_controls.extend (archetype_id_ctl)

			-- ============ parent archetype id data entry control ============
			if attached parent_archetype_id then
				create parent_archetype_id_ctl.make_readonly (parent_archetype_id, get_text ("parent_archetype_id_label_text"),
					agent :STRING do Result := parent_archetype_id.domain_concept end
				)
				ev_root_container.extend (parent_archetype_id_ctl.ev_root_container)
				ev_root_container.disable_item_expand (parent_archetype_id_ctl.ev_root_container)
				gui_controls.extend (parent_archetype_id_ctl)
			end

			-- ============ Directory path ============
			create dir_setter.make (get_text ("archetype_dir_label_text"), agent :STRING do Result := archetype_directory end, 0, 450)
			ev_root_container.extend (dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (dir_setter.ev_root_container)
			gui_controls.extend (dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			-- window characteristics
			set_title (get_text ("create_archetype_dialog_title"))
			set_icon_pixmap (adl_workbench_icon)

			extend (ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
			show_actions.extend (agent archetype_id_ctl.set_focus)
		end

feature -- Events

	on_ok
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if source.has_item_with_id (archetype_id.as_string) then
				create error_dialog.make_with_text (get_msg ("duplicate_archetype_id_err_msg", <<archetype_id.as_string>>))
				error_dialog.show_modal_to_window (Current)
			elseif not has_rm_schema_for_id (archetype_id) then
				create error_dialog.make_with_text (get_msg ("model_access_e7", <<archetype_id.qualified_package_name>>))
				error_dialog.show_modal_to_window (Current)
			else
				archetype_directory := dir_setter.data_control_text
				is_valid := True
				hide
			end
		end

feature -- Access

	archetype_id: ARCHETYPE_ID
			-- current value of archetype id

	parent_archetype_id: detachable ARCHETYPE_ID
			-- parent archetype id

	archetype_directory: STRING
			-- current value of archetype directory

feature -- Status Report

	is_valid: BOOLEAN

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

	source: ARCHETYPE_CATALOGUE

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	archetype_id_ctl: EVX_ARCHETYPE_ID_CONTROL

	parent_archetype_id_ctl: EVX_ARCHETYPE_ID_CONTROL

	dir_setter: EVX_DIRECTORY_SETTER

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
