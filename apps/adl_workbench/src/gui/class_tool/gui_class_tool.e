note
	component:   "openEHR Archetype Project"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, class, gui"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
			ev_differential_view_button.set_tooltip (get_msg ("Set differential archetype view", Void))
			ev_flat_view_button.set_tooltip (get_msg ("Set flat archetype view", Void))

			-- visual characteristics: notebook
			ev_notebook.set_item_text (properties_view.ev_root_container, get_msg ("properties_tab_text", Void))
			ev_notebook.item_tab (properties_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/properties"))

			ev_notebook.set_item_text (closure_view.ev_root_container, get_msg ("closure_tab_text", Void))
			ev_notebook.item_tab (closure_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/closure"))

			ev_notebook.set_item_text (ancestors_view.ev_root_container, get_msg ("ancestors_tab_text", Void))
			ev_notebook.item_tab (ancestors_view.ev_root_container).set_pixmap (get_icon_pixmap ("tool/ancestors"))

			ev_notebook.set_item_text (descendants_view.ev_root_container, get_msg ("descendants_tab_text", Void))
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

	update_rm_icons_setting
			-- call this routine if rm_icons setting changed elsewhere in tool
		do
			if closure_view.can_repopulate then
				closure_view.repopulate
			end
		end

	go_to_selected_item
		do
			if attached {BMM_CLASS_DEFINITION} selection_history.selected_item as class_def then
				gui_agents.select_class_agent.call ([class_def])
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
			ev_class_id.set_text (source.globally_qualified_path)
			properties_view.populate (source, differential_view)
			closure_view.populate (source, differential_view)
			ancestors_view.populate (source, differential_view)
			descendants_view.populate (source, differential_view)
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

	node_path: OG_PATH

feature {NONE} -- Inapplicable

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		do
		end

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
