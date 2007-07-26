indexing
	component:   "openEHR Archetype Project"
	description: "Main window"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	MAIN_WINDOW

inherit
	MAIN_WINDOW_IMP
		redefine
			show
		end

	MAIN_WINDOW_ACCELERATORS
		undefine
			copy,
			default_create
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_DIRECTORY
		undefine
			copy, default_create
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
		undefine
			copy, default_create
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		undefine
			copy, default_create
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	STRING_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	user_initialization is
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			initialise_gui_settings

			if editor_command.is_empty then
				set_editor_command(Default_editor_command)
			end

			initialise_accelerators

			if reference_repository_path.is_empty then
				set_reference_repository_path (application_startup_directory)
				need_to_set_repository := True
			end

			archetype_directory.put_repository (reference_repository_path, "reference")

			if not work_repository_path.is_empty then
				archetype_directory.put_repository (work_repository_path, "work")
			end

			populate_archetype_directory
		end

	initialise_gui_settings is
			-- initialise purely graphical elements
		local
			cur_title: STRING
		do
			set_icon_name("ADL Editor")
			set_icon_pixmap (adl_workbench_ico)
			cur_title := title.twin
			cur_title.replace_substring_all("VER", Current_adl_version)
			set_title(cur_title)

			set_position (app_x_position, app_y_position)

			if app_width > 0 then
				set_width(app_width)
			else
				set_width(app_initial_width)
			end
			if app_height > 0 then
				set_height(app_height)
			else
				set_height(app_initial_height)
			end

			if main_notebook_tab_pos > 1 then
				main_nb.select_item (main_nb.i_th (main_notebook_tab_pos))
			end

			if test_view_area_split_position > 0 then
				test_view_area.set_split_position (test_view_area_split_position)
			end
			if explorer_view_area_split_position > 0 then
				explorer_view_area.set_split_position (explorer_view_area_split_position)
			end
			if info_view_area_split_position > 0 then
				info_view_area.set_split_position (info_view_area_split_position)
			end
			if total_view_area_split_position > 0 then
				total_view_area.set_split_position (total_view_area_split_position)
			else
				total_view_area.set_split_position (app_initial_height - parser_status_area.minimum_height)
			end

			initialise_path_control
		end

	initialise_path_control is
			-- create tree control repersenting archetype files found in repository_path
		local
			filter_combo_index: INTEGER
			strs: ARRAYED_LIST [STRING]
		do
			parsed_archetype_found_paths.enable_multiple_selection

			path_filter_combo.set_strings (path_control_filter_names)
			if not path_filter_combo_selection.is_empty then
				from
					filter_combo_index := 1
				until
					filter_combo_index > path_control_filter_names.count or
					path_control_filter_names.item(filter_combo_index).is_equal(path_filter_combo_selection)
				loop
					filter_combo_index := filter_combo_index + 1
				end
				if filter_combo_index > path_control_filter_names.count then -- non-existent string in session file
					filter_combo_index := 1
				end
			else
				filter_combo_index := 1
			end
			path_filter_combo.i_th (filter_combo_index).enable_select

			path_view_check_list.set_strings (path_control_column_names)
			path_view_check_list.set_minimum_height (path_control_column_names.count * List_row_height)

			strs := path_view_check_list_settings
			if not strs.is_empty then
				strs.compare_objects
				from
					path_view_check_list.start
				until
					path_view_check_list.off
				loop
					if strs.has(path_view_check_list.item.text) then
						path_view_check_list.check_item (path_view_check_list.item)
					end
					path_view_check_list.forth
				end
			else -- default to physical paths
				path_view_check_list.check_item (path_view_check_list.i_th(2))
				path_view_check_list.check_item (path_view_check_list.i_th(3))
			end
		end

	initialise_accelerators is
			-- Initialise keybard accelerators for various controls.
		do
			suppress_tab_key_insertion (arch_desc_purpose_text, arch_translations_other_details_mlist, arch_desc_use_text)
			suppress_tab_key_insertion (arch_desc_use_text, arch_desc_purpose_text, arch_desc_misuse_text)
			suppress_tab_key_insertion (arch_desc_misuse_text, arch_desc_use_text, arch_desc_keywords_list)
			suppress_tab_key_insertion (arch_desc_copyright_text, arch_desc_resource_orig_res_mlist, parser_status_area)
			suppress_tab_key_insertion (archetype_text_edit_area, arch_notebook, parser_status_area)

			add_shortcut (agent step_focused_notebook_tab (1), {EV_KEY_CONSTANTS}.key_tab, True, False)
			add_shortcut (agent step_focused_notebook_tab (-1), {EV_KEY_CONSTANTS}.key_tab, True, True)

			add_menu_shortcut (open_menu_item, {EV_KEY_CONSTANTS}.key_o, True, False)
			add_menu_shortcut_for_action (copy_menu_item, agent call_unless_text_focused (agent on_copy), {EV_KEY_CONSTANTS}.key_c, True, False)
			add_menu_shortcut (select_all_menu_item, {EV_KEY_CONSTANTS}.key_a, True, False)
		end

feature -- Access

	need_to_set_repository: BOOLEAN
			-- flag set on startup to indicate if repository needs to be specified by user

feature -- Commands

	show
			-- Do a few adjustments straight after display.
		do
			Precursor
			focus_first_widget (main_nb.selected_item)
		end

	set_options is
			--
		do
			option_dialog.show_modal_to_window (Current)
		end

	set_repository is
			--
		do
			repository_dialog.show_modal_to_window (Current)
		end

	display_icon_help is
			--
		do
			icon_dialog.show_modal_to_window (Current)
		end

	update_status_area(s: STRING) is
			-- update parse status area on screen
		do
			parser_status_area.append_text(s)
		end

	display_news is
			-- Called by `pointer_button_press_actions' of `about_mi'.
		do
			News_dialog.show
		end

	load_and_parse_archetype
			-- Load and parse archetype currently selected in archetype_directory.
		require
			archetype_selected: archetype_directory.has_selected_archetype_descriptor
		do
			do_with_wait_cursor (agent
				do
					archetype_compiler.set_target_to_selected

					if arch_notebook.selected_item = archetype_text_edit_area then
						populate_archetype_text_edit_area
					end

					parse_archetype
				end)
		end

feature {NONE} -- Commands

	show_online_help is
			-- Called by `select_actions' of `online_mi'.
		do
			execution_environment.launch(Default_browser_command + ADL_help_page_url)
		end

	display_about is
			-- Called by `pointer_button_press_actions' of `about_mi'.
		do
			About_dialog.show_modal_to_window (Current)
		end

	exit_app is
			--
		local
			strs: ARRAYED_LIST [STRING]
			ev_items: DYNAMIC_LIST[EV_LIST_ITEM]
		do
			set_total_view_area_split_position(total_view_area.split_position)
			set_info_view_area_split_position(info_view_area.split_position)
			set_test_view_area_split_position(test_view_area.split_position)
			set_explorer_view_area_split_position(explorer_view_area.split_position)
			set_app_width(width)
			set_app_height(height)
			set_app_x_position(x_position)
			set_app_y_position(y_position)
			set_app_maximised(is_maximized)
			set_main_notebook_tab_pos(main_nb.selected_item_index)

			set_path_filter_combo_selection(path_filter_combo.selected_item.text)

			ev_items := path_view_check_list.checked_items
			create strs.make(0)
			from
				ev_items.start
			until
				ev_items.off
			loop
				strs.extend(ev_items.item.text)
				ev_items.forth
			end
			set_path_view_check_list_settings(strs)

			save_resources
			ev_application.destroy
		end

	select_language is
			-- Called by `select_actions' of `language_combo'.
		do
			if not language_combo.text.is_empty then
				archetype_compiler.set_current_language (language_combo.text)

				if archetype_compiler.parse_succeeded then
					populate_view_controls
				end
			end
		end

	open_adl_file is
			-- Let the user select an ADL file, and the load and parse it.
		local
			dialog: EV_FILE_OPEN_DIALOG
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*." + archetype_file_extension, "Files of type " + archetype_file_extension])
			dialog.show_modal_to_window (Current)

			if not dialog.file_name.is_empty then
				archetype_directory.add_adhoc_item (dialog.file_name)

				if archetype_directory.has_selected_archetype_descriptor then
					archetype_view_tree_control.repopulate
				end
			end
		end

	save_adl_file is
			-- Save ADL file via GUI File save dialog
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			a_file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			name, format: STRING
		do
			if archetype_compiler.parse_succeeded then
				ok_to_write := True

				name := archetype_directory.selected_archetype_descriptor.full_path.twin
				name.remove_tail (archetype_file_extensions [archetype_file_extension].count)

				create save_dialog
					save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				from
					archetype_file_extensions.start
				until
					archetype_file_extensions.off
				loop
					format := archetype_file_extensions.key_for_iteration

					if has_archetype_serialiser_format (format) then
						save_dialog.filters.extend (["*" + archetype_file_extensions.item_for_iteration, "Files of type " + format])
					end

					archetype_file_extensions.forth
				end

				save_dialog.show_modal_to_window (Current)
				name := save_dialog.file_name

				if not name.is_empty then
					format ?= (save_dialog.filters [save_dialog.selected_filter_index]) [1]
					format.remove_head (2)

					if not file_system.has_extension (name, archetype_file_extensions [format]) then
						name.append (archetype_file_extensions [format])
						save_dialog.set_file_name (name)
					end

					create a_file.make (name)

					if a_file.exists then
						create question_dialog.make_with_text ("File " + save_dialog.file_title + " already exists. Replace it?")
						question_dialog.set_buttons(<<"Yes", "No">>)
						question_dialog.show_modal_to_window (Current)
						ok_to_write := question_dialog.selected_button.is_equal("Yes")
					end

					if ok_to_write then
						archetype_compiler.save_archetype_as (name, format)
						parser_status_area.append_text (archetype_compiler.status)

						if format.is_equal (archetype_file_extension) then
							populate_archetype_directory
						end
					end

					set_current_work_directory (save_dialog.file_path)
				end
			else
				create error_dialog.make_with_text("must parse before serialising")
				error_dialog.show_modal_to_window (Current)
			end
		end

	edit_archetype is
			-- launch external editor with archetype
		do
			execution_environment.launch(editor_command + " " + archetype_directory.selected_archetype_descriptor.full_path)
		end

	parse_archetype is
			-- Parse the archetype currently selected.
		do
			do_with_wait_cursor (agent
				do
					clear_all_controls
					archetype_compiler.parse_archetype
					parser_status_area.append_text (archetype_compiler.status)

					if archetype_compiler.parse_succeeded then
						populate_all_archetype_controls
						archetype_compiler.set_archetype_readonly
					else
						populate_archetype_id
					end
				end)
		end

	archetype_view_tree_item_select is
			-- Display details of `archetype_file_tree' when the user selects it.
		do
			archetype_view_tree_control.display_details_of_selected_item_after_delay
		end

	node_map_shrink_tree_one_level is
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.shrink_one_level
			end
		end

	node_map_expand_tree_one_level is
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.expand_one_level
			end
		end

	node_map_toggle_expand_tree is
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.toggle_expand_tree
			end
		end

	node_map_item_select is
		do
			node_map_control.item_select
		end

	on_tree_domain_selected
			-- Hide technical details in `parsed_archetype_tree'.
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.set_domain_mode
			end
		end

	on_tree_technical_selected
			-- Display technical details in `parsed_archetype_tree'.
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.set_technical_mode
			end
		end

	on_tree_flat_view_selected
			-- Do not show the inherited/defined status of nodes in `parsed_archetype_tree'.
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.set_flat_view
			end
		end

	on_tree_inheritance_selected
			-- Show the inherited/defined status of nodes in `parsed_archetype_tree'.
		do
			if archetype_compiler.parse_succeeded then
				node_map_control.set_inheritance_view
			end
		end

	move_cursor_to_pointer_location (a_x, a_y, a_button: INTEGER; a_x_tilt, a_y_tilt, a_pressure: DOUBLE; a_screen_x, a_screen_y: INTEGER) is
			-- Called by `pointer_button_press_actions' of `archetype_text_edit_area'.
		do
		end

	pointer_double_click_action (a_x, a_y, a_button: INTEGER; a_x_tilt, a_y_tilt, a_pressure: DOUBLE; a_screen_x, a_screen_y: INTEGER) is
			-- Called by `pointer_double_press_actions' of `archetype_text_edit_area'.
		do
		end

	archetype_text_edit_process_keystroke (a_keystring: STRING) is
			-- Called by `key_press_string_actions' of `archetype_text_edit_area'.
		do
		end

	archetype_test_go_stop is
			-- start running tests in test page
		do
			archetype_test_tree_control.archetype_test_go_stop
		end

	archetype_test_tree_expand_toggle is
			-- toggle logical state of test page archetype tree expandedness
		do
			archetype_test_tree_control.toggle_expand_tree
		end

	archetype_test_refresh is
			-- refresh test environment back to vanilla state
			-- i.e. synchronised with file system and with all
			-- statuses cleared
		do
			archetype_test_tree_control.populate
		end

	show_clipboard is
			-- show the current contents of the clipboard
		local
			ev_info_dlg: EV_INFORMATION_DIALOG
		do
			create ev_info_dlg.make_with_text (ev_application.clipboard.text)
			ev_info_dlg.set_title ("Clipboard Contents")
			ev_info_dlg.show_modal_to_window (Current)
		end

	path_column_select (a_list_item: EV_LIST_ITEM) is
			-- Called by `check_actions' of `path_view_check_list'.
		do
			adl_path_map_control.column_select(a_list_item)
		end

	path_column_unselect (a_list_item: EV_LIST_ITEM) is
			-- Called by `check_actions' of `path_view_check_list'.
		do
			adl_path_map_control.column_unselect(a_list_item)
		end

	path_row_set_filter is
			-- Called by `select_actions' of `path_filter_combo'.
		do
			adl_path_map_control.set_filter
		end

	arch_notebook_select is
			-- Called by `selection_actions' of `arch_notebook'.
		do
			if arch_notebook.item_text (arch_notebook.selected_item).is_equal ("Source") then
				populate_archetype_text_edit_area
			end
		end

	translations_select_language is
			-- Called by `select_actions' of `arch_translations_languages_list'.
		do
			translation_controls.populate_items
		end

feature {NONE} -- Edit events

	call_unless_text_focused (action: PROCEDURE [ANY, TUPLE])
			-- Some of the edit shortcuts are implemented automatically for text boxes.
			-- If called from a keyboard shortcut, execute the action unless a text box is focused.
			-- Executing it within a text box would cause it to be performed twice.
			-- For some actions this wouldn't really matter (cut, copy), but for paste it would be a blatant bug.
		do
			if focused_text = Void then
				action.call ([])
			end
		end

	on_cut
			-- Cut the selected item, depending on which widget has focus.
		do
			on_copy
			on_delete
		end

	on_copy
			-- Copy the selected item, depending on which widget has focus.
		do
			if parsed_archetype_found_paths.has_focus then
				adl_path_map_control.copy_path_to_clipboard
			elseif focused_text /= Void then
				if focused_text.has_selection then
					focused_text.copy_selection
				end
			end
		end

	on_paste
			-- Paste an item, depending on which widget has focus.
		local
			old_length: INTEGER
		do
			if focused_text /= Void then
				if focused_text.is_editable then
					on_delete
					old_length := focused_text.text_length
					focused_text.paste (focused_text.caret_position)
					focused_text.set_caret_position (focused_text.caret_position + focused_text.text_length - old_length)
				end
			end
		end

	on_delete
			-- Delete the selected item, depending on which widget has focus.
		do
			if focused_text /= Void then
				if focused_text.is_editable and focused_text.has_selection then
					focused_text.delete_selection
				end
			end
		end

	on_select_all
			-- Select all text in the currently focused text box, if any.
		do
			if focused_text /= Void and then focused_text.text_length > 0 then
				focused_text.select_all
			end
		end

feature -- Controls

	ontology_controls: GUI_ONTOLOGY_CONTROLS is
		once
			create Result.make(Current)
		end

	description_controls: GUI_DESCRIPTION_CONTROLS is
		once
			create Result.make(Current)
		end

	translation_controls: GUI_TRANSLATION_CONTROLS is
		once
			create Result.make(Current)
		end

	node_map_control: GUI_NODE_MAP_CONTROL is
		once
			create Result.make(Current)
		end

	adl_path_map_control: GUI_PATH_MAP_CONTROL is
		once
			create Result.make(Current)
		end

	archetype_view_tree_control: GUI_VIEW_ARCHETYPE_TREE_CONTROL is
		once
			create Result.make(Current)
		end

	archetype_test_tree_control: GUI_TEST_ARCHETYPE_TREE_CONTROL is
		once
			create Result.make(Current)
		end

	Option_dialog: OPTION_DIALOG is
		once
			create Result
			Result.set_main_window(Current)
		end

	Repository_dialog: REPOSITORY_DIALOG is
		once
			create Result
			Result.set_main_window(Current)
		end

	Icon_dialog: ICON_DIALOG is
		once
			create Result
			Result.set_main_window(Current)
		end

	Print_dialog: EV_PRINT_DIALOG is
			-- 	EV_PRINT_DIALOG for test.
		once
			create Result
		end

	About_dialog: EV_INFORMATION_DIALOG is
			-- about text
		do
			create result.make_with_text(splash_text)
			result.set_background_color(create {EV_COLOR}.make_with_8_bit_rgb(255, 255, 255))
			result.propagate_background_color
			result.set_pixmap(pixmaps.item("Ocean logo"))
		end

	News_dialog: EV_INFORMATION_DIALOG is
			-- news dialog
		do
			create Result.make_with_text(News_text)
			result.propagate_background_color
			set_background_color(create {EV_COLOR}.make_with_8_bit_rgb(255, 255, 255))
			Result.set_x_position(20)
			Result.set_y_position(10)
		end

feature {EV_DIALOG} -- Implementation

	populate_archetype_directory is
			-- rebuild archetype directory & repopulate relevant GUI parts
		do
			clear_all_controls
			archetype_directory.build_directory
			parser_status_area.set_text (utf8 (billboard_content))
			archetype_view_tree_control.populate
			archetype_test_tree_control.populate
		end

	clear_archetype_text_edit_area is
			--
		do
			archetype_text_edit_area.set_text("")
		end

	clear_all_controls is
			-- wipe out content from visual controls
		do
			parser_status_area.set_text("")
			language_combo.wipe_out
			node_map_control.clear
			ontology_controls.clear
			description_controls.clear
			translation_controls.clear
			parsed_archetype_found_paths.wipe_out
		end

	populate_user_controls is
			-- populate content from visual controls
		do
			populate_archetype_id
			populate_languages
			populate_adl_version
		end

	populate_all_archetype_controls is
			-- populate content from visual controls
		do
			populate_user_controls
			adl_path_map_control.populate
			node_map_control.populate
			ontology_controls.populate
			description_controls.populate
			translation_controls.populate
		end

	populate_view_controls is
			-- populate content from visual controls
		do
			adl_path_map_control.populate
			node_map_control.repopulate
			ontology_controls.populate
			description_controls.populate
		end

	populate_archetype_id is
		local
			selected: ARCHETYPE
		do
			selected := archetype_directory.selected_archetype

			if selected /= Void then
				archetype_id.set_text (utf8 (selected.archetype_id.as_string))

				if selected.is_specialised then
					parent_archetype_id.set_text (utf8 (selected.parent_archetype_id.as_string))
				else
					parent_archetype_id.remove_text
				end
			else
				archetype_id.remove_text
				parent_archetype_id.remove_text
			end
		end

	populate_adl_version is
			-- populate ADL version
		do
			adl_version_text.set_text (utf8 (archetype_directory.selected_archetype.adl_version))
		end

	populate_languages is
		do
			language_combo.select_actions.block
			language_combo.set_strings (archetype_directory.selected_archetype.languages_available)
			language_combo.select_actions.resume
			terminologies_list.set_strings (archetype_directory.selected_archetype.ontology.terminologies_available)
		end

	populate_archetype_text_edit_area is
		local
			leader, int_val_str, src, s: STRING
			len, left_pos, right_pos, line_cnt: INTEGER
		do
			create s.make_empty
			src := archetype_compiler.source
			len := src.count

			from
				left_pos := 1
				line_cnt := 1
			until
				left_pos > len
			loop
				create leader.make(4)
				leader.fill_blank
				int_val_str := line_cnt.out
				leader.replace_substring(int_val_str, 1, int_val_str.count)

				s.append (leader)
				right_pos := src.index_of('%N', left_pos)
				s.append(src.substring(left_pos, right_pos))
				left_pos := right_pos + 1
				line_cnt := line_cnt + 1
			end
			archetype_text_edit_area.set_text (utf8 (s))
		end

feature {NONE} -- Implementation

	do_with_wait_cursor (action: PROCEDURE [ANY, TUPLE])
			-- Perform `action' with an hourglass mouse cursor, restoring the cursor when done.
		local
			cursor: EV_CURSOR
		do
			cursor := pointer_style
			set_pointer_style (wait_cursor)
			action.call ([])
			set_pointer_style (cursor)
		rescue
			set_pointer_style (cursor)
		end

feature {NONE} -- Standard Windows behaviour that EiffelVision ought to be managing automatically

	step_focused_notebook_tab (step: INTEGER)
			-- Switch forward or back from the current tab page of the currently focused notebook.
		require
			valid_step: step.abs <= 1
		local
			notebook: EV_NOTEBOOK
			widget: EV_WIDGET
		do
			notebook := notebook_containing_focused_widget

			if notebook /= Void then
				widget := notebook [1 + (step + notebook.selected_item_index - 1 + notebook.count) \\ notebook.count]
				notebook.select_item (widget)
				focus_first_widget (widget)
			end
		end

	notebook_containing_focused_widget: EV_NOTEBOOK
			-- The notebook, if any, containing the currently focused widget.
		local
			container: EV_CONTAINER
		do
			if has_recursive (ev_application.focused_widget) then
				from
					container := ev_application.focused_widget.parent
				until
					container = Void or Result /= Void
				loop
					Result ?= container
					container := container.parent
				end
			end
		end

	focus_first_widget (widget: EV_WIDGET)
			-- Set focus to `widget' or to its first child widget that accepts focus.
		require
			widget_attached: widget /= Void
		local
			container: EV_CONTAINER
			grid: EV_GRID
			label: EV_LABEL
			widgets: LINEAR [EV_WIDGET]
		do
			container ?= widget
			grid ?= widget

			if container /= Void and grid = Void then
				from
					widgets := container.linear_representation
					widgets.start
				until
					widgets.off or container.has_recursive (ev_application.focused_widget)
				loop
					focus_first_widget (widgets.item)
					widgets.forth
				end
			elseif widget.is_displayed and widget.is_sensitive then
				label ?= widget

				if label = Void then
					widget.set_focus
				end
			end
		end

	focused_text: EV_TEXT_COMPONENT
			-- The currently focused text widget, if any.
		do
			Result ?= ev_application.focused_widget

			if not has_recursive (Result) then
				Result := Void
			end
		ensure
			focused: Result /= Void implies Result.has_focus
			in_this_window: Result /= Void implies has_recursive (Result)
		end

	suppress_tab_key_insertion (text: EV_TEXT; previous_widget, next_widget: EV_WIDGET)
			-- Prevent insertion of tabs into `text', so that the user can tab out of it.
		require
			text_attached: text /= Void
			previous_attached: previous_widget /= Void
			next_attached: next_widget /= Void
		do
			text.set_default_key_processing_handler (
				agent (key: EV_KEY): BOOLEAN
					do
						Result := key.code /= {EV_KEY_CONSTANTS}.key_tab
					end)

			text.key_press_actions.extend (
				agent (key: EV_KEY; previous, next: EV_WIDGET)
					do
						if key /= Void and then key.code = {EV_KEY_CONSTANTS}.key_tab then
							if not ev_application.ctrl_pressed and not ev_application.alt_pressed then
								if ev_application.shift_pressed then
									previous.set_focus
								else
									next.set_focus
								end
							end
						end
					end (?, previous_widget, next_widget))
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
--| The Original Code is main_window.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
