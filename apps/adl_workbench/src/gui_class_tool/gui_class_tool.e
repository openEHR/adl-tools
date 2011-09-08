note
	component:   "openEHR Archetype Project"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_CLASS_TOOL

inherit
	GUI_TOOL
		redefine
			ev_root_container
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_update_all_tools_rm_icons_setting_agent: PROCEDURE [ANY, TUPLE]; a_select_class_agent, a_select_class_in_new_tool_agent: PROCEDURE [ANY, TUPLE [BMM_CLASS_DEFINITION]])
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

			create property_view.make (a_update_all_tools_rm_icons_setting_agent, a_select_class_agent, a_select_class_in_new_tool_agent)
			create inheritance_view.make (a_select_class_agent, a_select_class_in_new_tool_agent)

			-- connect widgets
			ev_root_container.extend (ev_action_bar)
			ev_root_container.extend (ev_notebook)

			ev_action_bar.extend (ev_class_id)
			ev_action_bar.extend (ev_view_label)
			ev_action_bar.extend (ev_view_tool_bar)
			ev_view_tool_bar.extend (ev_differential_view_button)
			ev_view_tool_bar.extend (ev_flat_view_button)

			-- connect widgets: sub-tools
			ev_notebook.extend (property_view.ev_root_container)
			ev_notebook.extend (inheritance_view.ev_root_container)

			-- visual characteristics
			ev_root_container.disable_item_expand (ev_action_bar)
			ev_action_bar.set_padding (10)
			ev_action_bar.set_border_width (4)
			ev_action_bar.disable_item_expand (ev_view_label)
			ev_action_bar.disable_item_expand (ev_view_tool_bar)
			ev_class_id.disable_edit
			ev_view_label.set_text ("View ")
			ev_differential_view_button.set_pixmap (pixmaps ["diff_class"])
			ev_flat_view_button.set_pixmap (pixmaps ["flat_class"])
			ev_differential_view_button.set_tooltip (create_message_content ("Set differential archetype view", Void))
			ev_flat_view_button.set_tooltip (create_message_content ("Set flat archetype view", Void))

			-- visual characteristics: notebook
			ev_notebook.set_item_text (property_view.ev_root_container, create_message_content ("properties_tab_text", Void))
	--		ev_notebook.item_tab (ev_property_view_hbox).set_pixmap (pixmaps ["properties"])

			ev_notebook.set_item_text (inheritance_view.ev_root_container, create_message_content ("inheritance_tab_text", Void))
	--		ev_notebook.item_tab (ev_property_view_hbox).set_pixmap (pixmaps ["descendants"])

			-- set events
			ev_differential_view_button.select_actions.extend (agent on_differential_view)
			ev_flat_view_button.select_actions.extend (agent on_flat_view)

			differential_view := True
			ev_differential_view_button.enable_select
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Status Report

	differential_view: BOOLEAN

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

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

	clear
		do
 			ev_class_id.remove_text
 			property_view.clear
 			inheritance_view.clear
		end

	populate (a_class_def: attached BMM_CLASS_DEFINITION)
			-- populate the ADL tree control by creating it from scratch
		local
			str: STRING
		do
			clear
			class_def := a_class_def

 			-- set the name in the name area
			str := class_def.qualified_package_name.as_lower
			str.append_character (package_name_delimiter)
			str.append (class_def.name)
 			ev_class_id.set_text (str)

			do_with_wait_cursor (ev_root_container, agent do_populate)
		end

	repopulate
			-- repopulate the ADL tree control by creating it from scratch for same class
		do
			do_with_wait_cursor (ev_root_container, agent do_populate)
		end

	do_populate
		do
			property_view.populate (class_def, differential_view)
			inheritance_view.populate (class_def)
		end

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
			property_view.update_rm_icons_cb
		end

feature {NONE} -- Implementation

	property_view: GUI_CLASS_TOOL_PROPERTY_VIEW

	inheritance_view: GUI_CLASS_TOOL_INHERITANCE_VIEW

	ev_class_id: EV_TEXT_FIELD

	ev_notebook: EV_NOTEBOOK

	ev_action_bar: EV_HORIZONTAL_BOX

	ev_view_tool_bar: EV_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_view_label: EV_LABEL

	class_def: BMM_CLASS_DEFINITION

	node_path: OG_PATH

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
