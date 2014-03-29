note
	component:   "openEHR ADL Tools"
	description: "Test page in ADL test workbench"
	keywords:    "ADL, regression"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_TEST_TOOL

inherit
	EV_SHARED_APPLICATION
		export
			{NONE} all;
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all;
		end

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all;
			{ANY} standard_is_equal, deep_twin, is_deep_equal
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_ADL_ENGINE
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_GUI_AGENTS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	EVX_DEFINITIONS
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
			ev_root_container.set_minimum_width (500)

			create ev_test_hbox
			ev_root_container.extend (ev_test_hbox)
			ev_root_container.enable_item_expand (ev_test_hbox)

			-- grid area
			create evx_grid.make (True, False, True, True)
			evx_grid.set_tree_expand_collapse_icons (get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_collapse"))
--			evx_grid.ev_grid.add_key_event (key_space,
--				agent
--					do
--						if attached {EV_GRID_CHECKABLE_LABEL_ITEM} evx_grid.ev_grid.selected_cell as gcli then
--							gcli.toggle_is_checked
--							set_checkboxes_recursively (gcli)
--						end
--					end
--			)
			ev_test_hbox.extend (evx_grid.ev_grid)

			-- ========== view controls control panel ===========
			create evx_control_panel.make
			ev_test_hbox.extend (evx_control_panel.ev_root_container)
			ev_test_hbox.disable_item_expand (evx_control_panel.ev_root_container)

			-- tree collapse/expand control
			create evx_treeview_control.make (create {EVX_TREE_CONTROL_GRID}.make (evx_grid),
				agent (a_row: EV_GRID_ROW): BOOLEAN do Result := not attached {BMM_MODEL_ELEMENT} a_row.data end,
				get_icon_pixmap ("tool/tree_collapse_all"), get_icon_pixmap ("tool/tree_collapse"),
				get_icon_pixmap ("tool/tree_expand"), get_icon_pixmap ("tool/tree_expand_all"))
			evx_control_panel.add_frame (evx_treeview_control.ev_root_container, False)

			--======================== 'Batch update' frame =======================
			create evx_batch_update_frame.make ("Batch update", 85, 100, False)
			evx_control_panel.add_frame_control (evx_batch_update_frame, False)

			-- remove unused codes RB
			create evx_remove_unused_codes_cb.make (get_text (ec_Test_remove_unused_codes_button_text), get_text (ec_Test_remove_unused_codes_button_tooltip),
				agent :BOOLEAN do Result := remove_unused_codes end)
			evx_batch_update_frame.extend (evx_remove_unused_codes_cb.ev_data_control, False)

			--====================== 'Test' frame ========================
			create evx_test_frame.make ("Test", 85, 100, False)
			evx_control_panel.add_frame_control (evx_test_frame, False)

			-- test refresh button
			create evx_arch_test_refresh_bn.make (Void, Void, get_text (ec_Test_refresh_button_text), get_text (ec_Test_refresh_button_tooltip), agent populate, Void)
			evx_test_frame.extend (evx_arch_test_refresh_bn.ev_button, False)

			-- regression test button
			create evx_regression_test_cb.make_linked (get_text (ec_Test_regression_checkbox_text), get_text (ec_Test_regression_checkbox_tooltip),
				agent :BOOLEAN do Result := regression_test_on end,
				agent (a_flag: BOOLEAN) do regression_test_on := a_flag end
			)
			evx_test_frame.extend (evx_regression_test_cb.ev_data_control, False)

			-- progress indicator
			create evx_progress_counter.make_readonly (get_text (ec_Test_processed_indicator_text), agent :STRING do Result := last_tested_archetypes_count.out end, 0, 0, True)
			evx_test_frame.extend (evx_progress_counter.ev_root_container, False)

			-- start / stop button
			create evx_archetype_test_go_bn.make (get_icon_pixmap ("tool/stop"), get_icon_pixmap ("tool/go"), get_text (ec_Test_start_stop_button_text),
				get_text (ec_Test_start_stop_button_tooltip), agent archetype_test_go, agent archetype_test_stop)
			evx_test_frame.extend (evx_archetype_test_go_bn.ev_button, False)

			-- close button
			create evx_close_bn.make (Void, Void, get_text (ec_Test_close_tool_button_text), get_text (ec_Test_close_tool_button_tooltip), agent on_close, Void)
			evx_test_frame.extend (evx_close_bn.ev_button, False)


			-- ==================== 'Diffs' frame =======================
			create evx_diffs_frame.make ("Diffs", 85, 100, False)
			evx_control_panel.add_frame_control (evx_diffs_frame, False)

			-- diff source button
			create evx_diff_source_button.make (Void, Void,
				get_text (ec_Test_source_serialised_button_text), get_text (ec_Test_source_serialised_button_tooltip),
				 agent on_diff_source, Void)
			evx_diffs_frame.extend (evx_diff_source_button.ev_button, False)

			-- diff flat button
			create evx_diff_flat_button.make (Void, Void,
				get_text (ec_Test_diff_flat_button_text), get_text (ec_Test_diff_flat_button_tooltip),
				 agent on_diff_flat, Void)
			evx_diffs_frame.extend (evx_diff_flat_button.ev_button, False)

			-- diff source flat button
			create evx_diff_source_flat_button.make (Void, Void,
				get_text (ec_Test_source_gen_flat_button_text), get_text (ec_Test_source_gen_flat_button_tooltip),
				 agent on_diff_source_flat, Void)
			evx_diffs_frame.extend (evx_diff_source_flat_button.ev_button, False)

			-- round trip button
			create evx_diff_source_round_trip_button.make (Void, Void,
				get_text (ec_Test_source_roundtrip_button_text), get_text (ec_Test_source_roundtrip_button_tooltip),
				 agent on_diff_round_trip, Void)
			evx_diffs_frame.extend (evx_diff_source_round_trip_button.ev_button, False)

			-- status area
			create test_status_area
			ev_root_container.extend (test_status_area)
			ev_root_container.disable_item_expand (test_status_area)
			test_status_area.set_minimum_height (status_area_min_height)
			test_status_area.disable_edit


			clear
		end

feature -- Access

	ev_root_container: EV_VERTICAL_SPLIT_AREA

	tests: HASH_TABLE [FUNCTION [ANY, TUPLE, INTEGER], STRING]
			-- table of test routines
		once
			create Result.make (0)
			Result.force (agent test_parse, get_text (ec_Test_parse_test_title))
			Result.force (agent regression_test, Regression_test_key)
			Result.force (agent test_save_flat, get_text (ec_Test_save_flat_test_title))
			Result.force (agent test_source_compare, get_text (ec_Test_source_compare_test_title))
			Result.force (agent test_save_source_odin, get_text (ec_Test_save_source_odin_test_title))
			Result.force (agent test_read_source_odin, get_text (ec_Test_read_source_odin_test_title))
		end

	last_tested_archetypes_count: INTEGER
			-- Number of archetypes tested in last run.

	diff_dir_source_orig: STRING
			-- directory where copies of original .adls files go
		attribute
			create Result.make_empty
		end

	diff_dir_source_new: STRING
			-- directory where first generation serialised .adls files go
		attribute
			create Result.make_empty
		end

	diff_dir_flat_orig: STRING
			-- directory where copies of original legacy .adl files go
		attribute
			create Result.make_empty
		end

	diff_dir_flat_new: STRING
			-- directory where first generation serialised .adlf files go
		attribute
			create Result.make_empty
		end

	diff_dir_source_flat_orig: STRING
			-- directory where copies of original .adls files go, renamed to .adlx, for comparison with flat form
			-- This diff will show expanded internal refs
		attribute
			create Result.make_empty
		end

	diff_dir_source_flat_new: STRING
			-- directory where flat files go, renamed to .adlx, for source/flat
			-- comparison, non-specialised archetypes only
		attribute
			create Result.make_empty
		end

	odin_source_dir: STRING
			-- directory where ODIN files from source form archetypes are saved
		attribute
			create Result.make_empty
		end

	odin_flat_dir: STRING
			-- directory where ODIN files from flat form archetypes are saved
		attribute
			create Result.make_empty
		end

	odin_adl_root: STRING
		attribute
			create Result.make_empty
		end

	diff_odin_round_trip_source_orig_dir: STRING
		attribute
			create Result.make_empty
		end

	diff_odin_round_trip_source_new_dir: STRING
		attribute
			create Result.make_empty
		end

feature -- Status Setting

	diff_dirs_available: BOOLEAN
			-- flag to indicate whether output directories for diff files are available and writable

	is_expanded: BOOLEAN
			-- True if archetype tree is in expanded state

	remove_unused_codes: BOOLEAN
			-- True means remove unused codes from every archetype	

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
			evx_grid.wipe_out
			test_status_area.remove_text
			create grid_row_stack.make(0)
			create original_differential_text.make_empty
			create test_status.make_empty
			create val_code.make_empty
		end

	populate
			-- populate the ADL tree control by creating it from scratch
		local
			curr_repo_name: STRING
			col_titles: ARRAYED_LIST [STRING]
		do
			clear

 			if has_current_repository then
	 			current_arch_cat.do_all_semantic (agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
 			end

 			check attached repository_config_table.current_repository_name as crn then
 				curr_repo_name := crn
 			end

			-- put names on columns
			if evx_grid.column_count > 0 then
				create col_titles.make (0)
				col_titles.extend ("Archetypes - " + curr_repo_name)
				col_titles.extend ("") -- checkbox column
				if evx_grid.column_count >= first_test_col then
					across tests as test_csr loop
						col_titles.extend (test_csr.key)
					end
					evx_grid.set_column_titles (col_titles)
				end

				is_expanded := False
			end
			evx_grid.expand_tree
			evx_grid.resize_columns_to_content

			evx_progress_counter.ev_data_control.set_text ("0")
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
				from i := evx_grid.row_count until i = 0 loop
					row := evx_grid.ev_grid.row (i)
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

	on_close
		do
			gui_agents.close_test_tool_agent.call ([])
		end

	archetype_test_go
			-- Start or stop a test run.
		do
			test_stop_requested := False
			run_tests
		end

	archetype_test_stop
			-- Start or stop a test run.
		do
			test_stop_requested := True
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
						do_diff_command (diff_odin_round_trip_source_orig_dir, diff_odin_round_trip_source_new_dir)
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
			remove_unused_codes := evx_remove_unused_codes_cb.is_selected

			last_tested_archetypes_count := 0
			from row_csr := 1 until row_csr > evx_grid.row_count or test_stop_requested loop
				run_tests_on_row (evx_grid.ev_grid.row (row_csr))
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
			if attached {EV_GRID_CHECKABLE_LABEL_ITEM} row.item (2) as gcli and then gcli.is_checked and attached {ARCH_CAT_ARCHETYPE} row.data as aca then
				target := aca

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

						test_status.wipe_out

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
					evx_progress_counter.ev_data_control.set_text (last_tested_archetypes_count.out)
				end

				gcli.set_is_checked (False)
			end
		end

feature {NONE} -- Tests

	test_parse: INTEGER
			-- parse archetype and return result
		local
			unused_at_codes: ARRAYED_LIST [STRING]
			orig_fname, src_fname, diff_fname, flat_fname, serialised_source_path: STRING
		do
			check attached target end

			Result := test_failed
			if not target.compile_attempted then
				archetype_compiler.rebuild_lineage (target, 0)
			end
			if target.is_valid then
				Result := test_passed
				test_status.append (" parse succeeded%N" + target.errors.as_string)

				unused_at_codes := target.differential_archetype.terminology_unused_term_codes
				if not unused_at_codes.is_empty then
					test_status.append ("Unused at-codes: " + display_arrayed_list (unused_at_codes) + "%N")
				end
				if remove_unused_codes and not unused_at_codes.is_empty then
					test_status.append (">>>>>>>>>> removing unused codes%N")
					target.differential_archetype.remove_terminology_unused_codes
				end

				-- save source as read in (not serialised) for in-memory compare test
				original_differential_text := target.source_text

				-- save source as serialised to $repository/source/new area
				if diff_dirs_available then
					orig_fname := file_system.basename (target.source_file_path)
					src_fname := extension_replaced (orig_fname, File_ext_archetype_source)
					diff_fname := extension_replaced (orig_fname, File_ext_archetype_adl_diff)
					flat_fname := extension_replaced (orig_fname, File_ext_archetype_flat)

					-- save source as read in (not serialised) to $repository/source/orig area
					file_system.copy_file (target.source_file_path, file_system.pathname (diff_dir_source_orig, src_fname))

					-- this save causes serialisation to rewrite target.differential_text, which gives us something to compare to what was captured above
					serialised_source_path := file_system.pathname (diff_dir_source_new, src_fname)
					target.save_differential_as (serialised_source_path, Syntax_type_adl)

					-- for top-level archetypes only, copy above serialised source to $repository/source_flat/orig area as well, using extension .adlx
					-- (flat also uses this - diff tool needs to see same extensions or else it gets confused)
				--	if not target.is_specialised then
						file_system.copy_file (serialised_source_path, file_system.pathname (diff_dir_source_flat_orig, diff_fname))
				--	end

					-- save a copy of legacy ADL
					if target.has_legacy_flat_file then
						target.save_legacy_to (file_system.pathname (diff_dir_flat_orig, flat_fname))
					end
				end
			else
				test_status.append (" parse failed%N" + target.errors.as_string)
			end
		end

	regression_test: INTEGER
			-- if archetype description.other_details contains an item with key "validity", see if the value
			-- matches the parse result
		do
			if regression_test_on then
				create val_code.make_empty

				if target.other_details.has (Regression_test_key) then
					check attached target.other_details.item (Regression_test_key) as rtk then
						val_code := rtk
					end
				elseif target.other_details.has (Regression_test_key.as_lower) then
					check attached target.other_details.item (Regression_test_key.as_lower) as rtk then
						val_code := rtk
					end
				end

				-- check to see if expected regression test result `val_code' (typically some code like "VSONIR" from AOM 1.5 spec)
				-- is in the errors or warnings list from a recent compilation. This list may contain slight variants of the
				-- official codes, e.g. "VSONIRocc" which are used to distinguish multiple error messages to do with the same
				-- validity condition. Therefore the comparison is not as simple as just doing compiler_result_codes.has(test_code)
				if not val_code.is_empty then
					if target.is_valid then
						if not val_code.is_case_insensitive_equal (Regression_fail_code) and
							(val_code.is_case_insensitive_equal (Regression_pass_code) or else target.errors.has_matching_warning (val_code)) and
							not target.errors.has_errors
						then
							Result := test_passed
						else
							Result := test_failed
						end
					else
						if val_code.is_case_insensitive_equal (Regression_fail_code) or else target.errors.has_matching_error (val_code) then
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
			orig_fname, diff_fname, flat_fname, flat_path: STRING
		do
			Result := Test_failed
			if target.is_valid then
				if diff_dirs_available then
					orig_fname := file_system.basename (target.source_file_path)
					diff_fname := extension_replaced (orig_fname, File_ext_archetype_adl_diff)
					flat_fname := extension_replaced (orig_fname, File_ext_archetype_flat)

					flat_path := file_system.pathname (diff_dir_flat_new, flat_fname)
					target.save_flat_as (flat_path, Syntax_type_adl)

					-- copy above flat file to $repository/source_flat/orig area as well, using extension .adlx (flat also uses this - diff tool needs to see same
					-- extensions or else it gets confused)
					file_system.copy_file (flat_path, file_system.pathname (diff_dir_source_flat_new, diff_fname))
				end

				if not target.has_errors then
					Result := test_passed
				end

				if not target.status.is_empty then
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
			if target.is_valid then
				if original_differential_text.count = target.source_text.count then
					if original_differential_text.same_string (target.source_text) then
						Result := Test_passed
					else
						test_status.append (get_msg_line ("Test_arch_compare_i1", <<>>))
					end
				else
					test_status.append (get_msg_line ("Test_arch_compare_i2", <<original_differential_text.count.out, target.source_text.count.out>>))
				end
			else
				Result := test_not_applicable
			end
		end

	test_save_source_odin: INTEGER
			-- serialise differential archetype to ODIN format, and copy to test area for later diffing
		local
			orig_fname, odin_fname: STRING
		do
			Result := Test_failed
			if target.is_valid then
				target.save_compiled_differential
				orig_fname := file_system.basename (target.source_file_path)
				odin_fname := extension_replaced (orig_fname, File_ext_odin)

				file_system.copy_file (target.differential_compiled_path, file_system.pathname (odin_source_dir, odin_fname))
				Result := test_passed
			else
				Result := test_not_applicable
			end
		end

	test_read_source_odin: INTEGER
		local
			fd: PLAIN_TEXT_FILE
			orig_fname, src_fname: STRING
		do
			Result := Test_failed
			if target.is_valid then
				if target.has_differential_compiled_file then
					orig_fname := file_system.basename (target.source_file_path)
					src_fname := extension_replaced (orig_fname, File_ext_archetype_source)

					-- original .adls file, for diffing
					file_system.copy_file (target.source_file_path, file_system.pathname (diff_odin_round_trip_source_orig_dir, src_fname))

					-- post-odin round-tripped file
					create fd.make_create_read_write (file_system.pathname (diff_odin_round_trip_source_new_dir, src_fname))
					fd.put_string (target.read_compiled_differential)
					fd.close

					Result := test_passed
				end
			else
				Result := test_not_applicable
			end
		end

feature {NONE} -- Implementation

	ev_test_hbox: EV_HORIZONTAL_BOX
	evx_remove_unused_codes_cb, evx_regression_test_cb: EVX_CHECK_BOX_CONTROL
	evx_arch_test_refresh_bn, evx_archetype_test_go_bn, evx_diff_source_button, evx_close_bn,
	evx_diff_flat_button, evx_diff_source_flat_button, evx_diff_source_round_trip_button: EVX_BUTTON
	test_status_area: EV_TEXT

	evx_grid: EVX_GRID
	evx_control_panel: EVX_CONTROL_PANEL
	evx_treeview_control: EVX_TREEVIEW_CONTROL
	evx_batch_update_frame, evx_test_frame, evx_diffs_frame: EVX_FRAME_CONTROL
	evx_progress_counter: EVX_SINGLE_LINE_TEXT_CONTROL

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

	target: detachable ARCH_CAT_ARCHETYPE
			-- current target of compilation operation
		note
			option: stable
		attribute
		end

	original_differential_text: STRING
			-- copy of archetype text after successful parse; = what was on file

	populate_gui_tree_node_enter (ari: ARCH_CAT_ITEM)
			-- Add a node representing `an_item' to `gui_file_tree'.
		local
			col_csr: INTEGER
		do
			if ari.has_artefacts or ari.is_root then
				if grid_row_stack.is_empty then
					evx_grid.add_row (ari)
				else
					grid_row_stack.item.collapse_actions.extend (agent (evx_grid.ev_grid).step_to_viewable_parent_of_selected_row)
					evx_grid.add_sub_row (grid_row_stack.item, ari)
				end
				evx_grid.set_last_row_label_col (1, ari.name, Void, Void, get_icon_pixmap ("archetype/" + ari.group_name))
				evx_grid.last_row_add_checkbox (2)
				check attached evx_grid.last_row as lr then
					grid_row_stack.extend (lr)
				end

				if attached {ARCH_CAT_ARCHETYPE} ari as ara then
					evx_grid.update_last_row_label_col (1, Void, ara.source_file_path, Void, Void)
					col_csr := first_test_col
					across tests as tests_csr loop
						evx_grid.set_last_row_label_col (col_csr, "?", Void, Void, Void)
						col_csr := col_csr + 1
					end
				end
			end
		end

	populate_gui_tree_node_exit (an_item: ARCH_CAT_ITEM)
		do
			if an_item.has_artefacts then
				grid_row_stack.remove
			end
		end

	reset_output_directories
			-- Set output directories, currently just the test diff output location.
			-- Needs to be called if either different repository is selected, or if `test_diff_directory' is changed in user options.
			-- Sets `diff_dirs_available' True if all directories can be found/created.
			-- Resulting directory structure:
			--
			-- 		test_diff_directory
			--			+---- $current_repository
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
			--					+---- odin
			--					|		+---- source
			--					|		+---- flat
			--					|
			--					+---- odin_adl
			--							+---- orig
			--							+---- new
			--
		require
			has_current_repository
		local
			curr_prof, diff_dir_root, diff_dir_source_root, diff_dir_flat_root, diff_dir_source_flat_root, odin_root: STRING
		do
			diff_dirs_available := False

			-- source diff dirs
			check attached repository_config_table.current_repository_name as cpn then
				curr_prof := cpn
			end
			diff_dir_root := file_system.pathname (test_diff_directory, curr_prof)
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

			-- odin serialisation source and flat dirs
			odin_root := file_system.pathname (diff_dir_root, "odin")
			odin_source_dir := file_system.pathname (odin_root, "source")
			if not file_system.directory_exists (odin_source_dir) then
				file_system.recursive_create_directory (odin_source_dir)
			end

			odin_flat_dir := file_system.pathname (odin_root, "flat")
			if not file_system.directory_exists (odin_flat_dir) then
				file_system.recursive_create_directory (odin_flat_dir)
			end

			-- dirs for adl files produced by serialised first to odin, reading back odin,
			-- deserialising then reserialising as adls
			odin_adl_root := file_system.pathname (diff_dir_root, "odin_adl")
			diff_odin_round_trip_source_orig_dir := file_system.pathname (odin_adl_root, "orig")
			if not file_system.directory_exists (diff_odin_round_trip_source_orig_dir) then
				file_system.recursive_create_directory (diff_odin_round_trip_source_orig_dir)
			end

			diff_odin_round_trip_source_new_dir := file_system.pathname (odin_adl_root, "new")
			if not file_system.directory_exists (diff_odin_round_trip_source_new_dir) then
				file_system.recursive_create_directory (diff_odin_round_trip_source_new_dir)
			end
		end

	display_arrayed_list (str_lst: ARRAYED_LIST [STRING]): STRING
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

end


