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

	make_ui (a_label: attached STRING; a_pixmap: EV_PIXMAP)
		do
			-- create widgets
			create ev_root_container
			create ev_hbox
			create ev_pixmap
			create ev_label
			create ev_tree

			-- connect widgets
			ev_root_container.extend (ev_hbox)
			ev_hbox.extend (ev_pixmap)
			ev_hbox.extend (ev_label)
			ev_root_container.extend (ev_tree)

			-- visual characteristics
			ev_root_container.disable_item_expand (ev_hbox)
			ev_hbox.set_padding (padding_width)
			ev_hbox.set_border_width (border_width)
			ev_hbox.disable_item_expand (ev_pixmap)
--			ev_pixmap.set_minimum_width (16)
--			ev_pixmap.set_minimum_height (16)
			ev_label.set_text (a_label)
			ev_label.align_text_left
			ev_tree.set_background_color (editable_colour)
			ev_tree.set_minimum_width (60)
			ev_pixmap.copy (a_pixmap)
  			ev_tree.set_minimum_width (max_arch_explorer_width)

			-- events
			ev_tree.select_actions.extend (agent tree_item_select)
			ev_tree.focus_in_actions.extend (agent tree_item_select)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Commands

	display_selected_item_after_delay
			-- When the user selects an item in `gui_file_tree', delay before displaying it.
		do
			if delay_to_make_keyboard_navigation_practical = Void then
				create delay_to_make_keyboard_navigation_practical
				delay_to_make_keyboard_navigation_practical.actions.extend (agent display_selected_item)
			end

			delay_to_make_keyboard_navigation_practical.set_interval (300)
		end

	populate
			-- Populate `gui_file_tree' from `archetype_directory'.
		do
			create ev_node_descriptor_map.make(0)
			ev_tree.wipe_out
 			create ev_tree_item_stack.make (0)

 			if has_current_profile then
	 			populate_tree
			end
		end

	update_tree_node_for_archetype (ara: attached ARCH_CAT_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		deferred
		end

feature -- Events

	tree_item_select
			-- Display details of tree when user selects
		deferred
		end

feature {NONE} -- Implementation

	ev_pixmap: EV_PIXMAP

	ev_label: EV_LABEL

	ev_tree: EV_TREE

	ev_hbox: EV_HORIZONTAL_BOX

	ev_node_descriptor_map: HASH_TABLE [EV_TREE_ITEM, STRING]
			-- list of GUI explorer nodes, keyed by artefact id

	artefact_types: ARRAY [INTEGER]
			-- types of artefact in this view

	ev_tree_item_stack: ARRAYED_STACK [EV_TREE_ITEM]
			-- Stack used during `populate_ev_tree_node_enter'.

	delay_to_make_keyboard_navigation_practical: EV_TIMEOUT
			-- Timer to delay a moment before calling `display_details_of_selected_item'.

	display_selected_item
		deferred
		end

	populate_tree
		deferred
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
