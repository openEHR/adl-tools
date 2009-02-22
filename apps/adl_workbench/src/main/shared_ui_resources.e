indexing
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_UI_RESOURCES

inherit
	SHARED_RESOURCES

	ADL_DEFINITIONS
		export
			{NONE} all
		end

	EV_STOCK_PIXMAPS
		rename
			implementation as pixmaps_implementation
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	News_file_path: STRING is
		once
			Result := application_startup_directory + os_directory_separator.out + "news.txt"
		end

	Status_file_path: STRING is
		once
			Result := application_startup_directory + os_directory_separator.out + ".status"
		end

	Default_editor_command: STRING is
			-- A reasonable name of an editor based on operating system.
		once
   			if is_windows then
   				Result := "Notepad.exe,cmd /q /d /c start %"%" /b"
			elseif is_mac_os_x then
				Result := "open -t"
			else
   				Result := "vi"
   			end
   		end

	ADL_help_page_url: STRING is "http://www.openehr.org/svn/ref_impl_eiffel/TRUNK/apps/doc/adl_workbench_help.htm"

	path_control_filter_names: ARRAY [STRING] is
			-- names of row filters of path control
		once
			Result := <<"All", "Leaf">>
		end

	path_control_column_names: ARRAY [STRING] is
			-- names of columns of path view control
		once
			Result := <<"Machine", "Nat lang", "RM Type", "AOM Type">>
		end

feature -- Commands

	show_in_system_browser (url: STRING)
			-- Launch the operating system's default browser to display the contents of `url'.
		local
			command: STRING
		do
   			if is_windows then
   				command := "cmd /q /d /c start %"%" /b"
			elseif is_mac_os_x then
				command := "open"
			else
   				command := "firefox"
   			end

			execution_environment.launch (command + " %"" + url + "%"")
		end

feature -- Access

	icon_directory: STRING is
		once
			Result := application_startup_directory + os_directory_separator.out + "icons"
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

	has_icon_directory: BOOLEAN is
			-- True if icon directory available
		local
			a_dir: DIRECTORY
		do
			create a_dir.make(icon_directory)
			Result := a_dir.exists
		end

	new_news: BOOLEAN is
			-- is there new news due to last installation?
			-- work this out by seeing if there is a file called ".status" which is
			-- older than the news file
		local
			news_file, status_file: PLAIN_TEXT_FILE
		once
			create news_file.make (news_file_path)
			create status_file.make (status_file_path)

			if status_file.exists and news_file.exists then
				Result := news_file.date > status_file.date
			else
				Result := news_file.exists
			end
		end

	update_status_file is
			-- renew the status file, currently only used to indicate that
			-- news has been shown at startup
		local
			status_file: PLAIN_TEXT_FILE
		once
			create status_file.make (Status_file_path)

			if status_file.exists then
				status_file.touch
			else
				status_file.create_read_write
				status_file.close
			end
		end

	pixmap_table: DS_HASH_TABLE [TUPLE [file, help: STRING], STRING] is
			-- Table of pixmap file paths and help messages, keyed by icon key.
		once
			create Result.make (0)

			Result.force (["archetype_1.ico", "Ad hoc archetype (not parsed yet)"], "archetype_1")
			Result.force (["archetype_parsed_1.ico", "Ad hoc archetype (parsed but not compiled)"], "archetype_parsed_1")
			Result.force (["archetype_parse_failed_1.ico", "Ad hoc archetype (parse failed)"], "archetype_parse_failed_1")
			Result.force (["archetype_warning_1.ico", "Ad hoc archetype (parsed and compiled with warnings)"], "archetype_warning_1")
			Result.force (["archetype_valid_1.ico", "Ad hoc archetype (parsed and compiled)"], "archetype_valid_1")

			Result.force (["file_folder_2.ico", Void], "file_folder_2")
			Result.force (["archetype_2.ico", "Archetype in the reference repository (not parsed yet)"], "archetype_2")
			Result.force (["archetype_parsed_2.ico", "Archetype in the reference repository (parsed but not compiled)"], "archetype_parsed_2")
			Result.force (["archetype_parse_failed_2.ico", "Archetype in the reference repository (parse failed)"], "archetype_parse_failed_2")
			Result.force (["archetype_warning_2.ico", "Archetype in the reference repository (parsed and compiled with warnings)"], "archetype_warning_2")
			Result.force (["archetype_valid_2.ico", "Archetype in the reference repository (parsed and compiled)"], "archetype_valid_2")

			Result.force (["file_folder_3.ico", Void], "file_folder_3")
			Result.force (["archetype_3.ico", "Archetype in the work repository (not parsed yet)"], "archetype_3")
			Result.force (["archetype_parsed_3.ico", "Archetype in the work repository (parsed but not compiled)"], "archetype_parsed_3")
			Result.force (["archetype_parse_failed_3.ico", "Archetype in the work repository (parse failed)"], "archetype_parse_failed_3")
			Result.force (["archetype_warning_3.ico", "Archetype in the work repository (parsed and compiled with warnings)"], "archetype_warning_3")
			Result.force (["archetype_valid_3.ico", "Archetype in the work repository (parsed and compiled)"], "archetype_valid_3")

			Result.force ([Void, ""], "Gap 1 in the help")

			Result.force (["node_normal/c_attribute.ico", "Single-valued attribute (mandatory)"], "C_ATTRIBUTE")
			Result.force (["node_normal/c_attribute_optional.ico", "Single-valued attribute (optional)"], "C_ATTRIBUTE.optional")
			Result.force (["node_normal/c_attribute_multiple.ico", "Container attribute (mandatory)"], "C_ATTRIBUTE.multiple")
			Result.force (["node_normal/c_attribute_multiple_optional.ico", "Container attribute (optional)"], "C_ATTRIBUTE.multiple.optional")

			Result.force (["node_reference_model/c_attribute.ico", "Single-valued RM attribute (mandatory)"], "C_ATTRIBUTE.reference_model")
			Result.force (["node_reference_model/c_attribute_multiple.ico", "Container RM attribute (mandatory)"], "C_ATTRIBUTE.multiple.reference_model")
			Result.force (["node_reference_model/c_attribute_optional.ico", "Single-valued RM attribute (optional)"], "C_ATTRIBUTE.optional.reference_model")
			Result.force (["node_reference_model/c_attribute_multiple_optional.ico", "Container RM attribute (optional)"], "C_ATTRIBUTE.multiple.optional.reference_model")

			Result.force ([Void, ""], "Gap 2 in the help")

			Result.force (["node_normal/c_code_phrase.ico", "C_CODE_PHRASE (openEHR archetype profile)"], "C_CODE_PHRASE")
			Result.force (["node_normal/c_dv_ordinal.ico", "C_DV_ORDINAL (openEHR archetype profile)"], "C_DV_ORDINAL")
			Result.force (["node_normal/c_dv_quantity.ico", "C_DV_QUANTITY (openEHR archetype profile)"], "C_DV_QUANTITY")
			Result.force (["node_normal/c_quantity_item.ico", "C_QUANTITY_ITEM (openEHR archetype profile)"], "C_QUANTITY_ITEM")
			Result.force (["node_normal/c_primitive_object.ico", "C_PRIMITIVE_OBJECT - any type (openEHR AOM)"], "C_PRIMITIVE_OBJECT")

			Result.force (["node_normal/archetype_slot.ico", "Archetype slot (mandatory)"], "ARCHETYPE_SLOT")
			Result.force (["node_normal/archetype_slot_optional.ico", "Archetype slot (optional)"], "ARCHETYPE_SLOT.optional")
			Result.force (["node_normal/cadl_include.ico", "Archetype slot allowed archetypes"], "CADL_INCLUDE")
			Result.force (["node_normal/cadl_exclude.ico", "Archetype slot excluded archetypes"], "CADL_EXCLUDE")

			Result.force (["node_normal/c_complex_object.ico", "Complex ref model object (mandatory, single occurrence)"], "C_COMPLEX_OBJECT")
			Result.force (["node_normal/c_complex_object_multiple.ico", "Complex ref model object (mandatory, multiple occurrences)"], "C_COMPLEX_OBJECT.multiple")
			Result.force (["node_normal/c_complex_object_optional.ico", "Complex ref model object (optional, single occurrence)"], "C_COMPLEX_OBJECT.optional")
			Result.force (["node_normal/c_complex_object_multiple_optional.ico", "Complex ref model object (optional, multiple occurrences)"], "C_COMPLEX_OBJECT.multiple.optional")

			Result.force (["node_normal/archetype_internal_ref.ico", "Archetype internal reference to previously defined node"], "ARCHETYPE_INTERNAL_REF")
			Result.force (["node_normal/archetype_code_ref.ico", "Constraint reference (openEHR AOM)"], "CONSTRAINT_REF")

			Result.force (["node_normal/term.ico", Void], "TERM")
			Result.force (["node_normal/ordinal.ico", Void], "ORDINAL")
			Result.force (["node_normal/cadl_invariant.ico", "Invariant section"], "CADL_INVARIANT")
			Result.force (["node_normal/cadl_invariant_item.ico","Invariant section item"], "CADL_INVARIANT_ITEM")
			Result.force (["node_inherited/icon_help_example.ico", "X is inherited from parent archetype"], "icon_help_example.inherited")
			Result.force (["node_redefined/icon_help_example.ico", "X is redefined from parent archetype"], "icon_help_example.redefined")

			Result.force (["node_inherited/c_attribute.ico", Void], "C_ATTRIBUTE.inherited")
			Result.force (["node_inherited/c_attribute_multiple.ico", Void], "C_ATTRIBUTE.multiple.inherited")
			Result.force (["node_inherited/c_attribute.ico", Void], "C_ATTRIBUTE.optional.inherited")
			Result.force (["node_inherited/c_attribute_multiple.ico", Void], "C_ATTRIBUTE.multiple.optional.inherited")
			Result.force (["node_inherited/c_code_phrase.ico", Void], "C_CODE_PHRASE.inherited")
			Result.force (["node_inherited/c_dv_ordinal.ico", Void], "C_DV_ORDINAL.inherited")
			Result.force (["node_inherited/c_dv_quantity.ico", Void], "C_DV_QUANTITY.inherited")
			Result.force (["node_inherited/c_quantity_item.ico", Void], "C_QUANTITY_ITEM.inherited")
			Result.force (["node_inherited/c_primitive_object.ico", Void], "C_PRIMITIVE_OBJECT.inherited")
			Result.force (["node_inherited/archetype_code_ref.ico", Void], "CONSTRAINT_REF.inherited")
			Result.force (["node_inherited/archetype_slot_optional.ico", Void], "ARCHETYPE_SLOT.optional.inherited")
			Result.force (["node_inherited/archetype_slot.ico", Void], "ARCHETYPE_SLOT.inherited")
			Result.force (["node_inherited/c_complex_object.ico", Void], "C_COMPLEX_OBJECT.inherited")
			Result.force (["node_inherited/c_complex_object_multiple.ico", Void], "C_COMPLEX_OBJECT.multiple.inherited")
			Result.force (["node_inherited/c_complex_object_optional.ico", Void], "C_COMPLEX_OBJECT.optional.inherited")
			Result.force (["node_inherited/c_complex_object_multiple_optional.ico", Void], "C_COMPLEX_OBJECT.multiple.optional.inherited")
			Result.force (["node_inherited/archetype_internal_ref.ico", Void], "ARCHETYPE_INTERNAL_REF.inherited")
			Result.force (["node_inherited/term.ico", Void], "TERM.inherited")
			Result.force (["node_inherited/ordinal.ico", Void], "ORDINAL.inherited")
			Result.force (["node_normal/archetype_slot_optional.ico", Void], "ARCHETYPE_SLOT.optional.inherited")

			Result.force (["node_redefined/c_attribute.ico", Void], "C_ATTRIBUTE.redefined")
			Result.force (["node_redefined/c_attribute_multiple.ico", Void], "C_ATTRIBUTE.multiple.redefined")
			Result.force (["node_redefined/c_attribute.ico", Void], "C_ATTRIBUTE.optional.redefined")
			Result.force (["node_redefined/c_attribute_multiple.ico", Void], "C_ATTRIBUTE.multiple.optional.redefined")
			Result.force (["node_redefined/c_code_phrase.ico", Void], "C_CODE_PHRASE.redefined")
			Result.force (["node_redefined/c_dv_ordinal.ico", Void], "C_DV_ORDINAL.redefined")
			Result.force (["node_redefined/c_dv_quantity.ico", Void], "C_DV_QUANTITY.redefined")
			Result.force (["node_redefined/c_quantity_item.ico", Void], "C_QUANTITY_ITEM.redefined")
			Result.force (["node_redefined/c_primitive_object.ico", Void], "C_PRIMITIVE_OBJECT.redefined")
			Result.force (["node_redefined/archetype_code_ref.ico", Void], "CONSTRAINT_REF.redefined")
			Result.force (["node_redefined/archetype_slot_optional.ico", Void], "ARCHETYPE_SLOT.optional.redefined")
			Result.force (["node_redefined/archetype_slot.ico", Void], "ARCHETYPE_SLOT.redefined")
			Result.force (["node_redefined/c_complex_object.ico", Void], "C_COMPLEX_OBJECT.redefined")
			Result.force (["node_redefined/c_complex_object_multiple.ico", Void], "C_COMPLEX_OBJECT.multiple.redefined")
			Result.force (["node_redefined/c_complex_object_optional.ico", Void], "C_COMPLEX_OBJECT.optional.redefined")
			Result.force (["node_redefined/c_complex_object_multiple_optional.ico", Void], "C_COMPLEX_OBJECT.multiple.optional.redefined")
			Result.force (["node_redefined/archetype_internal_ref.ico", Void], "ARCHETYPE_INTERNAL_REF.redefined")
			Result.force (["node_redefined/term.ico", Void], "TERM.redefined")
			Result.force (["node_redefined/ordinal.ico", Void], "ORDINAL.redefined")
			Result.force (["node_normal/archetype_slot_optional.ico", Void], "ARCHETYPE_SLOT.optional.redefined")

			Result.force (["pass.ico", Void], "test_passed")
			Result.force (["fail.ico", Void], "test_failed")
			Result.force (["not_applicable.ico", Void], "test_not_applicable")

			Result.force (["parse_errors.ico", Void], "parse_errors")
			Result.force (["validity_errors.ico", Void], "validity_errors")
			Result.force (["warnings.ico", Void], "warnings")

			Result.force (["go.ico", Void], "go")
			Result.force (["stop.ico", Void], "stop")
			Result.force (["parse.ico", Void], "parse")
			Result.force (["edit.ico", Void], "edit")
			Result.force (["history_back.ico", Void], "history_back")
			Result.force (["history_forward.ico", Void], "history_forward")

			Result.force (["openEHR_and_Ocean.png", Void], "openEHR and Ocean")
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

	pixmaps: HASH_TABLE [EV_PIXMAP, STRING] is
			-- Table of pixmap file paths keyed by logical name.
		require
			has_icon_directory
		local
			file: RAW_FILE
			pixmap: EV_PIXMAP
		once
			create Result.make (0)

			from
				pixmap_table.start
			until
				pixmap_table.off
			loop
				if pixmap_table.item_for_iteration.file /= Void then
					create file.make (icon_directory + "/" + pixmap_table.item_for_iteration.file)
					create pixmap
					Result [pixmap_table.key_for_iteration] := pixmap

					if file.exists then
						pixmap.set_with_named_file (file.name)
						pixmap.set_minimum_size (pixmap.width, pixmap.height)
					else
						io.putstring ("Could not find icon " + file.name + "; using default%N")
					end
				end

				pixmap_table.forth
			end
		ensure
			attached: Result /= Void
		end

	splash_text: STRING
			-- Text for splash screens, About boxes, etc.
		local
			version: OPENEHR_VERSION
		once
			create version
			create Result.make_empty
			Result.append ("ADL Workbench%N")
			Result.append ("%TVersion " + version.out + "%N")
			Result.append ("%T(c) 2003-2009 Ocean Informatics%N")
			Result.append ("%TADL version: " + current_adl_version + "%N")
			Result.append ("%TSource SVN - http://www.openehr.org/svn/ref_impl_eiffel%N%T" + version.last_changed + "%N")
			Result.append ("%TSource license: Mozilla tri-license (http://www.mozilla.org/MPL/boilerplate-1.1/mpl-tri-license-txt)%N")
			Result.append ("Support: support@OceanInformatics.com%N")
			Result.append ("Funded by: OceanInformatics.com%N")
			Result.append ("Author: Thomas Beale%N")
			Result.append ("Contributors: Peter Gummer%N")
			Result.append ("Built using%N")
			Result.append ("%TEiffel Software Eiffel (http://www.eiffel.com)%N")
			Result.append ("%TGobo parsing libraries & tools (http://www.gobosoft.com)%N")
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

	News_text: STRING is
			-- news dialog
		local
			news_file: PLAIN_TEXT_FILE
		once
			create news_file.make (news_file_path)

			if news_file.exists and then news_file.is_readable then
				news_file.open_read
				news_file.read_stream (news_file.count)
				Result := news_file.last_string
				news_file.close
			else
				Result := "(%"" + news_file_path + "%" file is missing)"
			end
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

feature -- Application Switches

	reference_repository_path: STRING is
			-- path of root of ADL file tree
		do
			Result := substitute_env_vars(resource_value("default", "reference_repository"))
		ensure
			Result /= Void
		end

	work_repository_path: STRING is
			-- path of root of ADL file tree
		do
			Result := substitute_env_vars(resource_value("default", "work_repository"))
		ensure
			Result /= Void
		end

	current_work_directory: STRING
			-- Directory where archetypes are currently being opened and saved
			-- from GUI open and save buttons; automatic opens (due to clicking
			-- on archetype name) still use main repository directory.
		do
			Result := resource_value ("default", "current_work_directory")
		ensure
			attached: Result /= Void
		end

	app_width: INTEGER is
			-- application width
		local
			str: STRING
		do
			str := resource_value("default", "app_width")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_height: INTEGER is
			-- application height
		local
			str: STRING
		do
			str := resource_value("default", "app_height")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_x_position: INTEGER is
			-- application horizontal position
		local
			str: STRING
		do
			str := resource_value("default", "app_x_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_y_position: INTEGER is
			-- application vertical position
		local
			str: STRING
		do
			str := resource_value("default", "app_y_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	app_maximised: BOOLEAN is
			-- True if app should be maximised
		local
			str: STRING
		do
			str := resource_value("default", "app_maximised")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	total_split_position: INTEGER is
			-- Split position of outer vertical split control.
		local
			str: STRING
		do
			str := resource_value ("default", "total_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	node_map_and_ontology_split_position: INTEGER is
			-- Split position of inner vertical split control.
		local
			str: STRING
		do
			str := resource_value ("default", "node_map_and_ontology_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	test_split_position: INTEGER is
			-- Split position of vertical split control in test tool.
		local
			str: STRING
		do
			str := resource_value ("default", "test_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	explorer_split_position: INTEGER is
			-- Split position of explorer horizontal split control.
		local
			str: STRING
		do
			str := resource_value ("default", "explorer_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	main_notebook_tab_pos: INTEGER is
			-- which tab of the main notebook was visible at the end of the last session
		local
			str: STRING
		do
			str := resource_value("default", "main_notebook_tab_pos")
			if str.is_integer then
				Result := str.to_integer
			end
		end

	expand_node_tree: BOOLEAN
			-- Expand the archetype definition node tree by default?
		local
			str: STRING
		do
			str := resource_value ("default", "expand_node_tree")

			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	show_technical_view: BOOLEAN
			-- Display the technical view in the archetype definition node tree by default?
		local
			str: STRING
		do
			str := resource_value ("default", "show_technical_view")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	show_reference_model_view: BOOLEAN
			-- Display the reference model view in the archetype definition node tree by default?
		local
			str: STRING
		do
			str := resource_value ("default", "show_reference_model_view")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	show_line_numbers: BOOLEAN
			-- Display line numbers in the ADL source text box?
		local
			str: STRING
		do
			str := resource_value ("default", "show_line_numbers")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	display_archetype_source: BOOLEAN
			-- Display "(f)" marker on archetypes created in flat form
		local
			str: STRING
		do
			str := resource_value ("default", "display_archetype_source")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

	path_filter_combo_selection: STRING is
			-- setting of path control filter combo-box
		do
			Result := resource_value ("default", "path_filter_combo_selection")
		end

	path_view_check_list_settings: ARRAYED_LIST[STRING] is
			-- path view column settings
		do
			Result := resource_value_list ("default", "path_view_check_list_settings")
		end

	editor_command: STRING
			-- Path of editor application for ADL files.
		do
			Result := substitute_env_vars (resource_value ("default", "editor"))
		ensure
			attached: Result /= Void
		end

	html_export_directory: STRING
			-- Path of directory to which HTML is exported.
		do
			Result := substitute_env_vars (resource_value ("default", "html_export_directory"))
		ensure
			attached: Result /= Void
		end

	rm_checking_on: BOOLEAN is
			-- True if Reference Model checking should be on
		local
			str: STRING
		do
			str := resource_value("default", "rm_checking_on")
			if str.is_boolean then
				Result := str.to_boolean
			end
		end

feature -- Application Switch Setting

	set_reference_repository_path(a_path: STRING) is
			-- set reference_repository_path
		require
			a_path_valid: a_path /= Void and then not a_path.is_empty
		do
			set_resource_value("default", "reference_repository", a_path)
		end

	set_work_repository_path(a_path: STRING) is
			-- set work repository_path
		require
			a_path_valid: a_path /= Void
		do
			if not a_path.is_empty then
				set_resource_value("default", "work_repository", a_path)
			else
				remove_resource ("default", "work_repository")
			end
		end

	set_current_work_directory (a_path: STRING) is
			-- set the directory where archetypes are currently being opened and saved.
		require
			a_path_attached: a_path /= Void
		do
			if not a_path.is_empty then
				set_resource_value ("default", "current_work_directory", a_path)
			else
				remove_resource ("default", "current_work_directory")
			end
		end

	set_editor_command (value: STRING) is
			-- set editor
		require
			value_attached: value /= Void
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "editor", value)
		end

	set_html_export_directory (value: STRING) is
			-- Set the path of directory to which HTML is exported.
		require
			value_attached: value /= Void
			value_not_empty: not value.is_empty
		do
			set_resource_value("default", "html_export_directory", value)
		end

	set_main_notebook_tab_pos(a_tab_pos: INTEGER) is
			-- set main notebook tab pos
		require
			a_tab_pos_valid: a_tab_pos > 0
		do
			set_resource_value("default", "main_notebook_tab_pos", a_tab_pos.out)
		end

	set_total_split_position (v: INTEGER) is
			-- Set split position of outer vertical split control.
		require
			v > 0
		do
			set_resource_value ("default", "total_split_position", v.out)
		end

	set_node_map_and_ontology_split_position (v: INTEGER) is
			-- Set split position of inner vertical split control.
		require
			v > 0
		do
			set_resource_value ("default", "node_map_and_ontology_split_position", v.out)
		end

	set_test_split_position (v: INTEGER) is
			-- Set split position of test tool vertical split control.
		require
			v > 0
		do
			set_resource_value ("default", "test_split_position", v.out)
		end

	set_explorer_split_position (v: INTEGER) is
			-- Set split position of explorer horizontal split control.
		require
			v > 0
		do
			set_resource_value ("default", "explorer_split_position", v.out)
		end

	set_app_width (v: INTEGER) is
			-- set app width
		require
			v > 0
		do
			set_resource_value("default", "app_width", v.out)
		end

	set_app_height (v: INTEGER) is
			-- set app height
		require
			v > 0
		do
			set_resource_value("default", "app_height", v.out)
		end

	set_app_x_position (v: INTEGER) is
			-- set app x position
		do
			set_resource_value("default", "app_x_position", v.out)
		end

	set_app_y_position (v: INTEGER) is
			-- set app y position
		do
			set_resource_value("default", "app_y_position", v.out)
		end

	set_app_maximised (f: BOOLEAN) is
			-- set app maximised flag
		do
			set_resource_value("default", "app_maximised", f.out)
		end

	set_expand_node_tree (flag: BOOLEAN) is
			-- Set flag for whether to expand the archetype definition node tree by default.
		do
			set_resource_value ("default", "expand_node_tree", flag.out)
		end

	set_show_technical_view (flag: BOOLEAN) is
			-- Set flag for whether to show the technical view in the archetype definition node tree by default.
		do
			set_resource_value ("default", "show_technical_view", flag.out)
		end

	set_show_reference_model_view (flag: BOOLEAN) is
			-- Set flag for whether to show the technical view in the archetype definition node tree by default.
		do
			set_resource_value ("default", "show_reference_model_view", flag.out)
		end

	set_show_line_numbers (flag: BOOLEAN) is
			-- Set flag for whether to show line numbers in the ADL source text box.
		do
			set_resource_value ("default", "show_line_numbers", flag.out)
		end

	set_display_archetype_source (flag: BOOLEAN) is
			-- Set flag for whether to display markers indicating archetype authoring form.
		do
			set_resource_value ("default", "display_archetype_source", flag.out)
		end

	set_path_filter_combo_selection(str: STRING) is
			--
		do
			set_resource_value("default", "path_filter_combo_selection", str)
		end

	set_path_view_check_list_settings (strs: ARRAYED_LIST[STRING]) is
			-- save path view column settings
		do
			set_resource_value_list("default", "path_view_check_list_settings", strs)

		end

	set_rm_checking_on (flag: BOOLEAN) is
			-- Set flag for whether to do reference model checking of archetypes
		do
			set_resource_value ("default", "rm_checking_on", flag.out)
		end

feature {NONE} -- Implementation

	get_file (init_value: STRING; a_parent_window: EV_WINDOW): STRING is
			-- get a file path from user
		require
			parent_window_valid: a_parent_window /= Void
		local
			dialog: EV_FILE_OPEN_DIALOG
			a_file: RAW_FILE
			error_dialog: EV_INFORMATION_DIALOG
			end_pos: INTEGER
			pathname: STRING
		do
			create dialog
			end_pos := init_value.last_index_of (operating_environment.Directory_separator, init_value.count)

			if end_pos = 0 then
				end_pos := init_value.count
			end

			pathname := init_value.substring (1, end_pos)
			dialog.set_start_directory (pathname)

			from
			until
				Result /= Void
			loop
				dialog.show_modal_to_window (a_parent_window)

				if dialog.selected_button = Void or else dialog.selected_button.is_equal ("Cancel") then
					Result := init_value
				else
					if not dialog.file_name.is_empty then
						create a_file.make (dialog.file_name)

						if a_file.exists then
							Result := dialog.file_name
						else
							create error_dialog.make_with_text ("File " + dialog.file_name + " does not exist")
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text("File <empty> does not exist")
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
			end
		end

	get_directory (init_value: STRING; a_parent_window: EV_WINDOW): STRING is
			-- get a directory from user
		require
			parent_window_valid: a_parent_window /= Void
		local
			dialog: EV_DIRECTORY_DIALOG
			a_dir: DIRECTORY
			error_dialog: EV_INFORMATION_DIALOG
		do
			create dialog

			if (create {DIRECTORY}.make (init_value)).exists then
				dialog.set_start_directory (init_value)
			end

			from
			until
				Result /= Void
			loop
				dialog.show_modal_to_window (a_parent_window)

				if dialog.selected_button = Void or else dialog.selected_button.is_equal ("Cancel") then
					Result := init_value
				else
					if not dialog.directory.is_empty then
						create a_dir.make(dialog.directory)

						if a_dir.exists then
							Result := dialog.directory
						else
							create error_dialog.make_with_text ("Directory " + dialog.directory + " does not exist")
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text ("Directory <empty dir> does not exist")
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
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
--| The Original Code is shared_ui_resources.e.
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
