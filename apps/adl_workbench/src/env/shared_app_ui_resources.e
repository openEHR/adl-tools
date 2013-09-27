note
	component:   "openEHR ADL Tools"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_APP_UI_RESOURCES

inherit
	SHARED_ADL_APP_RESOURCES

	SHARED_ICON_RESOURCES

	EVX_DEFINITIONS
		export
			{NONE} all
		end

feature -- Definitions

	icon_directory: STRING
		once
			Result := file_system.pathname (application_startup_directory, "icons")
		end

	bug_reporter_url: STRING = "http://www.openehr.org/issues/browse/AWBPR/"
			-- The URL to ADL Workbench's problem reporter.

	user_docking_layout_file_path: STRING
			-- Full path to docking layout configuration file.
		do
			Result := file_system.pathname (user_config_file_directory, extension_replaced ("ui_config", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	default_docking_layout_file_path: STRING
			-- Full path to docking layout configuration file.
		do
			Result := file_system.pathname (application_startup_directory, extension_replaced ("default_ui_config", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	rm_icon_dir: STRING = "rm"

	Definition_grid_col_rm_name: INTEGER = 1
	Definition_grid_col_meaning: INTEGER = 2
	Definition_grid_col_existence: INTEGER = 3
	Definition_grid_col_card_occ: INTEGER = 4
	Definition_grid_col_sibling_order: INTEGER = 5
	Definition_grid_col_constraint: INTEGER = 6
	Definition_grid_col_max: INTEGER
		once
			Result := Definition_grid_col_constraint
		end

	Definition_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text (ec_definition_grid_col_rm_name_text), Definition_grid_col_rm_name)
			Result.put (get_text (ec_definition_grid_col_meaning_text), Definition_grid_col_meaning)
			Result.put (get_text (ec_definition_grid_col_existence_text), Definition_grid_col_existence)
			Result.put (get_text (ec_definition_grid_col_card_occ_text), Definition_grid_col_card_occ)
			Result.put (get_text (ec_definition_grid_col_sibling_order_text), Definition_grid_col_sibling_order)
			Result.put (get_text (ec_definition_grid_col_constraint_text), Definition_grid_col_constraint)
		end

	Rules_grid_col_expr_type: INTEGER = 1
	Rules_grid_col_expr_value: INTEGER = 2

	Rules_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text (ec_rules_grid_col_expr_type_text), Rules_grid_col_expr_type)
			Result.put (get_text (ec_rules_grid_col_expr_value_text), Rules_grid_col_expr_value)
		end

	archetype_rm_type_inherited_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- LIGHT BLUE
		once
			-- create Result.make_with_8_bit_rgb (0xaa, 0xaa, 0xaa)
			create Result.make_with_8_bit_rgb (0x99, 0x99, 0xff)
		end

	archetype_rm_type_redefined_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- DARK GREY
		once
			create Result.make_with_8_bit_rgb (0x66, 0x66, 0x66)
		end

	archetype_rm_type_color: EV_COLOR
			-- foreground rendering colour for rm_attributes in the UI
			-- VERY DARK BLUE
		once
			create Result.make_with_8_bit_rgb (0, 0, 0x99)
		end

	archetyped_attribute_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- DARK BLUE
		once
			create Result.make_with_8_bit_rgb (0, 0, 0xcc)
		end

	rm_type_color: EV_COLOR
			-- foreground rendering colour for rm_attributes in the UI
			-- VERY DARK GREY
		once
			create Result.make_with_8_bit_rgb (0x22, 0x22, 0x22)
		end

	rm_attribute_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- VERY DARK GREY
		once
			create Result.make_with_8_bit_rgb (0x22, 0x22, 0x22)
			-- create Result.make_with_8_bit_rgb (0, 0, 0xff)
		end

	rm_runtime_attribute_colour: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- MEDIUM GREY
		once
			-- create Result.make_with_8_bit_rgb (0x44, 0x99, 0xff)
			create Result.make_with_8_bit_rgb (0x77, 0x77, 0x77)
		end

	rm_infrastructure_attribute_colour: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- LIGHT GREY
		once
			create Result.make_with_8_bit_rgb (0xaa, 0xaa, 0xaa)
		end

	Archetype_constraint_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- RED
		once
			create Result.make_with_8_bit_rgb (0xdd, 0, 0)
		end

	rm_type_pixmap (a_type_spec: BMM_TYPE_SPECIFIER; an_rm_publisher: STRING): EV_PIXMAP
		local
			pixmap_name: STRING
		do
			if not attached {BMM_GENERIC_PARAMETER_DEFINITION} a_type_spec then
				pixmap_name := rm_icon_dir + resource_path_separator + an_rm_publisher + resource_path_separator + a_type_spec.root_class
				if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
					Result := get_icon_pixmap (pixmap_name)
				else
					Result := get_icon_pixmap ("rm" + resource_path_separator + "generic" + resource_path_separator + a_type_spec.type_category)
				end
			else
				Result := get_icon_pixmap ("rm" + resource_path_separator + "generic" + resource_path_separator + a_type_spec.type_category)
			end
		end

feature -- Access

	adl_workbench_logo: EV_PIXMAP
		do
			Result := get_icon_pixmap ("openehr_adl_workbench_logo")
		end

feature -- Application Switches

	last_exec_app_version: STRING
			-- version of app when last run; used to detect if certain things
			-- should be done on a new version of the app
		do
			Result := app_cfg.string_value ("/exec/app_version")
		end

	set_last_exec_app_version (a_ver: STRING)
			-- set the version of app when last run
		do
			app_cfg.put_value ("/exec/app_version", a_ver)
		end

	current_work_directory: STRING
			-- Directory where archetypes are currently being opened and saved
			-- from GUI open and save buttons; automatic opens (due to clicking
			-- on archetype name) still use main repository directory.
		do
			Result := app_cfg.string_value ("/file_system/current_work_directory")
		end

	set_current_work_directory (a_path: STRING)
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

	expand_definition_tree: BOOLEAN
			-- Expand the archetype definition node tree by default?
		do
			Result := app_cfg.boolean_value ("/gui/expand_node_tree")
		end

	set_expand_definition_tree (flag: BOOLEAN)
			-- Set flag for whether to expand the archetype definition node tree by default.
		do
			app_cfg.put_value("/gui/expand_node_tree", flag)
		end

	allow_archetype_editing: BOOLEAN
			-- turn editing on; TEMPORARY flag to stop most users seeing editing function
			-- until its ready. Turned on by manual addition to .cfg file
		do
			Result := app_cfg.boolean_value ("/gui/allow_archetype_editing")
		end

	global_show_technical_view: BOOLEAN
			-- Display the technical view in the archetype definition node tree by default?
		do
			Result := app_cfg.boolean_value ("/gui/show_technical_view")
		end

	set_global_show_technical_view (flag: BOOLEAN)
			-- Set flag for whether to show the technical view in the archetype definition node tree by default.
		do
			app_cfg.put_value("/gui/show_technical_view", flag)
		end

	global_show_rm_data_properties: BOOLEAN
			-- Display the RM data properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_data_properties")
		end

	set_global_show_rm_data_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM data properties in the archetype definition node tree
		do
			app_cfg.put_value("/gui/show_rm_data_properties", flag)
		end

	global_show_rm_runtime_properties: BOOLEAN
			-- Display the RM runtime properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_runtime_properties")
		end

	set_global_show_rm_runtime_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM runtime properties in the archetype definition node tree
		do
			app_cfg.put_value ("/gui/show_rm_runtime_properties", flag)
		end

	global_show_rm_infrastructure_properties: BOOLEAN
			-- Display the RM infrastructure properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_infrastructure_properties")
		end

	set_global_show_rm_infrastructure_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM infrastructure properties in the archetype definition node tree
		do
			app_cfg.put_value ("/gui/show_rm_infrastructure_properties", flag)
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

	text_editor_command: STRING
			-- Path of editor application for ADL files; use default if nothing
			-- configured
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/text_editor_command")
			if Result.is_empty then
				Result := default_text_editor_command
				set_text_editor_command (Result)
			end
		end

	set_text_editor_command (a_value: STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/text_editor_command", a_value)
		end

	editor_app_command: STRING
			-- Path of editor application for ADL files; use default if nothing
			-- configured
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/editor_app_command")
			if Result.is_empty then
				Result := default_editor_app_command
				set_editor_app_command (Result)
			end
		end

	set_editor_app_command (a_value: STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/editor_app_command", a_value)
		end

	difftool_command: STRING
			-- Path of diff tool application for ADL files; use default if nothing
			-- configured
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/difftool_command")
			if Result.is_empty then
				Result := default_difftool_command
				set_difftool_command (Result)
			end
		end

	set_difftool_command (a_value: STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_value ("/commands/difftool_command", a_value)
		end

feature -- Conversion

	catalogue_node_pixmap (ara: ARCH_CAT_ITEM): EV_PIXMAP
		local
			pixmap_name: STRING
		do
			if attached {ARCH_CAT_CLASS_NODE} ara as acc then
				pixmap_name := "rm/" + acc.bmm_schema.rm_publisher + "/" + acc.class_definition.name
				if use_rm_pixmaps and then has_icon_pixmap (pixmap_name) then
					Result := get_icon_pixmap (pixmap_name)
				else
					Result := get_icon_pixmap ("archetype/" + ara.group_name)
				end
			else
				Result := get_icon_pixmap ("archetype/" + ara.group_name)
			end
		end

feature {NONE} -- Implementation

	splash_text: STRING
			-- Text for splash screens, About boxes, etc.
		once
			create Result.make_empty
			Result.append ("ADL " + Latest_adl_version + " Workbench  version " + app_version.out + "%N")
			Result.append ("(c) 2003- openEHR Foundation%N")
			Result.append ("         Source: https://github.com/openEHR/adl-tools.git%N")
			Result.append ("        License: Apache 2.0 <http://www.apache.org/licenses/LICENSE-2.0.html>%N")
			Result.append ("       Support: http://www.openehr.org/issues/browse/AWBPR%N")
			Result.append ("    Funded by: Thomas Beale; Ocean Informatics%N")
			Result.append ("          Author: Thomas Beale%N")
			Result.append ("Contributors: Peter Gummer, Ian McNicoll MD%N")
			Result.append ("Acknowledgements:%N")
			Result.append ("  - Eiffel Software (http://www.eiffel.com)%N")
			Result.append ("  - Gobo parsing libraries and tools (http://www.gobosoft.com)%N")
			Result.append ("  - Jonas Rask Design icons (http://jonasraskdesign.com)%N")
			Result.append ("  - VisualPharm (http://www.visualpharm.com/) 'must-have' icons (CC-BY-ND 3.0)%N")
		ensure
			not_empty: not Result.is_empty
		end

	app_version: OPENEHR_VERSION
		once
			create Result
		end

end


