note
	component:   "openEHR ADL Tools"
	description: "General model of a GUI tool whose data source is an BMM_CLASS_DEFINITION"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_CLASS_TARGETTED_TOOL

inherit
	GUI_TOOL
		rename
			populate as gui_tool_populate
		redefine
			source
		end

feature -- Access

	source: detachable BMM_CLASS
			-- class definition to which this tool is targetted

	ref_model: BMM_MODEL
		attribute
			create Result.default_create
		end

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := safe_source.global_artefact_identifier
		end

feature -- Status Report

	differential_view: BOOLEAN

feature -- Commands

	populate (a_source: attached like source; differential_view_flag: BOOLEAN)
			-- populate the control by creating it from scratch
		require
			can_populate (a_source)
		do
			differential_view := differential_view_flag
			gui_tool_populate (a_source)
			check attached a_source.bmm_model as mod then
				ref_model := mod
			end
		end

feature {NONE} -- Implementation

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		deferred
		end

	add_class_context_menu (menu: EV_MENU; a_bmm_class_def: BMM_CLASS)
			-- dynamically initializes the context menu for this tree
		local
			an_mi: EV_MENU_ITEM
		do
			create an_mi.make_with_text_and_action (get_msg ({ADL_MESSAGES_IDS}.ec_retarget_to_this_class, Void), agent display_context_selected_class_in_active_tool (a_bmm_class_def))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool"))
	    	menu.extend (an_mi)

			create an_mi.make_with_text_and_action (get_msg ({ADL_MESSAGES_IDS}.ec_display_in_new_tab, Void), agent display_context_selected_class_in_new_tool (a_bmm_class_def))
			an_mi.set_pixmap (get_icon_pixmap ("tool/class_tool_new"))
			menu.extend (an_mi)
		end

	display_context_selected_class_in_active_tool (a_class_def: BMM_CLASS)
		do
			selection_history.set_selected_item (a_class_def)
			gui_agents.call_select_class_agent (a_class_def)
			gui_agents.call_history_set_active_agent (ultimate_parent_tool)
		end

	display_context_selected_class_in_new_tool (a_class_def: BMM_CLASS)
		do
			selection_history.set_selected_item (a_class_def)
			gui_agents.call_select_class_in_new_tool_agent (a_class_def)
			gui_agents.call_history_set_active_agent (ultimate_parent_tool)
		end

end


