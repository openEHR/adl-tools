note
	component:   "openEHR Archetype Project"
	description: "Dialog to ask for initial details of a new C_OBJECT node to enable conversion from an RM object node"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	INITIAL_C_OBJECT_DIALOG

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

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

create
	make

feature {NONE} -- Initialization

	make (a_constraint_types, an_rm_types: ARRAYED_LIST [STRING]; a_current_constraint_type, a_current_rm_type: STRING;
			an_occurrences_default: MULTIPLICITY_INTERVAL; an_ed_context: ARCH_ED_CONTEXT_STATE; a_display_settings: GUI_DEFINITION_SETTINGS)
			-- Make with RM types, constraint type selection and an occurrences constrainer that is used to determine
			-- the possible occurrences in this case
		require
			Valid_constraint_types: a_constraint_types.object_comparison and a_constraint_types.has (a_current_constraint_type)
			Valid_rm_types: an_rm_types.object_comparison and an_rm_types.has (a_current_rm_type)
		do
			rm_types := an_rm_types
			current_rm_type := a_current_rm_type
			initial_rm_type := current_rm_type.twin
			constraint_types := a_constraint_types
			current_constraint_type := a_current_constraint_type
			initial_constraint_type := current_constraint_type.twin
			occurrences_default := an_occurrences_default
			current_occurrences := occurrences_default.as_string
			ed_context := an_ed_context
			display_settings := a_display_settings
			default_create
		end

	create_interface_objects
			-- Initialize `Current'.
		do
			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- window characteristics
			set_title (get_text ("initial_c_object_config_dialog_title"))
			set_icon_pixmap (adl_workbench_logo)

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ constraint type combo-box control ============
			create constraint_type_ctl.make_linked (get_text ("initial_c_object_config_constraint_type_text"),
				agent :STRING do Result := current_constraint_type end,
				constraint_types, agent set_current_constraint_type, Void, Void,
				0, 0)
			ev_root_container.extend (constraint_type_ctl.ev_root_container)
			ev_root_container.disable_item_expand (constraint_type_ctl.ev_root_container)
			gui_controls.extend (constraint_type_ctl)

			-- ============ RM type combo-box control ============
			create rm_type_ctl.make_linked (get_text ("initial_c_object_config_rm_type_text"),
				agent :STRING do Result := current_rm_type end,
				rm_types, agent (a_str: STRING) do current_rm_type := a_str end, Void, Void,
				0, 0)
			ev_root_container.extend (rm_type_ctl.ev_root_container)
			ev_root_container.disable_item_expand (rm_type_ctl.ev_root_container)
			gui_controls.extend (rm_type_ctl)

			-- ============ Occurrences ============
			create occurrences_choice_ctl.make_linked (get_text ("initial_c_object_config_occurrences_text"),
				agent :STRING do Result := current_occurrences end,
				occurrences_constrained_list, agent (a_str: STRING) do current_occurrences := a_str end, Void, Void,
				0, 0)
			ev_root_container.extend (occurrences_choice_ctl.ev_root_container)
			ev_root_container.disable_item_expand (occurrences_choice_ctl.ev_root_container)
			gui_controls.extend (occurrences_choice_ctl)

			-- ============ Archetype ext ref list ============			
			create arch_id_list_ctl.make_linked (get_text ("initial_c_object_config_ext_ref_text"),
				agent :STRING do Result := current_ext_ref end,
				arch_ext_ref_list, agent (a_str: STRING) do current_ext_ref := a_str end, Void, Void,
				0, 0)
			ev_root_container.extend (arch_id_list_ctl.ev_root_container)
			ev_root_container.disable_item_expand (arch_id_list_ctl.ev_root_container)
			if not current_constraint_type.is_equal ("C_ARCHETYPE_ROOT") then
				arch_id_list_ctl.hide
			end
			rm_type_ctl.add_linked_control (arch_id_list_ctl)
			gui_controls.extend (arch_id_list_ctl)


			-- ============ Archetype path list ============			
			create arch_path_list_ctl.make_linked (get_text ("initial_c_object_config_path_ref_text"),
				agent :STRING do Result := current_path_ref end,
				arch_path_list, agent (a_str: STRING) do current_path_ref := a_str end, Void, Void,
				0, 0)
			ev_root_container.extend (arch_path_list_ctl.ev_root_container)
			ev_root_container.disable_item_expand (arch_path_list_ctl.ev_root_container)
			if not current_constraint_type.is_equal ("ARCHETYPE_INTERNAL_REF") then
				arch_path_list_ctl.hide
			end
			gui_controls.extend (arch_path_list_ctl)
			rm_type_ctl.add_linked_control (arch_path_list_ctl)


			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
--			show_actions.extend (agent constraint_type_ctl.set_focus)
		end

	initialize
		do
			extend (ev_root_container)
			precursor
		end

feature -- Events

	on_ok
		do
			is_valid := not current_constraint_type.is_equal (initial_constraint_type) or
						not current_rm_type.is_equal (initial_rm_type) or
						not current_occurrences.is_equal (occurrences_default.as_string)
			hide
		end

feature -- Access

	rm_types: ARRAYED_LIST [STRING]

	current_rm_type: STRING

	constraint_types: ARRAYED_LIST [STRING]

	current_constraint_type: STRING

	current_occurrences: STRING

	current_ext_ref:  detachable STRING

	current_path_ref: detachable STRING

feature -- Status Report

	is_valid: BOOLEAN

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature -- Modification

	set_current_constraint_type (a_str: STRING)
		do
			current_constraint_type := a_str
			if current_constraint_type.is_equal ("C_ARCHETYPE_ROOT") and not arch_ext_ref_list.is_empty then
				arch_id_list_ctl.show
				arch_path_list_ctl.hide
			elseif current_constraint_type.is_equal ("ARCHETYPE_INTERNAL_REF") and not arch_path_list.is_empty then
				arch_path_list_ctl.show
				arch_id_list_ctl.hide
			else
				arch_path_list_ctl.hide
				arch_id_list_ctl.hide
			end
		end

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (
				agent (an_item: EVX_DATA_CONTROL)
					do
						if an_item.is_show_requested then
							an_item.populate
						end
					end
			)
		end

	ed_context: ARCH_ED_CONTEXT_STATE

	display_settings: GUI_DEFINITION_SETTINGS

	initial_rm_type: STRING

	initial_constraint_type: STRING

	occurrences_default: MULTIPLICITY_INTERVAL

	occurrences_constrained_list: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			across occurrences_default_list as occs_csr loop
				if occurrences_default.equal_interval (occs_csr.item) or occurrences_default.contains (occs_csr.item) then
					Result.extend (occs_csr.item.as_string)
				end
			end
		end

	arch_ext_ref_list: ARRAYED_SET [STRING]
		do
			Result := current_arch_cat.matching_ids (".*", current_rm_type, Void)
		end

	arch_path_list: ARRAYED_LIST [STRING]
		do
			Result := ed_context.archetype.matching_logical_paths (display_settings.language, current_rm_type)
		end

	archetype: ARCHETYPE

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	constraint_type_ctl, rm_type_ctl, occurrences_choice_ctl, arch_id_list_ctl, arch_path_list_ctl: EVX_COMBO_TEXT_SELECTOR_CONTROL

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
