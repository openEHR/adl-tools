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

	EVX_DEFINITIONS
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

	rm_icon_dir: STRING = "rm"

	resource_path_separator: STRING = "/"
			-- regardless of OS, this is used in paths to locate resources, including icons and also
			-- .cfg file items

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
			Result.put (get_text ("definition_grid_col_rm_name_text"), Definition_grid_col_rm_name)
			Result.put (get_text ("definition_grid_col_meaning_text"), Definition_grid_col_meaning)
			Result.put (get_text ("definition_grid_col_existence_text"), Definition_grid_col_existence)
			Result.put (get_text ("definition_grid_col_card_occ_text"), Definition_grid_col_card_occ)
			Result.put (get_text ("definition_grid_col_sibling_order_text"), Definition_grid_col_sibling_order)
			Result.put (get_text ("definition_grid_col_constraint_text"), Definition_grid_col_constraint)
		end

	Rules_grid_col_expr_type: INTEGER = 1
	Rules_grid_col_expr_value: INTEGER = 2

	Rules_grid_col_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text ("rules_grid_col_expr_type_text"), Rules_grid_col_expr_type)
			Result.put (get_text ("rules_grid_col_expr_value_text"), Rules_grid_col_expr_value)
		end

	archetype_rm_type_inherited_color: EV_COLOR
			-- foreground colour for inherited RM attributes and typenames in the UI
			-- GREY
		once
			create Result.make_with_8_bit_rgb (0xaa, 0xaa, 0xaa)
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

	rm_attribute_color: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- ROYAL BLUE
		once
			create Result.make_with_8_bit_rgb (0, 0, 0xff)
		end

	rm_runtime_attribute_colour: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- MEDIUM BLUE
		once
			create Result.make_with_8_bit_rgb (0x33, 0x99, 0xff)
		end

	rm_infrastructure_attribute_colour: EV_COLOR
			-- foreground colour for rm_attributes in the UI
			-- MEDIUM GREY
		once
			create Result.make_with_8_bit_rgb (0x99, 0x99, 0x99)
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

	adl_workbench_icon: EV_PIXMAP
		do
			Result := get_icon_pixmap ("openehr_adl_workbench_logo")
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

	has_icon_pixmap (key: STRING): BOOLEAN
			-- True if pixmap corresponding to `key' exists
		do
			Result := icon_pixmaps.has (key.as_lower)
		end

	get_icon_pixmap (key: STRING): EV_PIXMAP
			-- obtain pixmap corresponding to `key' or else a generic pixmap
		local
			pixmap_name: STRING
		do
			pixmap_name := key.as_lower
			if icon_pixmaps.has (pixmap_name) then
				Result := icon_pixmaps.item (pixmap_name)
			else
				io.put_string ("No pixmap for " + key + "%N")
				create Result.default_create
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

	show_rm_data_properties: BOOLEAN
			-- Display the RM data properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_data_properties")
		end

	set_show_rm_data_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM data properties in the archetype definition node tree
		do
			app_cfg.put_value("/gui/show_rm_data_properties", flag)
		end

	show_rm_runtime_properties: BOOLEAN
			-- Display the RM runtime properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_runtime_properties")
		end

	set_show_rm_runtime_properties (flag: BOOLEAN)
			-- Set flag for whether to show the RM runtime properties in the archetype definition node tree
		do
			app_cfg.put_value ("/gui/show_rm_runtime_properties", flag)
		end

	show_rm_infrastructure_properties: BOOLEAN
			-- Display the RM infrastructure properties in the archetype definition node tree?
		do
			Result := app_cfg.boolean_value ("/gui/show_rm_infrastructure_properties")
		end

	set_show_rm_infrastructure_properties (flag: BOOLEAN)
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

feature -- Conversion

	catalogue_node_pixmap (ara: ARCH_CAT_ITEM): EV_PIXMAP
		local
			pixmap_name: STRING
		do
			if attached {ARCH_CAT_MODEL_NODE} ara as acmn and then acmn.is_class then
				pixmap_name := "rm/" + acmn.bmm_schema.rm_publisher + "/" + acmn.class_definition.name
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

	icon_pixmaps: attached HASH_TABLE [EV_PIXMAP, STRING]
			-- Table of pixmap file paths keyed by relative path, e.g.
			-- tool/compile.ico
			-- added/c_attribute.ico
			-- rm/openehr/entry.ico
		require
			has_icon_directory
		once
			create Result.make (0)
			recursive_load_pixmaps (Result, "")
		end

	recursive_load_pixmaps (pixmap_table: HASH_TABLE [EV_PIXMAP, STRING]; rel_path: STRING)
			-- load .png and .ico pixmaps into `pixmaps', keyed by relative path under icons root directory
		require
			has_icon_directory
		local
			pixmap: EV_PIXMAP
			abs_path, key: STRING
			dir: KL_DIRECTORY
			dir_items: ARRAYED_LIST [STRING]
		do
			abs_path := file_system.pathname (icon_directory, rel_path)
			create dir.make (abs_path)

			-- process files
			create dir_items.make_from_array (dir.filenames)
			from dir_items.start until dir_items.off loop
				if dir_items.item.ends_with (icon_ico_extension) or dir_items.item.ends_with (icon_png_extension) then
					create pixmap
					pixmap.set_with_named_file (file_system.pathname (abs_path, dir_items.item))
					pixmap.set_minimum_size (pixmap.width, pixmap.height)
					key := file_system.pathname (rel_path, dir_items.item)
					key.remove_tail (key.count - key.last_index_of ('.', key.count) + 1)
					key.to_lower
					key.replace_substring_all ("\", "/")
					pixmap_table.put (pixmap, key)
				end
				dir_items.forth
			end

			-- process child directories
			create dir_items.make_from_array (dir.directory_names)
			from dir_items.start until dir_items.off loop
				if not dir_items.item.starts_with (".") then
					recursive_load_pixmaps (pixmap_table, file_system.pathname (rel_path, dir_items.item))
				end
				dir_items.forth
			end
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
			Result.append ("(c) 2003-2012 openEHR Foundation%N")
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
			Result.append ("  - VisualPharm 'must-have' icons (http://www.visualpharm.com/)%N")
			Result.append ("    under CC-BY-ND (http://creativecommons.org/licenses/by-nd/3.0/)%N")
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
