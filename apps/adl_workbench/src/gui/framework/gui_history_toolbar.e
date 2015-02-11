note
	component:   "openEHR ADL Tools"
	description: "[
				 History toolbar, containing back and forward visual controls, and a concept of 'current tool' to which it is focussed.
				 The current tool must have be enabled with a SELECTION_HISTORY.
				 ]"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_HISTORY_TOOLBAR

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			create evx_menu_bar.make
			create menu

			-- tool bar
			create tool_bar
			tool_bar.disable_vertical_button_style

			create back_button
			back_button.set_tooltip (get_text (ec_history_button_back_one_item_text))
			back_button.set_pixmap (get_icon_pixmap ("tool/history_back"))
			tool_bar.extend (back_button)

			create tool_bar_sep_3
			tool_bar.extend (tool_bar_sep_3)

			create forward_button
			forward_button.set_tooltip (get_text (ec_history_button_forward_one_item_text))
			forward_button.set_pixmap (get_icon_pixmap ("tool/history_forward"))
			tool_bar.extend (forward_button)

			-- toolbar button events
			back_button.select_actions.extend (agent on_back)
			forward_button.select_actions.extend (agent on_forward)
		end

	initialise_menu (a_menu_bar: EVX_MENU_BAR)
		do
			evx_menu_bar := a_menu_bar
			evx_menu_bar.add_menu_with_action ("History", get_text (ec_history_menu_text), agent on_history)
			menu := evx_menu_bar.last_menu
			evx_menu_bar.add_menu_item ("History>Back", get_text (ec_history_menu_back_text), get_icon_pixmap ("tool/history_back"), agent on_back)
			evx_menu_bar.add_menu_item ("History>Forward", get_text (ec_history_menu_forward_text), get_icon_pixmap ("tool/history_forward"), agent on_forward)
			evx_menu_bar.add_menu_separator
		end

feature -- Access

	active_tool: detachable GUI_TOOL
			-- currently active GUI tool to which history commands should apply

feature -- Status Report

	has_active_tool: BOOLEAN
			-- True if there is an active tool at the moment
		do
			Result := attached active_tool
		end

feature -- Modification

	add_shortcuts
		do
			evx_menu_bar.add_menu_shortcut ("History>Back", key_left, False, True, False)
			evx_menu_bar.add_menu_shortcut ("History>Forward", key_right, False, True, False)
		end

feature -- Commands

	set_active_tool (a_gui_tool: GUI_TOOL)
		do
			active_tool := a_gui_tool
			populate
		end

	clear_active_tool
		do
			active_tool := Void
		end

feature -- Events

	on_history
			-- On opening the History menu, append the list of recent archetypes.
		do
			menu.go_i_th (3)
			from until menu.count = 3 loop
				menu.remove_right
			end

			if has_active_tool then
				active_tool.selection_history.recently_selected_items (20).do_all (
					agent (ita: IDENTIFIED_TOOL_ARTEFACT)
						local
							mi: EV_MENU_ITEM
						do
							create mi.make_with_text (ita.global_artefact_identifier)
							mi.set_pixmap (get_icon_pixmap ("archetype/" + ita.global_artefact_category))
							mi.select_actions.extend (agent go_to_history_item (ita.global_artefact_identifier))
							menu.extend (mi)
						end
				)
			end
		end

	on_back
			-- Go back to the last archetype previously selected.
		do
			if attached active_tool as att_tool and then att_tool.is_selection_history_enabled and then att_tool.selection_history.has_previous then
				att_tool.selection_history.back
				att_tool.go_to_selected_item
				populate
			end
		end

	on_forward
			-- Go forth to the next archetype previously selected.
		do
			if attached active_tool as att_tool and then att_tool.is_selection_history_enabled and then att_tool.selection_history.has_next then
				att_tool.selection_history.forth
				att_tool.go_to_selected_item
				populate
			end
		end

	clear
			-- Wipe out content from visual controls.
		do
			populate
		end

	populate
		do
			if attached active_tool as att_tool and then att_tool.selection_history.has_previous then
				evx_menu_bar.enable_menu_items (<<"History>Back">>)
				back_button.enable_sensitive
			else
				evx_menu_bar.disable_menu_items (<<"History>Back">>)
				back_button.disable_sensitive
			end

			if attached active_tool as att_tool and then att_tool.selection_history.has_next then
				evx_menu_bar.enable_menu_items (<<"History>Forward">>)
				forward_button.enable_sensitive
			else
				evx_menu_bar.disable_menu_items (<<"History>Forward">>)
				forward_button.disable_sensitive
			end
		end

feature {MAIN_WINDOW} -- Widgets

	tool_bar: EV_TOOL_BAR
	tool_bar_sep_3: EV_TOOL_BAR_SEPARATOR
	back_button, forward_button: EV_TOOL_BAR_BUTTON
	menu: EV_MENU

	go_to_history_item (an_id: STRING)
		do
			if attached active_tool as att_tool then
				att_tool.selection_history.go_to (an_id)
				att_tool.go_to_selected_item
				populate
			end
		end

	evx_menu_bar: EVX_MENU_BAR

end


