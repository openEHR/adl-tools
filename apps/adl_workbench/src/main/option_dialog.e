indexing
	component:   "openEHR Archetype Project"
	description: "Options dialog window"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	OPTION_DIALOG

inherit
	OPTION_DIALOG_IMP

	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	user_initialization is
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do

		end

feature -- Access

	main_window: MAIN_WINDOW
			-- main window of app
			
feature -- Modification

	read_options_from_settings is
			-- set dialog repository_path and editor_command from shared settings
		do
			option_dialog_rep_path_edit.set_text(repository_path)
			option_dialog_editor_command_edit.set_text(editor_command)
		end
		
	set_main_window(a_mw: MAIN_WINDOW) is
			-- set main_window
		require
			a_mw /= Void
		do
			main_window := a_mw
		end
		
feature {NONE} -- Implementation

	option_dialog_ok is
			-- Called by `select_actions' of `option_dialog_ok_button'.
		do
			hide
			set_repository_path(option_dialog_rep_path_edit.text)
			set_editor_command(option_dialog_editor_command_edit.text)
			save_resources
			main_window.update_status_area("wrote config file " + Resource_config_file_name + "%N")
			main_window.archetype_tree_control.populate
		end
	
	option_dialog_cancel is
			-- Called by `select_actions' of `option_dialog_cancel_button'.
		do
			hide
		end
	
	get_rep_path_directory is
			-- Called by `select_actions' of `option_dialog_rep_path_button'.
		do
			option_dialog_rep_path_edit.set_text(get_directory(repository_path))
		end
	
	get_editor_command_directory is
			-- Called by `select_actions' of `option_dialog_editor_command_button'.
		do
			option_dialog_editor_command_edit.set_text(get_file(editor_command))
		end
		
	get_directory(init_value: STRING): STRING is
			-- get a directory from user
		local
			dir_dialog: EV_DIRECTORY_DIALOG
			a_dir: DIRECTORY
			error_dialog: EV_INFORMATION_DIALOG
		do
			create dir_dialog
			dir_dialog.set_start_directory (init_value)
			
			from
			until
				Result /= Void
			loop
				dir_dialog.show_modal_to_window (Current)
				if dir_dialog.selected_button.is_equal("Cancel") then
					Result := init_value
				else
					if not dir_dialog.directory.is_empty then
						create a_dir.make(dir_dialog.directory)
						if a_dir.exists then
							Result := dir_dialog.directory
						else
							create error_dialog.make_with_text("Directory " + dir_dialog.directory + " does not exist")
							error_dialog.show_modal_to_window (Current)
						end
					else
						create error_dialog.make_with_text("Directory <empty dir> does not exist")
						error_dialog.show_modal_to_window (Current)
					end
				end
			end
		end

	get_file(init_value: STRING): STRING is
			-- get a file path from user
		local
			file_dialog: EV_FILE_OPEN_DIALOG
			a_file: RAW_FILE
			error_dialog: EV_INFORMATION_DIALOG
			end_pos: INTEGER
			pathname: STRING
		do
			create file_dialog
			end_pos := init_value.last_index_of(operating_environment.Directory_separator, init_value.count)
			if end_pos = 0 then
				end_pos := init_value.count
			end
			pathname := init_value.substring(1, end_pos)
			file_dialog.set_start_directory (pathname)
			
			from
			until
				Result /= Void
			loop
				file_dialog.show_modal_to_window (Current)
				if file_dialog.selected_button.is_equal("Cancel") then
					Result := init_value
				else
					if not file_dialog.file_name.is_empty then
						create a_file.make(file_dialog.file_name)
						if a_file.exists then
							Result := file_dialog.file_name
						else
							create error_dialog.make_with_text("File " + file_dialog.file_name + " does not exist")
							error_dialog.show_modal_to_window (Current)
						end
					else
						create error_dialog.make_with_text("File <empty> does not exist")
						error_dialog.show_modal_to_window (Current)
					end
				end
			end
		end

end

