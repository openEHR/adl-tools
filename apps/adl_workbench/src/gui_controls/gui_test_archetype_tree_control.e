note
	component:   "openEHR Archetype Project"
	description: "Test page in ADL test workbench"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_TEST_ARCHETYPE_TREE_CONTROL

inherit
	EV_SHARED_APPLICATION
		export
			{NONE} all;
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all;
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_ADL_ENGINE
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

	GUI_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Diff_source: INTEGER = 1
	Diff_flat: INTEGER = 2
	Diff_source_flat: INTEGER = 3
	Diff_round_trip: INTEGER = 4

	First_test_col: INTEGER = 3
			-- Number of first column in grid to be used for test results.

	Test_passed: INTEGER = 101

	Test_failed: INTEGER = 102

	Test_not_applicable: INTEGER = 103

	Test_unknown: INTEGER = 104

	Regression_test_key: STRING = "Regression"

	Regression_fail_code: STRING = "FAIL"

	Regression_pass_code: STRING = "PASS"

	status_area_min_height: INTEGER = 65

feature {NONE} -- Initialisation

	make (an_info_feedback_agent: like info_feedback_agent)
		do
			info_feedback_agent := an_info_feedback_agent

			-- create widgets
			create ev_root_container
			create ev_test_hbox
			create ev_test_vbox
			create remove_unused_codes_rb
			create arch_test_tree_toggle_expand_bn
			create arch_test_refresh_bn
			create regression_test_bn
			create ev_processed_hbox
			create ev_processed_label
			create arch_test_processed_count
			create ev_hsep_1
			create archetype_test_go_bn
			create ev_spacer_cell
			create ev_hsep_2
			create ev_diff_label
			create diff_source_button
			create diff_flat_button
			create diff_source_flat_button
			create diff_source_round_trip_button
			create test_status_area

			create ev_grid.make
			ev_grid.enable_tree
			ev_grid.add_key_event (key_space,
				agent
					do
						if attached {EV_GRID_CHECKABLE_LABEL_ITEM} ev_grid.selected_cell as gcli then
							gcli.toggle_is_checked
							set_checkboxes_recursively (gcli)
						end
					end
			)

			-- connect widgets
			ev_root_container.extend (ev_test_hbox)
			ev_test_hbox.extend (ev_grid)
			ev_test_hbox.extend (ev_test_vbox)
			ev_test_vbox.extend (remove_unused_codes_rb)
			ev_test_vbox.extend (arch_test_tree_toggle_expand_bn)
			ev_test_vbox.extend (arch_test_refresh_bn)
			ev_test_vbox.extend (regression_test_bn)
			ev_test_vbox.extend (ev_processed_hbox)
			ev_processed_hbox.extend (ev_processed_label)
			ev_processed_hbox.extend (arch_test_processed_count)
			ev_test_vbox.extend (ev_hsep_1)
			ev_test_vbox.extend (archetype_test_go_bn)
			ev_test_vbox.extend (ev_spacer_cell)
			ev_test_vbox.extend (ev_hsep_2)
			ev_test_vbox.extend (ev_diff_label)
			ev_test_vbox.extend (diff_source_button)
			ev_test_vbox.extend (diff_flat_button)
			ev_test_vbox.extend (diff_source_flat_button)
			ev_test_vbox.extend (diff_source_round_trip_button)
			ev_root_container.extend (test_status_area)

			-- set visual characteristics
			ev_root_container.set_minimum_width (500)
			ev_root_container.enable_item_expand (ev_test_hbox)
			ev_root_container.disable_item_expand (test_status_area)
			ev_test_hbox.disable_item_expand (ev_test_vbox)
			ev_test_vbox.set_padding (Default_padding_width)
			ev_test_vbox.set_border_width (Default_border_width)
			ev_test_vbox.disable_item_expand (remove_unused_codes_rb)
			ev_test_vbox.disable_item_expand (arch_test_tree_toggle_expand_bn)
			ev_test_vbox.disable_item_expand (arch_test_refresh_bn)
			ev_test_vbox.disable_item_expand (regression_test_bn)
			ev_test_vbox.disable_item_expand (ev_processed_hbox)
			ev_test_vbox.disable_item_expand (ev_hsep_1)
			ev_test_vbox.disable_item_expand (archetype_test_go_bn)
			ev_test_vbox.disable_item_expand (ev_hsep_2)
			ev_test_vbox.disable_item_expand (ev_diff_label)
			ev_test_vbox.disable_item_expand (diff_source_button)
			ev_test_vbox.disable_item_expand (diff_flat_button)
			ev_test_vbox.disable_item_expand (diff_source_flat_button)
			ev_test_vbox.disable_item_expand (diff_source_round_trip_button)
			remove_unused_codes_rb.set_text ("Remove unused codes")
			remove_unused_codes_rb.set_tooltip ("Remove unused codes in archetypes on parse")
			arch_test_tree_toggle_expand_bn.set_text ("Collapse Tree")
			arch_test_tree_toggle_expand_bn.set_tooltip ("Expand or collapse directory tree")
			arch_test_refresh_bn.set_text ("Refresh")
			arch_test_refresh_bn.set_tooltip ("Resync to file system and reset statuses")
			regression_test_bn.set_text ("Regression off")
			regression_test_bn.set_tooltip ("Turn regression testing on for test archetypes")
			ev_processed_hbox.set_minimum_width (110)
			ev_processed_hbox.set_padding (Default_padding_width)
			ev_processed_hbox.disable_item_expand (ev_processed_label)
			ev_processed_label.set_text ("Processed:")
			ev_processed_label.set_minimum_width (80)
			ev_processed_label.align_text_right
			arch_test_processed_count.disable_edit
			ev_hsep_1.set_minimum_height (15)
			archetype_test_go_bn.set_text ("Go")
			archetype_test_go_bn.set_tooltip ("Start running tests")
			ev_diff_label.set_text ("Diffs")
			diff_source_button.set_text ("Source file v Serialised")
			diff_source_button.set_tooltip ("Open diff tool on parsed and 1st generation serialised .adls files")
			diff_flat_button.set_text ("Legacy v gen'd Flat")
			diff_flat_button.set_tooltip ("Open diff tool on legacy and generated flat files")
			diff_source_flat_button.set_text ("Source v gen'd Flat")
			diff_source_flat_button.set_tooltip ("Open diff tool on source and generated flat files; for top-level archetypes, this shows the effect of flattening the RM, if that option is turned on.")
			diff_source_round_trip_button.set_text ("Source v R-trip")
			diff_source_round_trip_button.set_tooltip ("Open diff tool on source and archetype round-tripped through dADL P_* objects")
			test_status_area.set_minimum_height (status_area_min_height)
			test_status_area.disable_edit
			archetype_test_go_bn.set_pixmap (get_icon_pixmap ("tool/go"))

			-- set up events
			arch_test_tree_toggle_expand_bn.select_actions.extend (agent toggle_expand_tree)
			arch_test_refresh_bn.select_actions.extend (agent populate)
			regression_test_bn.select_actions.extend (agent toggle_test_regression)
			archetype_test_go_bn.select_actions.extend (agent archetype_test_go_stop)
			diff_source_button.select_actions.extend (agent on_diff_source)
			diff_flat_button.select_actions.extend (agent on_diff_flat)
			diff_source_flat_button.select_actions.extend (agent on_diff_source_flat)
			diff_source_round_trip_button.select_actions.extend (agent on_diff_round_trip)
	--		arch_test_processed_count.focus_in_actions.extend (agent text_widget_handler.on_select_all)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_SPLIT_AREA

	tests: DS_HASH_TABLE [FUNCTION [ANY, TUPLE, INTEGER], STRING]
			-- table of test routines
		once
			create Result.make (0)
			Result.force (agent test_parse, "Parse")
			Result.force (agent regression_test, Regression_test_key)
			Result.force (agent test_save_flat, "->adlf")
			Result.force (agent test_source_compare, "Compare .adls")
			Result.force (agent test_save_source_dadl, "src AOM->dADL")
			Result.force (agent test_read_source_dadl, "src AOM<-dADL")
		end

	last_tested_archetypes_count: INTEGER
			-- Number of archetypes tested in last run.

	diff_dir_source_orig: STRING
			-- directory where copies of original .adls files go

	diff_dir_source_new: STRING
			-- directory where first generation serialised .adls files go

	diff_dir_flat_orig: STRING
			-- directory where copies of original legacy .adl files go

	diff_dir_flat_new: STRING
			-- directory where first generation serialised .adlf files go

	diff_dir_source_flat_orig: STRING
			-- directory where copies of original .adls files go, renamed to .adlx, for comparison with flat form
			-- This diff will show expanded internal refs

	diff_dir_source_flat_new: STRING
			-- directory where flat files go, renamed to .adlx, for source/flat
			-- comparison, non-specialised archetypes only

	dadl_source_dir: STRING
			-- directory where dADL files from source form archetypes are saved

	dadl_flat_dir: STRING
			-- directory where dADL files from flat form archetypes are saved

	dadl_adl_root: STRING

	diff_dadl_round_trip_source_orig_dir: STRING

	diff_dadl_round_trip_source_new_dir: STRING

feature -- Status Setting

	diff_dirs_available: BOOLEAN
			-- flag to indicate whether output directories for diff files are available and writable

	is_expanded: BOOLEAN
			-- True if archetype tree is in expanded state

	remove_unused_codes: BOOLEAN
			-- True means remove unused codes from every archetype	

	test_execution_underway: BOOLEAN
			-- True during a test run

	test_stop_requested: BOOLEAN
			-- user requested stop

	regression_test_on: BOOLEAN
			-- True if user has turned on regression testing, in which case, the archetype text being parsed will be searched
			-- for a "Regression" tag within the 'other_details' part of the 'description' section of the archetype. If this
			-- tag is found, the value should be "PASS", "FAIL", or some validity code like "VOTM", as defined in the AOM 1.5 spec.

feature -- Commands

	clear
			-- Wipe out content from widgets.
		do
			ev_grid.wipe_out
			test_status_area.remove_text
			create grid_row_stack.make(0)
		end

	populate
			-- populate the ADL tree control by creating it from scratch
		local
			col_csr: INTEGER
		do
			clear

 			if has_current_profile then
	 			current_arch_cat.do_all (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
 			end

			-- put names on columns
			if ev_grid.column_count > 0 then
				ev_grid.column (1).set_title ("Archetypes - " + repository_profiles.current_profile_name)

				if ev_grid.column_count >= first_test_col then
					from
						tests.start
						col_csr := first_test_col
					until
						tests.off
					loop
						ev_grid.column (col_csr).set_title (tests.key_for_iteration)
						tests.forth
						col_csr := col_csr + 1
					end
				end

				is_expanded := False
				toggle_expand_tree
				ev_grid.column (1).resize_to_content
				ev_grid.column (2).resize_to_content
			end

			arch_test_processed_count.set_text ("0")
			remove_unused_codes_rb.disable_select
		end

   	set_row_pixmap (row: attached EV_GRID_ROW)
   			-- Set the icon appropriate to the item attached to `row'.
   		do
			if attached {EV_GRID_LABEL_ITEM} row.item (1) as gli and attached {ARCH_CAT_ITEM} row.data as ari then
				gli.set_pixmap (get_icon_pixmap ("archetype/" + ari.group_name))
			end
		end

	do_row_for_item (ari: ARCH_CAT_ITEM)
   			-- Perform `action' for the row containing `an_item', if any.
  		local
   			i: INTEGER
			row: EV_GRID_ROW
   		do
			if attached ari then
				from i := ev_grid.row_count until i = 0 loop
					row := ev_grid.row (i)
					if row.data /= Void and then row.data.is_equal (ari) then
						set_row_pixmap (row)
						i := 0
					else
						i := i - 1
					end
				end
			end
		end

feature -- Events

	toggle_expand_tree
			-- toggle expanded status of tree view
		do
			if is_expanded then
				ev_grid.collapse_tree (ev_grid.row (1))
				arch_test_tree_toggle_expand_bn.set_text ("Expand Tree")
				is_expanded := False
			else
				ev_grid.expand_tree (ev_grid.row (1), Void)
				arch_test_tree_toggle_expand_bn.set_text ("Collapse Tree")
				is_expanded := True
			end
		end

	toggle_test_regression
		do
			if regression_test_on then
				regression_test_bn.set_text ("Regression off")
				regression_test_on := False
			else
				regression_test_bn.set_text ("Regression on")
				regression_test_on := True
			end
		end

	archetype_test_go_stop
			-- Start or stop a test run.
		do
			if test_execution_underway then
				test_stop_requested := True
			else
				test_stop_requested := False
				test_execution_underway := True
				archetype_test_go_bn.set_pixmap (get_icon_pixmap ("tool/stop"))
				archetype_test_go_bn.set_text ("Pause")
				run_tests
				test_execution_underway := False
				archetype_test_go_bn.set_pixmap (get_icon_pixmap ("tool/go"))
				archetype_test_go_bn.set_text ("Go")
			end
		end

	on_diff_source
			-- show diffs between input differential archetype and serialised output, from test diff dir
		do
			do_diff (Diff_source)
		end

	on_diff_flat
			-- show diffs between input flat (legacy) archetype and serialised output, from test diff dir
		do
			do_diff (Diff_flat)
		end

	on_diff_source_flat
			-- show diffs between input differential archetype and generated flat output, from test diff dir	
		do
			do_diff (Diff_source_flat)
		end

	on_diff_round_trip
			-- show diffs between input differential archetype and generated flat output, from test diff dir	
		do
			do_diff (Diff_round_trip)
		end

	do_diff (diff_type: INTEGER)
		do
			if not difftool_command.is_empty then
				if diff_dirs_available then
					inspect diff_type
					when Diff_source then
						do_diff_command (diff_dir_source_orig, diff_dir_source_new)
					when Diff_flat then
						do_diff_command (diff_dir_flat_orig, diff_dir_flat_new)
					when Diff_source_flat then
						do_diff_command (diff_dir_source_flat_orig, diff_dir_source_flat_new)
					when Diff_round_trip then
						do_diff_command (diff_dadl_round_trip_source_orig_dir, diff_dadl_round_trip_source_new_dir)
					else
						-- do nothing
					end
				else
					call_info_feedback_agent ("no_diff_dirs")
				end
			else
				call_info_feedback_agent ("no_diff_tool")
			end
		end

	do_diff_command (left_dir, right_dir: attached STRING)
		local
			command: STRING
		do
			command := difftool_command + " %"" + left_dir + "%" %"" + right_dir + "%""
			execution_environment.launch (command)
		end

feature {NONE} -- Commands

	run_tests
			-- Execute tests on all marked archetypes.
		local
			row_csr: INTEGER
		do
			reset_output_directories
			remove_unused_codes := remove_unused_codes_rb.is_selected

			last_tested_archetypes_count := 0
			from row_csr := 1 until row_csr > ev_grid.row_count or test_stop_requested loop
				run_tests_on_row (ev_grid.row (row_csr))
				row_csr := row_csr + 1
			end

			test_status_area.append_text ("****** Executed tests on " + last_tested_archetypes_count.out + " Archetypes ******%N")
		end

	run_tests_on_row (row: EV_GRID_ROW)
			-- Execute tests the archetype attached to `row' if it is marked for testing.
		local
			col_csr: INTEGER
			gli: EV_GRID_LABEL_ITEM
			res_label: STRING
			test_result: INTEGER
		do
			if attached {EV_GRID_CHECKABLE_LABEL_ITEM} row.item (2) as gcli and then gcli.is_checked then
				target ?= row.data

				if attached target then
					row.ensure_visible

					from
						tests.start
						col_csr := first_test_col
						test_result := test_unknown
					until
						tests.off or test_result = test_failed and not (regression_test_on and tests.key_for_iteration.is_equal (Regression_test_key))
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
						end

						create gli
						gli.set_pixmap (get_icon_pixmap ("tool/" + res_label))
						if regression_test_on and tests.key_for_iteration.is_equal (Regression_test_key) then
							gli.set_text (val_code)
						end
						row.set_item (col_csr, gli)

						if not test_status.is_empty then
							test_status_area.append_text ("--------------- " + target.id.as_string + " -----------------%N" + test_status)
						end

						ev_application.process_events
						tests.forth
						col_csr := col_csr + 1
					end

					last_tested_archetypes_count := last_tested_archetypes_count + 1
					arch_test_processed_count.set_text (last_tested_archetypes_count.out)
				end

				gcli.set_is_checked (False)
			end
		end

feature {NONE} -- Tests

	test_parse: INTEGER
			-- parse archetype and return result
		local
			unused_at_codes, unused_ac_codes: ARRAYED_LIST [STRING]
			serialised_source_path: STRING
		do
			Result := test_failed
			if not target.compile_attempted then
				archetype_compiler.rebuild_lineage (target, 0)
			end
			if target.is_valid then
				Result := test_passed
				test_status.append (" parse succeeded%N" + target.errors.as_string)

				unused_at_codes := target.differential_archetype.ontology_unused_term_codes
				unused_ac_codes := target.differential_archetype.ontology_unused_constraint_codes
				if not unused_at_codes.is_empty then
					test_status.append ("Unused at-codes: " + display_arrayed_list (unused_at_codes) + "%N")
				end
				if not unused_ac_codes.is_empty then
					test_status.append ("Unused ac-codes: " + display_arrayed_list (unused_ac_codes) + "%N")
				end
				if remove_unused_codes and (not unused_at_codes.is_empty or not unused_ac_codes.is_empty) then
					test_status.append (">>>>>>>>>> removing unused codes%N")
					target.differential_archetype.remove_ontology_unused_codes
				end

				-- save source as read in (not serialised) for in-memory compare test
				original_differential_text := target.differential_text

				-- save source as serialised to $profile/source/new area
				if diff_dirs_available then
					-- save source as read in (not serialised) to $profile/source/orig area
					file_system.copy_file (target.differential_path, file_system.pathname (diff_dir_source_orig, target.qualified_name + File_ext_archetype_source))

					-- this save causes serialisation to rewrite target.differential_text, which gives us something to compare to what was captured above
					serialised_source_path := file_system.pathname (diff_dir_source_new, target.qualified_name + File_ext_archetype_source)
					target.save_differential_as (serialised_source_path, Syntax_type_adl)

					-- for top-level archetypes only, copy above serialised source to $profile/source_flat/orig area as well, using extension .adlx
					-- (flat also uses this - diff tool needs to see same extensions or else it gets confused)
				--	if not target.is_specialised then
						file_system.copy_file (serialised_source_path, file_system.pathname (diff_dir_source_flat_orig, target.qualified_name + File_ext_archetype_adl_diff))
				--	end

					-- save legacy ADL
					if target.has_legacy_flat_file then
						target.save_legacy_to (file_system.pathname (diff_dir_flat_orig, target.qualified_name + File_ext_archetype_flat))
					end
				end
			else
				test_status.append (" parse failed%N" + target.errors.as_string)
			end
		end

	regression_test: INTEGER
			-- if archetype description.other_details contains an item with key "validity", see if the value
			-- matches the parse result
		local
			other_details: HASH_TABLE [STRING, STRING]
			amp: ARCHETYPE_MINI_PARSER
		do
			if regression_test_on then
				create val_code.make_empty
				create amp
				if target.has_legacy_flat_file then
					other_details := amp.extract_other_details (target.legacy_flat_text)
				else
					other_details := amp.extract_other_details (target.differential_text)
				end
				if other_details.has (Regression_test_key) then
					val_code := other_details.item (Regression_test_key)
				elseif other_details.has (Regression_test_key.as_lower) then
					val_code := other_details.item (Regression_test_key.as_lower)
				end

				-- check to see if expected regression test result `val_code' (typically some code like "VSONIR" from AOM 1.5 spec)
				-- is in the errors or warnings list from a recent compilation. This list may contain slight variants of the
				-- official codes, e.g. "VSONIRocc" which are used to distinguish multiple error messages to do with the same
				-- validity condition. Therefore the comparison is not as simple as just doing compiler_result_codes.has(test_code)
				if not val_code.is_empty then
					if target.is_valid then
						if not val_code.is_case_insensitive_equal (Regression_fail_code) and
							(val_code.is_case_insensitive_equal (Regression_pass_code) or target.errors.has_matching_warning (val_code)) and
							not target.errors.has_errors
						then
							Result := test_passed
						else
							Result := test_failed
						end
					else
						if val_code.is_case_insensitive_equal (Regression_fail_code) or target.errors.has_matching_error (val_code) then
							Result := test_passed
						else
							Result := test_failed
						end
					end
				else
					Result := test_not_applicable
				end
			else
				Result := test_not_applicable
			end
		end

	val_code: STRING

	test_save_flat: INTEGER
			-- parse archetype, save in source form and return result
		local
			flat_path: STRING
		do
			Result := Test_failed
			if target.is_valid then
				if diff_dirs_available then
					flat_path := file_system.pathname (diff_dir_flat_new, target.qualified_name + File_ext_archetype_flat)
					target.save_flat_as (flat_path, Syntax_type_adl)

					-- copy above flat file to $profile/source_flat/orig area as well, using extension .adlx (flat also uses this - diff tool needs to see same
					-- extensions or else it gets confused)
					file_system.copy_file (flat_path, file_system.pathname (diff_dir_source_flat_new, target.qualified_name + File_ext_archetype_adl_diff))
				end
				if target.status.is_empty then
					Result := test_passed
				else
					test_status.append (target.status + "%N")
				end
			else
				Result := test_not_applicable
			end
		end

	test_source_compare: INTEGER
			-- parse archetype and return result
		do
			Result := Test_failed
			if target.is_valid and target.differential_text /= Void then
				if original_differential_text.count = target.differential_text.count then
					if original_differential_text.same_string (target.differential_text) then
						Result := Test_passed
					else
						test_status.append (get_msg_line ("Test_arch_compare_i1", <<>>))
					end
				else
					test_status.append (get_msg_line ("Test_arch_compare_i2", <<original_differential_text.count.out, target.differential_text.count.out>>))
				end
			else
				Result := test_not_applicable
			end
		end

	test_save_source_dadl: INTEGER
			-- serialise differential archetype to dADL format, and copy to test area for later diffing
		do
			Result := Test_failed
			if target.is_valid then
				target.save_compiled_differential
				file_system.copy_file (target.differential_compiled_path, file_system.pathname (dadl_source_dir, target.qualified_name + File_ext_dadl))
				Result := test_passed
			else
				Result := test_not_applicable
			end
		end

	test_read_source_dadl: INTEGER
		local
			fd: PLAIN_TEXT_FILE
		do
			Result := Test_failed
			if target.is_valid then
				if attached target.read_compiled_differential as adl_text then
					-- original .adls file, for diffing
					file_system.copy_file (target.differential_path, file_system.pathname (diff_dadl_round_trip_source_orig_dir, target.qualified_name + File_ext_archetype_source))

					-- post-dadl round-tripped file
					create fd.make_create_read_write (file_system.pathname (diff_dadl_round_trip_source_new_dir, target.qualified_name + File_ext_archetype_source))
					fd.put_string (adl_text)
					fd.close

					Result := test_passed
				end
			else
				Result := test_not_applicable
			end
		end

feature {NONE} -- Implementation

	ev_test_vbox: EV_VERTICAL_BOX
	ev_test_hbox, ev_processed_hbox: EV_HORIZONTAL_BOX
	remove_unused_codes_rb: EV_CHECK_BUTTON
	arch_test_tree_toggle_expand_bn,
	arch_test_refresh_bn, regression_test_bn, archetype_test_go_bn, diff_source_button,
	diff_flat_button, diff_source_flat_button, diff_source_round_trip_button: EV_BUTTON
	ev_processed_label, ev_diff_label: EV_LABEL
	arch_test_processed_count: EV_TEXT_FIELD
	ev_hsep_1, ev_hsep_2: EV_HORIZONTAL_SEPARATOR
	ev_spacer_cell: EV_CELL
	test_status_area: EV_TEXT
	ev_grid: EV_GRID_KBD_MOUSE

	info_feedback_agent: PROCEDURE [ANY, TUPLE [STRING]]

	call_info_feedback_agent (a_message: attached STRING)
		do
			if attached info_feedback_agent then
				info_feedback_agent.call ([get_msg_line (a_message, Void)])
			end
		end

	grid_row_stack: ARRAYED_STACK [EV_GRID_ROW]
			-- Stack used during `populate_gui_tree_node_enter'.

	test_status: STRING
			-- Cumulative status message during running of test.

	target: ARCH_CAT_ARCHETYPE
			-- current target of compilation operation

	original_differential_text: STRING
			-- copy of archetype text after successful parse; = what was on file

	populate_gui_tree_node_enter (ari: attached ARCH_CAT_ITEM)
			-- Add a node representing `an_item' to `gui_file_tree'.
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			col_csr: INTEGER
		do
			if ari.has_artefacts or ari.is_root then
				create gli.make_with_text (utf8_to_utf32 (ari.name))
				if grid_row_stack.is_empty then
					ev_grid.set_item (1, 1, gli)
					row := gli.row
					gli.enable_select
				else
					row := grid_row_stack.item
					row.collapse_actions.extend (agent ev_grid.step_to_viewable_parent_of_selected_row)

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

				if attached {ARCH_CAT_ARCHETYPE} ari as ara then
					gli.set_tooltip (utf8_to_utf32 (ara.full_path))
					col_csr := first_test_col
					from tests.start until tests.off loop
						row.set_item (col_csr, create {EV_GRID_LABEL_ITEM}.make_with_text ("?"))
						tests.forth
						col_csr := col_csr + 1
					end
				end
			end
		end

	populate_gui_tree_node_exit (an_item: attached ARCH_CAT_ITEM)
		do
			if an_item.has_artefacts then
				grid_row_stack.remove
			end
		end

	reset_output_directories
			-- Set output directories, currently just the test diff output location.
			-- Needs to be called if either different profile is selected, or if `test_diff_directory' is changed in user options.
			-- Sets `diff_dirs_available' True if all directories can be found/created.
			-- Resulting directory structure:
			--
			-- 		test_diff_directory
			--			+---- $current_profile
			--					+---- source
			--					|		+---- orig
			--					|		+---- new
			--					|
			--					+---- flat
			--					|		+---- orig
			--					|		+---- new
			--					|
			--					+---- source_flat
			--					|		+---- new
			--					|		+---- orig
			--					|
			--					+---- dadl
			--					|		+---- source
			--					|		+---- flat
			--					|
			--					+---- dadl_adl
			--							+---- orig
			--							+---- new
			--
		local
			diff_dir_root, diff_dir_source_root, diff_dir_flat_root, diff_dir_source_flat_root, dadl_root: STRING
		do
			diff_dirs_available := False

			-- source diff dirs
			if attached repository_profiles.current_profile_name as profile_name then
				diff_dir_root := file_system.pathname (test_diff_directory, profile_name)

				diff_dir_source_root := file_system.pathname (diff_dir_root, "source")
				diff_dir_source_orig := file_system.pathname (diff_dir_source_root, "orig")
				diff_dir_source_new := file_system.pathname (diff_dir_source_root, "new")

				if not file_system.directory_exists (diff_dir_source_orig) then
					file_system.recursive_create_directory (diff_dir_source_orig)
				end
				if file_system.directory_exists (diff_dir_source_orig) then
					if not file_system.directory_exists (diff_dir_source_new) then
						file_system.recursive_create_directory (diff_dir_source_new)
					end
					if file_system.directory_exists (diff_dir_source_new) then
						diff_dirs_available := True
					end
				end
			end

			-- legacy / flat diff dirs
			if diff_dirs_available then
				diff_dir_flat_root := file_system.pathname (diff_dir_root, "flat")
				diff_dir_flat_orig := file_system.pathname (diff_dir_flat_root, "orig")
				diff_dir_flat_new := file_system.pathname (diff_dir_flat_root, "new")
				if not file_system.directory_exists (diff_dir_flat_orig) then
					file_system.recursive_create_directory (diff_dir_flat_orig)
				end
				if file_system.directory_exists (diff_dir_flat_orig) then
					if not file_system.directory_exists (diff_dir_flat_new) then
						file_system.recursive_create_directory (diff_dir_flat_new)
					end
					if not file_system.directory_exists (diff_dir_flat_new) then
						diff_dirs_available := False
					else
						diff_dirs_available := True
					end
				else
					diff_dirs_available := False
				end
			end

			-- source / flat diff dirs
			if diff_dirs_available then
				diff_dir_source_flat_root := file_system.pathname (diff_dir_root, "source_flat")
				diff_dir_source_flat_orig := file_system.pathname (diff_dir_source_flat_root, "orig")
				diff_dir_source_flat_new := file_system.pathname (diff_dir_source_flat_root, "new")
				if not file_system.directory_exists (diff_dir_source_flat_orig) then
					file_system.recursive_create_directory (diff_dir_source_flat_orig)
				end
				if file_system.directory_exists (diff_dir_source_flat_orig) then
					if not file_system.directory_exists (diff_dir_source_flat_new) then
						file_system.recursive_create_directory (diff_dir_source_flat_new)
					end
					if not file_system.directory_exists (diff_dir_source_flat_new) then
						diff_dirs_available := False
					else
						diff_dirs_available := True
					end
				else
					diff_dirs_available := False
				end
			end

			-- dadl serialisation source and flat dirs
			dadl_root := file_system.pathname (diff_dir_root, "dadl")
			dadl_source_dir := file_system.pathname (dadl_root, "source")
			if not file_system.directory_exists (dadl_source_dir) then
				file_system.recursive_create_directory (dadl_source_dir)
			end

			dadl_flat_dir := file_system.pathname (dadl_root, "flat")
			if not file_system.directory_exists (dadl_flat_dir) then
				file_system.recursive_create_directory (dadl_flat_dir)
			end

			-- dirs for adl files produced by serialised first to dadl, reading back dadl,
			-- deserialising then reserialising as adls
			dadl_adl_root := file_system.pathname (diff_dir_root, "dadl_adl")
			diff_dadl_round_trip_source_orig_dir := file_system.pathname (dadl_adl_root, "orig")
			if not file_system.directory_exists (diff_dadl_round_trip_source_orig_dir) then
				file_system.recursive_create_directory (diff_dadl_round_trip_source_orig_dir)
			end

			diff_dadl_round_trip_source_new_dir := file_system.pathname (dadl_adl_root, "new")
			if not file_system.directory_exists (diff_dadl_round_trip_source_new_dir) then
				file_system.recursive_create_directory (diff_dadl_round_trip_source_new_dir)
			end
		end

	display_arrayed_list (str_lst: attached ARRAYED_LIST [STRING]): attached STRING
			--
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

	add_checkbox (row: attached EV_GRID_ROW)
			-- Add the checkbox column to `row' of a grid control
		local
			gcli: EV_GRID_CHECKABLE_LABEL_ITEM
		do
			create gcli
			row.set_item (2, gcli)
			gcli.set_is_checked (True)
			gcli.pointer_button_press_actions.force_extend (agent set_checkboxes_recursively (gcli))
		ensure
			at_least_2_columns: row.count >= 2
		end

	set_checkboxes_recursively (a_gcli: attached EV_GRID_CHECKABLE_LABEL_ITEM)
			-- For all sub-items of `item' in a grid control, set their check boxes to match `item', recursively.
		local
			i: INTEGER
		do
			from i := a_gcli.row.subrow_count until i = 0 loop
				if attached {EV_GRID_CHECKABLE_LABEL_ITEM} a_gcli.row.subrow (i).item (a_gcli.column.index) as sub_gcli then
					sub_gcli.set_is_checked (a_gcli.is_checked)
					set_checkboxes_recursively (sub_gcli)
				end
				i := i - 1
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
