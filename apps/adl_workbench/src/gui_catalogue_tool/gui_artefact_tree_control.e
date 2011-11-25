note
	component:   "openEHR Archetype Project"
	description: "Composite control for viewing archetype or template artefacts"
	keywords:    "ADL, archetype, template, UI"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class GUI_ARTEFACT_TREE_CONTROL

inherit
	GUI_CATALOGUE_TARGETTED_TOOL
		redefine
			repopulate
		end

feature {NONE} -- Initialisation

	make (an_edit_archetype_agent: like edit_archetype_agent;
		a_save_archetype_agent: like save_archetype_agent)
			-- Create controller for the tree representing archetype files found in `archetype_directory'.
		do
			edit_archetype_agent := an_edit_archetype_agent
			save_archetype_agent := a_save_archetype_agent

			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)
			create ev_tree

			-- connect widgets
			ev_root_container.extend (ev_tree)

			-- visual characteristics
--			ev_tree.set_background_color (editable_colour)
  			ev_tree.set_minimum_width (180)
		end

feature -- Access

	ev_root_container: EV_CELL

	ev_tree: EV_TREE

feature -- Commands

	repopulate
			-- repopulate to update GUI settings
		do
			ev_tree.recursive_do_all (agent update_tree_node)
		end

	update_tree_node_for_archetype (ara: attached ARCH_CAT_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		deferred
		end

	update_rm_icons_setting
		do
			repopulate
		end

feature {NONE} -- Implementation

	do_clear
		do
			create ev_node_descriptor_map.make(0)
			ev_tree.wipe_out
 			create ev_tree_item_stack.make (0)
		end

	ev_node_descriptor_map: HASH_TABLE [EV_TREE_ITEM, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

	artefact_types: ARRAY [INTEGER]
			-- types of artefact in this view

	ev_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]
			-- Stack used during `populate_ev_tree_node_enter'.

   	update_tree_node (node: attached EV_TREE_NODE)
   		deferred
   		end

	selected_archetype_node: ARCH_CAT_ARCHETYPE

	select_archetype_with_delay (aca: ARCH_CAT_ARCHETYPE)
		deferred
		end

	edit_archetype_agent: PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]]

	save_archetype_agent: PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE, BOOLEAN, BOOLEAN]]
			-- agent with signature (aca: ARCH_CAT_ARCHETYPE; diff_flag, native_format_flag: BOOLEAN)

	archetype_node_handler (ev_ti: EV_TREE_ITEM; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {ARCH_CAT_ARCHETYPE} ev_ti.data as aca then
				create menu
				create an_mi.make_with_text_and_action (create_message_content ("display_in_active_tab", Void), agent display_context_selected_archetype_in_active_tool (ev_ti))
				an_mi.set_pixmap (pixmaps ["archetype_tool"])
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action (create_message_content ("display_in_new_tab", Void), agent display_context_selected_archetype_in_new_tool (ev_ti))
				an_mi.set_pixmap (pixmaps ["archetype_tool_new"])
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (create_message_content ("edit_source", Void), agent (an_aca: ARCH_CAT_ARCHETYPE) do edit_archetype_agent.call ([an_aca]) end (aca))
				an_mi.set_pixmap (pixmaps ["edit"])
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (create_message_content ("save_archetype_as", Void), agent (an_aca: ARCH_CAT_ARCHETYPE) do save_archetype_agent.call ([an_aca, True, True]) end (aca))
	--			an_mi.set_pixmap (pixmaps ["save"])
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (create_message_content ("export_archetype_as", Void), agent (an_aca: ARCH_CAT_ARCHETYPE) do save_archetype_agent.call ([an_aca, True, False]) end (aca))
	--			an_mi.set_pixmap (pixmaps ["save"])
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action (create_message_content ("export_flat_archetype_as", Void), agent (an_aca: ARCH_CAT_ARCHETYPE) do save_archetype_agent.call ([an_aca, False, False]) end (aca))
	--			an_mi.set_pixmap (pixmaps ["save"])
				menu.extend (an_mi)

				menu.show
			end
		end

	display_context_selected_archetype_in_active_tool (ev_ti: EV_TREE_ITEM)
		do
			ev_ti.enable_select
			if attached {ARCH_CAT_ARCHETYPE} ev_ti.data as aca then
				gui_agents.select_archetype_agent.call ([aca])
			end
		end

	display_context_selected_archetype_in_new_tool (ev_ti: EV_TREE_ITEM)
		do
			ev_ti.enable_select
			if attached {ARCH_CAT_ARCHETYPE} ev_ti.data as aca then
				gui_agents.select_archetype_in_new_tool_agent.call ([aca])
			end
		end

invariant
	valid_artefact_types: (create {ARTEFACT_TYPE}).valid_artefact_types (artefact_types)

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
--| The Original Code is adl_node_control.e.
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
