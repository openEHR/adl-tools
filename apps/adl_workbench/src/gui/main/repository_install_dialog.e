note
	component:   "openEHR ADL Tools"
	description: "Dialog to ask for details for installing a remote repository"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	REPOSITORY_INSTALL_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects, is_in_default_state
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} standard_is_equal, deep_twin, is_deep_equal
		undefine
			is_equal, default_create, copy
		end

create
	make

feature {NONE} -- Initialization

	make (a_repo_url: STRING)
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
			create ev_label_1
			ev_label_1.set_text (get_text (ec_repository_install_dialog_header_label))
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ new repository dir chooser ============
			create evx_dir_setter.make (get_text (ec_repository_dir_button_text), agent :STRING do Result := "" end, 0, 0)
			evx_dir_setter.set_button_tooltip (get_text (ec_repository_dir_button_tooltip))
			ev_root_container.extend (evx_dir_setter.ev_root_container)
			ev_root_container.disable_item_expand (evx_dir_setter.ev_root_container)
			gui_controls.extend (evx_dir_setter)

			-- ============ clone new checkbox ============
			create evx_clone_cb.make_linked (get_text (ec_repository_clone_here_text), get_text (ec_repository_clone_here_tooltip),
				agent :BOOLEAN do Result := user_requires_repository_clone end,
				agent set_user_requires_repository_clone)
			ev_root_container.extend (evx_clone_cb.ev_data_control)
			ev_root_container.disable_item_expand (evx_clone_cb.ev_data_control)
			gui_controls.extend (evx_clone_cb)

			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor

			-- window characteristics
			set_title (get_text (ec_repository_install_dialog_title))
			set_icon_pixmap (adl_workbench_logo)

			extend (ev_root_container)
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up form for display
			enable_edit
			do_populate
		end

feature -- Events

	on_ok
		do
			local_directory := evx_dir_setter.data_control_text
			hide
		end

feature -- Access

	local_directory: STRING
		attribute
			create Result.make_empty
		end

feature -- Status Report

	user_requires_repository_clone: BOOLEAN
			-- True if request to clone repo into chosen directory

feature -- Modification

	set_user_requires_repository_clone (a_val: BOOLEAN)
		do
			user_requires_repository_clone := a_val
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
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

	ev_cell_1, ev_cell_2: EV_CELL

	ev_label_1: EV_LABEL

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_clone_cb: EVX_CHECK_BOX_CONTROL

	evx_dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


