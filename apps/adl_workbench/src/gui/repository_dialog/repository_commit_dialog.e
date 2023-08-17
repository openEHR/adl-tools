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

	EVX_UTILITIES
		undefine
			is_equal, default_create, copy
		end

create
	make

feature -- Definitions

	Max_grid_height: INTEGER = 600

	Max_grid_width: INTEGER = 800

	col_titles: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.extend (get_text ({ADL_MESSAGES_IDS}.ec_repository_commit_status_col_title))
			Result.extend (get_text ({ADL_MESSAGES_IDS}.ec_repository_commit_commit_col_title))
			Result.extend (get_text ({ADL_MESSAGES_IDS}.ec_repository_commit_revert_col_title))
			Result.extend (get_text ({ADL_MESSAGES_IDS}.ec_repository_commit_file_list_col_title))
		end

	Col_status: INTEGER = 1
	Col_commit: INTEGER = 2
	Col_revert: INTEGER = 3
	Col_filename: INTEGER = 4

feature {NONE} -- Initialization

	make (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE)
		do
			create commit_list.make (0)
			commit_list.compare_objects
			create revert_list.make (0)
			revert_list.compare_objects
			create clean_list.make (0)
			clean_list.compare_objects

			repository_name := a_rep_if.key
			file_list := a_rep_if.uncommitted_files
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
			ev_label_1.set_text (get_msg ({ADL_MESSAGES_IDS}.ec_repository_commit_dialog_header_label, <<repository_name>>))
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ commit file list ============
			create evx_grid.make (False, True, False, True)
			evx_grid.set_maximum_dimensions (Max_grid_height, Max_grid_width)
			ev_root_container.extend (evx_grid.ev_grid)

			-- ============ commit message ============
			create evx_commit_msg_text.make (get_text ({ADL_MESSAGES_IDS}.ec_repository_commit_message_label), agent :STRING do Result := message end, 2, 0, True)
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
			set_title (get_text ({ADL_MESSAGES_IDS}.ec_repository_commit_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			-- ensure size controlled
			set_max_size_to_monitor (Current)

			extend (ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
		end

feature -- Events

	on_ok
		local
			error_dialog: EV_INFORMATION_DIALOG
			i: INTEGER
			ev_row: EV_GRID_ROW
			unchecked_files_exist: BOOLEAN
			fdesc: TUPLE [status, filename: STRING]
		do
			commit_list.wipe_out
			clean_list.wipe_out
			revert_list.wipe_out

			message := evx_commit_msg_text.data_control_text

			from i := 1 until i > evx_grid.row_count loop
				ev_row := evx_grid.ev_grid.row (i)
				check attached {TUPLE [status, filename: STRING]} ev_row.data as att_rd then
					fdesc := att_rd
				end
				if attached {EV_GRID_CHECKABLE_LABEL_ITEM} ev_row.item (Col_commit) as ev_commit_item then
					if ev_commit_item.is_checked then
						commit_list.extend (fdesc.filename)
					else
						unchecked_files_exist := True
					end
				end
				if attached {EV_GRID_CHECKABLE_LABEL_ITEM} ev_row.item (Col_revert) as ev_revert_item then
					if ev_revert_item.is_checked then
						if fdesc.status[2] = '?' then
							clean_list.extend (fdesc.filename)
						else
							revert_list.extend (fdesc.filename)
						end
					end
				end
				i := i + 1
			end

			commit_all := not unchecked_files_exist
			if (commit_all or not commit_list.is_empty) and message.is_empty then
				create error_dialog.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_no_commit_message_supplied))
				error_dialog.show_modal_to_window (Current)
			else
				is_valid := True
				hide
			end
		end

feature -- Access

	repository_name: STRING

	file_list: ARRAYED_LIST [TUPLE [status, filename: STRING]]

	commit_list: ARRAYED_SET [STRING]

	revert_list: ARRAYED_SET [STRING]

	clean_list: ARRAYED_SET [STRING]

	commit_all: BOOLEAN

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
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			populate_grid
		end

	populate_grid
			-- Set the grid from shared settings.
		do
			evx_grid.wipe_out
			across file_list as file_csr loop
				evx_grid.add_row (file_csr.item)

				-- VCS status
				evx_grid.set_last_row_label_col (Col_status, file_csr.item.status, Void, Void, Void, Void)

				-- make commit checkbox non-editable for already Added files
				evx_grid.last_row_add_checkbox (Col_commit, True, True)

				-- revert checkbox
				evx_grid.last_row_add_checkbox (Col_revert, False, True)

				if attached evx_grid.last_row as lr and then attached {EV_GRID_CHECKABLE_LABEL_ITEM} lr.item (Col_commit) as ev_commit_cb
					and then attached {EV_GRID_CHECKABLE_LABEL_ITEM} lr.item (Col_revert) as ev_revert_cb
				then
					ev_commit_cb.checked_changed_actions.force (agent enforce_commit_revert_xor (?, ev_revert_cb))
					ev_revert_cb.checked_changed_actions.force (agent enforce_commit_revert_xor (?, ev_commit_cb))
				end

				-- file name
				evx_grid.set_last_row_label_col (Col_filename, file_csr.item.filename, Void, Void, Void, Void)
			end

			-- make the columnn content visible
			evx_grid.set_column_titles (col_titles)
			evx_grid.resize_columns_to_content
			evx_grid.resize_viewable_area_to_content
		end

	enforce_commit_revert_xor (a_changed_cb, other_cb: EV_GRID_CHECKABLE_LABEL_ITEM)
		do
			if a_changed_cb.is_checked and other_cb.is_checked then
				other_cb.set_is_checked (False)
			end
		end

	ev_cell_1, ev_cell_2: EV_CELL

	ev_label_1: EV_LABEL

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_grid: EVX_GRID

	evx_commit_msg_text: EVX_MULTILINE_TEXT_CONTROL

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


