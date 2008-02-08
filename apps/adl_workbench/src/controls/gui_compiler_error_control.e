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

	COMPILER_ERROR_TYPES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Col_category: INTEGER is 1
	Col_location: INTEGER is 2
	Col_message: INTEGER is 3

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
			-- Create to control `a_main_window.compiler_output_grid'.
		require
			a_main_window /= Void
		do
			create items.make (0)
			create categories.make (Err_type_parse_error, Err_type_warning)

			gui := a_main_window
			make_for_grid (gui.compiler_output_grid)
			grid.enable_tree
			grid.disable_row_height_fixed
		ensure
			gui_set: gui = a_main_window
		end

feature -- Status Report

	has (ara: ARCH_REP_ARCHETYPE): BOOLEAN is
			-- Is `ara' already in `grid'?
		require
			ara /= Void
		do
			Result := items.has (ara.id.as_string)
		end

feature -- Commands

	clear is
			-- Wipe out the content from `grid'.
		do
			grid.wipe_out
			items.wipe_out
			categories.discard_items

			grid.insert_new_column (Col_category)
			grid.insert_new_column (Col_location)
			grid.insert_new_column (Col_message)
			grid.column (Col_category).set_title ("Category")
			grid.column (Col_location).set_title ("Archetype")
			grid.column (Col_message).set_title ("Message")
		end

	extend (ara: ARCH_REP_ARCHETYPE) is
			-- Add a node representing the errors or warnings of the archetype, if any
		require
			ara /= Void
		local
			gli: EV_GRID_LABEL_ITEM
			cat_row, row, subrow: EV_GRID_ROW
			pixmap: EV_PIXMAP
			i, row_idx, err_cat: INTEGER
		do
			err_cat := ara.compiler_error_type

			if err_cat /= Err_type_valid then
				cat_row := categories [err_cat]

				if cat_row = Void then
					-- figure out which row in the grid we need to insert a new row for this category
					from
						i := Err_type_parse_error
						row_idx := 1
					until
						i >= err_cat
					loop
						if categories [i] /= Void then
							-- count the category row itself + all its subrows
							row_idx := row_idx + categories [i].subrow_count_recursive + 1
						end

						i := i + 1
					end

					grid.insert_new_row (row_idx)
					cat_row := grid.row (row_idx)
					cat_row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)
					create gli.make_with_text (utf8 (Err_type_names [err_cat]))
					pixmap := pixmaps [Err_type_pixmap_names [err_cat]]

					if pixmap /= Void then
						gli.set_pixmap (pixmap)
					end

					cat_row.set_item (Col_category, gli)
					categories.put (cat_row, err_cat)
				end

				if not has (ara) then
					-- FIXME: really have to find a proper sorted position in the list...currently going at the end
					row_idx := cat_row.subrow_count + 1
					cat_row.insert_subrow (row_idx)
					row := cat_row.subrow (row_idx)
					row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)
					row.insert_subrow (1)
					subrow := row.subrow (1)
					subrow.set_data (ara)
					items.force (row, ara.id.as_string)
					cat_row.expand
				else
					-- find the existing row and subrow
					row := items [ara.id.as_string]
					subrow := row.subrow (1)
				end

				-- Create the label & icon - which might have changed since last compile.
				create gli.make_with_text (utf8 (ara.id.as_string))
				pixmap := pixmaps [ara.group_name]

				if pixmap /= Void then
					gli.set_pixmap (pixmap)
				end

				gli.set_data (ara)
				gli.pointer_double_press_actions.force_extend (agent select_node_in_archetype_tree_view)
				row.set_item (Col_location, gli)

				create gli.make_with_text (utf8 (ara.compiler_status))
				subrow.set_item (Col_message, gli)
				subrow.set_height (gli.text_height)

				grid.column (Col_category).resize_to_content
				grid.column (Col_location).resize_to_content
				grid.column (Col_message).resize_to_content
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

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
			-- Select the archetype represented by `selected_cell' in the main window's explorer tree.
		local
			ara: ARCH_REP_ARCHETYPE
		do
			if selected_cell /= Void and then selected_cell.column.index = Col_location then
				ara ?= selected_cell.data

				if ara /= Void then
					archetype_directory.set_selected_item (ara)
					gui.archetype_view_tree_select_node
				end
			end
		end

	categories: ARRAY [EV_GRID_ROW]
			-- rows containing category grouper in column 1

	items: HASH_TABLE [EV_GRID_ROW, STRING]
			-- IDs of archetypes that are displayed in the grid.

invariant
	gui_attached: gui /= Void
	items_attached: items /= Void
	categories_attached: categories /= Void
	correct_grid: grid = gui.compiler_output_grid

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
