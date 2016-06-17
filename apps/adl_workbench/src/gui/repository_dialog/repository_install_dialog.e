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
	make, make_fixed_url

feature {NONE} -- Initialization

	make_fixed_url (a_repo_url: STRING)
		do
			repository_url := a_repo_url
			create local_directory.make_empty
			header_text := get_text (ec_repository_install_dialog_header_label_url)
			default_create
		end

	make
		do
			create repository_url.make_empty
			create local_directory.make_empty
			header_text := get_text (ec_repository_install_dialog_header_label)
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
			ev_label_1.set_text (header_text)
			ev_root_container.extend (ev_label_1)
			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_1)
			ev_root_container.disable_item_expand (ev_label_1)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ URL text entry ============
			if repository_url.is_empty then
				create evx_url_text.make_linked (get_text (ec_repository_url_label), agent :STRING do Result := repository_url end, agent set_repository_url, Void, Void, 0, True)
			else
				create evx_url_text.make_readonly (get_text (ec_repository_url_label), agent :STRING do Result := repository_url end, 0, True)
			end
			ev_root_container.extend (evx_url_text.ev_root_container)
			ev_root_container.disable_item_expand (evx_url_text.ev_root_container)
			gui_controls.extend (evx_url_text)

			-- ============ new repository dir chooser ============
			create evx_dir_setter.make_linked (get_text (ec_repository_dir_text), agent :STRING do Result := local_directory end, agent set_local_directory, Void, Void, 0)
			evx_dir_setter.set_button_tooltip (get_text (ec_repository_dir_tooltip))
			evx_dir_setter.set_default_directory_agent (agent :STRING do Result := last_user_selected_directory end)
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
			set_last_user_selected_directory (local_directory)
			is_valid := not local_directory.is_empty
			hide
		end

feature -- Access

	repository_url: STRING

	local_directory: STRING

feature -- Status Report

	is_valid: BOOLEAN
			-- user selected OK, and data valid in this dialog

	user_requires_repository_clone: BOOLEAN
			-- True if request to clone repo into chosen directory

feature -- Modification

	set_user_requires_repository_clone (a_val: BOOLEAN)
		do
			user_requires_repository_clone := a_val
		end

	set_repository_url (a_url: STRING)
		do
			repository_url := a_url
		end

	set_local_directory (a_dir: STRING)
		do
			local_directory := a_dir
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature {NONE} -- Implementation

	header_text: STRING

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

	evx_url_text: EVX_SINGLE_LINE_TEXT_CONTROL

	evx_clone_cb: EVX_CHECK_BOX_CONTROL

	evx_dir_setter: EVX_DIRECTORY_SETTER

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end

