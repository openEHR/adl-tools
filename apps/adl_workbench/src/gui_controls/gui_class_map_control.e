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

class GUI_CLASS_MAP_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_archetype_explorer_select_agent: PROCEDURE [ANY, TUPLE])
		do
			-- create root widget
			create ev_root_container
			create action_bar
			create ev_class_id
			create view_label
			create ev_view_tool_bar
			create differential_view_button
			create flat_view_button
			create ev_tree

			-- connect widgets
			ev_root_container.extend (action_bar)
			ev_root_container.extend (ev_tree)

			action_bar.extend (ev_class_id)
			action_bar.extend (view_label)
			action_bar.extend (ev_view_tool_bar)
			ev_view_tool_bar.extend (differential_view_button)
			ev_view_tool_bar.extend (flat_view_button)

			-- visual characteristics
			ev_root_container.disable_item_expand (action_bar)
			action_bar.set_padding (10)
			action_bar.set_border_width (4)
			action_bar.disable_item_expand (view_label)
			action_bar.disable_item_expand (ev_view_tool_bar)
			ev_class_id.disable_edit
			view_label.set_text ("View ")
			differential_view_button.set_pixmap (pixmaps ["diff"])
			flat_view_button.set_pixmap (pixmaps ["flat"])
			differential_view_button.set_tooltip ("Set differential archetype view")
			flat_view_button.set_tooltip ("Set flat archetype view")

			-- set events: action bar
			differential_view_button.select_actions.extend (agent on_differential_view)
			flat_view_button.select_actions.extend (agent on_flat_view)

			-- set GUI feedback
			archetype_explorer_select_agent := a_archetype_explorer_select_agent

			differential_view := True
			differential_view_button.enable_select
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	ev_class_id: EV_TEXT_FIELD

	ev_tree: EV_TREE

	class_def: BMM_CLASS_DEFINITION

feature -- Status Report

	differential_view: BOOLEAN

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
			-- set view one way or the other
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
			ev_tree.wipe_out
 			ev_class_id.remove_text
		end

	populate (a_class_def: attached BMM_CLASS_DEFINITION)
			-- populate the ADL tree control by creating it from scratch
		do
			class_def := a_class_def
			repopulate
		end

	repopulate
		do
			clear
 			create ev_tree_item_stack.make (0)

 			ev_class_id.set_text (class_def.name)
			populate_root_node

			class_def.do_supplier_closure (not differential_view, agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
			ev_tree.recursive_do_all (agent ev_tree_expand)
			if attached archetype_explorer_select_agent then
				archetype_explorer_select_agent.call ([])
			end
		end

	select_flat_view
			-- Called by `select_actions' of `flat_view_button'.
		do
			if not flat_view_button.is_selected then
				flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called by `select_actions' of `differential_view_button'.
		do
			if not differential_view_button.is_selected then
				differential_view_button.enable_select
				set_view (True)
			end
		end

feature {NONE} -- Implementation

	action_bar: EV_HORIZONTAL_BOX

	ev_view_tool_bar: EV_TOOL_BAR

	differential_view_button, flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	view_label: EV_LABEL

	ev_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	archetype_explorer_select_agent: PROCEDURE [ANY, TUPLE]

   	populate_root_node
			-- Add root node representing class to `gui_file_tree'.
   		local
			a_ti: EV_TREE_ITEM
		do
			create a_ti
			a_ti.set_text (current_arch_cat.selected_class.display_name)
			a_ti.set_pixmap (pixmaps [current_arch_cat.selected_class.group_name])
			ev_tree.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)
		end

   	populate_gui_tree_node_enter (a_prop_def: BMM_PROPERTY_DEFINITION)
   			-- Add a node representing `a_prop_def' to `gui_file_tree'.
		require
			item_attached: a_prop_def /= Void
   		local
			a_ti: EV_TREE_ITEM
			pixmap: EV_PIXMAP
			str: STRING
		do
			create a_ti
			a_ti.set_data (a_prop_def)
			str := a_prop_def.name + ": " + a_prop_def.type_def.as_type_string
			if a_prop_def.is_mandatory then
				str.append (" [1]")
			else
				str.append (" [0..1]")
			end
			a_ti.set_text (utf8 (str))

			pixmap := pixmaps.item(rm_attribute_pixmap_string(a_prop_def))
			a_ti.set_pixmap (pixmap)
			ev_tree_item_stack.item.extend (a_ti)
			ev_tree_item_stack.extend (a_ti)
		end

   	populate_gui_tree_node_exit (a_prop_def: BMM_PROPERTY_DEFINITION)
   		do
			ev_tree_item_stack.remove
		end

	rm_attribute_pixmap_string(rm_attr: BMM_PROPERTY_DEFINITION): STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make(0)
			Result.append ("C_ATTRIBUTE")
			if rm_attr.is_container then
				Result.append (".multiple")
			end
			if not rm_attr.is_mandatory then
				Result.append (".optional")
			end
			Result.append (".reference_model")
		end

	ev_tree_expand(node: EV_TREE_NODE)
			--
		do
 			if node.is_expandable then
				node.expand
 			end
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
