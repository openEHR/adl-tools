note
	component:   "openEHR ADL Tools"
	description: "Dialog to ask for details for repository export"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	EXPORT_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} standard_is_equal, deep_twin, is_deep_equal
		undefine
			is_equal, default_create, copy
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			default_create, copy
		end

create
	make

feature -- Definitions

	Min_width_in_chars: INTEGER = 160

feature {NONE} -- Initialization

	make
		do
			default_create
		end

	create_interface_objects
			-- Initialize `Current'.
		do
			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ top label ============
			create ev_cell_1
			ev_cell_1.set_minimum_height (20)
			ev_root_container.extend (ev_cell_1)
			ev_root_container.disable_item_expand (ev_cell_1)

			create ev_label_1
			ev_label_1.set_text (get_text (ec_export_description))
			ev_root_container.extend (ev_label_1)
			ev_root_container.disable_item_expand (ev_label_1)

			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ input format ============
			create ev_input_params_hb
			ev_root_container.extend (ev_input_params_hb)
			ev_root_container.disable_item_expand (ev_input_params_hb)

			-- differential or flat: 2 x radio buttons
			create evx_diff_flat_rb.make (get_text (ec_export_differential_text), get_text (ec_export_flat_text),
				Void, Void,
				agent :BOOLEAN do Result := not export_flat end,
				agent update_export_flat, 0, 0, True)
			ev_input_params_hb.extend (evx_diff_flat_rb.ev_root_container)
			ev_input_params_hb.disable_item_expand (evx_diff_flat_rb.ev_root_container)
			gui_controls.extend (evx_diff_flat_rb)

			-- flatten with RM: check box
			create evx_flatten_with_rm_cb.make (get_text (ec_flatten_with_rm_cb_text), get_text (ec_flatten_with_rm_cb_tooltip), agent rm_flattening_on)
			ev_input_params_hb.extend (evx_flatten_with_rm_cb.ev_data_control)
			ev_input_params_hb.disable_item_expand (evx_flatten_with_rm_cb.ev_data_control)
			gui_controls.extend (evx_flatten_with_rm_cb)

			-- compile all first: check box
			create evx_compile_first_cb.make (get_text (ec_export_compile_first_text), get_text (ec_export_compile_first_tooltip), agent :BOOLEAN do Result := compile_all_first end)
			ev_input_params_hb.extend (evx_compile_first_cb.ev_data_control)
			ev_input_params_hb.disable_item_expand (evx_compile_first_cb.ev_data_control)
			gui_controls.extend (evx_compile_first_cb)


			-- ============ output format ============

			-- file format combo			
			create evx_format_cob.make_linked (get_text (ec_export_format_text), get_text (ec_export_format_tooltip),
				agent :STRING do Result := export_format end, export_formats, agent set_export_format, Void, Void, 15)
			ev_root_container.extend (evx_format_cob.ev_root_container)
			ev_root_container.disable_item_expand (evx_format_cob.ev_root_container)
			gui_controls.extend (evx_format_cob)

			-- ============ output directory ============
			create evx_dir_setter.make_linked (get_text (ec_export_directory_text), agent :STRING do Result := user_export_directory end, agent set_user_export_directory, Void, Void, 0)
			ev_root_container.extend (evx_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (evx_dir_setter.ev_root_container)
			gui_controls.extend (evx_dir_setter)

			-- link to file format combo, so that selection of format changes directory
			evx_format_cob.add_linked_control (evx_dir_setter)


			-- ============ Bottom row - progress bar + Export / Ok / Cancel buttons ============
			create ev_bottom_row_hb
			ev_root_container.extend (ev_bottom_row_hb)
			ev_root_container.disable_item_expand (ev_bottom_row_hb)

			-- progress control label
			create ev_progress_label
			ev_progress_label.set_text ("                ")
			ev_bottom_row_hb.extend (ev_progress_label)
			ev_bottom_row_hb.disable_item_expand (ev_progress_label)

			-- progress control
			create ev_progress_bar.default_create
			ev_progress_bar.set_foreground_color (Progress_bar_colour)
			ev_bottom_row_hb.extend (ev_progress_bar)

			-- Ok/Cancel buttons
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ok_cancel_buttons.add_button (get_text (ec_export_button_text), agent do_export)
			ev_bottom_row_hb.extend (ok_cancel_buttons.ev_root_container)
			ev_bottom_row_hb.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor

			-- window characteristics
			set_title (get_text (ec_export_library_dialog_title))
			set_icon_pixmap (adl_workbench_logo)
			set_minimum_width (Min_width_in_chars * Text_char_width)
			extend (ev_root_container)

			-- Set up Ok/ Cancel
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
		end

feature -- Events

	on_ok
		do
			hide
		end

	do_export
		do
			file_system.recursive_create_directory (user_export_directory)
			if not file_system.directory_exists (user_export_directory) then
				info_feedback (get_msg_line (ec_could_not_create_file_text, <<user_export_directory>>))
			else
				archetype_compiler.export_all (user_export_directory, evx_format_cob.data_control_text,
					evx_compile_first_cb.is_selected, export_flat, evx_flatten_with_rm_cb.is_selected,
					agent initialise_progress_bar, agent set_progress_bar_current_value)
			end
		end

feature -- Access

	export_format: STRING
		attribute
			Result := syntax_type_odin
		end

	user_export_directory: STRING
		attribute
			Result := file_system.pathname (file_system.pathname (export_directory, current_library_name), export_format)
		end

	custom_user_export_directory: BOOLEAN
			-- True if user has changed export dir

	compile_all_first: BOOLEAN

	export_flat: BOOLEAN

	update_export_flat (a_flag: BOOLEAN)
		do
			export_flat := not a_flag
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	set_user_export_directory (a_dir: STRING)
		do
			user_export_directory := a_dir
			custom_user_export_directory := True
		end

	set_export_format (a_str: STRING)
		do
			export_format := a_str
			if not custom_user_export_directory then
				user_export_directory := file_system.pathname (file_system.pathname (export_directory, current_library_name), export_format)
			end
		end

feature {NONE} -- Implementation

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (
				agent (an_item: EVX_DATA_CONTROL)
					do
						if an_item.is_show_requested then
							an_item.populate
						end
					end
			)
		end

	initialise_progress_bar (a_label: STRING; a_max_val: INTEGER)
		do
			ev_progress_label.set_text (a_label)
			ev_progress_bar.value_range.resize_exactly (0, a_max_val)
		end

	set_progress_bar_current_value (a_val: INTEGER)
		do
			ev_progress_bar.set_value (a_val)
			ev_application.process_graphical_events
		end

	info_feedback (a_message: STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_message)
			info_dialog.set_title ("Information")
			info_dialog.show_modal_to_window (Current)
		end

	ev_cell_1, ev_cell_2: EV_CELL

	ev_label_1: EV_LABEL

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_compile_first_cb, evx_flatten_with_rm_cb: EVX_CHECK_BOX_CONTROL

	evx_dir_setter: EVX_DIRECTORY_SETTER

	evx_format_cob: EVX_COMBO_TEXT_SELECTOR_CONTROL

	ev_progress_bar: EV_HORIZONTAL_PROGRESS_BAR

	ev_progress_label: EV_LABEL

	evx_diff_flat_rb: EVX_BOOLEAN_RADIO_CONTROL

	ev_input_params_hb, ev_bottom_row_hb: EV_HORIZONTAL_BOX

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

end
