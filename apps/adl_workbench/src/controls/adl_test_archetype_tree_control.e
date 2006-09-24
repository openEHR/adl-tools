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


class ADL_TEST_ARCHETYPE_TREE_CONTROL

inherit	
	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_ADL_INTERFACE
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

create
	make

feature -- Definitions

	First_test_col: INTEGER is 3
			-- number of first column in grid to be used for test results
			
	First_data_row: INTEGER is 2
			-- number of first row containing real information (top row contains root node)
			
feature -- Initialisation

	make(a_main_window: MAIN_WINDOW) is
			-- create tree control repersenting archetype files found in repository_path
		require
			a_main_window /= Void
		do
			gui := a_main_window
			gui_grid := gui.archetype_test_tree_grid
			gui_grid.enable_tree
			
			gui.archetype_test_go_bn.set_pixmap (pixmaps.item("go"))
		end

feature -- Access

	selected_file_path: STRING
			-- full path of file selected from tree control
			
	has_selected_file: BOOLEAN
			-- True if a file was selected
			
	tests: DS_HASH_TABLE [FUNCTION [ANY, TUPLE[STRING], BOOLEAN], STRING] is
			-- table of test routines 
		once
			create Result.make(4)
			Result.put(agent test_parse, "Parse")
			Result.put(agent test_save_html, "Save to HTML")
			Result.put(agent test_save_adl, "Save to ADL")
			Result.put(agent test_reparse, "Reparse")
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
		
	check_all_set: BOOLEAN
			-- True means all rows checked for test execution
			
	test_execution_underway: BOOLEAN
			-- True during a test run
				
	test_stop_requested: BOOLEAN
			-- user requested stop

feature -- Commands
	
	clear is
			-- wipe out content from controls
		do
			gui_grid.wipe_out
			gui.test_status_area.set_text ("")
			has_selected_file := False
		end
		
	populate is
			-- populate the ADL tree control by creating it from scratch
		local
			gli: EV_GRID_LABEL_ITEM
			col_csr: INTEGER
		do
			clear
 			create gui_grid_row_stack.make(0)
 			
 			-- populate first column with archetype tree
			create gli.make_with_text ("Root")
			gui_grid.set_item (1, 1, gli)
			gui_grid_row_stack.extend(gli.row)
			
 			populate_gui_tree(archetype_directory.directory)
			gui_grid.column (1).set_title ("Archetype")

			-- put names on columns
			if gui_grid.column_count > 1 then
				from
					tests.start
					col_csr := First_test_col
				until
					tests.off
				loop
					gui_grid.column (col_csr).set_title (tests.key_for_iteration)				
					tests.forth
					col_csr := col_csr + 1
				end			
			end
			
			is_expanded := False
			toggle_expand_tree

			check_all_set := True
			gui.arch_test_toggle_check_all_bn.set_text("Uncheck All")
			gui.arch_test_processed_count.set_text("0")
			gui.remove_unused_codes_rb.disable_select
			gui.overwrite_adl_rb.disable_select
		end
		
	item_select is
			-- do something when an item is selected
		local
			arch_item: ARCHETYPE_DIRECTORY_ARCHETYPE
		do
			arch_item ?= gui_grid.selected_rows.first.data
			if arch_item /= Void then
				has_selected_file := True
				selected_file_path := arch_item.full_path
			end
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
			arch_item: ARCHETYPE_DIRECTORY_ARCHETYPE
			row_csr, col_csr: INTEGER
			test_passed: BOOLEAN
			gr: EV_GRID_ROW
			gli_col_2, gli: EV_GRID_LABEL_ITEM
			res_label: STRING
			checked: BOOLEAN_REF
			item_is_checked: BOOLEAN
		do
			test_execution_underway := True
			test_stop_requested := False
			set_archetype_test_go_bn_icon
			overwrite := gui.overwrite_adl_rb.is_selected
			remove_unused_codes := gui.remove_unused_codes_rb.is_selected
			from
				row_csr := First_data_row
				last_tested_archetypes_count := 0
			until
				row_csr > gui_grid.row_count or test_stop_requested
			loop
				gr := gui_grid.row(row_csr)
				arch_item ?= gr.item (1).data
				if arch_item /= Void then		
					gli_col_2 ?= gr.item(2)
					checked ?= gli_col_2.data
					if checked /= Void then
						item_is_checked := checked.item
					end
					
					if item_is_checked then					
						gr.ensure_visible
						gui.parent_app.process_events
						from
							tests.start
							col_csr := First_test_col
							test_passed := True
						until
							tests.off or not test_passed
						loop
							gr.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text("processing..."))
							gui.parent_app.process_events
						
							create test_status.make(0)

							test_passed := tests.item_for_iteration.item ([arch_item.full_path])
							if test_passed then
								res_label := "pass"
							else
								res_label := "fail"
							end
							create gli.make_with_text("")
							gli.set_pixmap(pixmaps.item(res_label))
							gr.set_item (col_csr, gli)
					
							if not test_status.is_empty then
								gui.test_status_area.append_text ("--------------- " + arch_item.id.as_string + " -----------------%N" + test_status)
							end
							gui.parent_app.process_events
						
							tests.forth
							col_csr := col_csr + 1
						end
						toggle_checkbox_at_cell(gli_col_2)
						last_tested_archetypes_count := last_tested_archetypes_count + 1
						gui.arch_test_processed_count.set_text(last_tested_archetypes_count.out)
						gui.parent_app.process_events
					end
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
				collapse_tree(gui_grid.row (1))
				gui.arch_test_tree_toggle_expand_bn.set_text("Expand Tree")
				is_expanded := False
			else
				expand_tree(gui_grid.row (1))
				gui.arch_test_tree_toggle_expand_bn.set_text("Collapse Tree")
				is_expanded := True
			end
			gui_grid.column(1).resize_to_content
		end

	toggle_check_all is
			-- toggle status of check_all
		local
			arch_item: ARCHETYPE_DIRECTORY_ARCHETYPE
			row_csr: INTEGER
			gr: EV_GRID_ROW
			gli_col_2: EV_GRID_LABEL_ITEM
			checked: BOOLEAN_REF
		do
			if check_all_set then
				check_all_set := False
				gui.arch_test_toggle_check_all_bn.set_text("Check All")
			else
				check_all_set := True
				gui.arch_test_toggle_check_all_bn.set_text("Uncheck All")
			end
			
			from
				row_csr := First_data_row
			until
				row_csr > gui_grid.row_count
			loop
				gr := gui_grid.row(row_csr)
				arch_item ?= gr.item (1).data
				if arch_item /= Void then		
					gli_col_2 ?= gr.item(2)
					if gli_col_2 /= Void then
						checked ?= gli_col_2.data
						if check_all_set then
							gli_col_2.set_pixmap(pixmaps.item("checked_box"))
							checked.set_item(True)
						else
							gli_col_2.set_pixmap(pixmaps.item("unchecked_box"))
							checked.set_item(False)
						end
					end
				end
				row_csr := row_csr + 1
			end
		end
		
feature -- Tests

	test_parse (arch_file_path: STRING): BOOLEAN is
			-- parse archetype and return result
		local
			unused_at_codes, unused_ac_codes: ARRAYED_LIST[STRING]
		do
			adl_interface.reset
			adl_interface.open_adl_file(arch_file_path)
			if adl_interface.archetype_source_loaded then
				adl_interface.parse_archetype
				if adl_interface.parse_succeeded then
					Result := True
					if remove_unused_codes then
						unused_at_codes := adl_interface.archetype.ontology_unused_term_codes
						unused_ac_codes := adl_interface.archetype.ontology_unused_constraint_codes
						if not unused_at_codes.is_empty or not unused_ac_codes.is_empty then					
							test_status.append(">>>>>>>>>> removing unused codes%N")
							if not unused_at_codes.is_empty then					
								test_status.append("Unused AT codes: " + display_arrayed_list(unused_at_codes) + "%N")
							end
							if not unused_ac_codes.is_empty then					
								test_status.append("Unused AC codes: " + display_arrayed_list(unused_ac_codes) + "%N")
							end
							adl_interface.archetype.ontology_remove_unused_codes
						end
					end
				else
					test_status.append("Parse failed; reason: " + adl_interface.status + "%N")
				end
			else
				test_status.append("Source file for archetype " + arch_file_path + " not found%N")
			end
		end
			
	test_save_html (arch_file_path: STRING): BOOLEAN is
			-- parse archetype and return result
		local
			html_fname: STRING
		do
			if adl_interface.parse_succeeded then
				html_fname := arch_file_path.twin
				html_fname.replace_substring(".html", html_fname.count - Archetype_file_extension.count, html_fname.count)
				adl_interface.save_archetype(html_fname, "html")
				if adl_interface.save_succeeded then
					Result := True
				else
					test_status.append(adl_interface.status + "%N")
				end
			end
		end
			
	test_save_adl (arch_file_path: STRING): BOOLEAN is
			-- parse archetype and return result
		local
			new_adl_file: STRING
		do
			if adl_interface.parse_succeeded then
				new_adl_file := arch_file_path.twin
				if not overwrite then
					new_adl_file.append("x")
				end
				adl_interface.save_archetype(new_adl_file, "adl")
				if adl_interface.save_succeeded then
					Result := True
				else
					test_status.append(adl_interface.status + "%N")
				end
			end
		end

	test_reparse (arch_file_path: STRING): BOOLEAN is
			-- parse archetype and return result
		local
			new_adl_file: STRING
		do
			new_adl_file := arch_file_path.twin
			if not overwrite then
				new_adl_file.append("x")
			end
			adl_interface.open_adl_file(new_adl_file)
			if adl_interface.archetype_source_loaded then
				adl_interface.parse_archetype
				if adl_interface.parse_succeeded then
					Result := True
				else
					test_status.append("Parse failed; reason: " + adl_interface.status + "%N")
				end
			else
				test_status.append("Source file for archetype " + new_adl_file + " not found%N")
			end
		end
			
feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system
	
	gui_grid: EV_GRID
			-- reference to MAIN_WINDOW.archetype_test_tree_grid

	gui_grid_row_stack: ARRAYED_STACK[EV_GRID_ROW]
			-- stack used duing population
	
	test_status: STRING
			-- cumulative status message during running of test

	populate_gui_tree(node: TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM])  is
			-- add archetype ids found in directory and subdirectories to file_ids table
		require
			node /= Void
   		do
  			from
 				node.child_start
 			until
 				node.child_off
 			loop		
				populate_gui_tree_item(node.child_item)
 				populate_gui_tree(node.child)
				gui_grid_row_stack.remove
 				node.child_forth
 			end
   		end	
   		
   	populate_gui_tree_item(an_item: ARCHETYPE_DIRECTORY_ITEM) is
   			--
		require
			an_item /= Void
   		local
			gli: EV_GRID_LABEL_ITEM
   			ada: ARCHETYPE_DIRECTORY_ARCHETYPE
   			adf: ARCHETYPE_DIRECTORY_FOLDER
   			gr: EV_GRID_ROW
 			col_csr: INTEGER
 			checked: BOOLEAN_REF
  		do
 			gui_grid_row_stack.item.insert_subrow(gui_grid_row_stack.item.subrow_count + 1)
			gr := gui_grid_row_stack.item.subrow(gui_grid_row_stack.item.subrow_count)
  			adf ?= an_item
   			if adf /= Void then
				-- First column (explorer)
 				create gli.make_with_text(adf.base_name)
				gli.set_pixmap(pixmaps.item("file_folder"))
				gli.set_data(adf)
				gr.set_item(1, gli)
			else
				ada ?= an_item
				if ada /= Void then
					-- First column (explorer)
					create gli.make_with_text(ada.id.domain_concept + "(" + ada.id.version_id + ")")
					gli.set_data(ada)
					if ada.id.is_specialised then
						gli.set_pixmap(pixmaps.item("archetype_specialised"))
					else
						gli.set_pixmap(pixmaps.item("archetype"))
					end
					gr.set_item(1, gli)
					
					-- second column (check box)
					create gli.make_with_text("")
					gli.set_pixmap(pixmaps.item("checked_box"))
					create checked
					checked.set_item(True)
					gli.set_data (checked)
					gli.select_actions.extend (agent toggle_selected_checkbox)
					gr.set_item (2, gli)

					-- test columns
					from
						tests.start
						col_csr := First_test_col
					until
						tests.off
					loop
						gr.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text("?"))
						tests.forth
						col_csr := col_csr + 1
					end										
				end
   			end
			gui_grid_row_stack.extend(gr)
		end

	toggle_selected_checkbox is
			-- routine set in select_actions list on column 2 to toggle checkbox 
			-- indicating whether to include archetype or not
		local
			gli: EV_GRID_LABEL_ITEM
		do
			gli ?= gui_grid.selected_items.first
			if gli /= Void then
				toggle_checkbox_at_cell(gli)
			end
			gli.disable_select
		end
		
	toggle_checkbox_at_cell(gli: EV_GRID_LABEL_ITEM) is
			-- routine set in select_actions list on column 2 to toggle checkbox 
			-- indicating whether to include archetype or not
		local
			checked: BOOLEAN_REF
		do
			checked ?= gli.data
			if checked /= Void then
				if checked.item then
					gli.set_pixmap(pixmaps.item("unchecked_box"))
					checked.set_item(False)
				else
					gli.set_pixmap(pixmaps.item("checked_box"))
					checked.set_item(True)
				end
			end
		end
		
	expand_tree(a_grid_row: EV_GRID_ROW) is
			-- expand this row and all sub rows
		local
			i: INTEGER
		do
			if a_grid_row.subrow_count > 0 then
				a_grid_row.expand
				from
					i := 1
				until
					i > a_grid_row.subrow_count
				loop
					expand_tree(a_grid_row.subrow (i))
					i := i + 1
				end
			end
		end
		
	collapse_tree(a_grid_row: EV_GRID_ROW) is
			-- collapse this row and all sub rows
		local
			i: INTEGER
		do
			if a_grid_row.subrow_count > 0 then
				from
					i := 1
				until
					i > a_grid_row.subrow_count
				loop
					collapse_tree(a_grid_row.subrow (i))
					i := i + 1
				end
				a_grid_row.collapse
			end
		end
		
	set_archetype_test_go_bn_icon is
			-- Set go button to be either "go" or "stop" icon depending on 
			-- setting of test_execution_underway
		do		
			if test_execution_underway then
				gui.archetype_test_go_bn.set_pixmap (pixmaps.item("stop"))
				gui.archetype_test_go_bn.set_text ("Stop")
			else
				gui.archetype_test_go_bn.set_pixmap (pixmaps.item("go"))
				gui.archetype_test_go_bn.set_text ("Go")
			end
		end
		
	display_arrayed_list(str_lst: ARRAYED_LIST[STRING]):STRING is
			-- 
		require
			str_lst /= Void
		do
			create Result.make(0)
			from
				str_lst.start
			until
				str_lst.off
			loop
				if not str_lst.isfirst then
					Result.append(", ")
				end
				Result.append(str_lst.item)
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
