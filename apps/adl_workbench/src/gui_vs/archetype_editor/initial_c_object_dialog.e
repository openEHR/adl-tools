note
	component:   "openEHR ADL Tools"
	description: "Dialog to ask for initial details of a new C_OBJECT node to enable conversion from an RM object node"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_C_OBJECT_DIALOG

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

	SHARED_ARCHETYPE_CATALOGUES
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

create
	make

feature {NONE} -- Initialization

	make (a_constraint_types, an_rm_types: ARRAYED_LIST [STRING]; a_current_constraint_type, a_current_rm_type: STRING;
			an_occurrences_default: MULTIPLICITY_INTERVAL; an_archetype: ARCHETYPE; node_id_required_flag: BOOLEAN;
			a_display_settings: GUI_DEFINITION_SETTINGS)
			-- Make with RM types, constraint type selection and an occurrences constrainer that is used to determine
			-- the possible occurrences in this case
		require
			Valid_constraint_types: a_constraint_types.object_comparison and a_constraint_types.has (a_current_constraint_type)
			Valid_rm_types: an_rm_types.object_comparison and an_rm_types.has (a_current_rm_type)
		do
			constraint_types := a_constraint_types
			rm_types := an_rm_types

			create user_params.make (a_current_constraint_type, a_current_rm_type, an_occurrences_default.as_string)

			initial_rm_type := a_current_rm_type.twin
			initial_constraint_type := a_current_constraint_type.twin
			occurrences_default := an_occurrences_default

			archetype := an_archetype
			display_settings := a_display_settings

			node_id_required := node_id_required_flag

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


			-- ============ node_id text & description controls ============
			create node_id_text_ctl.make_linked (get_text (ec_node_id_text),
				agent :STRING do Result := user_params.node_id_text end,
				agent (v:STRING) do user_params.set_node_id_text (v) end,
				Void, Void,
				0, 0, True)
			if node_id_required then
				ev_root_container.extend (node_id_text_ctl.ev_root_container)
				ev_root_container.disable_item_expand (node_id_text_ctl.ev_root_container)
				gui_controls.extend (node_id_text_ctl)
			end

			create node_id_description_ctl.make_linked (get_text (ec_node_id_description),
				agent :STRING do Result := user_params.node_id_description end,
				agent (v:STRING) do user_params.set_node_id_description (v) end,
				Void, Void,
				0, 0, True)
			if node_id_required then
				ev_root_container.extend (node_id_description_ctl.ev_root_container)
				ev_root_container.disable_item_expand (node_id_description_ctl.ev_root_container)
				gui_controls.extend (node_id_description_ctl)
			end

			-- ============ constraint type combo-box control ============
			create constraint_type_ctl.make_linked (get_text (ec_initial_c_object_config_constraint_type_text),
				agent :STRING do Result := user_params.constraint_type end,
				constraint_types, agent set_current_constraint_type, Void, Void,
				0, 0)
			ev_root_container.extend (constraint_type_ctl.ev_root_container)
			ev_root_container.disable_item_expand (constraint_type_ctl.ev_root_container)
			gui_controls.extend (constraint_type_ctl)

			-- ============ RM type combo-box control ============
			create rm_type_ctl.make_linked (get_text (ec_initial_c_object_config_rm_type_text),
				agent :STRING do Result := user_params.rm_type end,
				rm_types, agent (a_str: STRING) do user_params.set_rm_type (a_str) end,
				Void, Void,
				0, 0)
			ev_root_container.extend (rm_type_ctl.ev_root_container)
			ev_root_container.disable_item_expand (rm_type_ctl.ev_root_container)
			gui_controls.extend (rm_type_ctl)

			-- ============ Occurrences ============
			create occurrences_choice_ctl.make_linked (get_text (ec_initial_c_object_config_occurrences_text),
				agent :STRING do Result := user_params.occurrences end,
				occurrences_constrained_list, agent (a_str: STRING) do user_params.set_occurrences (a_str) end, Void, Void,
				0, 0)
			ev_root_container.extend (occurrences_choice_ctl.ev_root_container)
			ev_root_container.disable_item_expand (occurrences_choice_ctl.ev_root_container)
			gui_controls.extend (occurrences_choice_ctl)

			-- ============ Archetype ext ref list ============			
			create arch_id_list_ctl.make_linked (get_text (ec_initial_c_object_config_ext_ref_text),
				agent :detachable STRING do Result := user_params.ext_ref end,
				arch_ext_ref_list, agent (a_str: STRING) do user_params.set_ext_ref (a_str) end, Void, Void,
				0, 0)
			ev_root_container.extend (arch_id_list_ctl.ev_root_container)
			ev_root_container.disable_item_expand (arch_id_list_ctl.ev_root_container)
			if not user_params.constraint_type.is_equal (bare_type_name(({C_ARCHETYPE_ROOT}).name)) then
				arch_id_list_ctl.hide
			end
			rm_type_ctl.add_linked_control (arch_id_list_ctl)
			gui_controls.extend (arch_id_list_ctl)


			-- ============ Archetype path list ============			
			create arch_path_list_ctl.make_linked (get_text (ec_initial_c_object_config_path_ref_text),
				agent :detachable STRING do Result := user_params.path_ref end,
				arch_path_list, agent (a_str: STRING) do user_params.set_path_ref (a_str) end, Void, Void,
				0, 0)
			ev_root_container.extend (arch_path_list_ctl.ev_root_container)
			ev_root_container.disable_item_expand (arch_path_list_ctl.ev_root_container)
			if not user_params.constraint_type.is_equal (bare_type_name(({ARCHETYPE_INTERNAL_REF}).name)) then
				arch_path_list_ctl.hide
			end
			gui_controls.extend (arch_path_list_ctl)
			rm_type_ctl.add_linked_control (arch_path_list_ctl)


			-- ============ Ok/Cancel buttons ============
			create ok_cancel_buttons.make (agent on_ok, agent hide)
			ev_root_container.extend (ok_cancel_buttons.ev_root_container)
			ev_root_container.disable_item_expand (ok_cancel_buttons.ev_root_container)
--			show_actions.extend (agent constraint_type_ctl.set_focus)
		end

	initialize
		do
			precursor

			-- window characteristics
			set_title (get_text (ec_initial_c_object_config_dialog_title))
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
			is_valid :=  True
--					not user_params.constraint_type.is_equal (initial_constraint_type) or
--					not user_params.rm_type.is_equal (initial_rm_type) or
--					not user_params.occurrences.is_equal (occurrences_default.as_string)
			hide
		end

feature -- Access

	user_params: GUI_C_OBJECT_DIALOG_PARAMS

	rm_types: ARRAYED_LIST [STRING]

	constraint_types: ARRAYED_LIST [STRING]

feature -- Status Report

	is_valid: BOOLEAN

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature -- Modification

	set_current_constraint_type (a_str: STRING)
		do
			user_params.set_constraint_type (a_str)
			if user_params.constraint_type.is_equal (bare_type_name(({C_ARCHETYPE_ROOT}).name)) and not arch_ext_ref_list.is_empty then
				arch_id_list_ctl.show
				arch_path_list_ctl.hide
			elseif user_params.constraint_type.is_equal (bare_type_name(({ARCHETYPE_INTERNAL_REF}).name)) and not arch_path_list.is_empty then
				arch_path_list_ctl.show
				arch_id_list_ctl.hide
			else
				arch_path_list_ctl.hide
				arch_id_list_ctl.hide
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

	archetype: ARCHETYPE

	display_settings: GUI_DEFINITION_SETTINGS

	initial_rm_type: STRING

	initial_constraint_type: STRING

	node_id_required: BOOLEAN

	occurrences_default: MULTIPLICITY_INTERVAL

	occurrences_constrained_list: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			across occurrences_default_list as occs_csr loop
				if occurrences_default.equal_interval (occs_csr.item) or occurrences_default.contains (occs_csr.item) then
					Result.extend (occs_csr.item.as_string)
				end
			end
		end

	arch_ext_ref_list: ARRAYED_SET [STRING]
		do
			Result := current_arch_cat.matching_ids (".*", user_params.rm_type, Void)
		end

	arch_path_list: ARRAYED_LIST [STRING]
		do
			Result := archetype.matching_logical_paths (display_settings.language, user_params.rm_type)
		end

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	constraint_type_ctl, rm_type_ctl, occurrences_choice_ctl, arch_id_list_ctl, arch_path_list_ctl: EVX_COMBO_TEXT_SELECTOR_CONTROL

	node_id_text_ctl, node_id_description_ctl: EVX_SINGLE_LINE_TEXT_CONTROL

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


