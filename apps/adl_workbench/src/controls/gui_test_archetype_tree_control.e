note
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL test workbench"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL:  $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate:  $"


class GUI_TEST_ARCHETYPE_TREE_CONTROL

inherit
	GUI_GRID_CONTROLLER
		redefine
			on_grid_key_press
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	First_test_col: INTEGER = 3
			-- Number of first column in grid to be used for test results.

	Test_passed: INTEGER = 101

	Test_failed: INTEGER = 102

	Test_not_applicable: INTEGER = 103

	Test_unknown: INTEGER = 104

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
			-- Create controller for the test grid.
		require
			a_main_window /= Void
		do
			gui := a_main_window
			make_for_grid (gui.archetype_test_tree_grid)
			grid.enable_tree
			gui.archetype_test_go_bn.set_pixmap (pixmaps ["go"])
		end

feature -- Access

	tests: DS_HASH_TABLE [FUNCTION [ANY, TUPLE, INTEGER], STRING]
			-- table of test routines
		once
			create Result.make (0)
			Result.force (agent test_parse, "Parse")
			Result.force (agent test_save_flat, "Save flat")
			Result.force (agent test_save_differential, "Save diff")
--			Result.force (agent test_reparse_differential, "Reparse")
--			Result.force (agent test_diff, "Diff")
		end

	last_tested_archetypes_count: INTEGER
			-- Number of archetypes tested in last run.

feature -- Status Setting

	is_expanded: BOOLEAN
			-- True if archetype tree is in expanded state

	remove_unused_codes: BOOLEAN
			-- True means remove unused codes from every archetype	

	test_execution_underway: BOOLEAN
			-- True during a test run

	test_stop_requested: BOOLEAN
			-- user requested stop

feature -- Commands

	clear
			-- Wipe out content from widgets.
		do
			grid.wipe_out
			gui.test_status_area.remove_text
			create grid_row_stack.make(0)
			reset_output_directories
		end

	reset_output_directories
			-- set output directories, currently just the test diff output location.
			-- this is test_diff_directory/$current_profile/orig and test_diff_directory/$current_profile/new
		do
			diff_dir_root := file_system.pathname (test_diff_directory, current_repository_profile)
			diff_dirs_not_available := False
			diff_orig_dir := file_system.pathname (diff_dir_root, "orig")
			if not file_system.directory_exists (diff_orig_dir) then
				file_system.recursive_create_directory (diff_orig_dir)
			end
			if file_system.directory_exists (diff_orig_dir) then
				diff_new_dir := file_system.pathname (diff_dir_root, "new")
				if not file_system.directory_exists (diff_new_dir) then
					file_system.recursive_create_directory (diff_new_dir)
				end
				if not file_system.directory_exists (diff_new_dir) then
					diff_dirs_not_available := True
				end
			else
				diff_dirs_not_available := True
			end
		end

	populate
			-- populate the ADL tree control by creating it from scratch
		local
			gli: EV_GRID_LABEL_ITEM
			col_csr: INTEGER
		do
			clear
 			arch_dir.do_all (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)

			-- put names on columns
			grid.column (1).set_title ("Archetype")
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
		end

	archetype_test_go_stop
			-- Start or stop a test run.
		local
			dialog: EV_WARNING_DIALOG
			message: STRING
		do
			if test_execution_underway then
				test_stop_requested := True
			else
				test_stop_requested := False

--				if gui.save_adlf_check_button.is_selected and gui.save_adls_check_button.is_selected then
--					message := ".adlf and .adls"
--				elseif gui.save_adlf_check_button.is_selected then
--					message := ".adlf"
--				elseif gui.save_adls_check_button.is_selected then
--					message := ".adls"
--				end

--				if message /= Void then
--					message := "This will overwrite all selected " + message + " files.%N%NDo you want to continue?";
--					create dialog.make_with_text (message)
--					dialog.set_title ("Overwriting Archetypes")
--					dialog.set_buttons (<<"Stop", "Go">>)
--					dialog.show_modal_to_window (gui)
--					test_stop_requested := dialog.selected_button.is_equal ("Stop")
--				end

				test_execution_underway := True
				gui.archetype_test_go_bn.set_pixmap (pixmaps ["stop"])
				gui.archetype_test_go_bn.set_text ("Stop")
				run_tests
				test_execution_underway := False
				gui.archetype_test_go_bn.set_pixmap (pixmaps ["go"])
				gui.archetype_test_go_bn.set_text ("Go")
			end
		end

	run_tests
			-- Execute tests on all marked archetypes.
		local
			row_csr: INTEGER
		do
			remove_unused_codes := gui.remove_unused_codes_rb.is_selected

			last_tested_archetypes_count := 0
			from row_csr := 1 until row_csr > grid.row_count or test_stop_requested loop
				run_tests_on_row (grid.row (row_csr))
				row_csr := row_csr + 1
			end

			gui.test_status_area.append_text ("****** Executed tests on " + last_tested_archetypes_count.out + " Archetypes ******%N")
			gui.populate_statistics
		end

	run_tests_on_row (row: EV_GRID_ROW)
			-- Execute tests the archetype attached to `row' if it is marked for testing.
		local
			col_csr: INTEGER
			gli: EV_GRID_LABEL_ITEM
			res_label: STRING
			test_result: INTEGER
		do
			if attached {EV_GRID_CHECKABLE_LABEL_ITEM} row.item (2) as checkbox and then checkbox.is_checked then
				target ?= row.data

				if target /= Void then
					row.ensure_visible

					from
						tests.start
						col_csr := first_test_col
						test_result := test_unknown
					until
						tests.off or test_result = test_failed
					loop
						row.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text ("processing..."))

						create test_status.make_empty

						test_result := tests.item_for_iteration.item ([])

						inspect test_result
						when test_passed then
							res_label := "test_passed"
						when test_failed then
							res_label := "test_failed"
						when test_not_applicable then
							res_label := "test_not_applicable"
						else

						end

						create gli
						gli.set_pixmap (pixmaps [res_label])
						row.set_item (col_csr, gli)

						if not test_status.is_empty then
							gui.test_status_area.append_text ("--------------- " + target.id.as_string + " -----------------%N" + test_status)
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
		end

	toggle_expand_tree
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

   	set_row_pixmap (row: EV_GRID_ROW)
   			-- Set the icon appropriate to the item attached to `row'.
		require
			row_attached: row /= Void
   		local
			pixmap: EV_PIXMAP
   		do
			if attached {EV_GRID_LABEL_ITEM} row.item (1) as gli and attached {ARCH_REP_ITEM} row.data as ari then
				pixmap := pixmaps [ari.group_name]
				if pixmap /= Void then
					gli.set_pixmap (pixmap)
				end
			end
		end

	do_row_for_item (an_item: ARCH_REP_ITEM; action: PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
   			-- Perform `action' for the row containing `an_item', if any.
		require
			action_attached: action /= Void
   		local
   			i: INTEGER
			row: EV_GRID_ROW
   		do
			if an_item /= Void then
				from i := grid.row_count until i = 0 loop
					row := grid.row (i)

					if row.data /= Void and then row.data.is_equal (an_item) then
						action.call ([row])
						i := 0
					else
						i := i - 1
					end
				end
			end
		end

feature {NONE} -- Tests

	test_parse: INTEGER
			-- parse archetype and return result
		local
			unused_at_codes, unused_ac_codes: ARRAYED_LIST [STRING]
			orig_fn: STRING
		do
			Result := test_failed
			archetype_compiler.rebuild_lineage (target)

			if target.is_valid then
				Result := test_passed
				test_status.append (" parse succeeded%N" + target.compilation_result)

				if remove_unused_codes then
					unused_at_codes := target.differential_archetype.ontology_unused_term_codes
					unused_ac_codes := target.differential_archetype.ontology_unused_constraint_codes

					if not unused_at_codes.is_empty or not unused_ac_codes.is_empty then
						test_status.append (">>>>>>>>>> removing unused codes%N")

						if not unused_at_codes.is_empty then
							test_status.append ("Unused AT codes: " + display_arrayed_list (unused_at_codes) + "%N")
						end

						if not unused_ac_codes.is_empty then
							test_status.append ("Unused AC codes: " + display_arrayed_list (unused_ac_codes) + "%N")
						end

						target.differential_archetype.remove_ontology_unused_codes
					end
				end

				orig_fn := file_system.pathname (diff_orig_dir, target.ontological_name + Archetype_source_file_extension)
				target.save_differential_as (orig_fn, Archetype_native_syntax)
			else
				test_status.append (" parse failed%N" + target.compilation_result)
			end
		end

	test_save_flat: INTEGER
			-- parse archetype, save in flat form and return result
		do
			Result := test_failed
			if target.is_valid then
				target.save_flat
				if target.save_succeeded then
					Result := test_passed
				else
					test_status.append (target.status + "%N")
				end
			else
				Result := test_not_applicable
			end
		end

	test_save_differential: INTEGER
			-- parse archetype, save in source form and return result
		local
			new_fn: STRING
		do
			Result := test_failed
			if target.is_valid then
				target.serialise_differential
				new_fn := file_system.pathname (diff_new_dir, target.ontological_name + Archetype_source_file_extension)
				target.save_differential_as (new_fn, Archetype_native_syntax)
				if target.status.is_empty then
					Result := test_passed
				else
					test_status.append (target.status + "%N")
				end
			else
				Result := test_not_applicable
			end
		end

--	test_reparse_differential: INTEGER
--			-- parse archetype and return result
--		do
--			Result := test_failed
--			target.parse
--			if target.is_valid then
--				target.serialise_differential
--				Result := test_passed
--				test_status.append ("Parse succeeded%N" + target.compilation_result)
--			else
--				test_status.append ("Parse failed; reason: " + target.compilation_result + "%N")
--			end
--		end

--	test_diff: INTEGER
--			-- parse archetype and return result
--		local
--			new_source: STRING
--		do
--			Result := Test_failed
--			if target.is_valid and target.test_differential_text /= Void then
--				if target.differential_text.count = target.test_differential_text.count then
--					if target.differential_text.same_string (target.test_differential_text) then
--						Result := Test_passed
--					else
--						test_status.append ("Archetype source lengths same but texts differ%N")
--					end
--				else
--					test_status.append ("Archetype source lengths differ: original =  " + target.test_differential_text.count.out + "; new = " + target.test_differential_text.count.out + "%N")
--				end
--			else
--				Result := test_not_applicable
--			end
--		end

feature {NONE} -- Implementation

	diff_dirs_not_available: BOOLEAN
			-- flag to indicate whether output directories for diff files are available and writable

	diff_dir_root: STRING
			-- directory root to diff file output, at test_diff_directory/$current_profile

	diff_orig_dir: STRING
			-- directory where copies of original .adls files go

	diff_new_dir: STRING
			-- directory where first generation serialised .adls files go

	gui: MAIN_WINDOW
			-- main window of system

	grid_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- Stack used during `populate_gui_tree_node_enter'.

	test_status: STRING
			-- Cumulative status message during running of test.

	target: ARCH_REP_ARCHETYPE
			-- current target of compilation operation

	populate_gui_tree_node_enter (ari: ARCH_REP_ITEM)
			-- Add a node representing `an_item' to `gui_file_tree'.
		require
			ari /= Void
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			col_csr: INTEGER
		do
			if ari.has_artefacts or ari.is_root then
				create gli.make_with_text (utf8 (ari.display_name))
				if grid_row_stack.is_empty then
					grid.set_item (1, 1, gli)
					row := gli.row
					gli.enable_select
				else
					row := grid_row_stack.item
					row.collapse_actions.extend (agent step_to_viewable_parent_of_selected_row)

					-- create a new sub row
					row.insert_subrow (row.subrow_count + 1)

					-- get the sub row
					row := row.subrow (row.subrow_count)
					row.set_item (1, gli)
				end
				add_checkbox (row)
				row.set_data (ari)
				set_row_pixmap (row)
				grid_row_stack.extend (row)

				if attached {ARCH_REP_ARCHETYPE} ari as ara then
					gli.set_tooltip (utf8 (ara.full_path))
					col_csr := first_test_col
					from tests.start until tests.off loop
						row.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text ("?"))
						tests.forth
						col_csr := col_csr + 1
					end
				end
			end
		end

	populate_gui_tree_node_exit (an_item: ARCH_REP_ITEM)
		do
			if an_item.has_artefacts then
				grid_row_stack.remove
			end
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
			from i := item.row.subrow_count until i = 0 loop
				sub_item ?= item.row.subrow (i).item (item.column.index)
				i := i - 1
				if sub_item /= Void then
					sub_item.set_is_checked (item.is_checked)
					set_checkboxes_recursively (sub_item)
				end
			end
		end

	on_grid_key_press (key: EV_KEY)
			-- When the user presses the space key, toggle the selected check box.
		local
			checkbox: EV_GRID_CHECKABLE_LABEL_ITEM
		do
			Precursor (key)

			if not (ev_application.shift_pressed or ev_application.alt_pressed or ev_application.ctrl_pressed) then
				if key /= Void and then key.code = key_space then
					checkbox ?= selected_cell
					if checkbox /= Void then
						checkbox.toggle_is_checked
						set_checkboxes_recursively (checkbox)
					end
				end
			end
		end

	display_arrayed_list (str_lst: ARRAYED_LIST [STRING]): STRING
			--
		require
			str_lst /= Void
		do
			create Result.make_empty

			from str_lst.start until str_lst.off loop
				if not str_lst.isfirst then
					Result.append (", ")
				end

				Result.append (str_lst.item)
				str_lst.forth
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
--| The Original Code is gui_test_archetype_tree_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
