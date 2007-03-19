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

	EV_STOCK_PIXMAPS
		rename
			implementation as pixmaps_implementation
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ADL_INTERFACE
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
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

feature {NONE} -- Initialization

	user_initialization is
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			initialise_gui_settings

			format_combo.set_strings(adl_interface.archetype_serialiser_formats)
			format_combo.set_text (Archetype_file_extension)

			if editor_command.is_empty then
				set_editor_command(Default_editor_command)
			end

			initialise_accelerators

			if reference_repository_path.is_empty then
				set_reference_repository_path(application_startup_directory)
				need_to_set_repository := True
			end

			archetype_directory.put_repository (reference_repository_path, "reference")
			if not work_repository_path.is_empty then
				archetype_directory.put_repository (work_repository_path, "work")
			end
			populate_archetype_directory

			adl_interface.set_current_directory(reference_repository_path)
			if current_work_directory = Void then
				current_work_directory := adl_interface.working_directory
			end
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
			-- initialise keybard accelerators for various controls
		local
			acc: EV_ACCELERATOR
			key: EV_KEY
			key_constants: EV_KEY_CONSTANTS
		do
			create key_constants

			-- make ^C (copy) accelerator
			create key.make_with_code (key_constants.key_c)
			create acc.make_with_key_combination (key, True, False, False)
			acc.actions.extend(agent dispatch_ctrl_c_keystroke)
			accelerators.extend (acc)
		end

feature -- Access

	need_to_set_repository: BOOLEAN
			-- flag set on startup to indicate if repository needs to be specified by user

	current_work_directory: STRING
			-- directory where archetypes are currently being opened and saved
			-- from GUI open and save buttons; automatic opens (due to clicking
			-- on arhcyetpe name still use main repository directory

	parent_app: EV_APPLICATION
			-- provide a reference to the owning application so as to get access to a
			-- few things that only applications can do, like `process_events`	

feature -- Modification

	set_parent_app(an_app: EV_APPLICATION) is
			-- set `parent_app'
		require
			an_app /= Void
		do
			parent_app := an_app
		end

feature -- Commands

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
			parent_app.destroy
		end

	select_language is
			-- Called by `select_actions' of `language_combo'.
		do
			if language_combo.has_selection then
				adl_interface.set_current_language(language_combo.selected_text)
				if adl_interface.parse_succeeded then
					populate_view_controls
				end
			end
		end

	select_format is
			-- Called by `select_actions' of `format_combo'.
		do
		end

	open_adl_file is
			-- Called by `pointer_button_press_actions' of `open_file_mi'.
		local
			adl_file_open_dialog: EV_FILE_OPEN_DIALOG
			cur_csr: EV_CURSOR
		do
			cur_csr := pointer_style
			set_pointer_style(wait_cursor)

			create adl_file_open_dialog
			adl_file_open_dialog.set_start_directory(current_work_directory)
			adl_file_open_dialog.filters.extend (["*." + Archetype_file_extension,
				"Files of type " + Archetype_file_extension])
			Adl_file_open_dialog.show_modal_to_window (Current)
			if Adl_file_open_dialog.file_name /= Void and then not Adl_file_open_dialog.file_name.is_empty then
				load_and_parse_adl_file(Adl_file_open_dialog.file_name)
				current_work_directory := adl_interface.file_context.current_directory
			end

			set_pointer_style(cur_csr)
		end

	save_adl_file is
			-- Save ADL file via GUI File save dialog
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			a_file: PLAIN_TEXT_FILE
			adl_file_save_dialog: EV_FILE_SAVE_DIALOG
			fname: STRING
		do
			if adl_interface.archetype_source_loaded then
				if adl_interface.parse_succeeded then
					if not format_combo.has_selection then
						format_combo.select_all
					end
				--	resync_file

					ok_to_write := True
					create adl_file_save_dialog

					fname := current_work_directory + operating_environment.directory_separator.out + adl_interface.file_context.current_file_name
					fname.replace_substring(archetype_file_extensions.item(format_combo.selected_text), fname.count - Archetype_file_extension.count, fname.count)
					adl_file_save_dialog.set_file_name (fname)
					adl_file_save_dialog.filters.extend (["*" + archetype_file_extensions.item(format_combo.text),
						"Files of type " + format_combo.text])
					adl_file_save_dialog.show_modal_to_window (Current)
					if not adl_file_save_dialog.file_name.is_empty then
						create a_file.make(adl_file_save_dialog.file_name)
						if a_file.exists then
							create question_dialog.make_with_text("File " + adl_file_save_dialog.file_title + " already exists; replace?")
							question_dialog.set_buttons(<<"Yes", "No">>)
							question_dialog.show_modal_to_window (Current)
							ok_to_write := question_dialog.selected_button.is_equal("Yes")
						end
						if ok_to_write then
							adl_interface.save_archetype(adl_file_save_dialog.file_name,
																format_combo.selected_text)
							parser_status_area.append_text(adl_interface.status)
							if format_combo.selected_text.is_equal(Archetype_file_extension) then
								populate_archetype_directory
							end
						end
						current_work_directory := adl_file_save_dialog.file_path
					end
				else
					create error_dialog.make_with_text("must parse before serialising")
					error_dialog.show_modal_to_window (Current)
				end
			end
		end

	edit_archetype is
			-- launch external editor with archetype
		do
			if adl_interface.archetype_source_loaded then
				execution_environment.launch(editor_command + " " + adl_interface.file_context.current_full_path)
			end
		end

	parse_archetype is
			-- Called by `select_actions' of `parse'.
		local
			cur_csr: EV_CURSOR
		do
			cur_csr := pointer_style
			set_pointer_style(wait_cursor)

			if adl_interface.archetype_source_loaded then
				resync_file
				clear_all_controls
				adl_interface.parse_archetype
				parser_status_area.append_text(adl_interface.status)
				if adl_interface.parse_succeeded then
					populate_all_archetype_controls
--					arch_notebook.select_item (info_view_area)
--					source_notebook.select_item(parsed_archetype_tree_view)
					adl_interface.set_archetype_readonly
				else
					populate_archetype_id
				end
			end

			set_pointer_style(cur_csr)
		end

	resync_file is
			-- resynchronise in-memory archetype to file if changed due to editing
		do
			if adl_interface.file_changed_on_disk then
				adl_interface.resync_file
				clear_all_controls
				if arch_notebook.item_text(arch_notebook.selected_item).is_equal ("Source") then
					populate_archetype_text_edit_area
				end
			end
		end

	archetype_view_tree_item_select is
			-- select an item on the archetype tree
		local
			cur_csr: EV_CURSOR
		do
			cur_csr := pointer_style
			set_pointer_style(wait_cursor)

			archetype_view_tree_control.item_select
			if archetype_view_tree_control.has_selected_file then
				load_and_parse_adl_file(archetype_view_tree_control.selected_file_path)
				current_work_directory := adl_interface.file_context.current_directory
			end
   			archetype_file_tree.set_minimum_width(0)

			set_pointer_style(cur_csr)
		end

	node_map_shrink_tree_one_level is
		do
			if adl_interface.parse_succeeded then
				node_map_control.shrink_one_level
			end
		end

	node_map_expand_tree_one_level is
		do
			if adl_interface.parse_succeeded then
				node_map_control.expand_one_level
			end
		end

	node_map_toggle_expand_tree is
		do
			if adl_interface.parse_succeeded then
				node_map_control.toggle_expand_tree
			end
		end

	node_map_item_select is
		do
			node_map_control.item_select
		end

	node_map_tree_technical_mode is
			--
		do
			if adl_interface.parse_succeeded then
				node_map_control.toggle_technical_mode
			end
		end

	node_map_tree_source_status_mode is
			--
		do
			if adl_interface.parse_succeeded then
				node_map_control.toggle_source_status_mode
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

	archetype_test_tree_check_all_toggle is
			-- toggle logical state of test page check boxes
		do
			archetype_test_tree_control.toggle_check_all
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
			create ev_info_dlg.make_with_text(parent_app.clipboard.text)
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

	copy_path_to_clipboard is
			-- Called by `select_actions' of `copy_mi'.
		do
			adl_path_map_control.copy_path_to_clipboard
		end

	arch_notebook_select is
			-- Called by `selection_actions' of `arch_notebook'.
		do
			if adl_interface.archetype_source_loaded and arch_notebook.item_text(arch_notebook.selected_item).is_equal ("Source") then
				populate_archetype_text_edit_area
			end
		end

	translations_select_language is
			-- Called by `select_actions' of `arch_translations_languages_list'.
		do
			translation_controls.populate_items
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
			archetype_directory.repopulate
			parser_status_area.set_text(billboard_content)
			archetype_view_tree_control.populate
			archetype_test_tree_control.populate
		end

	load_and_parse_adl_file(a_file_path: STRING) is
			-- load and parse a named ADL file
		do
			adl_interface.reset
			adl_interface.open_adl_file(a_file_path)
			if arch_notebook.item_text(arch_notebook.selected_item).is_equal ("Source") then
				populate_archetype_text_edit_area
			end
			parse_archetype
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
		do
			archetype_id.set_text(adl_interface.adl_engine.archetype_id.as_string)
			if adl_interface.adl_engine.archetype /= Void and then
					adl_interface.adl_engine.archetype.is_specialised then
				parent_archetype_id.set_text(adl_interface.adl_engine.parent_archetype_id.as_string)
			else
				parent_archetype_id.set_text("")
			end
		end

	populate_adl_version is
			-- populate ADL version
		do
			adl_version_text.set_text(adl_interface.archetype.adl_version)
		end

	populate_languages is
		do
			language_combo.set_strings(ontology.languages_available)
			terminologies_list.set_strings(ontology.terminologies_available)
		end

	populate_archetype_text_edit_area is
		local
			leader, int_val_str, src, s: STRING
			len, left_pos, right_pos, line_cnt: INTEGER
		do
			create s.make(0)
			src := adl_interface.adl_engine.source
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
			archetype_text_edit_area.set_text(s)
		end

	dispatch_ctrl_c_keystroke is
			-- dispathed routine for ctrl-C keystroke
		do
			if parsed_archetype_found_paths.has_focus then
				adl_path_map_control.copy_path_to_clipboard
			end
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
