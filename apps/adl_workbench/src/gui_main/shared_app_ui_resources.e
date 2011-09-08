note
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale "
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_APP_UI_RESOURCES

inherit
	SHARED_APP_RESOURCES

	EV_STOCK_PIXMAPS
		rename
			implementation as pixmaps_implementation
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	Sane_screen_coord: INTEGER = -2500
			-- assumed 'most negative' screen X or Y position that app could, due to use of multiple screens. If it is more negative
			-- than this, at least on windows, assume that the app was minimised and start it in a default screen location instead

	bug_reporter_url: STRING = "http://www.openehr.org/issues/browse/AWBPR/"
			-- The URL to ADL Workbench's problem reporter.

	user_docking_layout_file_path: attached STRING
			-- Full path to docking layout configuration file.
		do
			Result := file_system.pathname (user_config_file_directory, extension_replaced ("ui_config", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	default_docking_layout_file_path: attached STRING
			-- Full path to docking layout configuration file.
		do
			Result := file_system.pathname (application_startup_directory, extension_replaced ("default_ui_config", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	icon_ico_extension: STRING = ".ico"

	icon_png_extension: STRING = ".png"

feature -- Access

	adl_workbench_icon: EV_PIXMAP
		do
			Result := pixmaps["adl_workbench_logo"]
		end

	icon_directory: attached STRING
		once
			Result := file_system.pathname (application_startup_directory, "icons")
		ensure
			not_empty: not Result.is_empty
		end

	has_icon_directory: BOOLEAN
			-- True if icon directory available
		local
			a_dir: DIRECTORY
		do
			create a_dir.make(icon_directory)
			Result := a_dir.exists
		end

	pixmaps: attached HASH_TABLE [EV_PIXMAP, STRING]
			-- Table of pixmap file paths keyed by logical name; constructed from pixmaps
			-- mentioned in `pixmap_table' and also any other pixmaps (icons) found in the
			-- icon root directory, which will be keyed by their file name minus '.ico'
			-- This means practically, that if an icon is general purpose, does't need a
			-- help entry, then don't bother listing it in the `pixmap_table', just put
			-- it in the icons root directory and the app will find it on startup.
		require
			has_icon_directory
		local
			file: RAW_FILE
			pixmap: EV_PIXMAP
			ico_fname, pixmap_key: STRING
			dir: DIRECTORY
		once
			create Result.make (0)

			from semantic_icon_table.start until semantic_icon_table.off loop
				if semantic_icon_table.item_for_iteration.file /= Void then
					ico_fname := file_system.pathname (icon_directory, semantic_icon_table.item_for_iteration.file)
					create file.make (ico_fname)
					create pixmap
					Result [semantic_icon_table.key_for_iteration] := pixmap

					if file.exists then
						pixmap.set_with_named_file (file.name)
						pixmap.set_minimum_size (pixmap.width, pixmap.height)
					else
						io.putstring ("Could not find icon " + file.name + "; using default%N")
					end
				end

				semantic_icon_table.forth
			end

			-- now go and collect any other pixmaps found in the icon directory and put them in
			-- this table, keyed by the filename name with '.ico' removed
			create dir.make_open_read (icon_directory)
			from
				dir.start
				dir.readentry
			until
				dir.lastentry = Void
			loop
				if dir.lastentry.ends_with (icon_ico_extension) then
					pixmap_key := dir.lastentry.substring (1, dir.lastentry.count - icon_ico_extension.count)
					if not Result.has (pixmap_key) then
						create pixmap
						Result.put (pixmap, pixmap_key)
						ico_fname := file_system.pathname (dir.name, dir.lastentry)
						pixmap.set_with_named_file (ico_fname)
						pixmap.set_minimum_size (pixmap.width, pixmap.height)
					end
				end
				dir.readentry
			end
		end

	rm_pixmaps: attached HASH_TABLE [HASH_TABLE [EV_PIXMAP, STRING], STRING]
			-- Table of pixmap tables, each table for a given reference model;
			-- each table has the structure {PIXMAP, RM class name}
			-- these pixmaps can be used for RM-specific visualisation of the archetype definition
			-- the source files can be .ico or .png
		require
			has_icon_directory
		local
			rm_ico_file: RAW_FILE
			pixmap: EV_PIXMAP
			path, ico_fname: STRING
			dir, rm_ico_dir: DIRECTORY
			rm_ico_map: HASH_TABLE [EV_PIXMAP, STRING]
		once
			create Result.make (0)
			path := file_system.pathname (icon_directory, "rm")
			create dir.make_open_read (path)
			from
				dir.start
				dir.readentry
			until
				dir.lastentry = Void
			loop
				if not dir.lastentry.ends_with (".") then
					create rm_ico_map.make(0)
					Result.put (rm_ico_map, dir.lastentry)
					create rm_ico_dir.make_open_read (file_system.pathname (path, dir.lastentry))
					from
						rm_ico_dir.start
						rm_ico_dir.readentry
					until
						rm_ico_dir.lastentry = Void
					loop
						if rm_ico_dir.lastentry.ends_with (icon_ico_extension) or rm_ico_dir.lastentry.ends_with (icon_png_extension) then
							create pixmap
							rm_ico_map.put (pixmap, rm_ico_dir.lastentry.substring (1, rm_ico_dir.lastentry.count - icon_ico_extension.count).as_upper)
							ico_fname := file_system.pathname (rm_ico_dir.name, rm_ico_dir.lastentry)
							pixmap.set_with_named_file (ico_fname)
							pixmap.set_minimum_size (pixmap.width, pixmap.height)
						end
						rm_ico_dir.readentry
					end
				end
				dir.readentry
			end
		end

feature -- Application Switches

	current_work_directory: attached STRING
			-- Directory where archetypes are currently being opened and saved
			-- from GUI open and save buttons; automatic opens (due to clicking
			-- on archetype name) still use main repository directory.
		do
			Result := app_cfg.string_value ("/file_system/current_work_directory")
		end

	set_current_work_directory (a_path: attached STRING)
			-- set the directory where archetypes are currently being opened and saved.
		do
			if not a_path.is_empty then
				app_cfg.put_value ("/file_system/current_work_directory", a_path)
			else
				app_cfg.remove_resource ("/file_system/current_work_directory")
			end
		end

	app_width: INTEGER
			-- application width
		do
			Result := app_cfg.integer_value ("/gui/app_width")
		end

	set_app_width (v: INTEGER)
			-- set app width
		require
			v > 0
		do
			app_cfg.put_value ("/gui/app_width", v)
		end

	app_height: INTEGER
			-- application height
		do
			Result := app_cfg.integer_value ("/gui/app_height")
		end

	set_app_height (v: INTEGER)
			-- set app height
		require
			v > 0
		do
			app_cfg.put_value ("/gui/app_height", v)
		end

	app_x_position: INTEGER
			-- application horizontal position
		do
			Result := app_cfg.integer_value ("/gui/app_x_position")
		end

	set_app_x_position (v: INTEGER)
			-- set app x position
		do
			app_cfg.put_value ("/gui/app_x_position", v)
		end

	app_y_position: INTEGER
			-- application vertical position
		do
			Result := app_cfg.integer_value ("/gui/app_y_position")
		end

	set_app_y_position (v: INTEGER)
			-- set app y position
		do
			app_cfg.put_value ("/gui/app_y_position", v)
		end

	app_maximised: BOOLEAN
			-- True if app should be maximised
		do
			Result := app_cfg.boolean_value ("/gui/app_maximised")
		end

	set_app_maximised (flag: BOOLEAN)
			-- set app maximised flag
		do
			app_cfg.put_value("/gui/app_maximised", flag)
		end

	test_split_position: INTEGER
			-- Split position of vertical split control in test tool.
		do
			Result := app_cfg.integer_value ("/gui/test_split_position")
		end

	set_test_split_position (v: INTEGER)
			-- Set split position of test tool vertical split control.
		require
			v > 0
		do
			app_cfg.put_value ("/gui/test_split_position", v)
		end

	catalogue_split_position: INTEGER
			-- Split position of explorer horizontal split control.
		do
			Result := app_cfg.integer_value ("/gui/catalogue_split_position")
		end

	set_catalogue_split_position (v: INTEGER)
			-- Set split position of explorer vertical split control.
		require
			v > 0
		do
			app_cfg.put_value ("/gui/catalogue_split_position", v)
		end

	expand_node_tree: BOOLEAN
			-- Expand the archetype definition node tree by default?
		do
			Result := app_cfg.boolean_value ("/gui/expand_node_tree")
		end

	set_expand_node_tree (flag: BOOLEAN)
			-- Set flag for whether to expand the archetype definition node tree by default.
		do
			app_cfg.put_value("/gui/expand_node_tree", flag)
		end

	show_technical_view: BOOLEAN
			-- Display the technical view in the archetype definition node tree by default?
		do
			Result := app_cfg.boolean_value ("/gui/show_technical_view")
		end

	set_show_technical_view (flag: BOOLEAN)
			-- Set flag for whether to show the technical view in the archetype definition node tree by default.
		do
			app_cfg.put_value("/gui/show_technical_view", flag)
		end

	show_reference_model_view: BOOLEAN
			-- Display the reference model view in the archetype definition node tree by default?
		do
			Result := app_cfg.boolean_value ("/gui/show_reference_model_view")
		end

	set_show_reference_model_view (flag: BOOLEAN)
			-- Set flag for whether to show the technical view in the archetype definition node tree by default.
		do
			app_cfg.put_value("/gui/show_reference_model_view", flag)
		end

	show_line_numbers: BOOLEAN
			-- Display line numbers in the ADL source text box?
		do
			Result := app_cfg.boolean_value ("/gui/show_line_numbers")
		end

	set_show_line_numbers (flag: BOOLEAN)
			-- Set flag for whether to show line numbers in the ADL source text box.
		do
			app_cfg.put_value("/gui/show_line_numbers", flag)
		end

	show_entire_ontology: BOOLEAN
			-- Display the entire ontology class tree, even when classes have no archetypes
		do
			Result := app_cfg.boolean_value ("/gui/show_entire_ontology")
		end

	set_show_entire_ontology (flag: BOOLEAN)
			-- Set flag for show_entire_ontology.
		do
			app_cfg.put_value("/gui/show_entire_ontology", flag)
		end

	display_archetype_source: BOOLEAN
			-- Display "(f)" marker on archetypes created in flat form
		do
			Result := app_cfg.boolean_value ("/gui/display_archetype_source")
		end

	set_display_archetype_source (flag: BOOLEAN)
			-- Set flag for whether to display markers indicating archetype authoring form.
		do
			app_cfg.put_value ("/gui/display_archetype_source", flag)
		end

	path_filter_combo_selection: STRING
			-- setting of path control filter combo-box
		do
			Result := app_cfg.string_value ("/gui/path_filter_combo_selection")
		end

	set_path_filter_combo_selection(str: STRING)
			--
		do
			app_cfg.put_value("/gui/path_filter_combo_selection", str)
		end

	use_rm_pixmaps: BOOLEAN
			-- if True, substitute RM pixmaps, if any found, below icon directory, during
			-- archetype definition visualisation
		do
			Result := app_cfg.boolean_value ("/gui/use_rm_pixmaps")
		end

	set_use_rm_pixmaps (flag: BOOLEAN)
			--
		do
			app_cfg.put_value ("/gui/use_rm_pixmaps", flag)
		end

	path_view_check_list_settings: attached LIST [STRING]
			-- path view column settings
		do
			Result := app_cfg.string_list_value ("/gui/path_view_check_list_settings")
			Result.compare_objects
		ensure
			result_attached: attached Result
			value_comparison: Result.object_comparison
			no_empty_items: Result.for_all (agent (s: STRING): BOOLEAN do Result := attached s and then not s.is_empty end)
		end

	set_path_view_check_list_settings (strs: attached LIST [STRING])
			-- save path view column settings
		do
			app_cfg.put_value("/gui/path_view_check_list_settings", strs)
		end

	text_editor_command: attached STRING
			-- Path of editor application for ADL files.
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/text_editor_command")
		end

	set_text_editor_command (a_value: attached STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/text_editor_command", a_value)
		end

	editor_app_command: attached STRING
			-- Path of editor application for ADL files.
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/editor_app_command")
		end

	set_editor_app_command (a_value: attached STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/editor_app_command", a_value)
		end

	difftool_command: attached STRING
			-- Path of diff tool application for ADL files.
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/difftool_command")
		end

	set_difftool_command (a_value: attached STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/difftool_command", a_value)
		end

feature {NONE} -- Implementation

	semantic_icon_table: attached DS_HASH_TABLE [TUPLE [file, help: STRING], STRING]
			-- Table of pixmap file paths and help messages, keyed by icon key.
		once
			create Result.make (0)

			Result.force (["class_concrete.ico", "concrete class from RM"], "class_concrete")
			Result.force (["class_concrete_supertype.ico", "concrete class from RM"], "class_concrete_supertype")
			Result.force (["class_abstract.ico", "abstract class from RM"], "class_abstract")
			Result.force (["generic_parameter.ico", "generic parameter from RM type"], "generic_parameter")
			Result.force (["generic_parameter.ico", "constrained generic parameter from RM type"], "constrained_generic_parameter")

			Result.force (["archetype_1.ico", "Ad hoc archetype (not parsed yet)"], "archetype_1")
			Result.force (["archetype_parsed_1.ico", "Ad hoc archetype (parsed but not compiled)"], "archetype_parsed_1")
			Result.force (["archetype_parse_failed_1.ico", "Ad hoc archetype (parse failed)"], "archetype_parse_failed_1")
			Result.force (["archetype_warning_1.ico", "Ad hoc archetype (parsed and compiled with warnings)"], "archetype_warning_1")
			Result.force (["archetype_valid_1.ico", "Ad hoc archetype (parsed and compiled)"], "archetype_valid_1")

			Result.force (["archetype_2.ico", "Archetype in the reference repository (not parsed yet)"], "archetype_2")
			Result.force (["archetype_parsed_2.ico", "Archetype in the reference repository (parsed but not compiled)"], "archetype_parsed_2")
			Result.force (["archetype_parse_failed_2.ico", "Archetype in the reference repository (parse failed)"], "archetype_parse_failed_2")
			Result.force (["archetype_warning_2.ico", "Archetype in the reference repository (parsed and compiled with warnings)"], "archetype_warning_2")
			Result.force (["archetype_valid_2.ico", "Archetype in the reference repository (parsed and compiled)"], "archetype_valid_2")

			Result.force (["archetype_3.ico", "Archetype in the work repository (not parsed yet)"], "archetype_3")
			Result.force (["archetype_parsed_3.ico", "Archetype in the work repository (parsed but not compiled)"], "archetype_parsed_3")
			Result.force (["archetype_parse_failed_3.ico", "Archetype in the work repository (parse failed)"], "archetype_parse_failed_3")
			Result.force (["archetype_warning_3.ico", "Archetype in the work repository (parsed and compiled with warnings)"], "archetype_warning_3")
			Result.force (["archetype_valid_3.ico", "Archetype in the work repository (parsed and compiled)"], "archetype_valid_3")

			Result.force ([Void, ""], "Gap 0 in the help")

			Result.force (["template_1.ico", "Ad hoc template (not parsed yet)"], "template_1")
			Result.force (["template_parsed_1.ico", "Ad hoc template (parsed but not compiled)"], "template_parsed_1")
			Result.force (["template_parse_failed_1.ico", "Ad hoc template (parse failed)"], "template_parse_failed_1")
			Result.force (["template_warning_1.ico", "Ad hoc template (parsed and compiled with warnings)"], "template_warning_1")
			Result.force (["template_valid_1.ico", "Ad hoc template (parsed and compiled)"], "template_valid_1")

			Result.force (["template_2.ico", "Template in the reference repository (not parsed yet)"], "template_2")
			Result.force (["template_parsed_2.ico", "Template in the reference repository (parsed but not compiled)"], "template_parsed_2")
			Result.force (["template_parse_failed_2.ico", "Template in the reference repository (parse failed)"], "template_parse_failed_2")
			Result.force (["template_warning_2.ico", "Template in the reference repository (parsed and compiled with warnings)"], "template_warning_2")
			Result.force (["template_valid_2.ico", "Template in the reference repository (parsed and compiled)"], "template_valid_2")

			Result.force (["template_3.ico", "Template in the work repository (not parsed yet)"], "template_3")
			Result.force (["template_parsed_3.ico", "Template in the work repository (parsed but not compiled)"], "template_parsed_3")
			Result.force (["template_parse_failed_3.ico", "Template in the work repository (parse failed)"], "template_parse_failed_3")
			Result.force (["template_warning_3.ico", "Template in the work repository (parsed and compiled with warnings)"], "template_warning_3")
			Result.force (["template_valid_3.ico", "Template in the work repository (parsed and compiled)"], "template_valid_3")

			Result.force ([Void, ""], "Gap 1 in the help")

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

			Result.force (["node_normal/archetype_external_ref.ico", "Archetype reference to other archetype (mandatory, single occurrence)"], "C_ARCHETYPE_ROOT")
			Result.force (["node_normal/archetype_external_ref_multiple.ico", "Archetype reference to other archetype (mandatory, multiple occurrences)"], "C_ARCHETYPE_ROOT.multiple")
			Result.force (["node_normal/archetype_external_ref_optional.ico", "Archetype reference to other archetype (optional, single occurrence)"], "C_ARCHETYPE_ROOT.optional")
			Result.force (["node_normal/archetype_external_ref_multiple_optional.ico", "Archetype reference to other archetype (optional, multiple occurrences)"], "C_ARCHETYPE_ROOT.multiple.optional")

			Result.force (["node_normal/archetype_code_ref.ico", "Constraint reference (openEHR AOM)"], "CONSTRAINT_REF")

			Result.force (["node_normal/term.ico", Void], "TERM")
			Result.force (["node_normal/ordinal.ico", Void], "ORDINAL")
			Result.force (["node_normal/cadl_invariant.ico", "Invariant section"], "CADL_INVARIANT")
			Result.force (["node_normal/cadl_invariant_item.ico","Invariant section item"], "CADL_INVARIANT_ITEM")
			Result.force (["node_inherited/icon_help_example.ico", "X is inherited from parent archetype"], "icon_help_example.inherited")
			Result.force (["node_redefined/icon_help_example.ico", "X is redefined from parent archetype"], "icon_help_example.redefined")

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

			Result.force (["node_inherited/archetype_external_ref.ico", Void], "ARCHETYPE_EXTERNAL_REF.inherited")
			Result.force (["node_inherited/archetype_external_ref_multiple.ico", Void], "ARCHETYPE_EXTERNAL_REF.multiple.inherited")
			Result.force (["node_inherited/archetype_external_ref_optional.ico", Void], "ARCHETYPE_EXTERNAL_REF.optional.inherited")
			Result.force (["node_inherited/archetype_external_ref_multiple_optional.ico", Void], "ARCHETYPE_EXTERNAL_REF.multiple.optional.inherited")

			Result.force (["node_inherited/archetype_internal_ref.ico", Void], "ARCHETYPE_INTERNAL_REF.inherited")
			Result.force (["node_inherited/archetype_external_ref.ico", Void], "ARCHETYPE_EXTERNAL_REF.inherited")
			Result.force (["node_inherited/term.ico", Void], "TERM.inherited")
			Result.force (["node_inherited/ordinal.ico", Void], "ORDINAL.inherited")
			Result.force (["node_normal/archetype_slot_optional.ico", Void], "ARCHETYPE_SLOT.optional.inherited")

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

			Result.force (["node_redefined/archetype_external_ref.ico", Void], "ARCHETYPE_EXTERNAL_REF.redefined")
			Result.force (["node_redefined/archetype_external_ref_multiple.ico", Void], "ARCHETYPE_EXTERNAL_REF.multiple.redefined")
			Result.force (["node_redefined/archetype_external_ref_optional.ico", Void], "ARCHETYPE_EXTERNAL_REF.optional.redefined")
			Result.force (["node_redefined/archetype_external_ref_multiple_optional.ico", Void], "ARCHETYPE_EXTERNAL_REF.multiple.optional.redefined")

			Result.force (["node_redefined/archetype_internal_ref.ico", Void], "ARCHETYPE_INTERNAL_REF.redefined")
			Result.force (["node_redefined/archetype_external_ref.ico", Void], "ARCHETYPE_EXTERNAL_REF.redefined")
			Result.force (["node_redefined/term.ico", Void], "TERM.redefined")
			Result.force (["node_redefined/ordinal.ico", Void], "ORDINAL.redefined")
			Result.force (["node_normal/archetype_slot_optional.ico", Void], "ARCHETYPE_SLOT.optional.redefined")

			Result.force (["pass.ico", Void], "test_passed")
			Result.force (["fail.ico", Void], "test_failed")
			Result.force (["not_applicable.ico", Void], "test_not_applicable")

			Result.force (["openEHR.png", Void], "openEHR_logo")
			Result.force (["openehr_adl_workbench_logo.png", Void], "adl_workbench_logo")
		ensure
			not_empty: not Result.is_empty
		end

	splash_text: attached STRING
			-- Text for splash screens, About boxes, etc.
		local
			version: OPENEHR_VERSION
		once
			create version
			create Result.make_empty
			Result.append ("ADL Workbench%N")
			Result.append ("Version " + version.out + "%N")
			Result.append ("(c) 2003-2011 openEHR Foundation%N")
			Result.append ("ADL version: " + Latest_adl_version + "%N")
			Result.append ("Source SVN - http://www.openehr.org/svn/ref_impl_eiffel%N%T" + version.last_changed + "%N")
			Result.append ("Source license: Mozilla tri-license%N")
			Result.append ("(http://www.mozilla.org/MPL/boilerplate-1.1/mpl-tri-license-txt)%N")
			Result.append ("Support: http://www.openehr.org/issues/browse/AWBPR%N")
			Result.append ("Funded by: OceanInformatics.com%N")
			Result.append ("Author: Thomas Beale%N")
			Result.append ("Contributors: Peter Gummer%N")
			Result.append ("Acknowledgements:%N")
			Result.append ("  - Eiffel Software (http://www.eiffel.com)%N")
			Result.append ("  - Gobo parsing libraries & tools (http://www.gobosoft.com)%N")
			Result.append ("  - Jonas Rask Design icons (http://jonasraskdesign.com)%N")
		ensure
			not_empty: not Result.is_empty
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
