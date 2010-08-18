note
	component:   "openEHR Archetype Project"
	description: "Used-by map control - Visualise archetype ids that have slots that match the current archetype"
	keywords:    "archetype, slot, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_USED_BY_MAP_CONTROL

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

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
		require
			a_main_window /= Void
		do
			gui := a_main_window
			gui_tree := gui.used_by_tree
			gui_tree.pointer_double_press_actions.force_extend (agent select_node_in_archetype_tree_view)
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

	clear
		do
			gui_tree.wipe_out
		end

	populate
			-- populate the ADL tree control by creating it from scratch
		local
			eti: EV_TREE_ITEM
			ara: ARCH_REP_ARCHETYPE
		do
			clear

			if archetype_directory.has_selected_archetype then
				ara := archetype_directory.selected_archetype
				if ara.is_used then
					from
						ara.used_by_index.start
					until
						ara.used_by_index.off
					loop
						create eti.make_with_text (utf8(ara.used_by_index.item))
						eti.set_pixmap (pixmaps.item (archetype_directory.archetype_id_index.item (ara.used_by_index.item).group_name))
						eti.set_data (archetype_directory.archetype_id_index.item (ara.used_by_index.item))
						gui_tree.extend (eti)

						ara.used_by_index.forth
					end
				end
			end
		end

feature {NONE} -- Implementation

	target_archetype: ARCHETYPE
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

	attach_node(str: STRING): EV_TREE_ITEM
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

	select_node_in_archetype_tree_view
			-- Select the archetype in the main window's explorer tree.
		do
			gui.select_archetype_from_gui_data (gui_tree.selected_item)
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
