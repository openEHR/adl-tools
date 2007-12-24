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

	GUI_CONTROLLER_TOOLS
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
			set_icon_pixmap (adl_workbench_ico)
			option_dialog_cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (option_dialog_cancel_button)
			set_default_push_button (option_dialog_ok_button)
			show_actions.extend (agent option_dialog_editor_command_text.set_focus)
			option_dialog_editor_command_text.focus_in_actions.extend (agent on_select_all (option_dialog_editor_command_text))
			populate_controls
		end

feature -- Access

	main_window: MAIN_WINDOW
			-- main window of app

feature -- Modification

	set_main_window (a_mw: MAIN_WINDOW) is
			-- set main_window
		require
			a_mw /= Void
		do
			main_window := a_mw
		end

feature {NONE} -- Implementation

	populate_controls
			-- Set the dialog widgets from shared settings.
		do
			option_dialog_editor_command_text.set_text (editor_command)

			if expand_node_tree then
				option_dialog_node_tree_expand_cb.enable_select
			else
				option_dialog_node_tree_expand_cb.disable_select
			end

			if show_line_numbers then
				show_line_numbers_check_button.enable_select
			else
				show_line_numbers_check_button.disable_select
			end

			populate_ev_combo_from_hash_keys (option_dialog_status_reporting_level, message_type_ids)

			option_dialog_status_reporting_level.do_all (agent (li: EV_LIST_ITEM)
				do
					if li.text.same_string (message_type_names.item (status_reporting_level)) then
						li.enable_select
					end
				end)
		end

	option_dialog_ok
			-- Set shared settings from the dialog widgets.
		do
			hide
			set_editor_command (option_dialog_editor_command_text.text)
			set_expand_node_tree (option_dialog_node_tree_expand_cb.is_selected)
			set_show_line_numbers (show_line_numbers_check_button.is_selected)
			set_status_reporting_level (message_type_ids.item (option_dialog_status_reporting_level.text))
			save_resources
			main_window.update_status_area ("wrote config file " + Resource_config_file_name + "%N")
		end

	get_editor_command_directory is
			-- Called by `select_actions' of `option_dialog_editor_command_button'.
		do
			option_dialog_editor_command_text.set_text (get_file (editor_command, Current))
		end

	on_select_all (text: EV_TEXT_FIELD)
			-- Select all text in  `text', if any.
		do
			if text /= Void and then text.text_length > 0 then
				text.select_all
			end
		end

end
