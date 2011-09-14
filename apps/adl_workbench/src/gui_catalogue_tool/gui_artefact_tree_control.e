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
	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	CONSTANTS
		export
			{NONE} all
		end

feature {NONE} -- Initialisation

	make_ui
		do
			-- create widgets
			create ev_root_container

			-- connect widgets

			-- visual characteristics
			ev_root_container.set_background_color (editable_colour)
  			ev_root_container.set_minimum_width (max_arch_explorer_width)
		end

feature -- Access

	ev_root_container: EV_TREE

feature -- Commands

	populate
			-- Populate `gui_file_tree' from `archetype_directory'.
		do
			create ev_node_descriptor_map.make(0)
			ev_root_container.wipe_out
 			create ev_tree_item_stack.make (0)

 			if has_current_profile then
	 			populate_tree
			end
		end

	refresh
			-- repopulate to update GUI settings
		do
			ev_root_container.recursive_do_all (agent update_tree_node)
		end

	update_tree_node_for_archetype (ara: attached ARCH_CAT_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		deferred
		end

	update_rm_icons_setting
		do
			refresh
		end

feature {NONE} -- Implementation

	ev_node_descriptor_map: HASH_TABLE [EV_TREE_ITEM, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

	artefact_types: ARRAY [INTEGER]
			-- types of artefact in this view

	ev_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]
			-- Stack used during `populate_ev_tree_node_enter'.

	populate_tree
		deferred
		end

   	update_tree_node (node: attached EV_TREE_NODE)
   		deferred
   		end

	update_all_tools_rm_icons_setting_agent: PROCEDURE [ANY, TUPLE]
			-- if this is set, it is an agent that takes one argument of a routine
			-- to execute on all other editors, to sync them to a change in this current one

	object_node_pixmap (ara: ARCH_CAT_ITEM): EV_PIXMAP
		local
			rm_publisher: STRING
		do
			if attached {ARCH_CAT_MODEL_NODE} ara as acmn and then acmn.is_class then
				rm_publisher := acmn.class_definition.bmm_schema.model_publisher
				if use_rm_pixmaps and then rm_pixmaps.has (rm_publisher) and then rm_pixmaps.item (rm_publisher).has (acmn.display_name) then
					Result := rm_pixmaps.item (rm_publisher).item (acmn.display_name)
				else
					Result := pixmaps [ara.group_name]
				end
			else
				Result := pixmaps [ara.group_name]
			end
		end

	selected_archetype_node: ARCH_CAT_ARCHETYPE

	select_archetype_with_delay (aca: ARCH_CAT_ARCHETYPE)
		deferred
		end

	select_archetype_agent, edit_archetype_agent, select_archetype_in_new_tool_agent: PROCEDURE [ANY, TUPLE]

	archetype_node_handler (ev_ti: EV_TREE_ITEM; x,y, button: INTEGER)
			-- creates the context menu for a right click action for an ARCH_REP_ARCHETYPE node
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {ARCH_CAT_ARCHETYPE} ev_ti.data as aca then
				create menu
				create an_mi.make_with_text_and_action ("Compile and Display", agent display_context_selected_archetype_in_active_tool (ev_ti))
				an_mi.set_pixmap (pixmaps ["parse"])
		    	menu.extend (an_mi)

				create an_mi.make_with_text_and_action ("Display in new tab", agent display_context_selected_archetype_in_new_tool (ev_ti))
				an_mi.set_pixmap (pixmaps ["archetype_2"])
				menu.extend (an_mi)

				create an_mi.make_with_text_and_action ("Edit source", edit_archetype_agent)
				an_mi.set_pixmap (pixmaps ["edit"])
				menu.extend (an_mi)

				menu.show
			end
		end

	display_context_selected_archetype_in_active_tool (ev_ti: EV_TREE_ITEM)
		do
			if not ev_ti.is_selected then
				ev_ti.enable_select
			end
			if attached {ARCH_CAT_ARCHETYPE} ev_ti.data as aca then
				current_arch_cat.set_selected_item (aca)
				select_archetype_agent.call ([])
			end
		end

	display_context_selected_archetype_in_new_tool (ev_ti: EV_TREE_ITEM)
		do
			if not ev_ti.is_selected then
				ev_ti.enable_select
			end
			if attached {ARCH_CAT_ARCHETYPE} ev_ti.data as aca then
				current_arch_cat.set_selected_item (aca)
				select_archetype_in_new_tool_agent.call ([])
			end
		end

invariant
	valid_artefact_types: (create {ARTEFACT_TYPE}).valid_artefact_types(artefact_types)

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
