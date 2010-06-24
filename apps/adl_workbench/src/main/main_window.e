note
	component:   "openEHR Archetype Project"
	description: "Main window"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
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

	SHARED_ADL_APPLICATION
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		undefine
			copy, default_create
		end

	SHARED_REFERENCE_MODEL_ACCESS
		undefine
			copy, default_create
		end

	SHARED_SOURCE_REPOSITORIES
		undefine
			copy, default_create
		end

	SHARED_KNOWLEDGE_REPOSITORY
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

	STRING_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	user_initialization
			-- called by `initialize'.
			-- Any custom user initialization that could not be performed in `initialize',
			-- (due to regeneration of implementation class) can be added here.
		do
			adl_application.initialise
			initialise_accelerators
		end

	initialise_accelerators
			-- Initialise keyboard accelerators for various widgets.
		do
			add_shortcut (agent step_focused_notebook_tab (1), key_tab, True, False, False)
			add_shortcut (agent step_focused_notebook_tab (-1), key_tab, True, False, True)

			add_menu_shortcut (file_menu_open, key_o, True, False, False)
			add_menu_shortcut (file_menu_save_as, key_s, True, False, False)
			add_menu_shortcut_for_action (edit_menu_copy, agent call_unless_text_focused (agent on_copy), key_c, True, False, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False, False)

			add_menu_shortcut (repository_menu_build_all, key_f7, False, False, False)
			add_menu_shortcut (repository_menu_rebuild_all, key_f7, False, False, True)
			add_menu_shortcut (repository_menu_build_subtree, key_f7, True, False, False)
			add_menu_shortcut (repository_menu_rebuild_subtree, key_f7, True, False, True)
			add_menu_shortcut (repository_menu_interrupt_build, key_escape, False, False, True)

			add_menu_shortcut (history_menu_back, key_left, False, True, False)
			add_menu_shortcut (history_menu_forward, key_right, False, True, False)

			add_menu_shortcut (repository_menu_refresh, key_r, True, False, False)

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
			cur_title := title.twin.as_string_8
			cur_title.replace_substring_all ("VER", latest_adl_version)
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

			archetype_explorer_pixmap.copy (pixmaps.item("archetype_category"))
			template_explorer_pixmap.copy (pixmaps.item("template_category"))

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

	initialise_splitter (split: EV_SPLIT_AREA; position: INTEGER)
			-- Make `position' the position for `split'; but do nothing if `position' is outside the allowed bounds.
		do
			if split.minimum_split_position <= position and position <= split.maximum_split_position then
				split.set_split_position (position)
			end
		end

feature -- Status setting

	show
			-- Do a few adjustments and load the repository before displaying the window.
		local
			quit_dialog: EV_INFORMATION_DIALOG
		do
			if not found_rm_schemas then
				create quit_dialog.make_with_text (create_message_line ("model_access_e0", <<default_rm_schema_directory>>))
				quit_dialog.set_title ("Error")
				quit_dialog.show_modal_to_window (Current)
				ev_application.destroy
			else
				-- post any info from actions called in `user_initialization'			
				append_status_area (billboard.content)
				billboard.clear

				if reference_repository_path.is_empty then
					set_reference_repository_path (application_startup_directory)
					set_repository
				else
					populate_directory
				end

				archetype_compiler.set_visual_update_action (agent build_gui_update)
				initialise_overall_appearance
				path_map_control.initialise_controls

				Precursor

				initialise_splitter (test_split_area, test_split_position)
				initialise_splitter (explorer_split_area, explorer_split_position)
				initialise_splitter (total_split_area, total_split_position)
				initialise_splitter (archetype_template_split_area, archetype_template_split_position)
				focus_first_widget (main_notebook.selected_item)

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
			end
		end

feature -- File events

	open_archetype
			-- Let the user select an ADL file, and then load and parse it.
		local
			dialog: EV_FILE_OPEN_DIALOG
			fname: STRING
		do
			create dialog
			dialog.set_start_directory (current_work_directory)
			dialog.filters.extend (["*" + archetype_source_file_extension, "ADL source files"])
			dialog.filters.extend (["*" + archetype_legacy_file_extension, "ADL legacy flat files"])
			dialog.show_modal_to_window (Current)
			fname := dialog.file_name.as_string_8

			if not fname.is_empty then
				if not source_repos.adhoc_source_repository.has_path (fname) then
					set_current_work_directory (file_system.dirname (fname))
					if not file_system.file_exists (fname) then
						(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + fname + "%" not found.")).show_modal_to_window (Current)
					else
						arch_dir.add_adhoc_item (fname)
						archetype_view_tree_control.populate
						append_status_area (billboard.content)
					end
				else
					(create {EV_INFORMATION_DIALOG}.make_with_text ("%"" + fname + "%" already added.")).show_modal_to_window (Current)
				end
			end
		end

	parse_archetype
			-- Load and parse the archetype currently selected in `archetype_directory'.
		do
			if attached {ARCH_REP_ARCHETYPE} arch_dir.selected_archetype as ara then
				clear_all_controls
				do_with_wait_cursor (agent archetype_compiler.build_lineage (ara))
			end
		end

	edit_archetype
			-- Launch the external editor with the archetype currently selected in `archetype_directory'.
		local
			question_dialog: EV_QUESTION_DIALOG
			info_dialog: EV_INFORMATION_DIALOG
			editors_dialog: ICON_DIALOG
			path, flat, command: STRING
			ara: ARCH_REP_ARCHETYPE
			editors: LIST [STRING]
			list: EV_LIST
		do
			ara := arch_dir.selected_archetype

			if ara /= Void then
				path := ara.differential_path
				flat := file_system.basename (ara.legacy_flat_path)

				if ara.has_differential_file and ara.has_legacy_flat_file then
					create question_dialog.make_with_text ("Edit which file?%N%NDifferential: " + file_system.basename (path) + "%N%NFlat (legacy): " + flat + "%N")
					question_dialog.set_title ("Edit " + ara.id.as_string)
					question_dialog.set_buttons (<<"Differential", "Flat (legacy)">>)
					question_dialog.show_modal_to_window (Current)

					if question_dialog.selected_button.starts_with ("F") then
						path := ara.legacy_flat_path
					end
				elseif ara.has_legacy_flat_file then
					create info_dialog.make_with_text ("The Differential (.adls) file is not available.%N%NOpening the legacy flat file: " + flat + "%N")
					info_dialog.set_title ("Edit " + ara.id.as_string)
					info_dialog.show_modal_to_window (Current)
					path := ara.legacy_flat_path
				end

				command := editor_command
				editors := command.split (',')

				if editors.count > 1 then
					create editors_dialog
					editors_dialog.set_title ("Edit with which application?")
					list := editors_dialog.icon_help_list
					list.wipe_out

					from editors.start until editors.off loop
						command := editors.item
						command.left_adjust
						command.right_adjust

						if not command.is_empty then
							list.extend (create {EV_LIST_ITEM}.make_with_text (command))
							list.last.set_pixmap (pixmaps ["edit"])
						end

						editors.forth
					end

					list.first.enable_select
					editors_dialog.show_modal_to_window (Current)
					command := list.selected_item.text.as_string_8
				end

				execution_environment.launch (command + " %"" + path + "%"")
			end
		end

	save_archetype_as
			-- Save to an ADL or HTML file via a GUI file save dialog.
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			error_dialog: EV_INFORMATION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			name, format: STRING
		do
			if arch_dir.has_validated_selected_archetype then
				name := extension_replaced (arch_dir.selected_archetype.full_path, "")

				create save_dialog
				save_dialog.set_title ("Save Archetype")
				save_dialog.set_file_name (name)
				save_dialog.set_start_directory (current_work_directory)

				from archetype_serialiser_formats.start until archetype_serialiser_formats.off loop
					format := archetype_serialiser_formats.item
					save_dialog.filters.extend (["*" + archetype_file_extensions [format], "Save as " + format.as_upper])
					archetype_serialiser_formats.forth
				end

				save_dialog.show_modal_to_window (Current)
				name := save_dialog.file_name.as_string_8

				if not name.is_empty then
					set_current_work_directory (file_system.dirname (name))
					format := archetype_serialiser_formats [save_dialog.selected_filter_index]

					if not file_system.has_extension (name, archetype_file_extensions [format]) then
						name.append (archetype_file_extensions [format])
					end

					ok_to_write := True
					create file.make (name)

					if file.exists then
						create question_dialog.make_with_text ("File " + file_system.basename (name) + " already exists. Replace it?")
						question_dialog.set_title ("Save as " + format.as_upper)
						question_dialog.set_buttons (<<"Yes", "No">>)
						question_dialog.show_modal_to_window (Current)
						ok_to_write := question_dialog.selected_button.same_string ("Yes")
					end

					if ok_to_write then
						arch_dir.selected_archetype.save_differential_as (name, format)
						append_status_area (arch_dir.selected_archetype.status)
					end
				end
			else
				create error_dialog.make_with_text ("Must parse before serialising.")
				error_dialog.show_modal_to_window (Current)
			end
		end

	display_class
			-- display the class currently selected in `archetype_directory'.
		do
			if arch_dir.has_selected_class then
				if definition_notebook.parent = differential_view_box then
					class_map_control.set_differential_view
				else
					class_map_control.set_flat_view
				end
			end
		end

	exit_app
			-- Terminate the application, saving the window location.
		local
			strs: ARRAYED_LIST [STRING]
			ev_items: DYNAMIC_LIST [EV_LIST_ITEM]
		do
			set_total_split_position (total_split_area.split_position)
			set_test_split_position (test_split_area.split_position)
			set_explorer_split_position (explorer_split_area.split_position)
			set_archetype_template_split_position (archetype_template_split_area.split_position)
			set_app_width (width)
			set_app_height (height)
			set_app_x_position (x_position)
			set_app_y_position (y_position)
			set_app_maximised (is_maximized)
			set_main_notebook_tab_pos (main_notebook.selected_item_index)

			set_path_filter_combo_selection (path_analysis_row_filter_combo_box.selected_item.text.as_string_8)

			ev_items := path_analysis_column_view_checkable_list.checked_items
			create strs.make (0)

			from ev_items.start until ev_items.off loop
				strs.extend (ev_items.item.text.as_string_8)
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
				populate_directory
				save_resources_and_show_status
			end
		end

	refresh_directory
			-- repopulate the current repository using existing RM schemas and source repositories
		do
			append_status_area ("Populating directory ...")
			arch_dir.refresh
			archetype_view_tree_control.populate
			template_view_tree_control.populate
			archetype_test_tree_control.populate
			populate_statistics
			append_status_area ("complete%N")
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
			dialog.set_title ("Export HTML")
			dialog.set_buttons (<<"Yes, Build and Export All", "No, Export only the built ones", "Cancel">>)
			dialog.set_default_cancel_button (dialog.button ("Cancel"))
			dialog.show_modal_to_window (Current)

			if dialog.selected_button.starts_with ("Yes") then
				do_build_action (agent archetype_compiler.build_and_export_all_html (html_export_directory))
			elseif dialog.selected_button.starts_with ("No") then
				do_build_action (agent archetype_compiler.export_all_html (html_export_directory))
			end
		end

	export_repository_report
			-- Export the contents of the Errors grid and other statistics to an XML file via a GUI file save dialog.
		local
			ok_to_write: BOOLEAN
			question_dialog: EV_QUESTION_DIALOG
			file: PLAIN_TEXT_FILE
			save_dialog: EV_FILE_SAVE_DIALOG
			xml_name: STRING
		do
			create save_dialog
			save_dialog.set_title ("Export Repository Report")
			save_dialog.set_file_name ("ArchetypeRepositoryReport.xml")
			save_dialog.set_start_directory (current_work_directory)
			save_dialog.filters.extend (["*.xml", "Save as XML"])
			save_dialog.show_modal_to_window (Current)
			xml_name := save_dialog.file_name.as_string_8

			if not xml_name.is_empty then
				set_current_work_directory (file_system.dirname (xml_name))

				if not file_system.has_extension (xml_name, ".xml") then
					xml_name.append (".xml")
				end

				ok_to_write := True
				create file.make (xml_name)

				if file.exists then
					create question_dialog.make_with_text ("File " + file_system.basename (xml_name) + " already exists. Replace it?")
					question_dialog.set_title ("Export Repository Report")
					question_dialog.set_buttons (<<"Yes", "No">>)
					question_dialog.show_modal_to_window (Current)
					ok_to_write := question_dialog.selected_button.same_string ("Yes")
				end

				if ok_to_write then
					do_with_wait_cursor (agent compiler_error_control.export_repository_report (xml_name))

					if file.exists then
						append_status_area ("Exported report to %"" + xml_name + "%"%N")
						show_in_system_browser (xml_name)
					else
						append_status_area ("ERROR: Failed to export report to %"" + xml_name + "%"%N")
					end
				end
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

			arch_dir.recently_selected_archetypes (20).do_all (agent (ara: attached ARCH_REP_ARCHETYPE)
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
			if arch_dir.selection_history_has_previous then
				arch_dir.selection_history_back
				select_node_in_archetype_tree_view
			end
		end

	on_forward
			-- Go forth to the next archetype previously selected.
		do
			if arch_dir.selection_history_has_next then
				arch_dir.selection_history_forth
				select_node_in_archetype_tree_view
			end
		end

feature {NONE} -- Tools events

	clean_generated_files
			-- Remove all generated files below the repository directory.
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			if not archetype_compiler.build_completed then
				create info_dialog.make_with_text ("System needs to be compiled before generated files can be deleted")
				info_dialog.set_title ("Information")
				info_dialog.show_modal_to_window (Current)
			else
				do_with_wait_cursor (agent arch_dir.do_all_archetypes (agent delete_generated_files))
			end
		end

	delete_generated_files (ara: ARCH_REP_ARCHETYPE)
			-- delete a generated file associated with `ara'
		do
			ara.clean_generated
			append_status_area (ara.status)
		end

	set_options
			-- Display the Options dialog.
		local
			dialog: OPTION_DIALOG
		do
			create dialog
			dialog.show_modal_to_window (Current)

			if dialog.has_changed_archetype_options then
				save_resources_and_show_status
				populate_archetype_view_controls
			end
			if dialog.has_changed_navigator_options then
				archetype_view_tree_control.populate
				template_view_tree_control.populate
				archetype_test_tree_control.populate
			end
			if dialog.has_changed_schema_load_list then
				clear_status_area
				load_rm_schemas
				populate_directory
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
			show_in_system_browser (adl_help_page_url)
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

	template_view_tree_item_select
			-- Display details of `template_file_tree' when the user selects it.
		do
			template_view_tree_control.display_details_of_selected_item_after_delay
		end

	select_archetype_from_gui_data (gui_item: EV_ANY)
			-- Select and display the node of `archetype_file_tree' corresponding to the folder or archetype attached to `gui_item'.
		do
			if gui_item /= Void then
				if attached {ARCH_REP_ITEM} gui_item.data as ari then
					arch_dir.set_selected_item (ari)
					select_node_in_archetype_tree_view
				end
			end
		end

	select_node_in_archetype_tree_view
			-- Select and display the node of `archetype_file_tree' corresponding to the selection in `archetype_directory'.
		do
			if arch_dir.has_selected_item then
				archetype_view_tree_control.ensure_item_visible(arch_dir.selected_item.ontological_name)
			end
		end

	on_node_map_shrink_tree_one_level
		do
			if arch_dir.has_validated_selected_archetype then
				node_map_control.shrink_one_level
			end
		end

	on_node_map_expand_tree_one_level
		do
			if arch_dir.has_validated_selected_archetype then
				node_map_control.expand_one_level
			end
		end

	on_node_map_toggle_expand_tree
		do
			if arch_dir.has_validated_selected_archetype then
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
			if arch_dir.has_validated_selected_archetype then
				node_map_control.set_domain_mode
			end
		end

	on_node_map_technical_selected
			-- Display technical details in `node_map_tree'.
		do
			if arch_dir.has_validated_selected_archetype then
				node_map_control.set_technical_mode
			end
		end

	on_node_map_reference_model_selected
			-- turn on or off the display of reference model details in `node_map_tree'.
		do
			if arch_dir.has_validated_selected_archetype then
				node_map_control.set_reference_model_mode
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
			-- Show a column in the Path Analysis list after setting a check box in `path_view_check_list'.
		do
			path_map_control.adjust_columns
		end

	path_column_unselect (a_list_item: EV_LIST_ITEM)
			-- Hide a column in the Path Analysis list after clearing a check box in `path_view_check_list'.
		do
			path_map_control.adjust_columns
		end

	path_row_set_filter
			-- Called by `select_actions' of `path_filter_combo'.
		do
			path_map_control.set_filter
		end

	on_archetype_notebook_select
			-- Display either the differential or flat view of the archetype depending on the tab selected in `arch_notebook'.
		do
			if attached {EV_VERTICAL_BOX} archetype_notebook.selected_item as tab and attached {EV_VERTICAL_BOX} definition_notebook.parent as other then
				if tab /= other then
					if (<<differential_view_box, flat_view_box>>).has (tab) then
						other.prune (definition_notebook)
						tab.extend (definition_notebook)
						ev_application.process_graphical_events
						if arch_dir.has_selected_archetype then
							populate_archetype_view_controls
						elseif arch_dir.has_selected_class then
							display_class
						end
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

	class_map_control: GUI_CLASS_MAP_CONTROL
		once
			create Result.make (Current)
		end

	path_map_control: GUI_PATH_MAP_CONTROL
		once
			create Result.make (Current)
		end

	slot_map_control: GUI_SLOT_MAP_CONTROL
		once
			create Result.make (Current)
		end

	archetype_view_tree_control: GUI_VIEW_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (Current, archetype_file_tree, archetype_explorer_label, <<{ARTEFACT_TYPE}.archetype>>)
		end

	template_view_tree_control: GUI_VIEW_ARCHETYPE_TREE_CONTROL
		once
			create Result.make (Current, template_file_tree, template_explorer_label, <<{ARTEFACT_TYPE}.template, {ARTEFACT_TYPE}.template_component>>)
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

	append_status_area (text: STRING)
			-- Append `text' to `parser_status_area'.
		require
			text_attached: text /= Void
		do
			parser_status_area.append_text (text)
			parser_status_area.set_background_color (status_area_background_color)
			ev_application.process_graphical_events
		end

	set_status_area (text: STRING)
			-- Set `parser_status_area' to `text'.
		require
			text_attached: text /= Void
		do
			parser_status_area.remove_text
			append_status_area (text)
		end

	clear_status_area
			-- clear `parser_status_area'
		do
			parser_status_area.remove_text
		end

	save_resources_and_show_status
			-- Save the application configuration file and update the status area.
		do
			save_resources
			post_info (Current, "save_resources_and_show_status", "cfg_file_i1", <<resource_config_file_name>>)
		end

	status_area_background_color: EV_COLOR
			-- The colour for the background of `parser_status_area'.
		do
			if billboard.has_errors then
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
				set_current_language (language_combo.text.as_string_8)
				if arch_dir.has_validated_selected_archetype then
					populate_archetype_view_controls
				end
			end
		end

	populate_directory
			-- Rebuild archetype directory & repopulate relevant GUI parts.
		do
			do_with_wait_cursor (agent
				do
					if title.has_substring (" - ") then
						set_title (title.substring (title.substring_index (" - ", 1) + 3, title.count))
					end

					set_title (reference_repository_path + " - " + title)
					clear_all_controls
					clear_status_area
					compiler_error_control.clear

					select_node_in_archetype_tree_view

					if source_repos.valid_repository_path (reference_repository_path) then
						source_repos.set_reference_repository (reference_repository_path)
					end

					if source_repos.valid_repository_path (work_repository_path) then
						source_repos.set_work_repository (work_repository_path)
					end

					append_status_area ("Populating directory ... ")
					arch_dir.populate
					append_status_area ("complete%N")

					append_status_area (billboard.content)
					billboard.clear
					archetype_view_tree_control.populate
					template_view_tree_control.populate
					archetype_test_tree_control.populate
					populate_statistics
				end)
		end

	clear_all_controls
			-- Wipe out content from visual controls.
		do
			if arch_dir.selection_history_has_previous then
				history_menu_back.enable_sensitive
				history_back_button.enable_sensitive
			else
				history_menu_back.disable_sensitive
				history_back_button.disable_sensitive
			end

			if arch_dir.selection_history_has_next then
				history_menu_forward.enable_sensitive
				history_forward_button.enable_sensitive
			else
				history_menu_forward.disable_sensitive
				history_forward_button.disable_sensitive
			end

			populate_archetype_id
			populate_adl_version
			populate_languages

			source_rich_text.remove_text
			description_controls.clear
			translation_controls.clear
			node_map_control.clear
			path_map_control.clear
			ontology_controls.clear
			slot_map_control.clear
		end

	populate_archetype_view_controls
			-- Populate content from visual controls.
		do
			description_controls.populate
			translation_controls.populate
			slot_map_control.populate

			if definition_notebook.parent = differential_view_box then
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
		local
			text: STRING
			ara: ARCH_REP_ARCHETYPE
		do
			ara := arch_dir.selected_archetype
			if attached ara then
				if flat then
					if ara.is_valid then
						text := ara.flat_text
						populate_source_text_with_line_numbers (text)
					elseif ara.has_legacy_flat_file then
						ara.read_legacy_flat
						text := ara.legacy_flat_text
						populate_source_text_with_line_numbers (text)
					else -- not valid, but derived from differential source
						source_rich_text.set_text (create_message_line ("compiler_no_flat_text", <<>>))
					end
				else
					text := ara.differential_text
					if text = Void then
						source_rich_text.set_text (create_message_line ("compiler_no_source_text", <<>>))
					else
						populate_source_text_with_line_numbers (text)
					end
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

					if number < 1000 then
						leader.replace_substring (number_string, 1, number_string.count)
						s.append (leader)
					else
						s.append (number_string + " ")
					end

					right_pos := text.index_of ('%N', left_pos)

					if right_pos = 0 then
						right_pos := len
					end

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
			if arch_dir.has_selected_archetype then
				selected := arch_dir.selected_archetype.id
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
			if arch_dir.has_validated_selected_archetype then
				adl_version_text.set_text (utf8 (arch_dir.selected_archetype.differential_archetype.adl_version))
			else
				adl_version_text.remove_text
			end
		end

	populate_languages
			-- Populate `language_combo' in the toolbar.
		local
			archetype: ARCHETYPE
		do
			language_combo.select_actions.block

			if arch_dir.has_validated_selected_archetype then
				archetype := arch_dir.selected_archetype.differential_archetype

				if not archetype.has_language (current_language) then
					set_current_language (archetype.original_language.code_string)
				end

				language_combo.set_strings (archetype.languages_available)

				language_combo.do_all (agent (li: EV_LIST_ITEM)
					do
						if li.text.same_string (current_language) then
							li.enable_select
						end
					end)
			else
				set_current_language (default_language)
				language_combo.wipe_out
			end

			language_combo.select_actions.resume
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

feature {GUI_TEST_ARCHETYPE_TREE_CONTROL} -- Statistics

	populate_statistics
			-- Populate the statistics tab.
		do
			arch_total_count_tf.set_text (arch_dir.total_archetype_count.out)
			arch_spec_count_tf.set_text (arch_dir.specialised_archetype_count.out)
			arch_slotted_count_tf.set_text (arch_dir.slotted_archetype_count.out)
			arch_used_by_count_tf.set_text (arch_dir.used_by_archetype_count.out)
			arch_bad_count_tf.set_text (arch_dir.bad_archetype_count.out)
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
			append_status_area (archetype_compiler.status)

			if ara /= Void then
				archetype_view_tree_control.update_tree_node_for_archetype (ara)
				template_view_tree_control.update_tree_node_for_archetype (ara)

				archetype_test_tree_control.do_row_for_item (ara, agent archetype_test_tree_control.set_row_pixmap)

				if ara.last_compile_attempt_timestamp /= Void then
					compiler_error_control.extend_and_select (ara)
					populate_statistics

					if ara = arch_dir.selected_archetype then
						populate_archetype_id
						populate_adl_version
						populate_languages
						populate_archetype_view_controls
					end
				end
			end

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
			if attached {EV_CONTAINER} widget as container and not attached {EV_GRID} widget as grid then
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
				if not attached {EV_LABEL} widget as label and not attached {EV_TOOL_BAR} widget as toolbar then
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
