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
			set_default_cancel_button (option_dialog_cancel_button)
			set_default_push_button (option_dialog_ok_button)
			show_actions.extend(agent option_dialog_editor_command_edit.set_focus)
			populate_controls
		end

feature -- Access

	main_window: MAIN_WINDOW
			-- main window of app
			
feature -- Modification

	set_main_window(a_mw: MAIN_WINDOW) is
			-- set main_window
		require
			a_mw /= Void
		do
			main_window := a_mw
		end
		
feature {NONE} -- Implementation

	populate_controls is
			-- set dialog values from shared settings
		do
			option_dialog_editor_command_edit.set_text(editor_command)
			if expand_node_tree then
				option_dialog_node_tree_expand_cb.enable_select
			else
				option_dialog_node_tree_expand_cb.disable_select
			end
		end
		
	option_dialog_ok is
			-- Called by `select_actions' of `option_dialog_ok_button'.
		do
			hide
			set_editor_command(option_dialog_editor_command_edit.text)
			set_expand_node_tree(option_dialog_node_tree_expand_cb.is_selected)
			save_resources
			main_window.update_status_area("wrote config file " + Resource_config_file_name + "%N")
		end
	
	option_dialog_cancel is
			-- Called by `select_actions' of `option_dialog_cancel_button'.
		do
			hide
		end
	
	get_editor_command_directory is
			-- Called by `select_actions' of `option_dialog_editor_command_button'.
		do
			option_dialog_editor_command_edit.set_text(get_file(editor_command, Current))
		end
		
end

