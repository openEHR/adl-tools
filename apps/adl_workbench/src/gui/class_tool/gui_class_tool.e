note
	component:   "openEHR ADL Tools"
	description: "Class view tool"
	keywords:    "class, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CLASS_TOOL

inherit
	GUI_CLASS_TARGETTED_TOOL
		redefine
			go_to_selected_item
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container

			create ev_action_bar
			create ev_class_id
			create ev_view_label
			create ev_view_tool_bar
			create ev_differential_view_button
			create ev_flat_view_button
			create ev_notebook

			create properties_view.make
			create ancestors_view.make
			create descendants_view.make
			create closure_view.make

			-- connect widgets
			ev_root_container.extend (ev_action_bar)
			ev_root_container.extend (ev_notebook)

			ev_action_bar.extend (ev_class_id)
			ev_action_bar.extend (ev_view_label)
			ev_action_bar.extend (ev_view_tool_bar)
			ev_view_tool_bar.extend (ev_differential_view_button)
			ev_view_tool_bar.extend (ev_flat_view_button)

			-- connect widgets: sub-tools
			ev_notebook.extend (properties_view.ev_root_container)
			ev_notebook.extend (ancestors_view.ev_root_container)
			ev_notebook.extend (descendants_view.ev_root_container)
			ev_notebook.extend (closure_view.ev_root_container)

			-- visual characteristics
			ev_root_container.disable_item_expand (ev_action_bar)
			ev_action_bar.set_padding (10)
			ev_action_bar.set_border_width (4)
			ev_action_bar.disable_item_expand (ev_view_label)
			ev_action_bar.disable_item_expand (ev_view_tool_bar)
			ev_class_id.disable_edit
			ev_view_label.set_text ("View ")
			ev_differential_view_button.set_pixmap (get_icon_pixmap ("tool/diff_class"))
			ev_flat_view_button.set_pixmap (get_icon_pixmap ("tool/flat_class"))
			ev_differential_view_button.set_tooltip (get_text (ec_set_differential_archetype_view))
			ev_flat_view_button.set_tooltip (get_text (ec_set_flat_archetype_view))

			-- visual characteristics: notebook
			ev_notebook.set_item_text (properties_view.ev_root_container, get_text (ec_properties_tab_text))
			ev_notebook.item_tab (properties_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/properties"))

			ev_notebook.set_item_text (closure_view.ev_root_container, get_text (ec_closure_tab_text))
			ev_notebook.item_tab (closure_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/closure"))

			ev_notebook.set_item_text (ancestors_view.ev_root_container, get_text (ec_ancestors_tab_text))
			ev_notebook.item_tab (ancestors_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/ancestors"))

			ev_notebook.set_item_text (descendants_view.ev_root_container, get_text (ec_descendants_tab_text))
			ev_notebook.item_tab (descendants_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/descendants"))

			-- set events
			ev_differential_view_button.select_actions.extend (agent on_differential_view)
			ev_flat_view_button.select_actions.extend (agent on_flat_view)

			differential_view := False
			ev_flat_view_button.enable_select

			-- set up tool / sub-tool structures
			add_sub_tool (properties_view)
			add_sub_tool (ancestors_view)
			add_sub_tool (descendants_view)
			add_sub_tool (closure_view)
			enable_selection_history

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Events

	on_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			set_view (False)
		end

	on_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			set_view (True)
		end

	set_view (differential_flag: BOOLEAN)
			-- set view one way or the other from view controls in this tool
		do
			if (differential_flag and not differential_view) or -- changing from flat to diff
				(not differential_flag and differential_view)  -- changing from diff to flat
			then
				differential_view := differential_flag
				repopulate
			end
		end

feature -- Commands

	select_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			if not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			if not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			end
		end

	update_use_rm_pixmaps_setting
			-- call this routine if rm_icons setting changed elsewhere in tool
		do
			if closure_view.can_repopulate then
				closure_view.repopulate
			end
		end

	go_to_selected_item
		do
			if attached {BMM_CLASS} selection_history.selected_item as class_def then
				gui_agents.call_select_class_agent (class_def)
			end
		end

feature {NONE} -- Implementation

	do_clear
		do
 			ev_class_id.remove_text
 			closure_view.clear
 			properties_view.clear
 			descendants_view.clear
 			ancestors_view.clear
		end

	do_populate
		do
			if attached source as src then
				ev_class_id.set_text (src.globally_qualified_path)
				properties_view.populate (src, differential_view)
				closure_view.populate (src, differential_view)
				ancestors_view.populate (src, differential_view)
				descendants_view.populate (src, differential_view)
			end
		end

	properties_view: GUI_CLASS_TOOL_PROPERTY_VIEW

	closure_view: GUI_CLASS_TOOL_CLOSURE_VIEW

	ancestors_view: GUI_CLASS_TOOL_ANCESTORS_VIEW

	descendants_view: GUI_CLASS_TOOL_DESCENDANTS_VIEW

	ev_class_id: EV_TEXT_FIELD

	ev_notebook: EV_NOTEBOOK

	ev_action_bar: EV_HORIZONTAL_BOX

	ev_view_tool_bar: EV_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_view_label: EV_LABEL

feature {NONE} -- Inapplicable

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		do
		end

end


