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
			create categories.make (Err_type_valid, Err_type_warning)
			gui := a_main_window
			make_for_grid (gui.compiler_output_grid)
			grid.enable_tree
			grid.disable_row_height_fixed
			grid.hide_tree_node_connectors
		ensure
			gui_set: gui = a_main_window
		end

feature -- Commands

	clear is
			-- Wipe out the content from `grid'.
		do
			grid.wipe_out
			categories.discard_items

			grid.insert_new_column (Col_category)
			grid.insert_new_column (Col_location)
			grid.insert_new_column (Col_message)
			grid.column (Col_category).set_title ("Category")
			grid.column (Col_location).set_title ("Archetype")
			grid.column (Col_message).set_title ("Message")

			update_errors_tab_label
		end

	extend_and_select (ara: ARCH_REP_ARCHETYPE) is
			-- Add a node representing the errors or warnings of the archetype, if any.
		require
			ara_attached: ara /= Void
		local
			gli: EV_GRID_LABEL_ITEM
			cat_row, row, subrow: EV_GRID_ROW
			pixmap: EV_PIXMAP
			i, row_idx: INTEGER
		do
			remove_archetype_row_if_in_wrong_category (ara)

			if ara.compiler_error_type /= err_type_valid then
				ensure_row_for_category (ara.compiler_error_type)
				cat_row := categories [ara.compiler_error_type]

				from
					row_idx := 0
					i := 1
				until
					i /= 1
				loop
					row_idx := row_idx + 1

					if row_idx <= cat_row.subrow_count then
						row := cat_row.subrow (row_idx)
						row.collapse

						if {other: !ARCH_REP_ARCHETYPE} row.data then
							i := ara.id.three_way_comparison (other.id)
						end
					else
						i := -1
					end
				end

				if i = -1 then
					cat_row.insert_subrow (row_idx)
					row := cat_row.subrow (row_idx)
					row.set_data (ara)
					row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)
					row.insert_subrow (1)
				end

				subrow := row.subrow (1)
				cat_row.expand
				create gli.make_with_text (utf8 (ara.id.as_string))
				pixmap := pixmaps [ara.group_name]

				if pixmap /= Void then
					gli.set_pixmap (pixmap)
				end

				gli.set_tooltip (utf8 (ara.compiler_status))
				gli.pointer_double_press_actions.force_extend (agent select_node_in_archetype_tree_view)
				row.set_item (col_location, gli)
				row.expand
				gli.enable_select

				if gli.is_displayed then
					gli.ensure_visible
				end

				create gli.make_with_text (utf8 (ara.compiler_status))
				subrow.set_item (col_message, gli)
				subrow.set_height (gli.text_height)

				if gli.is_displayed then
					gli.ensure_visible
				end

				grid.column (Col_category).resize_to_content
				grid.column (Col_location).resize_to_content
				grid.column (Col_message).resize_to_content
			end

			update_errors_tab_label
		end

	export_error_report (file_name: STRING)
			-- Export the contents of the grid to XML in `file_name'.
		require
			file_name_attached: file_name /= Void
			file_name_not_empty: not file_name.is_empty
		local
			err_type, i: INTEGER
			category: STRING
			namespace: XM_NAMESPACE
			document: XM_DOCUMENT
			root, element, ara_element: XM_ELEMENT
			attribute: XM_ATTRIBUTE
			element_data: XM_CHARACTER_DATA
			pretty_printer: XM_INDENT_PRETTY_PRINT_FILTER
			xmlns_generator: XM_XMLNS_GENERATOR
			file: KL_TEXT_OUTPUT_FILE
		do
			create namespace.make_default
			create document.make_with_root_named ("errors", create {XM_NAMESPACE}.make ("openehr", "www.openehr.org"))
			root := document.root_element
			create element.make_last (root, "count", namespace)

			from
				err_type := categories.lower
			until
				err_type = categories.upper
			loop
				err_type := err_type + 1
				category := err_type_names [err_type].split (' ').first.as_lower
				create attribute.make_last (category, namespace, count_for_category (err_type).out, root.elements.first)

				if {row: !EV_GRID_ROW} categories [err_type] then
					from
						create element.make_last (root, "category", namespace)
						create attribute.make_last ("type", namespace, category, element)
						create attribute.make_last ("count", namespace, count_for_category (err_type).out, element)
						i := 0
					until
						i = row.subrow_count
					loop
						i := i + 1

						if {ara: !ARCH_REP_ARCHETYPE} row.subrow (i).data then
							create element_data.make_last (create {XM_ELEMENT}.make_last (element, "archetype", namespace), ara.id.as_string)
							create element_data.make_last (create {XM_ELEMENT}.make_last (element, "message", namespace), ara.compiler_status)
						end
					end
				end
			end

			create file.make (file_name)
			file.open_write

			if file.is_open_write then
				create pretty_printer.make_null
				pretty_printer.set_output_stream (file)
				create xmlns_generator.set_next (pretty_printer)
				document.process_to_events (xmlns_generator)
				file.close
			end
		end

feature -- Access

	parse_error_count: INTEGER
			-- Number of parser errors.
		do
			Result := count_for_category (err_type_parse_error)
		ensure
			natural: Result >= 0
		end

	validity_error_count: INTEGER
			-- Number of parser errors.
		do
			Result := count_for_category (err_type_validity_error)
		ensure
			natural: Result >= 0
		end

	warning_count: INTEGER
			-- Number of parser errors.
		do
			Result := count_for_category (err_type_warning)
		ensure
			natural: Result >= 0
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- Main window of system.

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
		do
			if selected_cell /= Void and then selected_cell.column.index = Col_location then
				gui.select_archetype_from_gui_data (selected_cell.row)
			end
		end

	update_errors_tab_label
			-- On the Errors tab, indicate parse errors, validity errors and warnings.
		do
			gui.status_notebook.set_item_text (gui.compiler_output_grid, "Errors (" + parse_error_count.out + "/" + validity_error_count.out + "/" + warning_count.out + ")")
		end

	ensure_row_for_category (err_type: INTEGER)
			-- Insert a row into `grid' representing `err_type', if there was no such row already.
		require
			not_too_small: err_type >= categories.lower
			not_too_big: err_type <= categories.upper
		local
			gli: EV_GRID_LABEL_ITEM
			pixmap: EV_PIXMAP
			i, row_idx: INTEGER
			row: EV_GRID_ROW
		do
			if categories [err_type] = Void then
				from
					i := categories.upper
					row_idx := grid.row_count + 1
				until
					i = err_type
				loop
					if categories [i] /= Void then
						row_idx := categories [i].index
					end

					i := i - 1
				end

				grid.insert_new_row (row_idx)
				row := grid.row (row_idx)
				row.set_data (err_type)
				row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)
				create gli.make_with_text (utf8 (err_type_names [err_type]))
				pixmap := pixmaps [err_type_pixmap_names [err_type]]

				if pixmap /= Void then
					gli.set_pixmap (pixmap)
				end

				row.set_item (col_category, gli)
				categories [err_type] := row
			end
		ensure
			category_row_attached: categories [err_type] /= Void
		end

	remove_archetype_row_if_in_wrong_category (ara: ARCH_REP_ARCHETYPE)
			-- Remove the row representing `ara' from `grid' if it is under the wrong category.
		require
			ara_attached: ara /= Void
		local
			cat_row, row: EV_GRID_ROW
			row_idx: INTEGER
		do
			from
				row_idx := grid.row_count
			until
				row_idx = 0
			loop
				row := grid.row (row_idx)
				row_idx := row_idx - 1

				if {other: !ARCH_REP_ARCHETYPE} row.data then
					if ara.id.is_equal (other.id) then
						row_idx := 0
						cat_row := row.parent_row

						if cat_row /= categories [ara.compiler_error_type] then
							if cat_row.subrow_count > 1 then
								grid.remove_row (row.index)
							else
								grid.remove_row (cat_row.index)

								if {i: !INTEGER_REF} cat_row.data then
									categories [i.item] := Void
								end
							end
						end
					end
				end
			end
		end

	count_for_category (err_type: INTEGER): INTEGER
			-- Number of parser errors.
		require
			not_too_small: err_type >= categories.lower
			not_too_big: err_type <= categories.upper
		do
			if {row: !EV_GRID_ROW} categories [err_type] then
				Result := row.subrow_count
			end
		ensure
			natural: Result >= 0
		end

	categories: !ARRAY [EV_GRID_ROW]
			-- Rows containing category grouper in column 1.

invariant
	gui_attached: gui /= Void
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
