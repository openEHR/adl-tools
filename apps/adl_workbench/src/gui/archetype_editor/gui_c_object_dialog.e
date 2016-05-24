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

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		undefine
			is_equal, default_create, copy
		end

create
	make

feature {NONE} -- Initialization

	make (a_aom_types, an_rm_types: ARRAYED_LIST [STRING]; an_old_aom_type, an_old_rm_type: STRING;
			an_occurrences_default: MULTIPLICITY_INTERVAL; an_archetype: ARCHETYPE;
			a_display_settings: GUI_DEFINITION_SETTINGS)
			-- Make with RM types, constraint type selection and an occurrences constrainer that is used to determine
			-- the possible occurrences in this case
		require
			Valid_constraint_types: a_aom_types.object_comparison and a_aom_types.has (an_old_aom_type)
			Valid_rm_types: an_rm_types.object_comparison and an_rm_types.has (an_old_rm_type)
		do
			occurrences_default := an_occurrences_default

			create old_params.make (an_old_aom_type, an_old_rm_type, an_occurrences_default.as_string, term_definition_mandatory)
			create new_params.make (an_old_aom_type.twin, an_old_rm_type.twin, an_occurrences_default.as_string, term_definition_mandatory)

			archetype := an_archetype

			create aom_types.make (0)
			aom_types.compare_objects
			aom_types.append (a_aom_types)
			if arch_ext_ref_list.is_empty then
				aom_types.prune (bare_type_name(({C_ARCHETYPE_ROOT}).name))
			end

			rm_types := an_rm_types

			display_settings := a_display_settings

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

			-- ============ node_id checkbox, text & description controls ============

			create node_id_cb_ctl.make_linked (get_text (ec_node_id_cb_text), get_text (ec_node_id_cb_tooltip),
				agent :BOOLEAN do Result := user_requires_id_term_definition end,
				agent set_user_requires_id_term_definition)
			ev_root_container.extend (node_id_cb_ctl.ev_data_control)
			ev_root_container.disable_item_expand (node_id_cb_ctl.ev_data_control)
			if term_definition_mandatory then
				node_id_cb_ctl.hide
			end
			gui_controls.extend (node_id_cb_ctl)

			-- terminology text - not shown by default if not needed
			create node_id_text_ctl.make_linked (get_text (ec_node_id_text),
				agent :STRING do Result := new_params.node_id_text end,
				agent (v:STRING) do new_params.set_node_id_text (v) end,
				Void, Void, 0, True)
			ev_root_container.extend (node_id_text_ctl.ev_root_container)
			ev_root_container.disable_item_expand (node_id_text_ctl.ev_root_container)
			if not term_definition_mandatory then
				node_id_text_ctl.hide
			end
			gui_controls.extend (node_id_text_ctl)

			-- terminology description - not shown by default if not needed
			create node_id_description_ctl.make_linked (get_text (ec_node_id_description),
				agent :STRING do Result := new_params.node_id_description end,
				agent (v:STRING) do new_params.set_node_id_description (v) end,
				Void, Void, 0, True)
			ev_root_container.extend (node_id_description_ctl.ev_root_container)
			ev_root_container.disable_item_expand (node_id_description_ctl.ev_root_container)
			if not term_definition_mandatory then
				node_id_description_ctl.hide
			end
			gui_controls.extend (node_id_description_ctl)

			-- ============ constraint type combo-box control ============
			create aom_type_ctl.make_linked (get_text (ec_initial_c_object_config_constraint_type_text),
				get_text (ec_initial_c_object_config_constraint_type_tooltip),
				agent :STRING do Result := new_params.aom_type end,
				aom_types, agent set_new_aom_type, Void, Void, 0)
			ev_root_container.extend (aom_type_ctl.ev_root_container)
			ev_root_container.disable_item_expand (aom_type_ctl.ev_root_container)
			gui_controls.extend (aom_type_ctl)
			if aom_types.count = 1 then
				aom_type_ctl.disable_sensitive
			end

			-- ============ RM type combo-box control ============
			create rm_type_ctl.make_linked (get_text (ec_initial_c_object_config_rm_type_text),
				get_text (ec_initial_c_object_config_rm_type_tooltip),
				agent :STRING do Result := new_params.rm_type end,
				rm_types, agent (a_str: STRING) do new_params.set_rm_type (a_str) end,
				Void, Void, 0)
			ev_root_container.extend (rm_type_ctl.ev_root_container)
			ev_root_container.disable_item_expand (rm_type_ctl.ev_root_container)
			gui_controls.extend (rm_type_ctl)
			if rm_types.count = 1 then
				rm_type_ctl.disable_sensitive
			end

			-- ============ Occurrences ============
			create occurrences_choice_ctl.make_linked (get_text (ec_initial_c_object_config_occurrences_text),
				get_text (ec_initial_c_object_config_occurrences_tooltip),
				agent :STRING do Result := new_params.occurrences end,
				occurrences_constrained_list, agent (a_str: STRING) do new_params.set_occurrences (a_str) end, Void, Void, 0)
			ev_root_container.extend (occurrences_choice_ctl.ev_root_container)
			ev_root_container.disable_item_expand (occurrences_choice_ctl.ev_root_container)
			gui_controls.extend (occurrences_choice_ctl)

			-- ============ Archetype ext ref list ============			
			create arch_id_list_ctl.make_linked (get_text (ec_initial_c_object_config_ext_ref_text),
				get_text (ec_initial_c_object_config_ext_ref_tooltip),
				agent :detachable STRING do Result := new_params.ext_ref end,
				arch_ext_ref_list, agent (a_str: STRING) do new_params.set_ext_ref (a_str) end, Void, Void, 0)
			ev_root_container.extend (arch_id_list_ctl.ev_root_container)
			ev_root_container.disable_item_expand (arch_id_list_ctl.ev_root_container)
			if not new_params.aom_type.is_equal (bare_type_name(({C_ARCHETYPE_ROOT}).name)) then
				arch_id_list_ctl.hide
			end
			rm_type_ctl.add_linked_control (arch_id_list_ctl)
			gui_controls.extend (arch_id_list_ctl)


			-- ============ Archetype path list ============			
			create arch_path_list_ctl.make_linked (get_text (ec_initial_c_object_config_path_ref_text),
				get_text (ec_initial_c_object_config_path_ref_tooltip),
				agent :detachable STRING do Result := new_params.path_ref end,
				arch_path_list, agent (a_str: STRING) do new_params.set_path_ref (a_str) end, Void, Void, 0)
			ev_root_container.extend (arch_path_list_ctl.ev_root_container)
			ev_root_container.disable_item_expand (arch_path_list_ctl.ev_root_container)
			if not new_params.aom_type.is_equal (bare_type_name(({C_COMPLEX_OBJECT_PROXY}).name)) then
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
--					not new_params.constraint_type.is_equal (old_params.aom_type) or
--					not new_params.rm_type.is_equal (old_params.rm_type) or
--					not new_params.occurrences.is_equal (old_params.occurrences)
			if term_definition_required then
				new_params.set_term_definition_required
			end
			hide
		end

feature -- Access

	old_params: C_OBJECT_PROPERTIES

	new_params: C_OBJECT_PROPERTIES

	rm_types: ARRAYED_LIST [STRING]

	aom_types: ARRAYED_LIST [STRING]

feature -- Status Report

	is_valid: BOOLEAN

	user_requires_id_term_definition: BOOLEAN
			-- True if a term definition should be created for the id code, even
			-- if it is not needed

	term_definition_required: BOOLEAN
			-- True if a term definition is required
		do
			Result := term_definition_mandatory or user_requires_id_term_definition
		end

	term_definition_mandatory: BOOLEAN
			-- True if a term definition is mandatory according to occurrences
		do
			Result := occurrences_default.upper_unbounded or else occurrences_default.upper > 1
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature -- Modification

	set_term (a_node_id_text, a_node_id_description: STRING)
			-- set node text/description
		do
			new_params.set_node_id_text (a_node_id_text)
			new_params.set_node_id_description (a_node_id_description)
			do_populate
		end

	set_new_aom_type (a_str: STRING)
		do
			new_params.set_aom_type (a_str)
			do_populate
			if new_params.aom_type.is_equal (bare_type_name(({C_ARCHETYPE_ROOT}).name)) and not arch_ext_ref_list.is_empty then
				arch_id_list_ctl.show
				arch_path_list_ctl.hide
			elseif new_params.aom_type.is_equal (bare_type_name(({C_COMPLEX_OBJECT_PROXY}).name)) and not arch_path_list.is_empty then
				arch_path_list_ctl.show
				arch_id_list_ctl.hide
			else
				arch_path_list_ctl.hide
				arch_id_list_ctl.hide
			end
		end

	set_user_requires_id_term_definition (flag: BOOLEAN)
		do
			user_requires_id_term_definition := flag
			if user_requires_id_term_definition then
				node_id_text_ctl.show
				node_id_description_ctl.show
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

	occurrences_default: MULTIPLICITY_INTERVAL

	occurrences_constrained_list: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			across occurrences_default_list as occs_csr loop
				if occurrences_default.is_equal (occs_csr.item) or occurrences_default.contains (occs_csr.item) then
					Result.extend (occs_csr.item.as_string)
				end
			end
		end

	arch_ext_ref_list: ARRAYED_SET [STRING]
		do
			if attached arch_ext_ref_list_cache as att_cache then
				Result := att_cache
			else
				Result := current_library.subsumption_set (new_params.rm_type, archetype.archetype_id)
				arch_ext_ref_list_cache := Result
			end
		end

	arch_path_list: ARRAYED_LIST [STRING]
		do
			Result := archetype.rm_type_paths_annotated (display_settings.language, new_params.rm_type)
		end

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	aom_type_ctl, rm_type_ctl, occurrences_choice_ctl, arch_id_list_ctl, arch_path_list_ctl: EVX_COMBO_TEXT_SELECTOR_CONTROL

	node_id_cb_ctl: EVX_CHECK_BOX_CONTROL

	node_id_text_ctl, node_id_description_ctl: EVX_SINGLE_LINE_TEXT_CONTROL

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

	arch_ext_ref_list_cache: detachable ARRAYED_SET [STRING]

end


