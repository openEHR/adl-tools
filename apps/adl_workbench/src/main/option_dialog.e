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
			cancel_button.select_actions.extend (agent hide)
			set_default_cancel_button (cancel_button)
			set_default_push_button (ok_button)
			show_actions.extend (agent editor_command_text.set_focus)
			editor_command_text.focus_in_actions.extend (agent on_select_all (editor_command_text))
			export_html_text.focus_in_actions.extend (agent on_select_all (export_html_text))
			populate_controls
		end

feature -- Access

	main_window: MAIN_WINDOW
			-- Main window of the application.

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
			editor_command_text.set_text (editor_command)

			if expand_node_tree then
				show_definition_tree_expanded_check_button.enable_select
			else
				show_definition_tree_expanded_check_button.disable_select
			end

			if show_line_numbers then
				show_line_numbers_check_button.enable_select
			else
				show_line_numbers_check_button.disable_select
			end

			populate_ev_combo_from_hash_keys (parser_error_reporting_level_combo_box, message_type_ids)

			parser_error_reporting_level_combo_box.do_all (agent (li: EV_LIST_ITEM)
				do
					if li.text.same_string (message_type_names.item (status_reporting_level)) then
						li.enable_select
					end
				end)

			export_html_text.set_text (html_export_directory)
		end

	option_dialog_ok
			-- Set shared settings from the dialog widgets.
		do
			hide
			set_editor_command (editor_command_text.text)
			set_expand_node_tree (show_definition_tree_expanded_check_button.is_selected)
			set_show_line_numbers (show_line_numbers_check_button.is_selected)
			set_status_reporting_level (message_type_ids.item (parser_error_reporting_level_combo_box.text))
			set_html_export_directory (export_html_text.text)
			save_resources
			main_window.update_status_area ("wrote config file " + Resource_config_file_name + "%N")
		end

	get_editor_command_directory
			-- Let the user browse for the application that will act as the external editor.
		do
			editor_command_text.set_text (get_file (editor_command, Current))
		end

	get_html_export_directory
			-- Let the user browse for the directory to which HTML will be exported.
		do
			export_html_text.set_text (get_directory (html_export_directory, Current))
		end

	on_select_all (text: EV_TEXT_FIELD)
			-- Select all text in  `text', if any.
		do
			if text /= Void and then text.text_length > 0 then
				text.select_all
			end
		end

end
