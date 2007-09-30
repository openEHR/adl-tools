indexing
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL test workbench"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_TEST_ARCHETYPE_TREE_CONTROL

inherit
	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all
		end

	STRING_UTILITIES

create
	make

feature -- Definitions

	First_test_col: INTEGER is 3
			-- Number of first column in grid to be used for test results.

	Test_passed: INTEGER is 101

	Test_failed: INTEGER is 102

	Test_not_applicable: INTEGER is 103

	Test_unknown: INTEGER is 104

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
			-- create tree control repersenting archetype files found in repository_path
		require
			a_main_window /= Void
		do
			gui := a_main_window
			grid := gui.archetype_test_tree_grid
			grid.enable_tree
			grid.key_press_actions.extend (agent on_grid_key_press)
			grid.mouse_wheel_actions.extend (agent on_mouse_wheel)

			gui.archetype_test_go_bn.set_pixmap (pixmaps ["go"])
		end

feature -- Access

	selected_file_path: STRING
			-- full path of file selected from tree control

	has_selected_file: BOOLEAN
			-- True if a file was selected

	tests: DS_HASH_TABLE [FUNCTION [ANY, TUPLE, INTEGER], STRING] is
			-- table of test routines
		once
			create Result.make (0)
			Result.force (agent test_parse, "Parse")
			Result.force (agent test_save_flat_html, "Save to HTML")
			Result.force (agent test_save, "Save to ADL")
			Result.force (agent test_reparse_flat, "Reparse")
			Result.force (agent test_diff, "Diff")
		end

	last_tested_archetypes_count: INTEGER
			-- number of archetypes tested in last run

feature -- Status Setting

	is_expanded: BOOLEAN
			-- True if archetype tree is in expanded state

	overwrite: BOOLEAN
			-- set to True if old files are to be overwritten by new files
			-- useful for upgrading ADL syntax in one go

	remove_unused_codes: BOOLEAN
			-- True means remove unused codes from every archetype	

	test_execution_underway: BOOLEAN
			-- True during a test run

	test_stop_requested: BOOLEAN
			-- user requested stop

feature -- Commands

	clear is
			-- wipe out content from controls
		do
			grid.wipe_out
			gui.test_status_area.remove_text
			has_selected_file := False
		end

	populate is
			-- populate the ADL tree control by creating it from scratch
		local
			gli: EV_GRID_LABEL_ITEM
			col_csr: INTEGER
		do
			clear
 			create grid_row_stack.make (0)

 			-- Populate first column with archetype tree.
			create gli.make_with_text ("Root")
			grid.set_item (1, 1, gli)
			add_checkbox (gli.row)
			gli.enable_select
			grid_row_stack.extend (gli.row)

 			archetype_directory.do_all (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
			grid.column (1).set_title ("Archetype")

			-- put names on columns
			if grid.column_count >= first_test_col then
				from
					tests.start
					col_csr := first_test_col
				until
					tests.off
				loop
					grid.column (col_csr).set_title (tests.key_for_iteration)
					tests.forth
					col_csr := col_csr + 1
				end
			end

			is_expanded := False
			toggle_expand_tree
			grid.column (1).resize_to_content
			grid.column (2).resize_to_content

			gui.arch_test_processed_count.set_text ("0")
			gui.remove_unused_codes_rb.disable_select
			gui.overwrite_adl_rb.disable_select
		end

	archetype_test_go_stop is
			-- start or stop test run
		do
			if test_execution_underway then
				test_stop_requested := True
			else
				run_tests
			end
		end

	run_tests is
			-- execute tests on all marked archetypes
		local
			arch_item: ARCH_REP_ARCHETYPE
			row_csr, col_csr: INTEGER
			row: EV_GRID_ROW
			gli: EV_GRID_LABEL_ITEM
			checkbox: EV_GRID_CHECKABLE_LABEL_ITEM
			res_label: STRING
			test_result: INTEGER
		do
			test_execution_underway := True
			test_stop_requested := False
			set_archetype_test_go_bn_icon
			overwrite := gui.overwrite_adl_rb.is_selected
			remove_unused_codes := gui.remove_unused_codes_rb.is_selected

			from
				row_csr := 1
				last_tested_archetypes_count := 0
			until
				row_csr > grid.row_count or test_stop_requested
			loop
				row := grid.row (row_csr)
				checkbox ?= row.item (2)

				if checkbox /= Void and then checkbox.is_checked then
					arch_item ?= row.item (1).data

					if arch_item /= Void then
						row.ensure_visible
						archetype_compiler.reset
						archetype_compiler.set_target(arch_item)

						from
							tests.start
							col_csr := first_test_col
							test_result := test_unknown
						until
							tests.off or test_result = test_failed
						loop
							row.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text ("processing..."))

							create test_status.make_empty

							test_result := tests.item_for_iteration.item([])

							inspect test_result
							when test_passed then
								res_label := "test_passed"
							when test_failed then
								res_label := "test_failed"
							when test_not_applicable then
								res_label := "test_not_applicable"
							else

							end

							create gli.make_with_text ("")
							gli.set_pixmap (pixmaps [res_label])
							row.set_item (col_csr, gli)

							if not test_status.is_empty then
								gui.test_status_area.append_text ("--------------- " + arch_item.id.as_string + " -----------------%N" + test_status)
							end

							ev_application.process_events
							tests.forth
							col_csr := col_csr + 1
						end

						last_tested_archetypes_count := last_tested_archetypes_count + 1
						gui.arch_test_processed_count.set_text (last_tested_archetypes_count.out)
					end

					checkbox.set_is_checked (False)
				end

				row_csr := row_csr + 1
			end

			gui.test_status_area.append_text ("****** Executed tests on " + last_tested_archetypes_count.out + " Archetypes ******%N")
			test_execution_underway := False
			set_archetype_test_go_bn_icon
		end

	toggle_expand_tree is
			-- toggle expanded status of tree view
		do
			if is_expanded then
				collapse_tree (grid.row (1))
				gui.arch_test_tree_toggle_expand_bn.set_text ("Expand Tree")
				is_expanded := False
			else
				expand_tree (grid.row (1))
				gui.arch_test_tree_toggle_expand_bn.set_text ("Collapse Tree")
				is_expanded := True
			end
		end

feature -- Tests

	test_parse: INTEGER is
			-- parse archetype and return result
		local
			unused_at_codes, unused_ac_codes: ARRAYED_LIST [STRING]
		do
			Result := test_failed
			archetype_compiler.parse_archetype

			if archetype_compiler.archetype_valid then
				Result := test_passed
				test_status.append (" parse succeeded%N" + archetype_compiler.status)

				if remove_unused_codes then
					unused_at_codes := archetype_compiler.archetype_differential.ontology_unused_term_codes
					unused_ac_codes := archetype_compiler.archetype_differential.ontology_unused_constraint_codes

					if not unused_at_codes.is_empty or not unused_ac_codes.is_empty then
						test_status.append (">>>>>>>>>> removing unused codes%N")

						if not unused_at_codes.is_empty then
							test_status.append ("Unused AT codes: " + display_arrayed_list (unused_at_codes) + "%N")
						end

						if not unused_ac_codes.is_empty then
							test_status.append ("Unused AC codes: " + display_arrayed_list (unused_ac_codes) + "%N")
						end

						archetype_compiler.archetype_differential.remove_ontology_unused_codes
					end
				end
			else
				test_status.append (" parse failed%N" + archetype_compiler.status)
			end
		end

	test_save_flat_html: INTEGER is
			-- parse archetype and return result
		local
			html_fname: STRING
		do
			Result := test_failed

			if archetype_compiler.archetype_valid then
				-- FIXME: Sam doesn't want the html files to go in the same place as the adl files anymore
				-- now they should go in the path html/adl, where html is a sibling directory of the main
				-- 'adl' directory in the repository path; 'html/adl' means "the ADL form of HTML", since
				-- there are other things in the html directory.
				html_fname := archetype_compiler.target.full_path.twin
				html_fname.replace_substring(".html", html_fname.count - Archetype_flat_file_extension.count, html_fname.count)
				archetype_compiler.save_archetype_as(html_fname, "html")

				if archetype_compiler.save_succeeded then
					Result := test_passed
				else
					test_status.append (archetype_compiler.status + "%N")
				end
			end
		end

	test_save: INTEGER is
			-- parse archetype and return result
		local
			new_adl_file_path: STRING
		do
			Result := test_failed

			if archetype_compiler.archetype_valid then
				if overwrite then
					archetype_compiler.save_archetype
				else
					new_adl_file_path := file_system.pathname (system_temp_file_directory, file_system.basename (archetype_compiler.target.full_path))
					archetype_compiler.save_archetype_as (new_adl_file_path, "adl")
				end

				if archetype_compiler.save_succeeded then
					Result := test_passed
				else
					test_status.append (archetype_compiler.status + "%N")
				end
			else
				Result := test_not_applicable
			end
		end

	test_reparse_flat: INTEGER is
			-- parse archetype and return result
		local
			new_adl_file_path: STRING
		do
			Result := test_failed
			if overwrite then
				new_adl_file_path := archetype_compiler.target.full_path
			else
				new_adl_file_path := file_system.pathname (system_temp_file_directory, file_system.basename (archetype_compiler.target.full_path))
			end

			-- FIXME: these are the right paths, but we don't yet have a way of overriding the source
			-- of an archetype from what is in its file
			-- DO SOMETHING HERE

			archetype_compiler.parse_archetype

			if archetype_compiler.archetype_valid then
				Result := test_passed
				test_status.append ("Parse succeeded%N" + archetype_compiler.status)
			else
				test_status.append ("Parse failed; reason: " + archetype_compiler.status + "%N")
			end
		end

	test_diff: INTEGER is
			-- parse archetype and return result
		local
			new_adl_file_path: STRING
			orig_arch_source, new_arch_source: STRING
		do
			Result := Test_failed

			if not overwrite then
				orig_arch_source := archetype_compiler.flat_text

				new_adl_file_path := file_system.pathname (system_temp_file_directory, file_system.basename (archetype_compiler.target.full_path))
				-- FIXME: DO SOMETIHNG HERE TO OPEN THE NEW FILE
				new_arch_source := archetype_compiler.serialised_flat

				if orig_arch_source.count = new_arch_source.count then
					if orig_arch_source.is_equal (new_arch_source) then
						Result := Test_passed
					else
						test_status.append ("Archetype source lengths same but texts differ%N")
					end
				else
					test_status.append ("Archetype source lengths differ: original =  " + orig_arch_source.count.out +
						"; new = " + new_arch_source.count.out + "%N")
				end
			else
				Result := Test_not_applicable
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	grid: EV_GRID
			-- reference to MAIN_WINDOW.archetype_test_tree_grid

	grid_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- Stack used during `populate_gui_tree_node_enter'.

	test_status: STRING
			-- Cumulative status message during running of test.

	populate_gui_tree_node_enter (an_item: ARCH_REP_ITEM) is
			-- Add a node representing `an_item' to `gui_file_tree'.
		require
			an_item /= Void
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			pixmap: EV_PIXMAP
			ada: ARCH_REP_ARCHETYPE
			col_csr: INTEGER
		do
			row := grid_row_stack.item
			row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)
			row.insert_subrow (row.subrow_count + 1)
			row := row.subrow (row.subrow_count)
			add_checkbox (row)
			create gli.make_with_text (utf8 (an_item.base_name))
			row.set_item (1, gli)
			gli.set_data (an_item)
			pixmap := pixmaps [an_item.group_name]

			if pixmap /= Void then
				gli.set_pixmap (pixmap)
			end

			ada ?= an_item

			if ada /= Void then
				from
					tests.start
					col_csr := first_test_col
				until
					tests.off
				loop
					row.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text ("?"))
					tests.forth
					col_csr := col_csr + 1
				end
			end

			grid_row_stack.extend (row)
		end

	populate_gui_tree_node_exit (an_item: ARCH_REP_ITEM) is
		do
			grid_row_stack.remove
		end

	add_checkbox (row: EV_GRID_ROW)
			-- Add the checkbox column to `row'.
		require
			row_attached: row /= Void
		local
			item: EV_GRID_CHECKABLE_LABEL_ITEM
		do
			create item
			row.set_item (2, item)
			item.set_is_checked (True)
			item.pointer_button_press_actions.force_extend (agent set_checkboxes_recursively (item))
		ensure
			at_least_2_columns: row.count >= 2
		end

	set_checkboxes_recursively (item: EV_GRID_CHECKABLE_LABEL_ITEM)
			-- For all sub-items of `item', set their check boxes to match `item', recursively.
		require
			item_attached: item /= Void
		local
			i: INTEGER
			sub_item: EV_GRID_CHECKABLE_LABEL_ITEM
		do
			from
				i := item.row.subrow_count
			until
				i = 0
			loop
				sub_item ?= item.row.subrow (i).item (item.column.index)
				i := i - 1

				if sub_item /= Void then
					sub_item.set_is_checked (item.is_checked)
					set_checkboxes_recursively (sub_item)
				end
			end
		end

	on_grid_key_press (key: EV_KEY)
			-- Process keystrokes in `grid' to scroll, expand and collapse rows, etc.
		local
			selected: EV_GRID_ITEM
			checkbox: EV_GRID_CHECKABLE_LABEL_ITEM
		do
			if key /= Void then
				if not ev_application.shift_pressed and not ev_application.alt_pressed then
					if ev_application.ctrl_pressed then
						if key.code = {EV_KEY_CONSTANTS}.key_up then
							key.set_code ({EV_KEY_CONSTANTS}.key_menu)
							scroll_to_row (grid.first_visible_row.index - 1)
						elseif key.code = {EV_KEY_CONSTANTS}.key_down then
							key.set_code ({EV_KEY_CONSTANTS}.key_menu)

							if grid.visible_row_indexes.count > 1 then
								scroll_to_row (grid.visible_row_indexes [2])
							end
						elseif key.code = {EV_KEY_CONSTANTS}.key_home then
							scroll_to_row (1)
						elseif key.code = {EV_KEY_CONSTANTS}.key_end then
							scroll_to_row (grid.row_count)
						elseif key.code = {EV_KEY_CONSTANTS}.key_page_up then
							scroll_to_row (index_of_viewable_offset_from_row (grid.first_visible_row.index, 1 - grid.visible_row_indexes.count))
						elseif key.code = {EV_KEY_CONSTANTS}.key_page_down then
							scroll_to_row (grid.last_visible_row.index)
						end
					elseif key.code = {EV_KEY_CONSTANTS}.key_home then
						step_to_row (1)
					elseif key.code = {EV_KEY_CONSTANTS}.key_end then
						step_to_row (grid.row_count)
					elseif not grid.selected_items.is_empty then
						selected := grid.selected_items.first

						if key.code = {EV_KEY_CONSTANTS}.key_page_up then
							step_to_row (index_of_viewable_offset_from_row (selected.row.index, 1 - grid.visible_row_indexes.count))
						elseif key.code = {EV_KEY_CONSTANTS}.key_page_down then
							step_to_row (index_of_viewable_offset_from_row (selected.row.index, grid.visible_row_indexes.count - 1))
						elseif key.code = {EV_KEY_CONSTANTS}.key_numpad_multiply then
							expand_tree (selected.row)
						elseif key.code = {EV_KEY_CONSTANTS}.key_numpad_add or key.code = {EV_KEY_CONSTANTS}.key_right then
							if selected.row.is_expandable then
								selected.row.expand
							end
						elseif key.code = {EV_KEY_CONSTANTS}.key_numpad_subtract then
							if selected.row.is_expanded then
								selected.row.collapse
							end
						elseif key.code = {EV_KEY_CONSTANTS}.key_left then
							if selected.column.index = 1 then
								if selected.row.is_expanded then
									selected.row.collapse
								elseif selected.row.parent_row /= Void then
									step_to_row (selected.row.parent_row.index)
								end
							end
						elseif key.code = {EV_KEY_CONSTANTS}.key_back_space then
							if selected.row.parent_row /= Void then
								step_to_row (selected.row.parent_row.index)
							end
						elseif key.code = {EV_KEY_CONSTANTS}.key_space then
							checkbox ?= selected

							if checkbox /= Void then
								checkbox.toggle_is_checked
								set_checkboxes_recursively (checkbox)
							end
						end
					end
				end
			end
		end

	on_mouse_wheel (step: INTEGER) is
			-- Scroll `grid' when the mouse wheel moves.
		do
			if step > 0 then
				scroll_to_row (grid.first_visible_row.index - step)
			else
				scroll_to_row (grid.visible_row_indexes [grid.visible_row_indexes.count.min (1 - step)])
			end
		end

	scroll_to_row (index: INTEGER)
			-- Scroll `grid' so the row at `index' is at the top.
		local
			i: INTEGER
		do
			i := index.max (1).min (grid.row_count)
			grid.set_first_visible_row (i)
		end

	step_to_row (index: INTEGER)
			-- Select the row at `index'.
		local
			row: EV_GRID_ROW
		do
			row := grid.row (index_of_viewable_offset_from_row (index, 0))

			if not row.item (1).is_selected then
				grid.remove_selection
				row.item (1).enable_select
				row.ensure_visible
			end
		end

	step_to_viewable_parent_of_selected_row
			-- Select `row' or one its parents, such that the selected row is not hidden within a collapsed parent.
		do
			if not grid.selected_items.is_empty then
				step_to_row (grid.selected_items.first.row.index)
			end
		end

	index_of_viewable_offset_from_row (index, offset: INTEGER): INTEGER
			-- The index of the row at viewable `offset' from the row at `index'.
		local
			indexes: ARRAYED_LIST [INTEGER]
			i: INTEGER
		do
			from
				indexes := grid.viewable_row_indexes
				i := indexes.count
			until
				i = 1 or else indexes [i] <= index
			loop
				i := i - 1
			end

			Result := indexes [(i + offset).max (1).min (indexes.count)]
		end

	expand_tree (row: EV_GRID_ROW)
			-- Expand `row' and all of its sub-rows, recursively.
		require
			row_attached: row /= Void
		local
			i: INTEGER
		do
			if row.is_expandable then
				row.expand

				from
					i := 1
				until
					i > row.subrow_count
				loop
					expand_tree (row.subrow (i))
					i := i + 1
				end
			end
		ensure
			row_expanded: row.is_expandable implies row.is_expanded
		end

	collapse_tree (row: EV_GRID_ROW)
			-- Collapse `row' and all of its sub-rows, recursively.
		require
			row_attached: row /= Void
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > row.subrow_count
			loop
				collapse_tree (row.subrow (i))
				i := i + 1
			end

			row.collapse
		ensure
			row_collapsed: not row.is_expanded
		end

	set_archetype_test_go_bn_icon is
			-- Set go button to be either "go" or "stop" icon depending on
			-- setting of test_execution_underway
		do
			if test_execution_underway then
				gui.archetype_test_go_bn.set_pixmap (pixmaps ["stop"])
				gui.archetype_test_go_bn.set_text ("Stop")
			else
				gui.archetype_test_go_bn.set_pixmap (pixmaps ["go"])
				gui.archetype_test_go_bn.set_text ("Go")
			end
		end

	display_arrayed_list (str_lst: ARRAYED_LIST [STRING]): STRING is
			--
		require
			str_lst /= Void
		do
			create Result.make_empty

			from
				str_lst.start
			until
				str_lst.off
			loop
				if not str_lst.isfirst then
					Result.append (", ")
				end

				Result.append (str_lst.item)
				str_lst.forth
			end
		end

invariant
	grid_attached: grid /= Void

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
