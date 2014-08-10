note
	component:   "openEHR ADL Tools"
	description: "Repositories dialog window"
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
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	EVX_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	Grid_display_name_col: INTEGER = 1
	Grid_description_col: INTEGER = 2
	Grid_maintainer_col: INTEGER = 3
	Grid_edit_col: INTEGER = 4
	Grid_max_cols: INTEGER
		once
			Result := Grid_edit_col
		end

	Grid_col_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text (ec_repository_grid_display_name_col_title), Grid_display_name_col)
			Result.put (get_text (ec_repository_grid_description_col_title), grid_description_col)
			Result.put (get_text (ec_repository_grid_maintainer_col_title), Grid_maintainer_col)
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
			ev_cell_1.set_minimum_height (20)
			ev_root_container.extend (ev_cell_1)
			create ev_label_1
			ev_label_1.set_text (get_text (ec_repository_dialog_header_label))
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ main grid ============
			create evx_grid.make (True, False, True, True)
			evx_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
			evx_grid.set_maximum_dimensions (0, Max_form_width)
			ev_root_container.extend (evx_grid.ev_grid)

			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

			-- ============ new repository dir chooser ============
			create repo_dir_setter.make (get_text (ec_repository_dir_button_text), agent :STRING do Result := "" end, 0, 0)
			repo_dir_setter.set_post_select_agent (agent on_add_repository)
			ev_root_container.extend (repo_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (repo_dir_setter.ev_root_container)
			gui_controls.extend (repo_dir_setter)


			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

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
		end

feature -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if original_current_library_selected.is_empty and not archetype_library_interfaces.is_empty then
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

	on_add_repository
			-- add a new repository
			-- Let the user browse for the directory where RM schemas are found.
			-- if a change is made, reload schemas immediately, then repopulate this dialog
		local
			error_dialog: EV_INFORMATION_DIALOG
			new_repo_dialog: EV_QUESTION_DIALOG
			new_repo_dir: STRING
		do
			new_repo_dir := repo_dir_setter.data_control_text

			-- if there is a repostory at this path, then it can be added
			if archetype_repository_interfaces.valid_repository_path (new_repo_dir) then
				ok_cancel_buttons.disable_sensitive
				do_with_wait_cursor (Current,
					agent (a_dir: STRING)
						do
							archetype_repository_interfaces.extend (a_dir)
							populate_grid
						end (new_repo_dir)
				)
				add_repository_path (new_repo_dir, archetype_repository_interfaces.item (new_repo_dir).key)
				ok_cancel_buttons.enable_sensitive

			-- see if the user wants to create a repository here, by creating a repository definition file
			elseif file_system.directory_exists (new_repo_dir) then
				create new_repo_dialog.make_with_text_and_actions (get_msg (ec_repository_create_new_question_text, <<new_repo_dir>>),
					<<agent on_create_new_repository, agent do end, agent do end>>)
				new_repo_dialog.show_modal_to_window (Current)
			else
				create error_dialog.make_with_text (get_msg (ec_repository_dir_invalid, <<new_repo_dir>>))
				error_dialog.show_modal_to_window (Current)
			end
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
		local
			parent_row: EV_GRID_ROW
			col_text: STRING
		do
			-- get rid of previously defined rows
			evx_grid.wipe_out

			-- create row containing widgets for each library
			across archetype_repository_interfaces as rep_interfaces_csr loop
				evx_grid.add_row (rep_interfaces_csr.item.key)

				-- column 1: display name
				evx_grid.set_last_row_label_col (Grid_display_name_col, rep_interfaces_csr.item.key,
					rep_interfaces_csr.item.repository_directory, Void, get_icon_pixmap ("tool/globe"))

				-- column 2 - library description
				if attached rep_interfaces_csr.item.repository_definition as att_rep_def then
					col_text := att_rep_def.description
				else
					col_text := "(unknown)"
				end
				evx_grid.set_last_row_label_col (Grid_description_col, col_text, Void, Void, Void)

				-- column 3 - maintainer
				if attached rep_interfaces_csr.item.repository_definition as att_rep_def then
					col_text := att_rep_def.maintainer
				else
					col_text := "(unknown)"
				end
				evx_grid.set_last_row_label_col (Grid_maintainer_col, col_text, Void, Void, Void)

				-- column 4 - create edit button and add to row
				evx_grid.set_last_row_label_col (Grid_edit_col, "         ", Void, Void, get_icon_pixmap ("tool/edit"))
				evx_grid.add_last_row_select_actions (Grid_edit_col, agent do_edit_repository_definition (rep_interfaces_csr.item))


				-- now do the libraries under the repository
				check attached evx_grid.last_row as att_row then
					parent_row := att_row
				end
				across rep_interfaces_csr.item.library_interfaces as lib_interfaces_csr loop
					evx_grid.set_last_row (parent_row)
					add_archetype_library_grid_rows (lib_interfaces_csr.item)
				end
				if parent_row.is_expandable then
					parent_row.expand
				end
			end

			-- make the columnn content visible
			evx_grid.set_column_titles (Grid_col_names.linear_representation)
			evx_grid.resize_columns_to_content
			evx_grid.resize_viewable_area_to_content
		end

	add_archetype_library_grid_rows (a_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- add row for `a_lib_if' and its children, recursively
		local
			col_text: STRING
			col_icon: detachable EV_PIXMAP
		do
			-- column 1 - name + check box to indicate loaded on top-level schemas
			evx_grid.add_sub_row_to_last_row (Void)
			evx_grid.set_last_row_label_col (Grid_display_name_col, a_lib_if.key, a_lib_if.library_path, Void, get_icon_pixmap ("tool/archetype_library"))

			-- column 2 - library dscription
			if attached a_lib_if.library_definition as att_lib_def then
				col_text := att_lib_def.description
			else
				col_text := "(unknown)"
			end
			evx_grid.set_last_row_label_col (Grid_description_col, col_text, Void, Void, Void)

			-- column 3 - validated
			if attached a_lib_if.library_definition as att_lib_def then
				col_text := att_lib_def.maintainer
			else
				col_text := "(unknown)"
			end
			evx_grid.set_last_row_label_col (Grid_maintainer_col, col_text, Void, Void, Void)

			-- column 4 - create edit button and add to row
			col_icon := get_icon_pixmap ("tool/edit")
			evx_grid.set_last_row_label_col (Grid_edit_col, "         ", Void, Void, col_icon)
			evx_grid.add_last_row_select_actions (Grid_edit_col, agent do_edit_library_definition (a_lib_if))
		end

	do_edit_repository_definition (a_lib_if: ARCHETYPE_REPOSITORY_INTERFACE)
			-- launch edit dialog
		do
			execution_environment.launch (text_editor_command + " %"" + a_lib_if.repository_definition_file_path + "%"")
		end

	do_edit_library_definition (a_lib_if: ARCHETYPE_LIBRARY_INTERFACE)
			-- launch edit dialog
		do
			execution_environment.launch (text_editor_command + " %"" + a_lib_if.library_definition_file_path + "%"")
		end

	on_create_new_repository
			-- create a new repository definition, save it, and repopulate
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			create error_dialog.make_with_text (get_msg (ec_to_be_implemented, Void))
			error_dialog.show_modal_to_window (Current)
		end

	ev_cell_1, ev_cell_2, ev_cell_3: EV_CELL

	ev_label_1: EV_LABEL

	evx_grid: EVX_GRID

	repo_dir_setter: EVX_DIRECTORY_SETTER

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


