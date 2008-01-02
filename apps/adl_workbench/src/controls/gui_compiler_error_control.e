indexing
	component:   "openEHR Archetype Project"
	description: "[
				 EV_GRID control for compiler error output. A preferable implementation is to separate the logical
				 (i.e. non-GUI related) list) of errors, probably in the class ARCHETYPE_COMPILER, which would make
				 it visible when built as a DLL or other component separate from the Vision GUI. To do that, it 
				 would require some way of the GUI update knowing how to add the latest entry/ies to the grid, 
				 without having to do a complete rebuild every time, which is what will happen when a complete
				 build of the archetype system is done.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_COMPILER_ERROR_CONTROL

inherit
	GUI_GRID_CONTROLLER
		redefine
			on_grid_key_press
		end

	SHARED_ARCHETYPE_DIRECTORY
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

feature -- Definitions

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
			-- create control
		require
			a_main_window /= Void
		do
			create items.make(0)
			gui := a_main_window
			make_for_grid (gui.compiler_output_grid)
			grid.enable_tree
			grid.disable_row_height_fixed
			grid.pointer_double_press_item_actions.extend (agent on_double_click)
			grid.insert_new_column (1)
			grid.insert_new_column (2)
			grid.column (1).set_title ("Archetype")
			grid.column (2).set_title ("Message")
		end

feature -- Status Report

	has (an_archetype: ARCH_REP_ARCHETYPE): BOOLEAN is
			-- True if this archetype already included
		require
			an_archetype /= Void
		do
			Result := items.has(an_archetype.id.as_string)
		end

feature -- Status Setting

	is_expanded: BOOLEAN
			-- True if archetype tree is in expanded state

feature -- Commands

	clear is
			-- wipe out content from controls
   		local
			gli: EV_GRID_LABEL_ITEM
		do
			grid.wipe_out
			items.wipe_out

 			-- Populate first column with archetype tree.
			create gli.make_with_text ("Errors")
			grid.set_item (1, 1, gli)
			gli.enable_select
		end

	extend (an_archetype: ARCH_REP_ARCHETYPE) is
			-- Add a node representing the errors or warnings of the archetype, if any
		require
			an_archetype /= Void
		local
			gli: EV_GRID_LABEL_ITEM
			row, subrow: EV_GRID_ROW
			pixmap: EV_PIXMAP
		do
			if not has (an_archetype) then
				-- FIXME: really have to find a proper sorted position in the list...currently going at the end
				grid.insert_new_row (grid.row_count+1)
				row := grid.row (grid.row_count)
				row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)
				row.insert_subrow (row.subrow_count + 1)
				subrow := row.subrow (row.subrow_count)
				subrow.set_data (an_archetype)
				items.force(row, an_archetype.id.as_string)
			else
				-- find the existing row and get rid of its subrow
				row := items.item(an_archetype.id.as_string)
				subrow := row.subrow (1)
			end

			-- Create the label & icon - which might have changed since last compile.
			create gli.make_with_text (utf8 (an_archetype.id.as_string))
			pixmap := pixmaps [an_archetype.group_name]
			if pixmap /= Void then
				gli.set_pixmap (pixmap)
			end
			gli.set_data (an_archetype)
			row.set_item (1, gli)

			create gli.make_with_text (utf8 (an_archetype.compiler_status))
			subrow.set_item (2, gli)
			subrow.set_height (gli.text_height)

			grid.column (1).resize_to_content
			grid.column (2).resize_to_content
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	on_double_click (grid_x_pos, grid_y_pos, a_button_index: INTEGER; item: EV_GRID_ITEM)
			-- When the user double-clicks an archetype, select it in the main window's explorer tree.
		do
			select_node_in_archetype_tree_view
		end

	on_grid_key_press (key: EV_KEY)
			-- When the user presses Enter on an archetype, select it in the main window's explorer tree.
		do
			Precursor (key)

			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key /= Void and then key.code = key_enter then
					select_node_in_archetype_tree_view
				end
			end
		end

	select_node_in_archetype_tree_view
			-- Select the archetype in the main window's explorer tree.
		local
			ara: ARCH_REP_ARCHETYPE
		do
			if selected_cell /= Void and then selected_cell.column.index = 1 then
				ara ?= selected_cell.data

				if ara /= Void then
					archetype_directory.set_selected_item (ara)
					gui.archetype_view_tree_select_node
				end
			end
		end

	items: HASH_TABLE [EV_GRID_ROW, STRING]
			-- IDs of archetypes that are displayed in the grid.

invariant
	items_attached: items /= Void

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
--| The Original Code is gui_compiler_error_control.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
