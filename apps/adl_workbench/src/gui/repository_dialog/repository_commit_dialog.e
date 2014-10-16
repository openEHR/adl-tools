note
	component:   "openEHR ADL Tools"
	description: "Dialog to get message for version control repository commit"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	REPOSITORY_COMMIT_DIALOG

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

create
	make

feature {NONE} -- Initialization

	make (a_repo_name: STRING; a_file_list: ARRAYED_LIST [STRING])
		do
			repository_name := a_repo_name
			file_list := a_file_list
			create message.make_empty
			default_create
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

			-- ============ top label ============
			create ev_cell_1
			ev_cell_1.set_minimum_height (20)
			ev_root_container.extend (ev_cell_1)
			create ev_label_1
			ev_label_1.set_text (get_msg (ec_repository_commit_dialog_header_label, <<repository_name>>))
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ commit file list ============
			create evx_file_list_text.make_readonly (get_text (ec_repository_commit_file_list_label), agent :ARRAYED_LIST [STRING] do Result := file_list end, 0, 0, True)
			ev_root_container.extend (evx_file_list_text.ev_root_container)
			gui_controls.extend (evx_file_list_text)

			-- ============ commit message ============
			create evx_commit_msg_text.make (get_text (ec_repository_commit_message_label), agent :STRING do Result := message end, 0, 0, True)
			ev_root_container.extend (evx_commit_msg_text.ev_root_container)
			ev_root_container.disable_item_expand (evx_commit_msg_text.ev_root_container)
			gui_controls.extend (evx_commit_msg_text)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor

			-- window characteristics
			set_title (get_text (ec_repository_commit_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			extend (ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
		end

feature -- Events

	on_ok
		do
			message := evx_commit_msg_text.data_control_text
			is_valid := True
			hide
		end

feature -- Access

	repository_name: STRING

	file_list: ARRAYED_LIST [STRING]

	message: STRING

feature -- Status Report

	is_valid: BOOLEAN
			-- user selected OK, and data valid in this dialog

	user_requires_repository_clone: BOOLEAN
			-- True if request to clone repo into chosen directory

feature -- Modification

	set_user_requires_repository_clone (a_val: BOOLEAN)
		do
			user_requires_repository_clone := a_val
		end

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
			gui_controls.do_all (
				agent (an_item: EVX_DATA_CONTROL)
					do
						if an_item.is_show_requested then
							an_item.populate
						end
					end
			)
		end

	ev_cell_1, ev_cell_2: EV_CELL

	ev_label_1: EV_LABEL

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_file_list_text: EVX_TEXT_LIST_CONTROL

	evx_commit_msg_text: EVX_MULTILINE_TEXT_CONTROL

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


