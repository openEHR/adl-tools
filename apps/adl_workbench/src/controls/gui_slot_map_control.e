indexing
	component:   "openEHR Archetype Project"
	description: "Slot map control - Visualise archetype ids matching slots"
	keywords:    "archetype, slot, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/BRANCHES/specialisation/apps/adl_workbench/src/controls/gui_node_map_control.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2008-01-14 00:27:16 +0000 (Mon, 14 Jan 2008) $"

class GUI_SLOT_MAP_CONTROL

inherit
	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
		end

	SHARED_UI_RESOURCES
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

	make(a_main_window: MAIN_WINDOW) is
		require
			a_main_window /= Void
		do
			gui := a_main_window
			gui_tree := gui.slot_map_tree
			gui_tree.pointer_double_press_actions.extend (agent on_double_click)
			in_differential_mode := True
		end

feature -- Status Report

	in_differential_mode: BOOLEAN
			-- True if node visualisation should show definition status of each node,
			-- i.e. inherited, redefine etc

feature -- Commands

	set_differential_view
			-- Set `in_differential_mode' on.
		do
			in_differential_mode := True
			populate
		end

	set_flat_view
			-- Set `in_differential_mode' off.
		do
			in_differential_mode := False
			populate
		end

	clear is
		do
			gui_tree.wipe_out
		end

	populate is
			-- populate the ADL tree control by creating it from scratch
		local
			eti: EV_TREE_ITEM
			slot_id_list: ARRAYED_LIST[STRING]
			a_path: STRING
			ara: ARCH_REP_ARCHETYPE
		do
			clear
			archetype_tree_root_set := False
			create tree_item_stack.make (0)

			if archetype_directory.has_selected_archetype then
				ara := archetype_directory.selected_archetype
				if ara.has_slots then
					from
						ara.slot_id_index.start
					until
						ara.slot_id_index.off
					loop
						a_path := ara.slot_id_index.key_for_iteration
						create eti.make_with_text (utf8(ara.archetype_differential.ontology.physical_to_logical_path (a_path, current_language)))
						eti.set_pixmap (pixmaps.item ("ARCHETYPE_SLOT"))

						gui_tree.extend (eti)
						tree_item_stack.extend (eti)

						slot_id_list := ara.slot_id_index.item_for_iteration
						from
							slot_id_list.start
						until
							slot_id_list.off
						loop
							create eti.make_with_text (utf8(slot_id_list.item))
							eti.set_pixmap (pixmaps.item (archetype_directory.archetype_id_index.item (slot_id_list.item).group_name))
							eti.set_data (archetype_directory.archetype_id_index.item (slot_id_list.item))
							tree_item_stack.item.extend(eti)
							slot_id_list.forth
						end

						tree_item_stack.remove
						ara.slot_id_index.forth
					end
				end
			end
		end

feature {NONE} -- Implementation

	target_archetype: ARCHETYPE is
			-- differential or flat version of archetype, depending on setting of `in_differential_mode'
		require
			archetype_directory.has_selected_archetype
		do
			if in_differential_mode then
				Result := archetype_directory.selected_archetype.archetype_differential
			else
				Result := archetype_directory.selected_archetype.archetype_flat
			end
		end

	gui: MAIN_WINDOW
			-- main window of system

	gui_tree: EV_TREE

	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	archetype_tree_root_set: BOOLEAN

	attach_node(str: STRING): EV_TREE_ITEM is
			-- attach a node into the tree
		do
			create Result.make_with_text (utf8 (str))

			if not archetype_tree_root_set then
				gui_tree.extend (Result)
				archetype_tree_root_set := True
			else
				tree_item_stack.item.extend(Result)
			end
		end

	on_double_click (x: INTEGER_32; y: INTEGER_32; button: INTEGER_32; x_tilt: REAL_64; y_tilt: REAL_64; pressure: REAL_64; screen_x: INTEGER_32; screen_y: INTEGER_32)
			-- When the user double-clicks an archetype, select it in the main window's explorer tree.
		do
			select_node_in_archetype_tree_view
		end

	select_node_in_archetype_tree_view
			-- Select the archetype in the main window's explorer tree.
		local
			ara: ARCH_REP_ARCHETYPE
		do
			if gui_tree.selected_item /= Void then
				ara ?= gui_tree.selected_item.data
				if ara /= Void then
					archetype_directory.set_selected_item (ara)
					gui.archetype_view_tree_select_node
				end
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
