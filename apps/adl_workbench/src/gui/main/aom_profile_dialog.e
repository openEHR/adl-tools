note
	component:   "openEHR ADL Tools"
	description: "RM schemas dialog window"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	AOM_PROFILE_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		undefine
			is_equal, default_create, copy
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	EVX_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	Grid_profile_col: INTEGER = 1
	Grid_rm_schemas_col: INTEGER = 2
	Grid_terminologies_col: INTEGER = 3
	Grid_validated_col: INTEGER = 4
	Grid_edit_col: INTEGER = 5
	Grid_max_cols: INTEGER
		once
			Result := Grid_edit_col
		end

	Grid_col_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_grid_profile_col_title), Grid_profile_col)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_grid_rm_col_title), Grid_rm_schemas_col)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_grid_term_col_title), Grid_terminologies_col)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_grid_validated_col_title), Grid_validated_col)
			Result.put (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_grid_edit_col_title), Grid_edit_col)
		end

	Grid_fixed_cols: ARRAYED_LIST[INTEGER]
		once
			create Result.make(0)
			Result.extend (Grid_profile_col)
			Result.extend (Grid_terminologies_col)
			Result.extend (Grid_validated_col)
			Result.extend (Grid_edit_col)
		end

	Frame_height: INTEGER = 700

	Frame_width: INTEGER = 1200

	Grid_expansion_factor: REAL = 1.2

feature {NONE} -- Initialisation

	create_interface_objects
			-- Initialize `Current'.
		do
			create gui_controls.make (0)
			last_populated_aom_profile_dir := aom_profile_directory.twin

			Precursor {EV_DIALOG}

			-- ============ root container ============
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ main grid ============
			create evx_grid.make (True, False, True, True)
			ev_root_container.extend (evx_grid.ev_grid)

			-- space cell
			create ev_cell_3
			ev_cell_3.set_minimum_height (10)
			ev_root_container.extend (ev_cell_3)
			ev_root_container.disable_item_expand (ev_cell_3)

			-- ============ AOM profile directory setter ============
			create evx_dir_setter.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_text), agent :STRING do Result := aom_profile_directory end, agent on_set_aom_profile_dir, Void, Void, 0)
			ev_root_container.extend (evx_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (evx_dir_setter.ev_root_container)
			gui_controls.extend (evx_dir_setter)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent on_cancel)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor
			extend (ev_root_container)
			set_title (get_text ({ADL_MESSAGES_IDS}.ec_aom_profile_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- ensure size controlled
			set_max_size_to_monitor (Current)

			-- Connect events.
			show_actions.extend (agent (evx_grid.ev_grid).set_focus)
			show_actions.extend (agent do_populate)

			-- add a reload button to the left of Ok/ Cancel
			ok_cancel_buttons.add_button (get_text ({ADL_MESSAGES_IDS}.ec_rm_schema_dialog_reload_button_text), agent on_reload)

			enable_edit
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Status

	has_changed_profile_dir: BOOLEAN
			-- AOM profile directory has changed; should refresh

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	on_reload
			-- allow user reload after manual changes while correcting schemas
		do
			do_with_wait_cursor (Current, agent reload)
		end

	reload
			-- allow user reload after manual changes while correcting schemas
		do
			on_set_aom_profile_dir (evx_dir_setter.data_control_text)
			aom_profiles_access.load_profiles
			do_populate
		end

feature -- Events

	on_ok
			-- Set shared settings from the dialog widgets.
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			-- we do this call again, even though it might have alredy been executed due to the user using the
			-- directory browse button (multiple times). We do it here because the user might have also set the
			-- directory by directly typing in the directory text box (in which case there is no other event to
			-- link this call to)
			on_set_aom_profile_dir (evx_dir_setter.data_control_text)

			-- case where the directory no longer exists or is readable
			if not directory_exists (last_populated_aom_profile_dir) then
				create error_dialog.make_with_text (get_msg ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_not_valid, <<last_populated_aom_profile_dir>>))
				error_dialog.show_modal_to_window (Current)
			else
				hide
				if not last_populated_aom_profile_dir.same_string (aom_profile_directory) and directory_exists (last_populated_aom_profile_dir) then
					set_aom_profile_user_directory (last_populated_aom_profile_dir)
					has_changed_profile_dir := True
				end
			end
		end

	on_cancel
			-- Set shared settings from the dialog widgets.
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if not directory_exists (last_populated_aom_profile_dir) then
				create error_dialog.make_with_text (get_msg ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_not_valid, <<last_populated_aom_profile_dir>>))
				error_dialog.show_modal_to_window (Current)
			else
				hide
			end
		end

	on_set_aom_profile_dir (new_dir: STRING)
			-- Let the user browse for the directory where AOM profiles are found.
			-- if a change is made, reload profiles immediately, then repopulate this dialog
		local
			error_dialog: EV_INFORMATION_DIALOG
		do
			if not new_dir.same_string (last_populated_aom_profile_dir) and directory_exists (new_dir) then
				ok_cancel_buttons.disable_sensitive
				aom_profiles_access.initialise (new_dir)
				if not aom_profiles_access.found_valid_profiles then
					create error_dialog.make_with_text (get_msg ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_contains_no_valid_profiles, <<new_dir>>))
					error_dialog.show_modal_to_window (Current)
				end
				populate_grid
				ok_cancel_buttons.enable_sensitive
				last_populated_aom_profile_dir := new_dir
			end
		end

	last_populated_aom_profile_dir: STRING

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			populate_grid
		end

	populate_grid
			-- Set the grid from shared settings.
		local
			aom_profile: AOM_PROFILE
			prf_name: STRING
			rm_schemas_list, terminologies: STRING
			col_icon: EV_PIXMAP
		do
			-- get rid of previously defined rows
			evx_grid.wipe_out

			-- create row containinng widgets for each profile
			across aom_profiles_access.profile_descriptor_candidates as profs_csr loop
				create terminologies.make_empty
				create rm_schemas_list.make_empty
				if attached profs_csr.item.profile as prf then
					aom_profile := prf
					prf_name := aom_profile.profile_name
					across aom_profile.matched_model_ids as sch_ids loop
						if sch_ids.target_index > 1 then
							rm_schemas_list.append (", ")
						end
						rm_schemas_list.append (sch_ids.item)
					end
					if attached aom_profile.terminology_profile as tpf then
						if attached tpf.terminology_issuer as iss then
							terminologies.append (iss)
						end
						if attached tpf.code_sets_issuer as iss then
							if not terminologies.is_empty then
								terminologies.append (", ")
							end
							terminologies.append (iss)
						end
					end
				else
					prf_name := "unknown"
				end

				evx_grid.add_row (prf_name)

				-- column 1 - profile name
				evx_grid.update_last_row_label_col (Grid_profile_col, prf_name, Void, Void, Void, Void)

				-- column 2 - matched Reference Models list
				evx_grid.update_last_row_label_col (Grid_rm_schemas_col, rm_schemas_list, Void, Void, Void, Void)

				-- column 3 - matched Terminologies list
				evx_grid.update_last_row_label_col (Grid_terminologies_col, terminologies, Void, Void, Void, Void)

				-- column 4 - validated
				if profs_csr.item.passed and not profs_csr.item.has_warnings then
					col_icon := get_icon_pixmap ("tool/star")
				else
					if profs_csr.item.has_errors then
						col_icon := get_icon_pixmap ("tool/errors")
					else
						col_icon := get_icon_pixmap ("tool/info")
					end
				end
				evx_grid.update_last_row_label_col (Grid_validated_col, "         ", Void, Void, Void, col_icon)
				if not profs_csr.item.passed or else profs_csr.item.has_warnings then
					evx_grid.add_last_row_select_actions (Grid_validated_col, agent show_profile_validation (profs_csr.item))
				end

				-- column 8 - create edit button and add to row
				evx_grid.update_last_row_label_col (Grid_edit_col, get_text ({ADL_MESSAGES_IDS}.ec_edit), Void, Void, Ev_grid_text_link_colour, Void)
				evx_grid.add_last_row_select_actions (Grid_edit_col, agent do_edit_profile (profs_csr.item))
			end

			evx_grid.set_column_titles (Grid_col_names.linear_representation)
			-- evx_grid.resize_columns_to_content_and_fit (Grid_fixed_cols)
			-- set_minimum_height ((grid.visible_row_count * grid.row_height + empty_form_height).min(Max_height))
			evx_grid.resize_viewable_area_to_content
		end

	do_edit_profile (a_profile_desc: AOM_PROFILE_ACCESS)
			-- launch external editor with schema, or info box if none defined
		do
			do_system_run_command_synchronous (text_editor_command + " %"" + a_profile_desc.profile_path + "%"", Void)
		end

	show_profile_validation (a_profile_desc: AOM_PROFILE_ACCESS)
			-- display info dialog with validity report
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_profile_desc.error_strings)
			info_dialog.show_modal_to_window (Current)
		end

	ev_cell_3: EV_CELL

	evx_grid: EVX_GRID

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


