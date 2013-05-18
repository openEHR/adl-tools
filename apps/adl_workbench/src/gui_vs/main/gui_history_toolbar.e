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

create
	make

feature -- Initialisation

	make
		do
			-- menu
			create menu
			create menu_item_back
			create menu_item_forward
			create menu_separator

			-- tool bar
			create tool_bar
			tool_bar.disable_vertical_button_style

			create back_button
			back_button.set_tooltip ("Back one item")
			back_button.set_pixmap (get_icon_pixmap ("tool/history_back"))

			create tool_bar_sep_3
			create forward_button
			forward_button.set_tooltip ("Forward one item")
			forward_button.set_pixmap (get_icon_pixmap ("tool/history_forward"))

			-- Connect widgets
			menu.extend (menu_item_back)
			menu.extend (menu_item_forward)
			menu.extend (menu_separator)

			tool_bar.extend (back_button)
			tool_bar.extend (tool_bar_sep_3)
			tool_bar.extend (forward_button)

			-- Set visual characteristics
			menu.set_text ("H&istory")
			menu_item_back.set_text ("&Back")
			menu_item_forward.set_text ("&Forward")
			menu_item_back.set_pixmap (get_icon_pixmap ("tool/history_back"))
			menu_item_forward.set_pixmap (get_icon_pixmap ("tool/history_forward"))

			-- menu events
			menu.select_actions.extend (agent on_history)
			menu_item_back.select_actions.extend (agent on_back)
			menu_item_forward.select_actions.extend (agent on_forward)

			-- toolbar button events
			back_button.select_actions.extend (agent on_back)
			forward_button.select_actions.extend (agent on_forward)
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
			menu.wipe_out
			menu.extend (menu_item_back)
			menu.extend (menu_item_forward)
			menu.extend (menu_separator)

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
			if has_active_tool and then active_tool.is_selection_history_enabled and then active_tool.selection_history.has_previous then
				active_tool.selection_history.back
				active_tool.go_to_selected_item
				populate
			end
		end

	on_forward
			-- Go forth to the next archetype previously selected.
		do
			if has_active_tool and then active_tool.is_selection_history_enabled and then active_tool.selection_history.has_next then
				active_tool.selection_history.forth
				active_tool.go_to_selected_item
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
			if has_active_tool and then active_tool.selection_history.has_previous then
				menu_item_back.enable_sensitive
				back_button.enable_sensitive
			else
				menu_item_back.disable_sensitive
				back_button.disable_sensitive
			end

			if has_active_tool and then active_tool.selection_history.has_next then
				menu_item_forward.enable_sensitive
				forward_button.enable_sensitive
			else
				menu_item_forward.disable_sensitive
				forward_button.disable_sensitive
			end
		end

feature {MAIN_WINDOW} -- Widgets

	tool_bar: EV_TOOL_BAR
	tool_bar_sep_3: EV_TOOL_BAR_SEPARATOR
	back_button, forward_button: EV_TOOL_BAR_BUTTON
	menu: EV_MENU
	menu_item_back, menu_item_forward: EV_MENU_ITEM
	menu_separator: EV_MENU_SEPARATOR

	go_to_history_item (an_id: STRING)
		do
			active_tool.selection_history.go_to (an_id)
			active_tool.go_to_selected_item
			populate
		end

end


