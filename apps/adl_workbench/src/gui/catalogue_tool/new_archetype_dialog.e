note
	component:   "openEHR ADL Tools"
	description: "Dialog to ask for details of a new archetype - directory path and concept name."
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

create
	make, make_specialised

feature {NONE} -- Initialization

	make (a_start_dir: STRING; an_id_template: ARCHETYPE_HRID; a_source: ARCHETYPE_LIBRARY)
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

	make_specialised (a_start_dir: STRING; an_id_template, a_parent_id: attached like parent_archetype_id; a_source: ARCHETYPE_LIBRARY)
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
			create archetype_id_ctl.make_linked (archetype_id, get_text (ec_archetype_id_label_text),
				agent :STRING do Result := archetype_id.concept_id end,
				agent (a_str: STRING) do archetype_id.set_concept_id (a_str) end,
				Void, Void
			)
			archetype_id_ctl.set_validity_agents (agent archetype_id.valid_concept_id, agent get_msg (ec_invalid_archetype_id_concept_err, ?))
			ev_root_container.extend (archetype_id_ctl.ev_root_container)
			ev_root_container.disable_item_expand (archetype_id_ctl.ev_root_container)
			gui_controls.extend (archetype_id_ctl)

			-- ============ parent archetype id data entry control ============
			if attached parent_archetype_id as pid then
				create parent_archetype_id_ctl.make_readonly (pid, get_text (ec_parent_archetype_id_label_text),
					agent (a_parent_id: like parent_archetype_id):STRING do Result := a_parent_id.concept_id end (pid)
				)
				ev_root_container.extend (parent_archetype_id_ctl.ev_root_container)
				ev_root_container.disable_item_expand (parent_archetype_id_ctl.ev_root_container)
				gui_controls.extend (parent_archetype_id_ctl)
			end

			-- ============ Directory path ============
			create dir_setter.make (get_text (ec_archetype_dir_label_text), agent :STRING do Result := archetype_directory end, 0, 450)
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
			set_title (get_text (ec_create_archetype_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

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
				create error_dialog.make_with_text (get_msg (ec_duplicate_archetype_id_err_msg, <<archetype_id.as_string>>))
				error_dialog.show_modal_to_window (Current)
			elseif not has_rm_schema_for_archetype_id (archetype_id) then
				create error_dialog.make_with_text (get_msg (ec_model_access_e7, <<archetype_id.qualified_rm_closure>>))
				error_dialog.show_modal_to_window (Current)
			else
				archetype_directory := dir_setter.data_control_text
				is_valid := True
				hide
			end
		end

feature -- Access

	archetype_id: ARCHETYPE_HRID
			-- current value of archetype id

	parent_archetype_id: detachable ARCHETYPE_HRID
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

	source: ARCHETYPE_LIBRARY

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	archetype_id_ctl: EVX_ARCHETYPE_ID_CONTROL

	parent_archetype_id_ctl: detachable EVX_ARCHETYPE_ID_CONTROL
		note
			option: stable
		attribute
		end

	dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


