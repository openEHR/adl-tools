indexing
	description: "Objects that provide access to constants loaded from files."
	date: "$Date$"
	revision: "$Revision$"

class
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

	arch_tree_min_width: INTEGER is 
			-- `Result' is INTEGER constant named arch_tree_min_width.
		once
			Result := 350
		end

	app_min_height: INTEGER is 
			-- `Result' is INTEGER constant named app_min_height.
		once
			Result := 350
		end

	label_font: EV_FONT is
			-- `Result' is EV_FONT constant named `label_font'.
		once
			create Result
			Result.set_family ({EV_FONT_CONSTANTS}.Family_sans)
			Result.set_weight ({EV_FONT_CONSTANTS}.Weight_bold)
			Result.set_shape ({EV_FONT_CONSTANTS}.Shape_regular)
			Result.set_height_in_points (8)
			Result.preferred_families.extend ("System")
		end

	app_initial_width: INTEGER is 
			-- `Result' is INTEGER constant named app_initial_width.
		once
			Result := 1024
		end

	source_notebook_min_width: INTEGER is 
			-- `Result' is INTEGER constant named source_notebook_min_width.
		once
			Result := 600
		end

	app_max_width: INTEGER is 
			-- `Result' is INTEGER constant named app_max_width.
		once
			Result := 2000
		end

	min_terms_status_height: INTEGER is 
			-- `Result' is INTEGER constant named min_terms_status_height.
		once
			Result := 200
		end

	tree_control_panel_width: INTEGER is 
			-- `Result' is INTEGER constant named tree_control_panel_width.
		once
			Result := 100
		end

	arch_tree_min_height: INTEGER is 
			-- `Result' is INTEGER constant named arch_tree_min_height.
		once
			Result := 60
		end

	max_arch_explorer_width: INTEGER is 
			-- `Result' is INTEGER constant named max_arch_explorer_width.
		once
			Result := 180
		end

	padding_width: INTEGER is 
			-- `Result' is INTEGER constant named padding_width.
		once
			Result := 5
		end

	min_list_height: INTEGER is 
			-- `Result' is INTEGER constant named min_list_height.
		once
			Result := 80
		end

	max_terms_height: INTEGER is 
			-- `Result' is INTEGER constant named max_terms_height.
		once
			Result := 400
		end

	table_row_spacing: INTEGER is 
			-- `Result' is INTEGER constant named table_row_spacing.
		once
			Result := 4
		end

	desc_label_width: INTEGER is 
			-- `Result' is INTEGER constant named desc_label_width.
		once
			Result := 100
		end

	app_initial_height: INTEGER is 
			-- `Result' is INTEGER constant named app_initial_height.
		once
			Result := 768
		end

	icons: STRING is
			-- `Result' is DIRECTORY constant named `icons'.
		once
			Result := "C:\project\openehr\ref_impl_eiffel\apps\adl_workbench\app\icons"
		end

	min_entry_control_width: INTEGER is 
			-- `Result' is INTEGER constant named min_entry_control_width.
		once
			Result := 200
		end

	main_hbox_min_height: INTEGER is 
			-- `Result' is INTEGER constant named main_hbox_min_height.
		once
			Result := 560
		end

	adl_workbench_ico: EV_PIXMAP is
		local
			a_file_name: FILE_NAME
		once
			create Result
			create a_file_name.make_from_string (icons)
			a_file_name.set_file_name ("adl_gui_vision2.ico")
			set_with_named_file (Result, a_file_name)
		end

	main_vbox_min_height: INTEGER is 
			-- `Result' is INTEGER constant named main_vbox_min_height.
		once
			Result := 600
		end

	status_area_min_height: INTEGER is 
			-- `Result' is INTEGER constant named status_area_min_height.
		once
			Result := 65
		end

	source_notebook_min_height: INTEGER is 
			-- `Result' is INTEGER constant named source_notebook_min_height.
		once
			Result := 200
		end

	border_width: INTEGER is 
			-- `Result' is INTEGER constant named border_width.
		once
			Result := 5
		end

	button_colour: EV_COLOR is
			-- `Result' is EV_COLOR constant named `button_colour'.
		once
			Result := create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 0)
		end

	background: EV_COLOR is
			-- `Result' is EV_COLOR constant named `background'.
		once
			Result := create {EV_COLOR}.make_with_8_bit_rgb (254, 248, 205)
		end

	app_max_height: INTEGER is 
			-- `Result' is INTEGER constant named app_max_height.
		once
			Result := 2000
		end

	min_terms_height: INTEGER is 
			-- `Result' is INTEGER constant named min_terms_height.
		once
			Result := 100
		end

	app_min_width: INTEGER is 
			-- `Result' is INTEGER constant named app_min_width.
		once
			Result := 500
		end

	arch_notebook_min_height: INTEGER is 
			-- `Result' is INTEGER constant named arch_notebook_min_height.
		once
			Result := 500
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
		
	file_name: STRING is "constants.txt"
		-- File name from which constants must be loaded.
		
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
						all_constants.put (value, name)
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

end -- class CONSTANTS_IMP
