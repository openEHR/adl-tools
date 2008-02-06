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
			copy, default_create
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_PARSER
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_DIRECTORY
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
			initialise_default_resource_config_file_name
			initialise_accelerators
		end

	initialise_accelerators is
			-- Initialise keyboard accelerators for various widgets.
		do
			add_shortcut (agent step_focused_notebook_tab (1), key_tab, True, False)
			add_shortcut (agent step_focused_notebook_tab (-1), key_tab, True, True)

			add_menu_shortcut (repository_menu_build_all, key_f7, False, False)
			add_menu_shortcut (repository_menu_rebuild_all, key_f7, False, True)
			add_menu_shortcut (repository_menu_build_subtree, key_f7, True, False)
			add_menu_shortcut (repository_menu_rebuild_subtree, key_f7, True, True)
			add_menu_shortcut (repository_menu_interrupt_build, key_escape, False, True)

			add_menu_shortcut (file_menu_open, key_o, True, False)
			add_menu_shortcut_for_action (edit_menu_copy, agent call_unless_text_focused (agent on_copy), key_c, True, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False)
		end

	initialise_overall_appearance is
			-- Initialise the main properties of the window (size, appearance, title, etc.).
		local
			cur_title: STRING
		do
			set_icon_pixmap (adl_workbench_ico)
			cur_title := title.twin
			cur_title.replace_substring_all ("VER", Current_adl_version)
			set_title (cur_title)

			set_position (app_x_position, app_y_position)

			if app_width > 0 then
				set_width (app_width)
			else
				set_width (app_initial_width)
			end

			if app_height > 0 then
				set_height (app_height)
			else
				set_height (app_initial_height)
			end

			if main_notebook_tab_pos > 1 then
				main_nb.select_item (main_nb.i_th (main_notebook_tab_pos))
			end
		end

	initialise_path_control is
			-- Initialise widgets associated with the Node Map and the Path Analysis.
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
					path_control_filter_names.item (filter_combo_index).is_equal (path_filter_combo_selection)
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
			strs := path_view_check_list_settings

			if not strs.is_empty then
				strs.compare_objects

				from
					path_view_check_list.start
				until
					path_view_check_list.off
				loop
					if strs.has (path_view_check_list.item.text) then
						path_view_check_list.check_item (path_view_check_list.item)
					end

					path_view_check_list.forth
				end
			else -- default to physical paths
				path_view_check_list.check_item (path_view_check_list.i_th (2))
				path_view_check_list.check_item (path_view_check_list.i_th (3))
			end
		end

	initialise_splitters is
			-- Restore splitter widgets to their remembered positions.
		do
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
		end

feature -- Status setting

	show
			-- Do a few adjustments and load the repository before displaying the window.
		do
			populate_archetype_directory
			archetype_compiler.set_visual_update_action (agent build_gui_update)
			archetype_compiler.set_initial_visual_update_action (agent build_gui_stats_update)
			archetype_compiler.set_final_visual_update_action (agent build_gui_stats_update)
			initialise_overall_appearance
			initialise_path_control
			Precursor
			initialise_splitters
			focus_first_widget (main_nb.selected_item)

			if app_maximised then
				maximize
			end

			if editor_command.is_empty then
				set_editor_command (default_editor_command)
			end

			if new_news then
				display_news
				update_status_file
			end

			if reference_repository_path.is_empty then
				set_reference_repository_path (application_startup_directory)
				set_repository
			elseif html_export_directory.is_empty then
				set_html_export_directory (file_system.pathname (file_system.absolute_parent_directory (reference_repository_path), "html"))
			end
		end

	update_status_area (text: STRING) is
			-- Append `text' to `parser_status_area'.
		require
			text_attached: text /= Void
		do
			parser_status_area.append_text (text)
		end

	set_status_area (text: STRING) is
			-- set `parser_status_area' to `text'
		require
			text_attached: text /= Void
		do
			parser_status_area.set_text (text)
		end

feature -- File events

	open_adl_file is
			-- Let the user select an ADL file, and then load and parse it.
		local
			dialog: EV_FILE_OPEN_DIALOG
			ara: ARCH_REP_ARCHETYPE
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*." + archetype_native_syntax, "Files of type " + Archetype_flat_file_extension])
			dialog.show_modal_to_window (Current)

			if not dialog.file_name.is_empty then
				archetype_directory.add_adhoc_item (dialog.file_name)
				ara := archetype_directory.archetype_descriptor_from_full_path (dialog.file_name)

				if ara /= Void then
					archetype_directory.set_selected_item (ara)
					archetype_view_tree_control.populate
				end
			end
		end

	parse_archetype
			-- Load and parse the archetype currently selected in `archetype_directory'.
		local
			ara: ARCH_REP_ARCHETYPE
		do
			clear_all_controls
			arch_notebook_select
			ara := archetype_directory.selected_archetype

			if ara /= Void then
				if not ara.parse_attempted then
					do_with_wait_cursor (agent archetype_compiler.build_lineage (ara))
				elseif ara.is_differential_file_out_of_date then
					do_with_wait_cursor (agent archetype_compiler.rebuild_lineage (ara))
				elseif not ara.compiler_status.is_empty then
					parser_status_area.set_text (utf8(ara.compiler_status))
				end

				if ara.is_valid then
					populate_all_archetype_controls
				else -- if ara.is_parsed then
					populate_archetype_id
				end
			end
		end

	edit_archetype is
			-- Launch the external editor with the archetype currently selected in `archetype_directory'.
		local
			info_dialog: EV_INFORMATION_DIALOG
			path: STRING
			ara: ARCH_REP_ARCHETYPE
		do
			ara := archetype_directory.selected_archetype

			if ara /= Void then
				if ara.has_differential_file then
					path := ara.differential_path
				else
					path := ara.full_path
					create info_dialog.make_with_text ("No source (.adls) file available; opening flat (.adl) file.")
					info_dialog.show_modal_to_window (Current)
				end

				execution_environment.launch (editor_command + " %"" + path + "%"")
			end
		end

	save_adl_file is
			-- Save ADL source file via GUI File save dialog
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			a_file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			name, format: STRING
		do
			if archetype_directory.has_valid_selected_archetype then
				name := archetype_directory.selected_archetype.full_path.twin
				name.remove_tail (archetype_file_extensions [Archetype_flat_file_extension].count)

				create save_dialog
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				from
					archetype_serialiser_formats.start
				until
					archetype_serialiser_formats.off
				loop
					format := archetype_serialiser_formats.item_for_iteration
					save_dialog.filters.extend (["*" + archetype_file_extensions [format], "Files of type " + format])
					archetype_serialiser_formats.forth
				end

				save_dialog.show_modal_to_window (Current)
				name := save_dialog.file_name

				if not name.is_empty then
					set_current_work_directory (file_system.dirname (name))
					format ?= (save_dialog.filters [save_dialog.selected_filter_index]) [1]
					format.remove_head (2)

					if not file_system.has_extension (name, archetype_file_extensions [format]) then
						name.append (archetype_file_extensions [format])
					end

					ok_to_write := True
					create a_file.make (name)

					if a_file.exists then
						create question_dialog.make_with_text ("File " + file_system.basename (name) + " already exists. Replace it?")
						question_dialog.set_buttons (<<"Yes", "No">>)
						question_dialog.show_modal_to_window (Current)
						ok_to_write := question_dialog.selected_button.same_string ("Yes")
					end

					if ok_to_write then
						archetype_parser.save_archetype_differential_as (name, format)
						parser_status_area.append_text (archetype_parser.status)

						-- FIXME: currently this refreshes the whole view and forgets what archetype the user was on;
						-- it is only useful to do this in any case if the archetype was written over the .adl file
						-- in the repository area; if it is saved to e.g. the temp area, this should not even be done.
						-- It also causes the compilation status of all of the archetypes to be forgotten.
						if format.is_equal (archetype_native_syntax) then
							populate_archetype_directory
						end
					end
				end
			else
				create error_dialog.make_with_text ("Must parse before serialising.")
				error_dialog.show_modal_to_window (Current)
			end
		end

	exit_app is
			-- Terminate the application, saving the window location.
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
				path_map_control.copy_path_to_clipboard
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

	show_clipboard is
			-- Display the current contents of the clipboard.
		local
			dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (ev_application.clipboard.text)
			dialog.set_title ("Clipboard Contents")
			dialog.show_modal_to_window (Current)
		end

feature {NONE} -- Repository events

	set_repository is
			-- Display the Repository Settings dialog.
		do
			repository_dialog.show_modal_to_window (Current)
		end

	build_all
			-- Build the whole system.
		do
			do_build_action (agent archetype_compiler.build_all)
		end

	rebuild_all
			-- Force the whole system to rebuild.
		do
			compiler_error_control.clear
			do_build_action (agent archetype_compiler.rebuild_all)
		end

	build_subtree
			-- Build the subsystem below the currently selected node.
		do
			do_build_action (agent archetype_compiler.build_subtree)
		end

	rebuild_subtree
			-- Force rebuilding of the whole subsystem below the currently selected node.
		do
			do_build_action (agent archetype_compiler.rebuild_subtree)
		end

	export_html
			-- Generate HTML from flat archetypes into `html_export_directory'.
		local
			dialog: EV_QUESTION_DIALOG
		do
			create dialog.make_with_text ("Only successfully built archetypes can be exported to HTML.%N%NDo you want to build each archetype before exporting it?%N")
			dialog.set_title (title + " - Export HTML")
			dialog.set_buttons (<<"Yes, Build and Export All", "No, Export only the built ones", "Cancel">>)
			dialog.set_default_cancel_button (dialog.button ("Cancel"))
			dialog.show_modal_to_window (Current)

			if dialog.selected_button.starts_with ("Yes") then
				do_build_action (agent archetype_compiler.build_and_export_all_html (html_export_directory))
			elseif dialog.selected_button.starts_with ("No") then
				do_build_action (agent archetype_compiler.export_all_html (html_export_directory))
			end
		end

	interrupt_build
			-- Cancel the build currently in progress.
		do
			archetype_compiler.interrupt
		end

feature {NONE} -- Tools events

	clean_generated_files
			-- Remove all generated files below the repository directory.
		local
			delete_adls_files_in_folder: PROCEDURE [ANY, TUPLE [ARCH_REP_ITEM]]
		do
			delete_adls_files_in_folder := agent (a: ARCH_REP_ITEM)
				local
					dir: DIRECTORY
					name: STRING
				do
					if {folder: !ARCH_REP_FOLDER} a then
						create dir.make_open_read (folder.full_path)

						from
							dir.start
							dir.readentry
						until
							dir.lastentry = Void
						loop
							name := dir.lastentry
							dir.readentry

							if file_system.has_extension (name, "." + archetype_source_file_extension) then
								name := file_system.pathname (dir.name, name)

								if file_system.is_file_readable (name) then
									file_system.delete_file (name)
								end
							end
						end

						dir.close
					end
				end

			do_with_wait_cursor (agent archetype_directory.do_subtree (archetype_directory.directory, delete_adls_files_in_folder, Void))
		end

	set_options
			-- Display the Options dialog.
		do
			option_dialog.show_modal_to_window (Current)
		end

feature {NONE} -- Help events

	display_icon_help is
			-- Display the Icons help dialog.
		do
			icon_dialog.show_modal_to_window (Current)
		end

	display_news is
			-- Display news about the latest release.
		do
			News_dialog.show_modal_to_window (Current)
		end

	show_online_help is
			-- Display the application's online help in an external browser.
		do
			execution_environment.launch (Default_browser_command + ADL_help_page_url)
		end

	display_about is
			-- Display the application's About box.
		do
			About_dialog.show_modal_to_window (Current)
		end

feature -- Archetype Commands

	archetype_view_tree_item_select is
			-- Display details of `archetype_file_tree' when the user selects it.
		do
			archetype_view_tree_control.display_details_of_selected_item_after_delay
		end

	archetype_view_tree_select_node is
			-- Display node of `archetype_file_tree' corresponding to a selected archetype in the ARCH_DIRECTORY
		do
			archetype_view_tree_control.make_node_visible (archetype_directory.selected_item)
			parse_archetype
		end

	node_map_shrink_tree_one_level is
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.shrink_one_level
			end
		end

	node_map_expand_tree_one_level is
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.expand_one_level
			end
		end

	node_map_toggle_expand_tree is
		do
			if archetype_directory.has_valid_selected_archetype then
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
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.set_domain_mode
			end
		end

	on_tree_technical_selected
			-- Display technical details in `parsed_archetype_tree'.
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.set_technical_mode
			end
		end

	on_tree_flat_view_selected
			-- Do not show the inherited/defined status of nodes in `parsed_archetype_tree'.
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.set_flat_view
				ontology_controls.set_flat_view
				path_map_control.set_flat_view
			end
		end

	on_tree_inheritance_selected
			-- Show the inherited/defined status of nodes in `parsed_archetype_tree'.
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.set_differential_view
				ontology_controls.set_differential_view
				path_map_control.set_differential_view
			end
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

	path_column_select (a_list_item: EV_LIST_ITEM) is
			-- Called by `check_actions' of `path_view_check_list'.
		do
			path_map_control.column_select(a_list_item)
		end

	path_column_unselect (a_list_item: EV_LIST_ITEM) is
			-- Called by `check_actions' of `path_view_check_list'.
		do
			path_map_control.column_unselect(a_list_item)
		end

	path_row_set_filter is
			-- Called by `select_actions' of `path_filter_combo'.
		do
			path_map_control.set_filter
		end

	arch_notebook_select is
			-- Redisplay the archetype's source when the selected page changes in `arch_notebook'.
		local
			leader, int_val_str, src, s: STRING
			len, left_pos, right_pos, line_cnt: INTEGER
		do
			if arch_notebook.selected_item = archetype_source_rich_text then
				if archetype_directory.has_selected_archetype then
					if archetype_directory.selected_archetype.has_differential_file then
						src := archetype_directory.selected_archetype.differential_text
					else
						src := "==================== FLAT TEXT (no source .adls file available) ======================%N"
						src.append (archetype_directory.selected_archetype.flat_text)
					end

					len := src.count
					create s.make (len)

					if show_line_numbers then
						create leader.make_filled (' ', 4)
					end

					from
						left_pos := 1
						line_cnt := 1
					until
						left_pos > len
					loop
						if leader /= Void then
							int_val_str := line_cnt.out
							leader.replace_substring (int_val_str, 1, int_val_str.count)
							s.append (leader)
						end

						right_pos := src.index_of ('%N', left_pos)
						s.append (src.substring (left_pos, right_pos))
						left_pos := right_pos + 1
						line_cnt := line_cnt + 1
					end

					archetype_source_rich_text.set_text (utf8 (s))
				else
					archetype_source_rich_text.remove_text
				end
			end
		end

	translations_select_language is
			-- Called by `select_actions' of `arch_translations_languages_list'.
		do
			translation_controls.populate_items
		end

feature {NONE} -- Application Commands

	select_language is
			-- Called by `select_actions' of `language_combo'.
		do
			if not language_combo.text.is_empty then
				set_current_language (language_combo.text)

				if archetype_directory.has_valid_selected_archetype then
					populate_view_controls
				end
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

feature -- Controls

	ontology_controls: GUI_ONTOLOGY_CONTROLS is
		once
			create Result.make (Current)
		end

	description_controls: GUI_DESCRIPTION_CONTROLS is
		once
			create Result.make (Current)
		end

	translation_controls: GUI_TRANSLATION_CONTROLS is
		once
			create Result.make (Current)
		end

	node_map_control: GUI_NODE_MAP_CONTROL is
		once
			create Result.make (Current)
		end

	slot_map_control: GUI_SLOT_MAP_CONTROL is
		once
			create Result.make (Current)
		end

	used_by_map_control: GUI_USED_BY_MAP_CONTROL is
		once
			create Result.make (Current)
		end

	path_map_control: GUI_PATH_MAP_CONTROL is
		once
			create Result.make (Current)
		end

	archetype_view_tree_control: GUI_VIEW_ARCHETYPE_TREE_CONTROL is
		once
			create Result.make (Current)
		end

	archetype_test_tree_control: GUI_TEST_ARCHETYPE_TREE_CONTROL is
		once
			create Result.make (Current)
		end

	compiler_error_control: GUI_COMPILER_ERROR_CONTROL is
		once
			create Result.make (Current)
		end

	Option_dialog: OPTION_DIALOG is
		once
			create Result
			Result.set_main_window (Current)
		end

	Repository_dialog: REPOSITORY_DIALOG is
		once
			create Result
			Result.set_main_window (Current)
		end

	Icon_dialog: ICON_DIALOG is
		once
			create Result
			Result.set_main_window (Current)
		end

	Print_dialog: EV_PRINT_DIALOG is
			-- 	EV_PRINT_DIALOG for test.
		once
			create Result
		end

	About_dialog: EV_INFORMATION_DIALOG is
			-- about text
		do
			create Result.make_with_text (splash_text)
			Result.set_title ("About ADL Workbench")
			Result.set_pixmap (pixmaps ["openEHR and Ocean"])
			Result.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
		end

	News_dialog: EV_INFORMATION_DIALOG is
			-- news dialog
		do
			create Result.make_with_text (news_text)
			Result.set_x_position (20)
			Result.set_y_position (10)
			Result.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
		end

feature {EV_DIALOG} -- Implementation

	populate_archetype_directory
			-- Rebuild archetype directory & repopulate relevant GUI parts.
		do
			do_with_wait_cursor (agent
				do
					clear_all_controls
					archetype_directory.make

					if archetype_directory.valid_repository_path (reference_repository_path) then
						archetype_directory.put_repository (reference_repository_path, 2)
					end

					if archetype_directory.valid_repository_path (work_repository_path) then
						archetype_directory.put_repository (work_repository_path, 3)
					end

					archetype_directory.build_directory
					parser_status_area.set_text (utf8 (billboard_content))
					archetype_view_tree_control.populate
					archetype_test_tree_control.populate
					populate_statistics
				end)
		end

	clear_all_controls
			-- Wipe out content from visual controls.
		do
			parser_status_area.remove_text
			language_combo.wipe_out
			node_map_control.clear
			ontology_controls.clear
			description_controls.clear
			translation_controls.clear
			parsed_archetype_found_paths.wipe_out
		end

	populate_user_controls
			-- Populate content from visual controls.
		do
			populate_archetype_id
			populate_languages
			populate_adl_version
		end

	populate_all_archetype_controls
			-- Populate content from visual controls.
		do
			populate_user_controls
			path_map_control.populate
			slot_map_control.populate
			used_by_map_control.populate
			node_map_control.populate
			ontology_controls.populate
			description_controls.populate
			translation_controls.populate
		end

	populate_view_controls
			-- Populate content from visual controls.
		do
			path_map_control.populate
			node_map_control.repopulate
			ontology_controls.populate
			description_controls.populate
		end

	populate_archetype_id
		local
			selected: ARCHETYPE_ID
		do
			selected := archetype_directory.selected_archetype.id

			if selected /= Void then
				archetype_id.set_text (utf8 (selected.as_string))
			else
				archetype_id.remove_text
			end
		end

	populate_adl_version
			-- Populate ADL version.
		do
			if archetype_directory.has_selected_archetype then
				adl_version_text.set_text (utf8 (archetype_directory.selected_archetype.archetype_differential.adl_version))
			else
				adl_version_text.remove_text
			end
		end

	populate_languages
			-- Populate the languages combo box and the terminologies list.
		do
			language_combo.select_actions.block

			if archetype_directory.has_selected_archetype then
				language_combo.set_strings (archetype_directory.selected_archetype.archetype_differential.languages_available)
				terminologies_list.set_strings (archetype_directory.selected_archetype.archetype_differential.ontology.terminologies_available)
			else
				language_combo.wipe_out
				terminologies_list.wipe_out
			end

			language_combo.select_actions.resume
		end

	populate_statistics is
			-- populate statistics
		do
			arch_total_count_tf.set_text (archetype_directory.total_archetype_count.out)
			arch_spec_count_tf.set_text (archetype_directory.specialised_archetype_count.out)
			arch_slotted_count_tf.set_text (archetype_directory.slotted_archetype_count.out)
			arch_used_by_count_tf.set_text (archetype_directory.used_by_archetype_count.out)
			arch_bad_count_tf.set_text (archetype_directory.bad_archetype_count.out)
		end

feature {NONE} -- Implementation

	do_with_wait_cursor (action: PROCEDURE [ANY, TUPLE])
			-- Perform `action' with an hourglass mouse cursor, restoring the cursor when done.
		require
			action_attached: action /= Void
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

	do_build_action (action: PROCEDURE [ANY, TUPLE])
			-- Perform `action', with an hourglass mouse cursor and disabling the build menus, until done.
		require
			action_attached: action /= Void
		local
			menu_items: ARRAY [EV_MENU_ITEM]
		do
			if menu_items = Void then
				menu_items := <<
					repository_menu_build_all,
					repository_menu_rebuild_all,
					repository_menu_build_subtree,
					repository_menu_rebuild_subtree,
					repository_menu_export_html
				>>

				menu_items.do_all (agent {EV_MENU_ITEM}.disable_sensitive)
				repository_menu_interrupt_build.enable_sensitive
				do_with_wait_cursor (action)
			end

			menu_items.do_all (agent {EV_MENU_ITEM}.enable_sensitive)
			repository_menu_interrupt_build.disable_sensitive
		rescue
			retry
		end

	build_gui_update (ara: ARCH_REP_ARCHETYPE) is
			-- Update GUI with progress on build.
		do
			parser_status_area.append_text (utf8 (archetype_compiler.status))

			if ara /= Void then
				archetype_view_tree_control.do_node_for_item (ara, agent archetype_view_tree_control.set_node_pixmap)
				archetype_test_tree_control.do_row_for_item (ara, agent archetype_test_tree_control.set_row_pixmap)

				if ara.parse_attempted and ara.has_compiler_status then
					compiler_error_control.extend (ara)
				end
			end

			ev_application.process_events
		end

	build_gui_stats_update is
			-- Update GUI with progress at end of build.
		do
			populate_statistics
			ev_application.process_events
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
