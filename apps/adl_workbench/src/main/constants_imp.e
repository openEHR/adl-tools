indexing
	description: "[
			Objects that provide access to constants, possibly loaded from a files.
			Each constant is generated into two features: both a query and a storage
			feature. For example, for a STRING constant named `my_string', the following
			features are generated: my_string: STRING and my_string_cell: CELL [STRING].
			`my_string' simply returns the current item of `my_string_cell'. By seperating
			the constant access in this way, it is possible to change the constant's value
			by either redefining `my_string' in descendent classes or simply performing
			my_string_cell.put ("new_string") as required.
			If you are loading the constants from a file and you wish to reload a different set
			of constants for your interface (e.g. for multi-language support), you may perform
			this in the following way:
			
			set_file_name ("my_constants_file.text")
			reload_constants_from_file
			
			and then for each generated widget, call `set_all_attributes_using_constants' to reset
			the newly loaded constants into the attribute settings of each widget that relies on constants.
			
			Note that if you wish your constants file to be loaded from a specific location,
			you may redefine `initialize_constants' to handle the loading of the file from
			an alternative location.
			
			Note that if you have selected to load constants from a file, and the file cannot
			be loaded, you will get a precondition violation when attempting to access one
			of the constants that should have been loaded. Therefore, you must ensure that either the
			file is accessible or you do not specify to load from a file.
		]"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CONSTANTS_IMP
	
feature {NONE} -- Initialization

	initialize_constants is
			-- Load all constants from file.
		local
			file: PLAIN_TEXT_FILE
		do
			if not constants_initialized then
				create file.make (file_name)
				if file.exists then
					file.open_read
					file.readstream (file.count)
					file.close
					parse_file_contents (file.laststring)
				end
				initialized_cell.put (True)
			end
		ensure
			initialized: constants_initialized
		end

feature -- Access

	reload_constants_from_file is
			-- Re-load all constants from file named `file_name'.
			-- When used in conjunction with `set_file_name', it enables
			-- you to load a fresh set of INTEGER and STRING constants
			-- from a constants file. If you then wish these to be applied
			-- to a current generated interface, call `set_all_attributes_using_constants'
			-- on that interface for the changed constants to be reflected in the attributes
			-- of your widgets.
		do
			initialized_cell.put (False)
			initialize_constants
		end

	app_min_height: INTEGER is
			-- `Result' is INTEGER constant named `app_min_height'.
		do
			Result := app_min_height_cell.item
		end

	app_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `app_min_height'.
		once
			create Result.put (350)
		end

	min_combo_box_width: INTEGER is
			-- `Result' is INTEGER constant named `min_combo_box_width'.
		do
			Result := min_combo_box_width_cell.item
		end

	min_combo_box_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `min_combo_box_width'.
		once
			create Result.put (55)
		end

	list_row_height: INTEGER is
			-- `Result' is INTEGER constant named `list_row_height'.
		do
			Result := list_row_height_cell.item
		end

	list_row_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `list_row_height'.
		once
			create Result.put (18)
		end

	adl_workbench_ico: EV_PIXMAP is
			-- `Result' is EV_PIXMAP constant named `adl_workbench_ico'.
		do
			Result := adl_workbench_ico_cell.item
		end

	adl_workbench_ico_cell: CELL [EV_PIXMAP] is
			--`Result' is once access to a cell holding vale of `adl_workbench_ico'.
		local
			a_file_name: FILE_NAME
		once
			create Result.put (create {EV_PIXMAP})
			create a_file_name.make_from_string (icons)
			a_file_name.set_file_name ("openEHR.ico")
			set_with_named_file (Result.item, a_file_name)
		end

	label_font: EV_FONT is
			-- `Result' is EV_FONT constant named `label_font'.
		do
			Result := label_font_cell.item
		end

	label_font_cell: CELL [EV_FONT] is
			--`Result' is once access to a cell holding vale of `label_font'.
		once
			create Result.put (create {EV_FONT})
			Result.item.set_family ({EV_FONT_CONSTANTS}.Family_sans)
			Result.item.set_weight ({EV_FONT_CONSTANTS}.Weight_bold)
			Result.item.set_shape ({EV_FONT_CONSTANTS}.Shape_regular)
			Result.item.set_height_in_points (8)
			Result.item.preferred_families.extend ("System")
		end

	status_area_min_height: INTEGER is
			-- `Result' is INTEGER constant named `status_area_min_height'.
		do
			Result := status_area_min_height_cell.item
		end

	status_area_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `status_area_min_height'.
		once
			create Result.put (65)
		end

	main_hbox_min_height: INTEGER is
			-- `Result' is INTEGER constant named `main_hbox_min_height'.
		do
			Result := main_hbox_min_height_cell.item
		end

	main_hbox_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `main_hbox_min_height'.
		once
			create Result.put (560)
		end

	dialog_border_width: INTEGER is
			-- `Result' is INTEGER constant named `dialog_border_width'.
		do
			Result := dialog_border_width_cell.item
		end

	dialog_border_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `dialog_border_width'.
		once
			create Result.put (10)
		end

	app_max_width: INTEGER is
			-- `Result' is INTEGER constant named `app_max_width'.
		do
			Result := app_max_width_cell.item
		end

	app_max_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `app_max_width'.
		once
			create Result.put (2000)
		end

	max_terms_height: INTEGER is
			-- `Result' is INTEGER constant named `max_terms_height'.
		do
			Result := max_terms_height_cell.item
		end

	max_terms_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `max_terms_height'.
		once
			create Result.put (400)
		end

	min_terms_status_height: INTEGER is
			-- `Result' is INTEGER constant named `min_terms_status_height'.
		do
			Result := min_terms_status_height_cell.item
		end

	min_terms_status_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `min_terms_status_height'.
		once
			create Result.put (200)
		end

	source_notebook_min_width: INTEGER is
			-- `Result' is INTEGER constant named `source_notebook_min_width'.
		do
			Result := source_notebook_min_width_cell.item
		end

	source_notebook_min_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `source_notebook_min_width'.
		once
			create Result.put (600)
		end

	max_arch_explorer_width: INTEGER is
			-- `Result' is INTEGER constant named `max_arch_explorer_width'.
		do
			Result := max_arch_explorer_width_cell.item
		end

	max_arch_explorer_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `max_arch_explorer_width'.
		once
			create Result.put (180)
		end

	editable_colour: EV_COLOR is
			-- `Result' is EV_COLOR constant named `editable_colour'.
		do
			Result := editable_colour_cell.item
		end

	editable_colour_cell: CELL [EV_COLOR] is
			--`Result' is once access to a cell holding vale of `editable_colour'.
		once
			create Result.put (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 255))
		end

	source_notebook_min_height: INTEGER is
			-- `Result' is INTEGER constant named `source_notebook_min_height'.
		do
			Result := source_notebook_min_height_cell.item
		end

	source_notebook_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `source_notebook_min_height'.
		once
			create Result.put (200)
		end

	app_min_width: INTEGER is
			-- `Result' is INTEGER constant named `app_min_width'.
		do
			Result := app_min_width_cell.item
		end

	app_min_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `app_min_width'.
		once
			create Result.put (500)
		end

	tree_control_panel_width: INTEGER is
			-- `Result' is INTEGER constant named `tree_control_panel_width'.
		do
			Result := tree_control_panel_width_cell.item
		end

	tree_control_panel_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `tree_control_panel_width'.
		once
			create Result.put (100)
		end

	arch_tree_min_height: INTEGER is
			-- `Result' is INTEGER constant named `arch_tree_min_height'.
		do
			Result := arch_tree_min_height_cell.item
		end

	arch_tree_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `arch_tree_min_height'.
		once
			create Result.put (60)
		end

	arch_notebook_min_height: INTEGER is
			-- `Result' is INTEGER constant named `arch_notebook_min_height'.
		do
			Result := arch_notebook_min_height_cell.item
		end

	arch_notebook_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `arch_notebook_min_height'.
		once
			create Result.put (500)
		end

	padding_width: INTEGER is
			-- `Result' is INTEGER constant named `padding_width'.
		do
			Result := padding_width_cell.item
		end

	padding_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `padding_width'.
		once
			create Result.put (3)
		end

	min_text_height: INTEGER is
			-- `Result' is INTEGER constant named `min_text_height'.
		do
			Result := min_text_height_cell.item
		end

	min_text_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `min_text_height'.
		once
			create Result.put (35)
		end

	app_initial_height: INTEGER is
			-- `Result' is INTEGER constant named `app_initial_height'.
		do
			Result := app_initial_height_cell.item
		end

	app_initial_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `app_initial_height'.
		once
			create Result.put (768)
		end

	main_vbox_min_height: INTEGER is
			-- `Result' is INTEGER constant named `main_vbox_min_height'.
		do
			Result := main_vbox_min_height_cell.item
		end

	main_vbox_min_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `main_vbox_min_height'.
		once
			create Result.put (600)
		end

	icons: STRING is
			-- `Result' is DIRECTORY constant named `icons'.
		do
			Result := icons_cell.item
		end

	icons_cell: CELL [STRING] is
			--`Result' is once access to a cell holding vale of `icons'.
		once
			create Result.put ("C:\project\openehr\ref_impl_eiffel\apps\adl_workbench\app\icons")
		end

	min_terms_height: INTEGER is
			-- `Result' is INTEGER constant named `min_terms_height'.
		do
			Result := min_terms_height_cell.item
		end

	min_terms_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `min_terms_height'.
		once
			create Result.put (100)
		end

	dialog_padding_width: INTEGER is
			-- `Result' is INTEGER constant named `dialog_padding_width'.
		do
			Result := dialog_padding_width_cell.item
		end

	dialog_padding_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `dialog_padding_width'.
		once
			create Result.put (15)
		end

	min_list_height: INTEGER is
			-- `Result' is INTEGER constant named `min_list_height'.
		do
			Result := min_list_height_cell.item
		end

	min_list_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `min_list_height'.
		once
			create Result.put (50)
		end

	app_max_height: INTEGER is
			-- `Result' is INTEGER constant named `app_max_height'.
		do
			Result := app_max_height_cell.item
		end

	app_max_height_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `app_max_height'.
		once
			create Result.put (2000)
		end

	arch_tree_min_width: INTEGER is
			-- `Result' is INTEGER constant named `arch_tree_min_width'.
		do
			Result := arch_tree_min_width_cell.item
		end

	arch_tree_min_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `arch_tree_min_width'.
		once
			create Result.put (350)
		end

	min_entry_control_width: INTEGER is
			-- `Result' is INTEGER constant named `min_entry_control_width'.
		do
			Result := min_entry_control_width_cell.item
		end

	min_entry_control_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `min_entry_control_width'.
		once
			create Result.put (200)
		end

	desc_label_width: INTEGER is
			-- `Result' is INTEGER constant named `desc_label_width'.
		do
			Result := desc_label_width_cell.item
		end

	desc_label_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `desc_label_width'.
		once
			create Result.put (70)
		end

	table_row_spacing: INTEGER is
			-- `Result' is INTEGER constant named `table_row_spacing'.
		do
			Result := table_row_spacing_cell.item
		end

	table_row_spacing_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `table_row_spacing'.
		once
			create Result.put (4)
		end

	border_width: INTEGER is
			-- `Result' is INTEGER constant named `border_width'.
		do
			Result := border_width_cell.item
		end

	border_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `border_width'.
		once
			create Result.put (4)
		end

	app_initial_width: INTEGER is
			-- `Result' is INTEGER constant named `app_initial_width'.
		do
			Result := app_initial_width_cell.item
		end

	app_initial_width_cell: CELL [INTEGER] is
			--`Result' is once access to a cell holding vale of `app_initial_width'.
		once
			create Result.put (1024)
		end

feature -- Access

--| FIXME `constant_by_name' and `has_constant' `constants_initialized' are only required until the complete change to
--| constants is complete. They are required for the pixmaps at the moment.

	constants_initialized: BOOLEAN is
			-- Have constants been initialized from file?
		do
			Result := initialized_cell.item
		end

	string_constant_by_name (a_name: STRING): STRING is
			-- `Result' is STRING 
		require
			initialized: constants_initialized
			name_valid: a_name /= Void and not a_name.is_empty
			has_constant (a_name)
		do
			Result := (all_constants.item (a_name)).twin
		ensure
			Result_not_void: Result /= Void
		end
		
	integer_constant_by_name (a_name: STRING): INTEGER is
			-- `Result' is STRING 
		require
			initialized: constants_initialized
			name_valid: a_name /= Void and not a_name.is_empty
			has_constant (a_name)
		local
			l_string: STRING
		do
			l_string := (all_constants.item (a_name)).twin
			check
				is_integer: l_string.is_integer
			end
			
			Result := l_string.to_integer
		end
		
	has_constant (a_name: STRING): BOOLEAN is
			-- Does constant `a_name' exist?
		require
			initialized: constants_initialized
			name_valid: a_name /= Void and not a_name.is_empty
		do
			Result := all_constants.item (a_name) /= Void
		end

feature {NONE} -- Implementation

	initialized_cell: CELL [BOOLEAN] is
			-- A cell to hold whether the constants have been loaded.
		once
			create Result
		end
		
	all_constants: HASH_TABLE [STRING, STRING] is
			-- All constants loaded from constants file.
		once
			create Result.make (4)
		end
		
	file_name: STRING is
			-- File name from which constants must be loaded.
		do
			Result := file_name_cell.item
		end
		
	file_name_cell: CELL [STRING] is
		once
			create Result
			Result.put ("constants.txt")
		end
		
	set_file_name (a_file_name: STRING) is
			-- Assign `a_file_name' to `file_name'.
		do
			file_name_cell.put (a_file_name)
		end
		
	String_constant: STRING is "STRING"
	
	Integer_constant: STRING is "INTEGER"
		
	parse_file_contents (content: STRING) is
			-- Parse contents of `content' into `all_constants'.
		local
			line_contents: STRING
			is_string: BOOLEAN
			is_integer: BOOLEAN
			start_quote1, end_quote1, start_quote2, end_quote2: INTEGER
			name, value: STRING
		do
			from
			until
				content.is_equal ("")
			loop
				line_contents := first_line (content)
				if line_contents.count /= 1 then
					is_string := line_contents.substring_index (String_constant, 1) /= 0
					is_integer := line_contents.substring_index (Integer_constant, 1) /= 0
					if is_string or is_integer then
						start_quote1 := line_contents.index_of ('"', 1)
						end_quote1 := line_contents.index_of ('"', start_quote1 + 1)
						start_quote2 := line_contents.index_of ('"', end_quote1 + 1)
						end_quote2 := line_contents.index_of ('"', start_quote2 + 1)
						name := line_contents.substring (start_quote1 + 1, end_quote1 - 1)
						value := line_contents.substring (start_quote2 + 1, end_quote2 - 1)
						all_constants.force (value, name)
					end
				end
			end
		end
		
	first_line (content: STRING): STRING is
			-- `Result' is first line of `Content',
			-- which will be stripped from `content'.
		require
			content_not_void: content /= Void
			content_not_empty: not content.is_empty
		local
			new_line_index: INTEGER		
		do
			new_line_index := content.index_of ('%N', 1)
			if new_line_index /= 0 then
				Result := content.substring (1, new_line_index)
				content.keep_tail (content.count - new_line_index)
			else
				Result := content.twin
				content.keep_head (0)
			end
		ensure
			Result_not_void: Result /= Void
			no_characters_lost: old content.count = Result.count + content.count
		end

	set_with_named_file (a_pixmap: EV_PIXMAP; a_file_name: STRING) is
			-- Set image of `a_pixmap' from file, `a_file_name'.
			-- If `a_file_name' does not exist, do nothing.
		require
			a_pixmap_not_void: a_pixmap /= Void
			a_file_name /= Void
		local
			l_file: RAW_FILE
		do
			create l_file.make (a_file_name)
			if l_file.exists then
				a_pixmap.set_with_named_file (a_file_name)
			end
		end

invariant
	all_constants_not_void: all_constants /= Void

end
