note
	component:   "openEHR ADL Tools"
	description: "Shared UI resources"
	keywords:    "application, UI"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
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

	Icon_rm_dir: STRING = "rm"
			-- location of all RM icons

	Icon_rm_generic_dir: STRING
			-- location of generic RM icons
		do
			Result := Icon_rm_dir + resource_path_separator + "generic"
		end

	Icon_am_dir: STRING = "am"
			-- location of all AOM icons

feature -- Definitions: Archetype viewer

	Definition_grid_col_rm_name: INTEGER = 1
	Definition_grid_col_meaning: INTEGER = 2
	Definition_grid_col_constraint: INTEGER = 3
	Definition_grid_col_existence: INTEGER = 4
	Definition_grid_col_card_occ: INTEGER = 5
	Definition_grid_col_sibling_order: INTEGER = 6
	Definition_grid_col_loinc: INTEGER = 7
	Definition_grid_col_max: INTEGER
		once ("PROCESS")
			Result := Definition_grid_col_loinc
		end

	Definition_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_rm_name_text), Definition_grid_col_rm_name)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_meaning_text), Definition_grid_col_meaning)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_constraint_text), Definition_grid_col_constraint)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_existence_text), Definition_grid_col_existence)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_card_occ_text), Definition_grid_col_card_occ)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_sibling_order_text), Definition_grid_col_sibling_order)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_grid_col_loinc_text), Definition_grid_col_loinc)
		end

	Rules_grid_col_expr_type: INTEGER = 1
	Rules_grid_col_expr_value: INTEGER = 2

	Rules_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_rules_grid_col_expr_type_text), Rules_grid_col_expr_type)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_rules_grid_col_expr_value_text), Rules_grid_col_expr_value)
		end

	Value_sets_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_value_sets_grid_col_code_text), Value_sets_grid_col_code)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_value_sets_grid_col_text_text), Value_sets_grid_col_text)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_value_sets_grid_col_description_text), Value_sets_grid_col_description)
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
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_id_terms_grid_col_code_text), Id_terms_grid_col_code)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_id_terms_grid_col_text_text), Id_terms_grid_col_text)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_id_terms_grid_col_member_code_text), Id_terms_grid_col_description)
		end

	Id_terms_grid_col_code: INTEGER = 1
	Id_terms_grid_col_text: INTEGER = 2
	Id_terms_grid_col_description: INTEGER = 3
	Id_terms_grid_col_max: INTEGER
		once ("PROCESS")
			Result := Id_terms_grid_col_description
		end

feature -- Definitions: Tool tabs

	Tool_tab_min: INTEGER = 0
	Tool_tab_description: INTEGER = 0
	Tool_tab_definition: INTEGER = 1
	Tool_tab_terminology: INTEGER = 2
	Tool_tab_annotations: INTEGER = 3
	Tool_tab_interface: INTEGER = 4
	Tool_tab_slots: INTEGER = 5
	Tool_tab_clients_suppliers: INTEGER = 6
	Tool_tab_source: INTEGER = 7
	Tool_tab_serialised: INTEGER = 8
	Tool_tab_instance: INTEGER = 9
	Tool_tab_validity: INTEGER = 10
	Tool_tab_stats: INTEGER = 11
	Tool_tab_max: INTEGER = 12

	Tool_tab_index: HASH_TABLE [STRING, INTEGER]
			-- names of tool tabs keyed by tab constants
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_description_tab_text), Tool_tab_description)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_definition_tab_text), Tool_tab_definition)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_terminology_tab_text), Tool_tab_terminology)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_annotations_tab_text), Tool_tab_annotations)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_interface_tab_text), Tool_tab_interface)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_slots_tab_text), Tool_tab_slots)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_clients_suppliers_tab_text), Tool_tab_clients_suppliers)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_source_tab_text), Tool_tab_source)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_serialised_tab_text), Tool_tab_serialised)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_instance_tab_text), Tool_tab_instance)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_validity_tab_text), Tool_tab_validity)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_stat_info_tab_text), Tool_tab_stats)
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

feature -- Definitions: Resource paths

	Gui_show_flat_form_resource_path: IMMUTABLE_STRING_8
		once
			create Result.make_from_string ("/gui/show_flat_form")
		end

feature -- Definitions: Colours

	archetype_default_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- BLACK
		once
			create Result.make_with_8_bit_rgb (0x0, 0x0, 0x0)
		end

	archetype_rm_type_inherited_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- LIGHT GREY
		once
			create Result.make_with_8_bit_rgb (0x80, 0x80, 0x80)
		end

	archetype_rm_type_redefined_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- LIGHT-MEDIUM GREY
		once
			create Result.make_with_8_bit_rgb (0x64, 0x64, 0x64)
		end

	archetype_rm_type_color: EV_COLOR
			-- foreground rendering colour for rm_attributes in the UI
			-- VERY DARK BLUE
		once
			create Result.make_with_8_bit_rgb (0, 0, 0x99)
		end

	archetype_generated_color: EV_COLOR
			-- foreground colour for generated archetypes in the explorer
			-- DARK GREY
		once
			create Result.make_with_8_bit_rgb (0x64, 0x64, 0x64)
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
			create Result.make_with_8_bit_rgb (0x80, 0x80, 0x80)
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

	Binding_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- MEDIUM GREY
		once
			create Result.make_with_8_bit_rgb (0x80, 0x80, 0x80)
		end

	At_code_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- RED
		once
			create Result.make_with_8_bit_rgb (0xdd, 0, 0)
		end

	Ac_code_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- FOREST GREEN
		once
			create Result.make_with_8_bit_rgb (0, 0x66, 0)
		end

	Id_code_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- DARK BLUE
		once
			create Result.make_with_8_bit_rgb (0, 0, 0xcc)
		end

	Id_code_color_inherited: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- LIGHT GREY
		once
			create Result.make_with_8_bit_rgb (0x80, 0x80, 0x80)
		end

	Repository_remote_proxy_color: EV_COLOR
			-- foreground colour for displaying remote proxy entry in repo list in the UI
			-- DARK GREY
		once
			create Result.make_with_8_bit_rgb (0x64, 0x64, 0x64)
		end

	Ev_grid_text_link_colour: EV_COLOR
			-- foreground colour for links in EV_GRID
			-- BLUE
		once
			create Result.make_with_8_bit_rgb (0x33, 0x33, 0xff)
		end

	Url_color: EV_COLOR
			-- foreground colour for links in EV_GRID
			-- BLUE
		once
			create Result.make_with_8_bit_rgb (0x33, 0x33, 0xff)
		end

	Default_bg_color: EV_COLOR
			-- default background colour
		once
			create Result.make_with_8_bit_rgb (0xff, 0xff, 0xff)
		end

	Splash_background_color: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (240, 240, 200)
		end

	Off_white_background_color: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (0xff, 0xff, 0xff)
		end

	Progress_bar_colour: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (0x33, 0x33, 0xff)
		end

feature -- Definitions: Fonts

	Bold_font: EV_FONT
		once ("PROCESS")
			create Result
			Result.set_weight ({EV_FONT_CONSTANTS}.weight_bold)
		end

	Regular_font: EV_FONT
		once ("PROCESS")
			create Result
			Result.set_weight ({EV_FONT_CONSTANTS}.weight_regular)
		end

	Normal_url_char_fmt: EV_CHARACTER_FORMAT
		once ("PROCESS")
			create Result.make_with_font_and_color (Regular_font, Url_color, Default_bg_color)
		end

	Normal_char_fmt: EV_CHARACTER_FORMAT
		once ("PROCESS")
			create Result.make_with_font (Regular_font)
		end

	Bold_char_fmt: EV_CHARACTER_FORMAT
		once ("PROCESS")
			create Result.make_with_font (Bold_font)
		end

feature -- Definitions: VCS status

	Vcs_status_icons: HASH_TABLE [EV_PIXMAP, INTEGER]
		once ("PROCESS")
			create Result.make (0)
			Result.put (get_icon_pixmap ("tool/unknown"), Vcs_status_unknown)
			Result.put (get_icon_pixmap ("tool/vcs_files_not_committed"), Vcs_status_files_not_committed)
			Result.put (get_icon_pixmap ("tool/vcs_up_to_date"), Vcs_status_up_to_date)
			Result.put (get_icon_pixmap ("tool/vcs_sync_required"), Vcs_status_sync_required)
			Result.put (get_icon_pixmap ("tool/vcs_pull_required"), Vcs_status_pull_required)
			Result.put (get_icon_pixmap ("tool/vcs_push_required"), Vcs_status_push_required)
			Result.put (get_icon_pixmap ("tool/vcs_diverged"), Vcs_status_diverged)
		end

	vcs_status_icon (a_status: INTEGER): EV_PIXMAP
		require
			Valid_vcs_status (a_status)
		do
			check attached Vcs_status_icons.item (a_status) as att_pixmap then
				Result := att_pixmap
			end
		end

	Vcs_status_tooltips: HASH_TABLE [READABLE_STRING_8, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_unknown_tooltip), Vcs_status_unknown)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_files_not_committed_tooltip), Vcs_status_files_not_committed)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_up_to_date_tooltip), Vcs_status_up_to_date)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_sync_required_tooltip), Vcs_status_sync_required)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_pull_required_tooltip), Vcs_status_pull_required)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_push_required_tooltip), Vcs_status_push_required)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_vcs_status_diverged_tooltip), Vcs_status_diverged)
		end

	vcs_status_tooltip (a_status: INTEGER): STRING
		require
			Valid_vcs_status (a_status)
		do
			check attached Vcs_status_tooltips.item (a_status) as att_str then
				Result := att_str
			end
		end

feature -- Access

	rm_type_pixmap_key (a_class_def: BMM_CLASS): STRING
			-- generate an RM class pixmap key based on RM publisher and possibly closure (model) name;
			-- Return empty string if not found
		do
			-- assume form of key that just uses RM publisher, i.e. one set of icons for publisher
			Result := Icon_rm_dir + resource_path_separator + a_class_def.bmm_model.rm_publisher + resource_path_separator + a_class_def.name
			if not has_icon_pixmap (Result) then
				-- now try icon key based on publisher and model name
				Result := Icon_rm_dir + resource_path_separator + a_class_def.bmm_model.rm_publisher + {ARCHETYPE_HRID}.Section_separator_string +
					a_class_def.bmm_model.model_name + resource_path_separator + a_class_def.name
				if not has_icon_pixmap (Result) then
					Result.wipe_out
				end
			end
		end

	rm_type_pixmap (a_rm_entity: BMM_ENTITY; use_rm_pixmaps: BOOLEAN): EV_PIXMAP
			-- generate an RM pixmap for RM type `a_type_spec'
		local
			pixmap_key: STRING
		do
			create pixmap_key.make_empty
			if not attached {BMM_PARAMETER_TYPE} a_rm_entity then
				if use_rm_pixmaps then
					if attached {BMM_CLASS} a_rm_entity as a_class then
						pixmap_key := rm_type_pixmap_key (a_class)
					elseif attached {BMM_MODEL_TYPE} a_rm_entity as a_type then
						pixmap_key := rm_type_pixmap_key (a_type.defining_class)
					end
				end
				if pixmap_key.is_empty then
					pixmap_key := Icon_rm_dir + resource_path_separator + "generic" + resource_path_separator + a_rm_entity.entity_category
				end
			end
			Result := get_icon_pixmap (pixmap_key)
		end

	library_node_pixmap (ara: ARCH_LIB_ITEM): EV_PIXMAP
		local
			pixmap_key: STRING
		do
			create pixmap_key.make_empty
			if attached {ARCH_LIB_CLASS} ara as acc then
				Result := rm_type_pixmap (acc.class_definition, True)
			else
				Result := get_icon_pixmap ("archetype/" + ara.group_name)
			end
		end

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
			app_cfg.put_string_value ("/exec/app_version", a_ver)
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
			-- set user chosen directory.
		do
			if not a_path.is_empty then
				app_cfg.put_string_value ("/file_system/last_user_selected_directory", a_path)
			end
		end

	last_user_save_directory: STRING
			-- most recently chosen save directory, usually via a directory chooser control
		do
			Result := app_cfg.string_value ("/file_system/last_user_save_directory")
			if Result.is_empty then
				Result := execution_environment.root_directory_name
			end
		end

	set_last_user_save_directory (a_path: STRING)
			-- set the directory for ad hoc saving
		do
			if not a_path.is_empty then
				app_cfg.put_string_value ("/file_system/last_user_save_directory", a_path)
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
				app_cfg.put_string_value ("/file_system/current_work_directory", a_path)
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
			app_cfg.put_integer_value ("/gui/app_width", v)
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
			app_cfg.put_integer_value ("/gui/app_height", v)
		end

	app_x_position: INTEGER
			-- application horizontal position
		do
			Result := app_cfg.integer_value ("/gui/app_x_position")
		end

	set_app_x_position (v: INTEGER)
			-- set app x position
		do
			app_cfg.put_integer_value ("/gui/app_x_position", v)
		end

	app_y_position: INTEGER
			-- application vertical position
		do
			Result := app_cfg.integer_value ("/gui/app_y_position")
		end

	set_app_y_position (v: INTEGER)
			-- set app y position
		do
			app_cfg.put_integer_value ("/gui/app_y_position", v)
		end

	app_maximised: BOOLEAN
			-- True if app should be maximised
		do
			Result := app_cfg.boolean_value ("/gui/app_maximised")
		end

	set_app_maximised (flag: BOOLEAN)
			-- set app maximised flag
		do
			app_cfg.put_boolean_value("/gui/app_maximised", flag)
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
			app_cfg.put_integer_value ("/gui/test_split_position", v)
		end

	expand_definition_tree: BOOLEAN
			-- Expand the archetype definition node tree by default?
		do
			Result := app_cfg.boolean_value ("/gui/expand_node_tree")
		end

	set_expand_definition_tree (flag: BOOLEAN)
			-- Set flag for whether to expand the archetype definition node tree by default.
		do
			app_cfg.put_boolean_value ("/gui/expand_node_tree", flag)
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
			app_cfg.put_boolean_value("/gui/show_technical_view", flag)
		end

	global_show_rm_multiplicities: BOOLEAN
			-- Display the RM multiplicities in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_multiplicities")
		end

	set_global_show_rm_multiplicities (flag: BOOLEAN)
			-- Set flag for whether to show the RM multiplicities in the archetype definition node tree
		do
			app_cfg.put_boolean_value("/gui/show_rm_multiplicities", flag)
		end

	global_show_rm_data_properties: BOOLEAN
			-- Display the RM data properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_data_properties")
		end

	set_global_show_rm_data_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM data properties in the archetype definition node tree
		do
			app_cfg.put_boolean_value("/gui/show_rm_data_properties", flag)
		end

	global_show_rm_runtime_properties: BOOLEAN
			-- Display the RM runtime properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_runtime_properties")
		end

	set_global_show_rm_runtime_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM runtime properties in the archetype definition node tree
		do
			app_cfg.put_boolean_value ("/gui/show_rm_runtime_properties", flag)
		end

	global_show_rm_infrastructure_properties: BOOLEAN
			-- Display the RM infrastructure properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_infrastructure_properties")
		end

	set_global_show_rm_infrastructure_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM infrastructure properties in the archetype definition node tree
		do
			app_cfg.put_boolean_value ("/gui/show_rm_infrastructure_properties", flag)
		end

	global_show_rm_inheritance: BOOLEAN
			-- Use inheritance-based colourisation in definition tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_inheritance")
		end

	set_global_show_rm_inheritance (flag: BOOLEAN)
			-- Set flag for whether to show inheritance-based colourisation in definition tree
		do
			app_cfg.put_boolean_value ("/gui/show_rm_inheritance", flag)
		end

	global_show_codes: BOOLEAN
			-- Show codes in definition tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_codes")
		end

	set_global_show_codes (flag: BOOLEAN)
			-- Set flag for whether to show codes in definition tree
		do
			app_cfg.put_boolean_value ("/gui/show_codes", flag)
		end

	show_line_numbers: BOOLEAN
			-- Display line numbers in the ADL source text box?
		do
			Result := app_cfg.boolean_value ("/gui/show_line_numbers")
		end

	set_show_line_numbers (flag: BOOLEAN)
			-- Set flag for whether to show line numbers in the ADL source text box.
		do
			app_cfg.put_boolean_value("/gui/show_line_numbers", flag)
		end

	show_entire_ontology: BOOLEAN
			-- Display the entire ontology class tree, even when classes have no archetypes
		do
			Result := app_cfg.boolean_value ("/gui/show_entire_ontology")
		end

	set_show_entire_ontology (flag: BOOLEAN)
			-- Set flag for show_entire_ontology.
		do
			app_cfg.put_boolean_value("/gui/show_entire_ontology", flag)
		end

	display_archetype_source: BOOLEAN
			-- Display "(f)" marker on archetypes created in flat form
		do
			Result := app_cfg.boolean_value ("/gui/display_archetype_source")
		end

	set_display_archetype_source (flag: BOOLEAN)
			-- Set flag for whether to display markers indicating archetype authoring form.
		do
			app_cfg.put_boolean_value ("/gui/display_archetype_source", flag)
		end

	text_editor_command: STRING
			-- Path of editor application for ADL files; use default if nothing
			-- configured
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/text_editor_command")
			if Result.is_empty then
				Result := default_text_editor_command
				set_text_editor_command (Result)

			-- if it's not a command path, convert it to one
			elseif not is_command_template (Result) then
				Result := convert_to_command_template (Result)
				set_text_editor_command (Result)
			end
		end

	set_text_editor_command (a_value: STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_string_value ("/commands/text_editor_command", a_value)
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
			app_cfg.put_string_value ("/commands/editor_app_command", a_value)
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
			app_cfg.put_string_value ("/commands/difftool_command", a_value)
		end

	show_flat_form: BOOLEAN
			-- If true show flat rather than differential form of archetype
		do
			Result := app_cfg.boolean_value (Gui_show_flat_form_resource_path)
		end

	set_show_flat_form (flag: BOOLEAN)
			-- Set flag for `show_flat_form'
		do
			app_cfg.put_boolean_value(Gui_show_flat_form_resource_path, flag)
		end

	is_set_show_flat_form: BOOLEAN
			-- is flag for `show_flat_form' set to some value in options?
		do
			Result := app_cfg.has_resource (Gui_show_flat_form_resource_path)
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
			app_cfg.put_integer_value ("/gui/default_tool_tab", v)
		end

feature {NONE} -- Implementation

	splash_text: STRING
			-- Text for splash screens, About boxes, etc.
		once ("PROCESS")
			create Result.make_empty
			Result.append ("                                                   ADL " + Latest_adl_major_version + " Workbench  v" + app_version.out + "%N")
			Result.append ("                    (c) 2003- openEHR Foundation <http://www.openEHR.org>%N")
			Result.append ("%N")
			Result.append ("          Source: " + Source_url + "%N")
			Result.append ("         License: Apache 2.0 <http://www.apache.org/licenses/LICENSE-2.0.html>%N")
			Result.append ("          Author: Thomas Beale (Ars Semantica) <http://ArsSemantica.com>%N")
			Result.append ("Contributors: Peter Gummer, Ian McNicoll MD (FreshEHR)),%N")
			Result.append ("                        Patrick Langford (Intermountain Healthcare),%N")
			Result.append ("                        Harold Solbrig (Mayo Clinic)%N")
			Result.append ("        Funding: Ars Semantica, Ocean Informatics%N")
			Result.append ("%N")
			Result.append ("Issue tracker: " + Bug_reporter_url + "%N")
			Result.append ("%N")
			Result.append ("Acknowledgements:%N")
			Result.append ("  - Eiffel Software EiffelStudio GPL release <http://www.eiffel.com>%N")
			Result.append ("  - Gobo parsing libraries and tools <http://www.gobosoft.com>%N")
			Result.append ("  - Jonas Rask Design icons <http://jonasraskdesign.com>%N")
			Result.append ("  - VisualPharm <http://www.visualpharm.com/> 'must-have' icons (CC-BY-ND 3.0)")
		ensure
			not_empty: not Result.is_empty
		end

	ev_splash_text: EV_RICH_TEXT
			-- Text for splash screens, About boxes, etc.
		once ("PROCESS")
			create Result
			Result.buffered_append ("                                                ADL " + Latest_adl_major_version + " Workbench  v" + app_version.out + "%N", Normal_char_fmt)
			Result.buffered_append ("                    (c) 2003- openEHR Foundation <", Normal_char_fmt)
				Result.buffered_append ("http://www.openEHR.org", Normal_url_char_fmt); Result.buffered_append (">%N", Normal_char_fmt)
			Result.buffered_append ("%N", Normal_char_fmt)

			Result.buffered_append ("           Source: ", Bold_char_fmt); Result.buffered_append (Source_url + "%N", Normal_url_char_fmt)
			Result.buffered_append ("          License: ", Bold_char_fmt); Result.buffered_append ("Apache 2.0 <http://www.apache.org/licenses/LICENSE-2.0.html>%N", Normal_char_fmt)

			Result.buffered_append ("           Author: ", Bold_char_fmt); Result.buffered_append ("Thomas Beale (Ars Semantica) <", Normal_char_fmt)
				Result.buffered_append ("http://ArsSemantica.com", Normal_url_char_fmt); Result.buffered_append (">%N", Normal_char_fmt)
			Result.buffered_append (" Contributors: ", Bold_char_fmt); Result.buffered_append ("Peter Gummer, Ian McNicoll MD (FreshEHR),%N", Normal_char_fmt)
			Result.buffered_append ("                          Patrick Langford (Intermountain Healthcare),%N", Normal_char_fmt)
			Result.buffered_append ("                          Harold Solbrig (Mayo Clinic)%N", Normal_char_fmt)
			Result.buffered_append ("          Funding: ", Bold_char_fmt); Result.buffered_append ("Ars Semantica, Ocean Informatics %N", Normal_char_fmt)
			Result.buffered_append ("Issue tracker: ", Bold_char_fmt); Result.buffered_append (Bug_reporter_url + "%N", Normal_url_char_fmt)
			Result.buffered_append ("%N", Normal_char_fmt)
			Result.buffered_append ("Acknowledgements:%N", Bold_char_fmt)
			Result.buffered_append ("  - Eiffel Software EiffelStudio GPL release <", Normal_char_fmt)
				Result.buffered_append ("http://www.eiffel.com", Normal_url_char_fmt); Result.buffered_append (">%N", Normal_char_fmt)
			Result.buffered_append ("  - Gobo parsing libraries and tools <", Normal_char_fmt)
				Result.buffered_append ("http://www.gobosoft.com", Normal_url_char_fmt); Result.buffered_append (">%N", Normal_char_fmt)
			Result.buffered_append ("  - Jonas Rask Design icons <http://jonasraskdesign.com>%N", Normal_char_fmt)
			Result.buffered_append ("  - VisualPharm <http://www.visualpharm.com/> 'must-have' icons (CC-BY-ND 3.0)", Normal_char_fmt)
			Result.flush_buffer
			Result.disable_edit
			Result.set_background_color (Splash_background_color)
			Result.set_minimum_width (500)
		end

	app_version: OPENEHR_VERSION
		once ("PROCESS")
			create Result
		end

end


