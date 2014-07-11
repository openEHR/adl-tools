note
	component:   "openEHR ADL Tools"
	description: "Description controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_DESCRIPTION_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, can_edit, disable_edit, enable_edit
		end

create
	make, make_editable

feature -- Definitions

	min_entry_control_width: INTEGER = 150

feature {NONE} -- Initialisation

	make_editable (an_undo_redo_chain: like undo_redo_chain)
		do
			undo_redo_chain := an_undo_redo_chain
			make
		end

	make
		do
			-- set commit handling
			create gui_controls.make (0)

			-- ======= root container ===========
			create ev_root_container

			-- ====== Authoring tab =======
			create admin_vbox
			ev_root_container.extend (admin_vbox)
			ev_root_container.set_item_text (admin_vbox, get_text (ec_authoring_tab_text))

			-- lifecycle state control - single line combo text-selection field
			create lifecycle_state_text_ctl.make_linked (get_text (ec_lifecycle_state_label_text),
				get_text (ec_lifecycle_state_label_tooltip),
				agent :detachable STRING do if attached source_archetype.description as desc then Result := desc.lifecycle_state end end,
				resource_lifecycle_states,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_lifecycle_state (a_str) end end,
				Void, undo_redo_chain, 0, 140)
			gui_controls.extend (lifecycle_state_text_ctl)
			admin_vbox.extend (lifecycle_state_text_ctl.ev_root_container)
			admin_vbox.disable_item_expand (lifecycle_state_text_ctl.ev_root_container)

			create auth_frame_ctl.make (get_msg (ec_auth_frame_text, Void), 70, 0, True)
			admin_vbox.extend (auth_frame_ctl.ev_root_container)

			-- original_author control - Hash
			create original_author_ctl.make_linked (get_text (ec_auth_orig_auth_label_text),
				agent :detachable HASH_TABLE [STRING, STRING] do if attached source_archetype.description as desc then Result := desc.original_author end end,
				agent (a_key, a_val: STRING) do if attached source_archetype.description as desc then desc.put_original_author_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached source_archetype.description as desc then desc.remove_original_author_item (a_key) end end,
				undo_redo_chain,
				0, min_entry_control_width, False, Void)
			gui_controls.extend (original_author_ctl)

			-- contributors - list
			create auth_contrib_list_ctl.make_linked (get_text (ec_auth_contrib_label_text),
				agent :detachable DYNAMIC_LIST [STRING] do if attached source_archetype.description as desc and then attached desc.other_contributors as oc then Result := oc end end,
				agent (a_str: STRING; i: INTEGER) do if attached source_archetype.description as desc then desc.add_other_contributor (a_str, i) end end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.remove_other_contributor (a_str) end end,
				undo_redo_chain,
				0, min_entry_control_width, False)
			gui_controls.extend (auth_contrib_list_ctl)
			auth_frame_ctl.extend (original_author_ctl.ev_root_container, True)
			auth_frame_ctl.extend (auth_contrib_list_ctl.ev_root_container, True)

			create lang_frame_ctl.make (get_msg (ec_lang_frame_text, Void), 130, 0, False)
			admin_vbox.extend (lang_frame_ctl.ev_root_container)
			create lang_original_trans_hbox
			lang_frame_ctl.extend (lang_original_trans_hbox, False)

			-- original_language - text field (not modifiable)
			create original_language_text_ctl.make (get_text (ec_original_language_label_text),
				agent :STRING do Result := source_archetype.original_language.code_string end,
				0, 0, True)
			gui_controls.extend (original_language_text_ctl)
			lang_original_trans_hbox.extend (original_language_text_ctl.ev_root_container)

			-- translation languages selector
			create trans_languages_ctl.make (get_text (ec_trans_languages_label_text), Void,
				agent :detachable DYNAMIC_LIST [STRING]
					do
						if source_archetype.has_translations then
							Result := create {ARRAYED_LIST [STRING]}.make_from_array (source_archetype.translations.current_keys)
						end
					end, Void,
				0, 100, True)
			lang_original_trans_hbox.extend (trans_languages_ctl.ev_root_container)
			gui_controls.extend (trans_languages_ctl)

			create lang_translations_hbox
			lang_frame_ctl.extend (lang_translations_hbox, True)

			-- translation author - Hash table
			create trans_author_accreditation_vbox
			lang_translations_hbox.extend (trans_author_accreditation_vbox)
			create trans_author_ctl.make_linked (get_text (ec_translator_label_text),
				agent :detachable HASH_TABLE [STRING, STRING]
					do
						if source_archetype.has_translations then
							Result := translation_details.author
						end
					end,
				agent (a_key, a_val: STRING) do if source_archetype.has_translations then translation_details.put_author_item (a_key, a_val) end end,
				agent (a_key: STRING) do translation_details.remove_author_item (a_key) end,
				undo_redo_chain, 0, min_entry_control_width, False, Void)
			gui_controls.extend (trans_author_ctl)
			trans_languages_ctl.add_linked_control (trans_author_ctl)
			trans_author_accreditation_vbox.extend (trans_author_ctl.ev_root_container)

			-- translator accreditation - multi-line text field
			create trans_accreditation_text_ctl.make_linked (get_text (ec_accreditation_label_text),
				agent :detachable STRING do if source_archetype.has_translations then Result := translation_details.accreditation end end,
				agent (a_str: STRING) do translation_details.set_accreditation (a_str) end,
				agent do translation_details.clear_accreditation end,
				undo_redo_chain, 0, 0, False)
			gui_controls.extend (trans_accreditation_text_ctl)
			trans_author_accreditation_vbox.extend (trans_accreditation_text_ctl.ev_root_container)
			trans_languages_ctl.add_linked_control (trans_accreditation_text_ctl)

			-- translator other_details - Hash
			create trans_other_details_ctl.make_linked (get_text (ec_translator_other_details_label_text),
				agent :detachable HASH_TABLE [STRING, STRING] do if source_archetype.has_translations then Result := translation_details.other_details end end,
				agent (a_key, a_val: STRING) do if source_archetype.has_translations then translation_details.put_other_details_item (a_key, a_val) end end,
				agent (a_key: STRING) do translation_details.remove_other_details_item (a_key) end,
				undo_redo_chain,
				0, min_entry_control_width, False, Void)
			gui_controls.extend (trans_other_details_ctl)
			trans_languages_ctl.add_linked_control (trans_other_details_ctl)
			lang_translations_hbox.extend (trans_other_details_ctl.ev_root_container)

			-- copyright - multi-line text
			create copyright_text_ctl.make_linked (get_text (ec_copyright_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.copyright end end,
				agent (a_str: STRING) do description_details.set_copyright (a_str) end,
				agent do description_details.clear_copyright end,
				undo_redo_chain, 44, 0, True)
			gui_controls.extend (copyright_text_ctl)
			admin_vbox.extend (copyright_text_ctl.ev_root_container)
			admin_vbox.disable_item_expand (copyright_text_ctl.ev_root_container)


			-- ======== Descriptive tab =========
			create description_vbox
			ev_root_container.extend (description_vbox)
			ev_root_container.set_item_text (description_vbox, get_text (ec_descriptive_tab_text))

			create details_hbox
			description_vbox.extend (details_hbox)
			create details_frame_ctl.make (get_text (ec_archetype_details_label_text), 70, 0, False)
			details_hbox.extend (details_frame_ctl.ev_root_container)

			-- purpose - mutli-line String
			create purpose_text_ctl.make_linked (get_text (ec_purpose_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.purpose end end,
				agent (a_str: STRING) do description_details.set_purpose (a_str) end,
				Void, undo_redo_chain, 0, 0, True)
			gui_controls.extend (purpose_text_ctl)
			details_frame_ctl.extend (purpose_text_ctl.ev_root_container, True)

			-- use - mutli-line String
			create use_text_ctl.make_linked (get_text (ec_use_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.use end end,
				agent (a_str: STRING) do description_details.set_use (a_str) end,
				agent do description_details.clear_use end,
				undo_redo_chain, 0, 0, True)
			gui_controls.extend (use_text_ctl)
			details_frame_ctl.extend (use_text_ctl.ev_root_container, True)

			-- misuse - mutli-line String
			create misuse_text_ctl.make_linked (get_text (ec_misuse_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.misuse end end,
				agent (a_str: STRING) do description_details.set_misuse (a_str) end,
				agent do description_details.clear_misuse end,
				undo_redo_chain,
				0, 0, True)
			gui_controls.extend (misuse_text_ctl)
			details_frame_ctl.extend (misuse_text_ctl.ev_root_container, True)

			-- keywords list
			create keywords_list_ctl.make_linked (get_text (ec_keywords_label_text),
				agent :detachable DYNAMIC_LIST [STRING] do if attached description_details as dd then Result := dd.keywords end end,
				agent (a_str: STRING; i: INTEGER) do description_details.add_keyword (a_str, i) end,
				agent (a_str: STRING) do description_details.remove_keyword (a_str) end,
				undo_redo_chain,
				0, 200, False)
			gui_controls.extend (keywords_list_ctl)
			details_hbox.extend (keywords_list_ctl.ev_root_container)
			details_hbox.disable_item_expand (keywords_list_ctl.ev_root_container)

			create resource_frame_ctl.make (get_text (ec_resources_label_text), 90, 0, False)
			description_vbox.extend (resource_frame_ctl.ev_root_container)
			description_vbox.disable_item_expand (resource_frame_ctl.ev_root_container)

			-- resource package - String
			create resource_package_ctl.make_linked (get_text (ec_packages_label_text),
				agent :detachable STRING
					do
						if attached source_archetype.description as desc and then attached desc.resource_package_uri as rpi then
							Result := rpi.out
						end
					end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_resource_package_uri (a_str) end end,
				agent do source_archetype.description.clear_resource_package_uri end,
				undo_redo_chain, 0, 0, True)
			gui_controls.extend (resource_package_ctl)
			resource_frame_ctl.extend (resource_package_ctl.ev_root_container, False)

			-- original resources - Hash
			create original_resources_ctl.make_linked (get_text (ec_resource_orig_res_label_text),
				agent :detachable HASH_TABLE [STRING, STRING]
					do
						if attached description_details as dd and then attached dd.original_resource_uri then
							Result := dd.original_resource_uri
						end
					end,
				agent (a_key, a_val: STRING) do if attached description_details as dd then dd.put_original_resource_uri_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached description_details as dd then description_details.remove_original_resource_uri_item (a_key) end end,
				undo_redo_chain,
				44, 0, True, Void)
			gui_controls.extend (original_resources_ctl)
			resource_frame_ctl.extend (original_resources_ctl.ev_root_container, False)

			ev_root_container.set_data (Current)

			-- =========== set up events ==========
			ev_root_container.select_item (admin_vbox)

			if not editing_enabled then
				disable_edit
			end
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := a_source.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated and source.is_valid
		end

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := True
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

	disable_edit
			-- disable editing
		do
			precursor
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.disable_editable end)
		end

feature {NONE} -- Implementation

	admin_vbox, description_vbox, trans_author_accreditation_vbox: EV_VERTICAL_BOX

	details_hbox, lang_translations_hbox, lang_original_trans_hbox: EV_HORIZONTAL_BOX

	auth_frame_ctl, lang_frame_ctl, details_frame_ctl, resource_frame_ctl: EVX_FRAME_CONTROL

	original_language_text_ctl, resource_package_ctl: EVX_SINGLE_LINE_TEXT_CONTROL

	lifecycle_state_text_ctl: EVX_COMBO_TEXT_SELECTOR_CONTROL

	original_author_ctl, trans_author_ctl, trans_other_details_ctl, original_resources_ctl: EVX_HASH_TABLE_CONTROL

	auth_contrib_list_ctl, keywords_list_ctl: EVX_TEXT_LIST_CONTROL

	trans_accreditation_text_ctl, copyright_text_ctl, purpose_text_ctl, use_text_ctl, misuse_text_ctl: EVX_MULTILINE_TEXT_CONTROL

	trans_languages_ctl: EVX_COMBO_CONTROL

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	do_clear
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
		end

	do_populate
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
		end

	description_details: detachable RESOURCE_DESCRIPTION_ITEM
		require
			is_populated
		do
			if attached source_archetype.description as desc and then desc.has_details and attached selected_language as sel_lang then
				Result := desc.detail_for_language (sel_lang)
			end
		end

	translation_details: detachable TRANSLATION_DETAILS
		do
			if source_archetype.has_translations then
				Result := source_archetype.translation_for_language (trans_languages_ctl.selected_text)
			end
		end

end



