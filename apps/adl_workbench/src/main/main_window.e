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

	user_initialization
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			initialise_default_resource_config_file_name
			initialise_accelerators
		end

	initialise_accelerators
			-- Initialise keyboard accelerators for various widgets.
		do
			add_shortcut (agent step_focused_notebook_tab (1), key_tab, True, False, False)
			add_shortcut (agent step_focused_notebook_tab (-1), key_tab, True, False, True)

			add_menu_shortcut (file_menu_open, key_o, True, False, False)
			add_menu_shortcut_for_action (edit_menu_copy, agent call_unless_text_focused (agent on_copy), key_c, True, False, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False, False)

			add_menu_shortcut (repository_menu_build_all, key_f7, False, False, False)
			add_menu_shortcut (repository_menu_rebuild_all, key_f7, False, False, True)
			add_menu_shortcut (repository_menu_build_subtree, key_f7, True, False, False)
			add_menu_shortcut (repository_menu_rebuild_subtree, key_f7, True, False, True)
			add_menu_shortcut (repository_menu_interrupt_build, key_escape, False, False, True)

			add_menu_shortcut (history_menu_back, key_left, False, True, False)
			add_menu_shortcut (history_menu_forward, key_right, False, True, False)

			archetype_file_tree.set_default_key_processing_handler (
				agent (key: EV_KEY): BOOLEAN
						-- Workaround to prevent Alt+Left and Alt+Right being inappropriately handled by the tree view.
					do
						Result := (key.code /= key_left and key.code /= key_right) or not ev_application.alt_pressed
					end)
		end

	initialise_overall_appearance
			-- Initialise the main properties of the window (size, appearance, title, etc.).
		local
			cur_title: STRING
		do
			set_icon_pixmap (adl_workbench_ico)
			cur_title := title.twin
			cur_title.replace_substring_all ("VER", current_adl_version)
			set_title (cur_title)

			file_menu_open.set_pixmap (pixmaps ["archetype_1"])
			file_menu_parse.set_pixmap (pixmaps ["parse"])
			file_menu_edit.set_pixmap (pixmaps ["edit"])
			history_menu_back.set_pixmap (pixmaps ["history_back"])
			history_menu_forward.set_pixmap (pixmaps ["history_forward"])

			open_button.set_pixmap (pixmaps ["archetype_1"])
			parse_button.set_pixmap (pixmaps ["parse"])
			edit_button.set_pixmap (pixmaps ["edit"])
			history_back_button.set_pixmap (pixmaps ["history_back"])
			history_forward_button.set_pixmap (pixmaps ["history_forward"])

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
				main_notebook.select_item (main_notebook [main_notebook_tab_pos])
			end
		end

	initialise_path_control
			-- Initialise widgets associated with the Node Map and the Path Analysis.
		local
			filter_combo_index: INTEGER
			strs: ARRAYED_LIST [STRING]
		do
			path_analysis_multi_column_list.enable_multiple_selection
			path_analysis_row_filter_combo_box.set_strings (path_control_filter_names)

			if not path_analysis_row_filter_combo_box.is_empty then
				from
					filter_combo_index := 1
				until
					filter_combo_index > path_control_filter_names.count or
					path_control_filter_names [filter_combo_index].is_equal (path_filter_combo_selection)
				loop
					filter_combo_index := filter_combo_index + 1
				end

				if filter_combo_index > path_control_filter_names.count then -- non-existent string in session file
					filter_combo_index := 1
				end
			else
				filter_combo_index := 1
			end

			path_analysis_row_filter_combo_box [filter_combo_index].enable_select

			path_analysis_column_view_checkable_list.set_strings (path_control_column_names)
			strs := path_view_check_list_settings

			if not strs.is_empty then
				strs.compare_objects

				from
					path_analysis_column_view_checkable_list.start
				until
					path_analysis_column_view_checkable_list.off
				loop
					if strs.has (path_analysis_column_view_checkable_list.item.text) then
						path_analysis_column_view_checkable_list.check_item (path_analysis_column_view_checkable_list.item)
					end

					path_analysis_column_view_checkable_list.forth
				end
			else -- default to physical paths
				path_analysis_column_view_checkable_list.check_item (path_analysis_column_view_checkable_list [2])
				path_analysis_column_view_checkable_list.check_item (path_analysis_column_view_checkable_list [3])
			end
		end

	initialise_splitters
			-- Restore splitter widgets to their remembered positions.
		do
			if test_split_position > 0 then
				test_split_area.set_split_position (test_split_position)
			end

			if explorer_split_position > 0 then
				explorer_split_area.set_split_position (explorer_split_position)
			end

			if node_map_and_ontology_split_position > 0 then
				node_map_and_ontology_split_area.set_split_position (node_map_and_ontology_split_position)
			end

			if total_split_position > 0 then
				total_split_area.set_split_position (total_split_position)
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
			focus_first_widget (main_notebook.selected_item)

			if app_maximised then
				maximize
			end

			if editor_command.is_empty then
				set_editor_command (default_editor_command)
			end

			if new_news then
				clean_generated_files
				display_news
				update_status_file
			end

			if reference_repository_path.is_empty then
				set_reference_repository_path (application_startup_directory)
				set_repository

				if archetype_file_tree.is_empty then
					populate_archetype_directory
				end
			end

			if html_export_directory.is_empty then
				set_html_export_directory (file_system.pathname (file_system.absolute_parent_directory (reference_repository_path), "html"))
			end
		end

	update_status_area (text: STRING)
			-- Append `text' to `parser_status_area'.
		require
			text_attached: text /= Void
		do
			parser_status_area.append_text (utf8 (text))
			parser_status_area.set_background_color (status_area_background_color)
			ev_application.process_graphical_events
		end

	set_status_area (text: STRING)
			-- Set `parser_status_area' to `text'.
		require
			text_attached: text /= Void
		do
			parser_status_area.set_text (utf8 (text))
			parser_status_area.set_background_color (status_area_background_color)
			ev_application.process_graphical_events
		end

	save_resources_and_show_status
			-- Save the application configuration file and update the status area.
		do
			save_resources
			update_status_area ("Wrote config file %"" + resource_config_file_name + "%".%N")
		end

feature -- File events

	open_adl_file
			-- Let the user select an ADL file, and then load and parse it.
		local
			dialog: EV_FILE_OPEN_DIALOG
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*." + archetype_native_syntax, "Files of type " + archetype_flat_file_extension])
			dialog.show_modal_to_window (Current)

			if not dialog.file_name.is_empty then
				if not file_system.file_exists (dialog.file_name) then
					(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + dialog.file_name + "%" does not exist.")).show_modal_to_window (Current)
				else
					archetype_directory.add_adhoc_item (dialog.file_name)

					if {ara: !ARCH_REP_ARCHETYPE} archetype_directory.archetype_descriptor_from_full_path (dialog.file_name) then
						archetype_directory.set_selected_item (ara)
						archetype_view_tree_control.populate
					end

					set_status_area (billboard_content)
				end
			end
		end

	parse_archetype
			-- Load and parse the archetype currently selected in `archetype_directory'.
		local
			ara: ARCH_REP_ARCHETYPE
		do
			clear_all_controls
			ara := archetype_directory.selected_archetype

			if ara /= Void then
				if not ara.parse_attempted then
					do_with_wait_cursor (agent archetype_compiler.build_lineage (ara))
				elseif ara.is_differential_file_out_of_date then
					do_with_wait_cursor (agent archetype_compiler.rebuild_lineage (ara))
				elseif not ara.compiler_status.is_empty then
					set_status_area (ara.compiler_status)
				end

				populate_archetype_id
				populate_languages
				populate_adl_version
				populate_view_controls
			end
		end

	edit_archetype
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

	save_adl_file
			-- Save ADL source file via GUI file save dialog.
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
				name.remove_tail (archetype_flat_file_extension.count + 1)

				create save_dialog
				save_dialog.set_title ("Save Archetype")
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				from
					archetype_serialiser_formats.start
				until
					archetype_serialiser_formats.off
				loop
					format := archetype_serialiser_formats.item_for_iteration
					save_dialog.filters.extend (["*" + archetype_file_extensions [format], "Save as " + format.as_upper])
					archetype_serialiser_formats.forth
				end

				save_dialog.show_modal_to_window (Current)
				name := save_dialog.file_name

				if not name.is_empty then
					set_current_work_directory (file_system.dirname (name))
					format := archetype_serialiser_formats [save_dialog.selected_filter_index]

					if not file_system.has_extension (name, archetype_file_extensions [format]) then
						name.append (archetype_file_extensions [format])
					end

					ok_to_write := True
					create a_file.make (name)

					if a_file.exists then
						create question_dialog.make_with_text ("File " + file_system.basename (name) + " already exists. Replace it?")
						question_dialog.set_title ("Save as " + format.as_upper)
						question_dialog.set_buttons (<<"Yes", "No">>)
						question_dialog.show_modal_to_window (Current)
						ok_to_write := question_dialog.selected_button.same_string ("Yes")
					end

					if ok_to_write then
						archetype_parser.set_target (archetype_directory.selected_archetype)
						archetype_parser.save_archetype_differential_as (name, format)
						update_status_area (archetype_parser.status)
					end
				end
			else
				create error_dialog.make_with_text ("Must parse before serialising.")
				error_dialog.show_modal_to_window (Current)
			end
		end

	exit_app
			-- Terminate the application, saving the window location.
		local
			strs: ARRAYED_LIST [STRING]
			ev_items: DYNAMIC_LIST [EV_LIST_ITEM]
		do
			set_total_split_position (total_split_area.split_position)
			set_node_map_and_ontology_split_position (node_map_and_ontology_split_area.split_position)
			set_test_split_position (test_split_area.split_position)
			set_explorer_split_position (explorer_split_area.split_position)
			set_app_width (width)
			set_app_height (height)
			set_app_x_position (x_position)
			set_app_y_position (y_position)
			set_app_maximised (is_maximized)
			set_main_notebook_tab_pos (main_notebook.selected_item_index)

			set_path_filter_combo_selection (path_analysis_row_filter_combo_box.selected_item.text)

			ev_items := path_analysis_column_view_checkable_list.checked_items
			create strs.make (0)

			from
				ev_items.start
			until
				ev_items.off
			loop
				strs.extend (ev_items.item.text)
				ev_items.forth
			end

			set_path_view_check_list_settings (strs)

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
			if path_analysis_multi_column_list.has_focus then
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

	show_clipboard
			-- Display the current contents of the clipboard.
		local
			dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (ev_application.clipboard.text)
			dialog.set_title ("Clipboard Contents")
			dialog.show_modal_to_window (Current)
		end

feature {NONE} -- Repository events

	set_repository
			-- Display the Repository Settings dialog.
		local
			dialog: REPOSITORY_DIALOG
		do
			create dialog
			dialog.show_modal_to_window (Current)

			if dialog.has_changed_paths then
				populate_archetype_directory
				save_resources_and_show_status
			end
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

feature {NONE} -- History events

	on_history
			-- On opening the History menu, append the list of recent archetypes.
		do
			history_menu.wipe_out
			history_menu.extend (history_menu_back)
			history_menu.extend (history_menu_forward)
			history_menu.extend (history_menu_separator)

			archetype_directory.recently_selected_archetypes (20).do_all (agent (ara: !ARCH_REP_ARCHETYPE)
				local
					mi: EV_MENU_ITEM
				do
					create mi.make_with_text (ara.id.as_string)
					mi.select_actions.extend (agent select_archetype_from_gui_data (mi))
					mi.set_data (ara)
					history_menu.extend (mi)
				end)
		end

	on_back
			-- Go back to the last archetype previously selected.
		do
			if archetype_directory.selection_history_has_previous then
				archetype_directory.selection_history_back
				select_node_in_archetype_tree_view
			end
		end

	on_forward
			-- Go forth to the next archetype previously selected.
		do
			if archetype_directory.selection_history_has_next then
				archetype_directory.selection_history_forth
				select_node_in_archetype_tree_view
			end
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
		local
			dialog: OPTION_DIALOG
		do
			create dialog
			dialog.show_modal_to_window (Current)

			if dialog.has_changed_options then
				save_resources_and_show_status
			end
		end

feature {NONE} -- Help events

	display_icon_help
			-- Display the icons help dialog.
		do
			(create {ICON_DIALOG}).show_modal_to_window (Current)
		end

	display_news
			-- Display news about the latest release.
		local
			dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (news_text)
			dialog.set_x_position (20)
			dialog.set_y_position (10)
			dialog.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			dialog.show_modal_to_window (Current)
		end

	show_online_help
			-- Display the application's online help in an external browser.
		do
			execution_environment.launch (Default_browser_command + ADL_help_page_url)
		end

	display_about
			-- Display the application's About box.
		local
			dialog: EV_INFORMATION_DIALOG
		do
			create dialog.make_with_text (splash_text)
			dialog.set_title ("About ADL Workbench")
			dialog.set_pixmap (pixmaps ["openEHR and Ocean"])
			dialog.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			dialog.show_modal_to_window (Current)
		end

feature -- Archetype commands

	archetype_view_tree_item_select
			-- Display details of `archetype_file_tree' when the user selects it.
		do
			archetype_view_tree_control.display_details_of_selected_item_after_delay
		end

	select_archetype_from_gui_data (gui_item: EV_ANY)
			-- Select and display the node of `archetype_file_tree' corresponding to the folder or archetype attached to `gui_item'.
		do
			if gui_item /= Void and then {a: !ARCH_REP_ITEM} gui_item.data then
				archetype_directory.set_selected_item (a)
				select_node_in_archetype_tree_view
			end
		end

	select_node_in_archetype_tree_view
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_directory'.
		do
			if {node: !EV_TREE_NODE} archetype_file_tree.retrieve_item_recursively_by_data (archetype_directory.selected_item, True) then
				archetype_file_tree.ensure_item_visible (node)
				node.enable_select
			end
		end

	on_node_map_shrink_tree_one_level
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.shrink_one_level
			end
		end

	on_node_map_expand_tree_one_level
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.expand_one_level
			end
		end

	on_node_map_toggle_expand_tree
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.toggle_expand_tree
			end
		end

	on_node_map_item_select
			-- When the user selects a node in `node_map_tree'.
		do
			node_map_control.item_select
		end

	on_node_map_domain_selected
			-- Hide technical details in `node_map_tree'.
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.set_domain_mode
			end
		end

	on_node_map_technical_selected
			-- Display technical details in `node_map_tree'.
		do
			if archetype_directory.has_valid_selected_archetype then
				node_map_control.set_technical_mode
			end
		end

	archetype_test_go_stop
			-- start running tests in test page
		do
			archetype_test_tree_control.archetype_test_go_stop
		end

	archetype_test_tree_expand_toggle
			-- toggle logical state of test page archetype tree expandedness
		do
			archetype_test_tree_control.toggle_expand_tree
		end

	archetype_test_refresh
			-- refresh test environment back to vanilla state
			-- i.e. synchronised with file system and with all
			-- statuses cleared
		do
			archetype_test_tree_control.populate
		end

	path_column_select (a_list_item: EV_LIST_ITEM)
			-- Called by `check_actions' of `path_view_check_list'.
		do
			path_map_control.column_select(a_list_item)
		end

	path_column_unselect (a_list_item: EV_LIST_ITEM)
			-- Called by `check_actions' of `path_view_check_list'.
		do
			path_map_control.column_unselect(a_list_item)
		end

	path_row_set_filter
			-- Called by `select_actions' of `path_filter_combo'.
		do
			path_map_control.set_filter
		end

	on_archetype_notebook_select
			-- Display either the differential or flat view of the archetype depending on the tab selected in `arch_notebook'.
		do
			if {tab: !EV_CONTAINER} archetype_notebook.selected_item and {other: !EV_CONTAINER} definition_notebook.parent then
				if tab /= other then
					if tab = differential_view_box or tab = flat_view_box then
						other.prune (definition_notebook)
						tab.extend (definition_notebook)
						ev_application.process_graphical_events
						populate_view_controls
					end
				end
			end
		end

	translations_select_language
			-- Called by `select_actions' of `arch_translations_languages_list'.
		do
			translation_controls.populate_items
		end

feature -- Controls

	ontology_controls: GUI_ONTOLOGY_CONTROLS
		once
			create Result.make (Current)
		end

	description_controls: GUI_DESCRIPTION_CONTROLS
		once
			create Result.make (Current)
		end

	translation_controls: GUI_TRANSLATION_CONTROLS
		once
			create Result.make (Current)
		end

	node_map_control: GUI_NODE_MAP_CONTROL
		once
			create Result.make (Current)
		end

	slot_map_control: GUI_SLOT_MAP_CONTROL
		once
			create Result.make (Current)
		end

	used_by_map_control: GUI_USED_BY_MAP_CONTROL
		once
			create Result.make (Current)
		end

	path_map_control: GUI_PATH_MAP_CONTROL
		once
			create Result.make (Current)
		end

	archetype_view_tree_control: GUI_VIEW_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (Current)
		end

	archetype_test_tree_control: GUI_TEST_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (Current)
		end

	compiler_error_control: GUI_COMPILER_ERROR_CONTROL
		once
			create Result.make (Current)
		end

feature {NONE} -- Implementation

	status_area_background_color: EV_COLOR
			-- The colour for the background of `parser_status_area'.
		do
			if billboard_has_errors then
				create Result.make_with_8_bit_rgb (255, 224, 224)
			else
				create Result.make_with_8_bit_rgb (240, 255, 255)
			end
		end

	select_language
			-- Repopulate the view of the archetype when the user selects a different language.
		do
			if language_combo.text.is_empty then
				set_current_language (default_language)
			else
				set_current_language (language_combo.text)

				if archetype_directory.has_valid_selected_archetype then
					populate_view_controls
				end
			end
		end

	populate_archetype_directory
			-- Rebuild archetype directory & repopulate relevant GUI parts.
		do
			do_with_wait_cursor (agent
				do
					if title.has_substring (" - ") then
						set_title (title.substring (title.substring_index (" - ", 1) + 3, title.count))
					end

					set_title (reference_repository_path + " - " + title)
					archetype_directory.make
					clear_billboard
					clear_all_controls
					compiler_error_control.clear
					set_status_area ("Populating repository ...")
					select_node_in_archetype_tree_view

					if archetype_directory.valid_repository_path (reference_repository_path) then
						archetype_directory.put_repository (reference_repository_path, 2)
					end

					if archetype_directory.valid_repository_path (work_repository_path) then
						archetype_directory.put_repository (work_repository_path, 3)
					end

					archetype_directory.build_directory
					set_status_area (billboard_content)
					archetype_view_tree_control.populate
					archetype_test_tree_control.populate
					populate_statistics
				end)
		end

	clear_all_controls
			-- Wipe out content from visual controls.
		do
			if archetype_directory.selection_history_has_previous then
				history_menu_back.enable_sensitive
				history_back_button.enable_sensitive
			else
				history_menu_back.disable_sensitive
				history_back_button.disable_sensitive
			end

			if archetype_directory.selection_history_has_next then
				history_menu_forward.enable_sensitive
				history_forward_button.enable_sensitive
			else
				history_menu_forward.disable_sensitive
				history_forward_button.disable_sensitive
			end

			parser_status_area.remove_text
			source_rich_text.remove_text
			language_combo.wipe_out
			description_controls.clear
			translation_controls.clear
			node_map_control.clear
			ontology_controls.clear
			path_map_control.clear
			slot_map_control.clear
			used_by_map_control.clear
		end

	populate_view_controls
			-- Populate content from visual controls.
		do
			description_controls.populate
			translation_controls.populate
			slot_map_control.populate
			used_by_map_control.populate

			if archetype_notebook.selected_item = differential_view_box then
				node_map_control.set_differential_view
				path_map_control.set_differential_view
				ontology_controls.set_differential_view
				populate_source_text (False)
			else
				node_map_control.set_flat_view
				path_map_control.set_flat_view
				ontology_controls.set_flat_view
				populate_source_text (True)
			end
		end

	populate_source_text (flat: BOOLEAN)
			-- Display the selected archetype's differential or flat text in `source_rich_text', optionally with line numbers.
		do
			if {ara: !ARCH_REP_ARCHETYPE} archetype_directory.selected_archetype then
				if flat then
					populate_source_text_with_line_numbers (ara.flat_text)
				elseif ara.has_differential_file then
					populate_source_text_with_line_numbers (ara.differential_text)
				else
					source_rich_text.set_text ("==================== No source (.adls) file available ======================")
				end
			else
				source_rich_text.remove_text
			end
		end

	populate_source_text_with_line_numbers (text: STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		require
			text_attached: text /= Void
		local
			leader, s, number_string: STRING
			len, left_pos, right_pos, number: INTEGER
		do
			if show_line_numbers then
				from
					len := text.count
					create s.make (len)
					create leader.make_filled (' ', 4)
					left_pos := 1
					number := 1
				until
					left_pos > len
				loop
					number_string := number.out
					leader.replace_substring (number_string, 1, number_string.count)
					s.append (leader)
					right_pos := text.index_of ('%N', left_pos)
					s.append (text.substring (left_pos, right_pos))
					left_pos := right_pos + 1
					number := number + 1
				end
			else
				s := text
			end

			source_rich_text.set_text (utf8 (s))
		end

	populate_archetype_id
		local
			selected: ARCHETYPE_ID
		do
			if archetype_directory.has_selected_archetype then
				selected := archetype_directory.selected_archetype.id
			end

			if selected /= Void then
				archetype_id.set_text (utf8 (selected.as_string))
			else
				archetype_id.remove_text
			end
		end

	populate_adl_version
			-- Populate ADL version.
		do
			if archetype_directory.has_valid_selected_archetype then
				adl_version_text.set_text (utf8 (archetype_directory.selected_archetype.archetype_differential.adl_version))
			else
				adl_version_text.remove_text
			end
		end

	populate_languages
			-- Populate the languages combo box and the terminologies list.
		local
			archetype: ARCHETYPE
		do
			language_combo.select_actions.block

			if archetype_directory.has_valid_selected_archetype then
				archetype := archetype_directory.selected_archetype.archetype_differential

				if not archetype.has_language (current_language) then
					set_current_language (default_language)
				end

				language_combo.set_strings (archetype.languages_available)
				terminologies_list.set_strings (archetype.ontology.terminologies_available)

				language_combo.do_all (agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (current_language) then
							li.enable_select
						end
					end)
			else
				set_current_language (default_language)
				language_combo.wipe_out
				terminologies_list.wipe_out
			end

			language_combo.select_actions.resume
		end

	populate_statistics
			-- populate statistics
		do
			arch_total_count_tf.set_text (archetype_directory.total_archetype_count.out)
			arch_spec_count_tf.set_text (archetype_directory.specialised_archetype_count.out)
			arch_slotted_count_tf.set_text (archetype_directory.slotted_archetype_count.out)
			arch_used_by_count_tf.set_text (archetype_directory.used_by_archetype_count.out)
			arch_bad_count_tf.set_text (archetype_directory.bad_archetype_count.out)
		end

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

feature {NONE} -- Build commands

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

	build_gui_update (ara: ARCH_REP_ARCHETYPE)
			-- Update GUI with progress on build.
		do
			update_status_area (archetype_compiler.status)

			if ara /= Void then
				if {node: !EV_TREE_NODE} archetype_file_tree.retrieve_item_recursively_by_data (ara, True) then
					archetype_view_tree_control.set_node_pixmap (node)
				end

				archetype_test_tree_control.do_row_for_item (ara, agent archetype_test_tree_control.set_row_pixmap)

				if ara.parse_attempted then
					if ara.has_compiler_status then
						compiler_error_control.extend (ara)
					end

					if ara = archetype_directory.selected_archetype then
						populate_view_controls
					end
				end
			end

			ev_application.process_events
		end

	build_gui_stats_update
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
			widgets: LINEAR [EV_WIDGET]
		do
			if {container: !EV_CONTAINER} widget and not {grid: !EV_GRID} widget then
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
				if not {label: !EV_LABEL} widget and not {toolbar: !EV_TOOL_BAR} widget then
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
