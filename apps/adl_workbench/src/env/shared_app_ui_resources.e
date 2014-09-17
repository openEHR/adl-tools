note
	component:   "openEHR ADL Tools"
	description: "Shared UI resources"
	keywords:    "application, UI"
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
		once ("PROCESS")
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
		once ("PROCESS")
			Result := Definition_grid_col_constraint
		end

	Definition_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once ("PROCESS")
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
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text (ec_rules_grid_col_expr_type_text), Rules_grid_col_expr_type)
			Result.put (get_text (ec_rules_grid_col_expr_value_text), Rules_grid_col_expr_value)
		end

	Value_sets_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text (ec_value_sets_grid_col_code_text), Value_sets_grid_col_code)
			Result.put (get_text (ec_value_sets_grid_col_text_text), Value_sets_grid_col_text)
			Result.put (get_text (ec_value_sets_grid_col_description_text), Value_sets_grid_col_description)
		end

	Value_sets_grid_col_code: INTEGER = 1
	Value_sets_grid_col_text: INTEGER = 2
	Value_sets_grid_col_description: INTEGER = 3
	Value_sets_grid_col_max: INTEGER
		once ("PROCESS")
			Result := Value_sets_grid_col_description
		end

	Id_terms_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text (ec_id_terms_grid_col_code_text), Id_terms_grid_col_code)
			Result.put (get_text (ec_id_terms_grid_col_text_text), Id_terms_grid_col_text)
			Result.put (get_text (ec_id_terms_grid_col_member_code_text), Id_terms_grid_col_description)
		end

	Id_terms_grid_col_code: INTEGER = 1
	Id_terms_grid_col_text: INTEGER = 2
	Id_terms_grid_col_description: INTEGER = 3
	Id_terms_grid_col_max: INTEGER
		once ("PROCESS")
			Result := Id_terms_grid_col_description
		end

	Tool_tab_min: INTEGER = 0
	Tool_tab_description: INTEGER = 0
	Tool_tab_definition: INTEGER = 1
	Tool_tab_terminology: INTEGER = 2
	Tool_tab_annotations: INTEGER = 3
	Tool_tab_interface: INTEGER = 4
	Tool_tab_slots: INTEGER = 5
	Tool_tab_source: INTEGER = 6
	Tool_tab_serialised: INTEGER = 7
	Tool_tab_validity: INTEGER = 8
	Tool_tab_stats: INTEGER = 9
	Tool_tab_max: INTEGER = 9

	Tool_tab_index: HASH_TABLE [STRING, INTEGER]
			-- names of tool tabs keyed by tab constants
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text (ec_description_tab_text), Tool_tab_description)
			Result.put (get_text (ec_definition_tab_text), Tool_tab_definition)
			Result.put (get_text (ec_terminology_tab_text), Tool_tab_terminology)
			Result.put (get_text (ec_annotations_tab_text), Tool_tab_annotations)
			Result.put (get_text (ec_interface_tab_text), Tool_tab_interface)
			Result.put (get_text (ec_slots_tab_text), Tool_tab_slots)
			Result.put (get_text (ec_source_tab_text), Tool_tab_source)
			Result.put (get_text (ec_serialised_tab_text), Tool_tab_serialised)
			Result.put (get_text (ec_validity_tab_text), Tool_tab_validity)
			Result.put (get_text (ec_stat_info_tab_text), Tool_tab_stats)
		end

	tool_tab_text_to_id (a_tab_text: STRING): INTEGER
			-- Some tab texts have variable text parts in () after the static text part - need to remove this
			-- to generate the tab id
		local
			static_tab_text: STRING
			paren_pos: INTEGER
		do
			create static_tab_text.make_from_string (a_tab_text)
			paren_pos := static_tab_text.index_of ('(', 1)
			if paren_pos > 0 then
				static_tab_text.keep_head (paren_pos - 1)
				static_tab_text.right_adjust
			end
			if Tool_tab_reverse_index.has (static_tab_text) then
				Result := Tool_tab_reverse_index.item (static_tab_text)
			end
		end

	Tool_tab_reverse_index: HASH_TABLE [INTEGER, STRING]
			-- names of tool tabs keyed by tab constants
		once ("PROCESS")
			create Result.make (0)
			across Tool_tab_index as tabs_csr loop
				Result.put (tabs_csr.key, tabs_csr.item)
			end
		end

	Tool_tab_names: ARRAYED_LIST [STRING]
		once ("PROCESS")
			create Result.make (0)
			Result.compare_objects
			Result.append (Tool_tab_index.linear_representation)
		end

	Tool_tab_name (idx: INTEGER): STRING
		require
			idx >= 0 and idx <= Tool_tab_max
		do
			check attached Tool_tab_index.item (idx) as att_name then
				Result := att_name
			end
		end

	archetype_rm_type_inherited_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- LIGHT BLUE
		once ("PROCESS")
			-- create Result.make_with_8_bit_rgb (0xaa, 0xaa, 0xaa)
			create Result.make_with_8_bit_rgb (0x99, 0x99, 0xff)
		end

	archetype_rm_type_redefined_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- DARK GREY
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0x66, 0x66, 0x66)
		end

	archetype_rm_type_color: EV_COLOR
			-- foreground rendering colour for rm_attributes in the UI
			-- VERY DARK BLUE
		once ("PROCESS")
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
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0x22, 0x22, 0x22)
		end

	rm_attribute_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- VERY DARK GREY
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0x22, 0x22, 0x22)
			-- create Result.make_with_8_bit_rgb (0, 0, 0xff)
		end

	rm_runtime_attribute_colour: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- MEDIUM GREY
		once ("PROCESS")
			-- create Result.make_with_8_bit_rgb (0x44, 0x99, 0xff)
			create Result.make_with_8_bit_rgb (0x77, 0x77, 0x77)
		end

	rm_infrastructure_attribute_colour: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- LIGHT GREY
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0xaa, 0xaa, 0xaa)
		end

	Archetype_constraint_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- RED
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0xdd, 0, 0)
		end

	Binding_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- MEDIUM GREY
		once ("PROCESS")
			-- create Result.make_with_8_bit_rgb (0x44, 0x99, 0xff)
			create Result.make_with_8_bit_rgb (0x77, 0x77, 0x77)
		end

	At_code_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- RED
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0xdd, 0, 0)
		end

	Ac_code_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- FOREST GREEN
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0, 0x66, 0)
		end

	Id_code_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- DARK BLUE
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0, 0, 0xcc)
		end

	Id_code_color_inherited: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- MEDIUM GREY
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0x77, 0x77, 0x77)
		end

	Repository_remote_proxy_color: EV_COLOR
			-- foreground colour for displaying remote proxy entry in repo list in the UI
			-- MEDIUM GREY
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0x77, 0x77, 0x77)
		end

	Ev_grid_text_link_colour: EV_COLOR
			-- foreground colour for links in EV_GRID
			-- BLUE
		once ("PROCESS")
			create Result.make_with_8_bit_rgb (0x33, 0x33, 0xff)
		end

	rm_type_pixmap_key (a_type_name, an_rm_publisher, an_rm_closure: STRING): STRING
			-- generate an RM class pixmap key based on RM publisher and possibly closure (model) name;
			-- Return empty string if not found
		do
			-- assume form of key that just uses RM publisher, i.e. one set of icons for publisher
			Result := rm_icon_dir + resource_path_separator + an_rm_publisher + resource_path_separator + a_type_name
			if not has_icon_pixmap (Result) then
				-- now try icon key based on publisher and model name
				Result := rm_icon_dir + resource_path_separator + an_rm_publisher + {ARCHETYPE_HRID}.Section_separator_string + an_rm_closure + resource_path_separator + a_type_name
				if not has_icon_pixmap (Result) then
					create Result.make_empty
				end
			end
		end

	rm_type_pixmap (a_type_spec: BMM_CLASSIFIER; an_rm_publisher, an_rm_closure: STRING): EV_PIXMAP
		local
			pixmap_key: STRING
		do
			create pixmap_key.make_empty
			if not attached {BMM_GENERIC_PARAMETER} a_type_spec then
				if use_rm_pixmaps then
					pixmap_key := rm_type_pixmap_key (a_type_spec.base_class.name, an_rm_publisher, an_rm_closure)
				end
				if pixmap_key.is_empty then
					pixmap_key := "rm" + resource_path_separator + "generic" + resource_path_separator + a_type_spec.type_category
				end
			end
			Result := get_icon_pixmap (pixmap_key)
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

	last_user_selected_directory: STRING
			-- most recently chosen directory, usually via a directory chooser control
		do
			Result := app_cfg.string_value ("/file_system/last_user_selected_directory")
			if Result.is_empty then
				Result := execution_environment.root_directory_name
			end
		end

	set_last_user_selected_directory (a_path: STRING)
			-- set the directory where archetypes are currently being opened and saved.
		do
			if not a_path.is_empty then
				app_cfg.put_value ("/file_system/last_user_selected_directory", a_path)
			end
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

	global_show_rm_multiplicities: BOOLEAN
			-- Display the RM multiplicities in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_multiplicities")
		end

	set_global_show_rm_multiplicities (flag: BOOLEAN)
			-- Set flag for whether to show the RM multiplicities in the archetype definition node tree
		do
			app_cfg.put_value("/gui/show_rm_multiplicities", flag)
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
			Result := if app_cfg.has_resource ("/gui/use_rm_pixmaps") then app_cfg.boolean_value ("/gui/use_rm_pixmaps") else True end
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

	show_flat_form: BOOLEAN
			-- If true show flat rather than differential form of archetype
		do
			Result := app_cfg.boolean_value ("/gui/show_flat_form")
		end

	set_show_flat_form (flag: BOOLEAN)
			-- Set flag for `show_flat_form'
		do
			app_cfg.put_value("/gui/show_flat_form", flag)
		end

	default_tool_tab: INTEGER
			-- index of tool tab in `Tool_tab_index'
		do
			Result := app_cfg.integer_value ("/gui/default_tool_tab")
		end

	set_default_tool_tab (v: INTEGER)
			-- set `default_tool_tab'
		require
			v >= Tool_tab_min
		do
			app_cfg.put_value ("/gui/default_tool_tab", v)
		end

feature -- Conversion

	catalogue_node_pixmap (ara: ARCH_LIB_ITEM): EV_PIXMAP
		local
			pixmap_key: STRING
		do
			create pixmap_key.make_empty
			if attached {ARCH_LIB_CLASS_NODE} ara as acc then
				if use_rm_pixmaps then
					pixmap_key := rm_type_pixmap_key (acc.class_definition.name, acc.bmm_schema.rm_publisher, acc.bmm_schema.schema_name)
				end
			end
			if pixmap_key.is_empty then
				pixmap_key := "archetype/" + ara.group_name
			end
			Result := get_icon_pixmap (pixmap_key)
		end

feature {NONE} -- Implementation

	splash_text: STRING
			-- Text for splash screens, About boxes, etc.
		once ("PROCESS")
			create Result.make_empty
			Result.append ("ADL " + Latest_adl_version + " Workbench  v" + app_version.out + "%N")
			Result.append ("(c) 2003- openEHR Foundation%N")
			Result.append ("          Source: https://github.com/openEHR/adl-tools.git%N")
			Result.append ("         License: Apache 2.0 <http://www.apache.org/licenses/LICENSE-2.0.html>%N")
			Result.append ("        Support: http://www.openehr.org/issues/browse/AWBPR%N")
			Result.append ("     Funding: Thomas Beale, Ocean Informatics<http://www.oceaninformatics.com>%N")
			Result.append ("          Author: Thomas Beale%N")
			Result.append ("Contributors: Peter Gummer, Ian McNicoll MD%N")
			Result.append ("%N")
			Result.append ("Acknowledgements:%N")
			Result.append ("  - Eiffel Software EiffelStudio GPL release <http://www.eiffel.com>%N")
			Result.append ("  - Gobo parsing libraries and tools <http://www.gobosoft.com>%N")
			Result.append ("  - Jonas Rask Design icons <http://jonasraskdesign.com>%N")
			Result.append ("  - VisualPharm <http://www.visualpharm.com/> 'must-have' icons (CC-BY-ND 3.0)%N")
		ensure
			not_empty: not Result.is_empty
		end

	app_version: OPENEHR_VERSION
		once ("PROCESS")
			create Result
		end

end


