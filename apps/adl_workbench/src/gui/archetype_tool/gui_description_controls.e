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

	min_entry_control_width_in_chars: INTEGER = 20

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

			-- ================================== Governance tab ========================================
			create ev_governance_tab_vbox
			ev_root_container.extend (ev_governance_tab_vbox)
			ev_root_container.set_item_text (ev_governance_tab_vbox, get_text (ec_governance_tab_text))

			-- lifecycle state control - single line combo text-selection field
			create evx_lifecycle_state_combo.make_linked (get_text (ec_lifecycle_state_label_text),
				get_text (ec_lifecycle_state_label_tooltip),
				agent : detachable STRING do if attached source_archetype.description as desc then Result := desc.lifecycle_state end end,
				resource_lifecycle_states,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_lifecycle_state (a_str) end end,
				Void, undo_redo_chain, 18)
			gui_controls.extend (evx_lifecycle_state_combo)
			ev_governance_tab_vbox.extend (evx_lifecycle_state_combo.ev_root_container)
			ev_governance_tab_vbox.disable_item_expand (evx_lifecycle_state_combo.ev_root_container)

			-- resource package - String
			create evx_package_frame.make (get_msg (ec_package_frame_text, Void), False)
			ev_governance_tab_vbox.extend (evx_package_frame.ev_root_container)
			ev_governance_tab_vbox.disable_item_expand (evx_package_frame.ev_root_container)
			create evx_resource_package.make_linked (get_text (ec_packages_label_text),
				agent :detachable STRING
					do
						if attached source_archetype.description as desc and then attached desc.resource_package_uri as rpi then
							Result := rpi.out
						end
					end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_resource_package_uri (a_str) end end,
				agent do source_archetype.description.clear_resource_package_uri end,
				undo_redo_chain, 0, True)
			gui_controls.extend (evx_resource_package)
			evx_package_frame.extend (evx_resource_package.ev_root_container, False)

			-- current custodian frame & controls
			create evx_custodian_frame.make (get_msg (ec_custodian_frame_text, Void), False)
			ev_governance_tab_vbox.extend (evx_custodian_frame.ev_root_container)
			ev_governance_tab_vbox.disable_item_expand (evx_custodian_frame.ev_root_container)

			-- custodian namespace - String
			create evx_custodian_namespace_text.make_linked (get_text (ec_custodian_namespace_label_text),
				agent : detachable STRING
					do
						if attached source_archetype.description as desc and then attached desc.custodian_namespace as rpi then
							Result := rpi
						end
					end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_custodian_namespace (a_str) end end,
				agent do source_archetype.description.clear_custodian_namespace end,
				undo_redo_chain, 0, True)
			gui_controls.extend (evx_custodian_namespace_text)
			evx_custodian_frame.extend (evx_custodian_namespace_text.ev_root_container, False)

			-- custodian organisation - String
			create evx_custodian_organisation_text.make_linked (get_text (ec_custodian_organisation_label_text),
				agent : detachable STRING
					do
						if attached source_archetype.description as desc and then attached desc.custodian_organisation as rpi then
							Result := rpi
						end
					end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_custodian_organisation (a_str) end end,
				agent do source_archetype.description.clear_custodian_organisation end,
				undo_redo_chain, 0, True)
			gui_controls.extend (evx_custodian_organisation_text)
			evx_custodian_frame.extend (evx_custodian_organisation_text.ev_root_container, False)


			-- ---------- original publisher frame & controls -----------
			create evx_original_publisher_frame.make (get_text (ec_original_publisher_frame_text), False)
			ev_governance_tab_vbox.extend (evx_original_publisher_frame.ev_root_container)
			ev_governance_tab_vbox.disable_item_expand (evx_original_publisher_frame.ev_root_container)

			-- original namespace - String
			create evx_original_namespace_text.make_linked (get_text (ec_original_namespace_label_text),
				agent : detachable STRING
					do
						if attached source_archetype.description as desc and then attached desc.original_namespace as rpi then
							Result := rpi
						end
					end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_original_namespace (a_str) end end,
				agent do source_archetype.description.clear_original_namespace end,
				undo_redo_chain, 0, True)
			gui_controls.extend (evx_original_namespace_text)
			evx_original_publisher_frame.extend (evx_original_namespace_text.ev_root_container, False)

			-- original publisher - String
			create evx_original_publisher_text.make_linked (get_text (ec_original_publisher_label_text),
				agent : detachable STRING
					do
						if attached source_archetype.description as desc and then attached desc.original_publisher as rpi then
							Result := rpi
						end
					end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.set_original_publisher (a_str) end end,
				agent do source_archetype.description.clear_original_publisher end,
				undo_redo_chain, 0, True)
			gui_controls.extend (evx_original_publisher_text)
			evx_original_publisher_frame.extend (evx_original_publisher_text.ev_root_container, False)


			-- ---------- IP frame and controls ----------
			create evx_ip_frame.make (get_text (ec_intellectual_property_frame_text), False)
			ev_governance_tab_vbox.extend (evx_ip_frame.ev_root_container)

			-- copyright - multi-line text
			create evx_copyright_text.make_linked (get_text (ec_copyright_label_text),
				agent : detachable STRING do if attached source_archetype.description as desc then Result := desc.copyright end end,
				agent (a_str: STRING) do source_archetype.description.set_copyright (a_str) end,
				agent do source_archetype.description.clear_copyright end,
				undo_redo_chain, 0, 0, True)
			gui_controls.extend (evx_copyright_text)
			evx_ip_frame.extend (evx_copyright_text.ev_root_container, False)

			-- licence - multi-line text
			create evx_licence_text.make_linked (get_text (ec_licence_label_text),
				agent : detachable STRING do if attached source_archetype.description as desc then Result := desc.licence end end,
				agent (a_str: STRING) do source_archetype.description.set_licence (a_str) end,
				agent do source_archetype.description.clear_licence end,
				undo_redo_chain, 0, 0, True)
			gui_controls.extend (evx_licence_text)
			evx_ip_frame.extend (evx_licence_text.ev_root_container, False)

			-- ip_acknowledgements control - Hash
			create evx_ip_acknowledgements.make_linked (get_text (ec_ip_acknowledgements_label_text),
				agent : detachable HASH_TABLE [STRING, STRING] do if attached source_archetype.description as desc and then attached desc.ip_acknowledgements as ack then Result := ack end end,
				agent (a_key, a_val: STRING) do if attached source_archetype.description as desc then desc.put_ip_acknowledgements_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached source_archetype.description as desc then desc.remove_ip_acknowledgements_item (a_key) end end,
				undo_redo_chain,
				0, 0, True, Void)
			gui_controls.extend (evx_ip_acknowledgements)
			evx_ip_frame.extend (evx_ip_acknowledgements.ev_root_container, True)

			-- ---------- source status frame and controls ----------
			create evx_source_status_frame.make (get_text (ec_source_status_frame_text), False)
			ev_governance_tab_vbox.extend (evx_source_status_frame.ev_root_container)

			-- generated checkbox
			create evx_generated_cb.make_linked (get_text (ec_generated_status_label), get_text (ec_generated_status_tooltip),
				agent get_archetype_is_generated,
				agent (a_val: BOOLEAN) do if attached source_archetype as att_arch then if a_val then att_arch.set_is_generated else att_arch.clear_is_generated end end end)
			gui_controls.extend (evx_generated_cb)
			evx_source_status_frame.extend (evx_generated_cb.ev_data_control, False)

			-- conversion_details control - Hash
			create evx_conversion_details.make_linked (get_text (ec_conversion_details_label_text),
				agent : detachable HASH_TABLE [STRING, STRING] do if attached source_archetype.description as desc and then attached desc.conversion_details as cd then Result := cd end end,
				agent (a_key, a_val: STRING) do if attached source_archetype.description as desc then desc.put_conversion_details_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached source_archetype.description as desc then desc.remove_conversion_details_item (a_key) end end,
				undo_redo_chain,
				0, 0, True, Void)
			gui_controls.extend (evx_conversion_details)
			evx_source_status_frame.extend (evx_conversion_details.ev_root_container, True)


			-- ================================== Authoring tab ========================================
			create ev_author_tab_vbox
			ev_root_container.extend (ev_author_tab_vbox)
			ev_root_container.set_item_text (ev_author_tab_vbox, get_text (ec_authoring_tab_text))

			create evx_auth_frame.make (get_text (ec_auth_frame_text), True)
			ev_author_tab_vbox.extend (evx_auth_frame.ev_root_container)

			-- original_author control - Hash
			create evx_original_author.make_linked (get_text (ec_auth_orig_auth_label_text),
				agent : detachable HASH_TABLE [STRING, STRING] do if attached source_archetype.description as desc then Result := desc.original_author end end,
				agent (a_key, a_val: STRING) do if attached source_archetype.description as desc then desc.put_original_author_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached source_archetype.description as desc then desc.remove_original_author_item (a_key) end end,
				undo_redo_chain, 0, min_entry_control_width_in_chars, False, Void)
			gui_controls.extend (evx_original_author)
			evx_auth_frame.extend (evx_original_author.ev_root_container, True)

			-- contributors - list
			create evx_auth_contrib_list.make_linked (get_text (ec_auth_contrib_label_text),
				agent : detachable DYNAMIC_LIST [STRING] do if attached source_archetype.description as desc and then attached desc.other_contributors as oc then Result := oc end end,
				agent (a_str: STRING; i: INTEGER) do if attached source_archetype.description as desc then desc.add_other_contributor (a_str, i) end end,
				agent (a_str: STRING) do if attached source_archetype.description as desc then desc.remove_other_contributor (a_str) end end,
				undo_redo_chain, 0, min_entry_control_width_in_chars, False)
			gui_controls.extend (evx_auth_contrib_list)
			evx_auth_frame.extend (evx_auth_contrib_list.ev_root_container, True)

			create evx_lang_frame.make (get_text (ec_lang_frame_text), False)
			ev_author_tab_vbox.extend (evx_lang_frame.ev_root_container)
			create ev_lang_original_trans_hbox
			evx_lang_frame.extend (ev_lang_original_trans_hbox, False)

			-- original_language - text field (not modifiable)
			create evx_original_language_text.make (get_text (ec_original_language_label_text),
				agent : STRING do Result := source_archetype.original_language.code_string end, 6, True)
			gui_controls.extend (evx_original_language_text)
			ev_lang_original_trans_hbox.extend (evx_original_language_text.ev_root_container)

			-- translation languages selector
			create evx_trans_languages_combo.make (get_text (ec_trans_languages_label_text), Void,
				agent : detachable DYNAMIC_LIST [STRING]
					do
						if source_archetype.has_translations then
							Result := create {ARRAYED_LIST [STRING]}.make_from_array (source_archetype.translations.current_keys)
						end
					end, Void, 6, True)
			ev_lang_original_trans_hbox.extend (evx_trans_languages_combo.ev_root_container)
			gui_controls.extend (evx_trans_languages_combo)

			create ev_lang_translations_hbox
			evx_lang_frame.extend (ev_lang_translations_hbox, True)

			-- translation author - Hash table
			create ev_trans_author_accreditation_vbox
			ev_lang_translations_hbox.extend (ev_trans_author_accreditation_vbox)
			create evx_trans_author.make_linked (get_text (ec_translator_label_text),
				agent : detachable HASH_TABLE [STRING, STRING]
					do
						if source_archetype.has_translations then
							Result := translation_details.author
						end
					end,
				agent (a_key, a_val: STRING) do if source_archetype.has_translations then translation_details.put_author_item (a_key, a_val) end end,
				agent (a_key: STRING) do translation_details.remove_author_item (a_key) end,
				undo_redo_chain, 0, min_entry_control_width_in_chars, False, Void)
			gui_controls.extend (evx_trans_author)
			evx_trans_languages_combo.add_linked_control (evx_trans_author)
			ev_trans_author_accreditation_vbox.extend (evx_trans_author.ev_root_container)

			-- translator accreditation - multi-line text field
			create evx_trans_accreditation_text.make_linked (get_text (ec_accreditation_label_text),
				agent :detachable STRING do if source_archetype.has_translations then Result := translation_details.accreditation end end,
				agent (a_str: STRING) do translation_details.set_accreditation (a_str) end,
				agent do translation_details.clear_accreditation end,
				undo_redo_chain, 0, 0, False)
			gui_controls.extend (evx_trans_accreditation_text)
			ev_trans_author_accreditation_vbox.extend (evx_trans_accreditation_text.ev_root_container)
			evx_trans_languages_combo.add_linked_control (evx_trans_accreditation_text)

			-- translator other_details - Hash
			create evx_trans_other_details.make_linked (get_text (ec_translator_other_details_label_text),
				agent :detachable HASH_TABLE [STRING, STRING] do if source_archetype.has_translations then Result := translation_details.other_details end end,
				agent (a_key, a_val: STRING) do if source_archetype.has_translations then translation_details.put_other_details_item (a_key, a_val) end end,
				agent (a_key: STRING) do translation_details.remove_other_details_item (a_key) end,
				undo_redo_chain, 0, min_entry_control_width_in_chars, False, Void)
			gui_controls.extend (evx_trans_other_details)
			evx_trans_languages_combo.add_linked_control (evx_trans_other_details)
			ev_lang_translations_hbox.extend (evx_trans_other_details.ev_root_container)


			-- ================================== Details tab ========================================
			create ev_description_tab_vbox
			ev_root_container.extend (ev_description_tab_vbox)
			ev_root_container.set_item_text (ev_description_tab_vbox, get_text (ec_descriptive_tab_text))

			create ev_details_hbox
			ev_description_tab_vbox.extend (ev_details_hbox)
			create evx_details_frame.make (get_text (ec_archetype_details_label_text), False)
			ev_details_hbox.extend (evx_details_frame.ev_root_container)

			-- purpose - mutli-line String
			create evx_purpose_text.make_linked (get_text (ec_purpose_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.purpose end end,
				agent (a_str: STRING) do description_details.set_purpose (a_str) end,
				Void, undo_redo_chain, 3, 0, True)
			gui_controls.extend (evx_purpose_text)
			evx_details_frame.extend (evx_purpose_text.ev_root_container, False)

			-- use - mutli-line String
			create evx_use_text.make_linked (get_text (ec_use_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.use end end,
				agent (a_str: STRING) do description_details.set_use (a_str) end,
				agent do description_details.clear_use end,
				undo_redo_chain, 0, 0, True)
			gui_controls.extend (evx_use_text)
			evx_details_frame.extend (evx_use_text.ev_root_container, True)

			-- misuse - mutli-line String
			create evx_misuse_text.make_linked (get_text (ec_misuse_label_text),
				agent :detachable STRING do if attached description_details as dd then Result := dd.misuse end end,
				agent (a_str: STRING) do description_details.set_misuse (a_str) end,
				agent do description_details.clear_misuse end,
				undo_redo_chain, 0, 0, True)
			gui_controls.extend (evx_misuse_text)
			evx_details_frame.extend (evx_misuse_text.ev_root_container, True)

			-- keywords list
			create evx_keywords_list.make_linked (get_text (ec_keywords_label_text),
				agent :detachable DYNAMIC_LIST [STRING] do if attached description_details as dd then Result := dd.keywords end end,
				agent (a_str: STRING; i: INTEGER) do description_details.add_keyword (a_str, i) end,
				agent (a_str: STRING) do description_details.remove_keyword (a_str) end,
				undo_redo_chain, 0, 25, False)
			gui_controls.extend (evx_keywords_list)
			ev_details_hbox.extend (evx_keywords_list.ev_root_container)
			ev_details_hbox.disable_item_expand (evx_keywords_list.ev_root_container)

			create evx_resource_frame.make (get_text (ec_resources_label_text), False)
			ev_description_tab_vbox.extend (evx_resource_frame.ev_root_container)
			ev_description_tab_vbox.disable_item_expand (evx_resource_frame.ev_root_container)

			-- original resource URIs - Hash <String, String>
			create evx_original_resources.make_linked (get_text (ec_resource_orig_res_label_text),
				agent :detachable HASH_TABLE [STRING, STRING]
					do
						if attached description_details as dd and then attached dd.original_resource_uri as ori then
							Result := ori
						end
					end,
				agent (a_key, a_val: STRING) do if attached description_details as dd then dd.put_original_resource_uri_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached description_details as dd then dd.remove_original_resource_uri_item (a_key) end end,
				undo_redo_chain, 3, 0, True, Void)
			gui_controls.extend (evx_original_resources)
			evx_resource_frame.extend (evx_original_resources.ev_root_container, False)

			-- other details - Hash <String, String>
			create evx_description_other_details.make_linked (get_text (ec_other_details_label_text),
				agent :detachable HASH_TABLE [STRING, STRING]
					do
						if attached description_details as dd and then attached dd.other_details as od then
							Result := od
						end
					end,
				agent (a_key, a_val: STRING) do if attached description_details as dd then dd.put_other_details_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached description_details as dd then dd.remove_other_details_item (a_key) end end,
				undo_redo_chain, 2, 0, True, Void)
			gui_controls.extend (evx_description_other_details)
			ev_description_tab_vbox.extend (evx_description_other_details.ev_root_container)
			ev_description_tab_vbox.disable_item_expand (evx_description_other_details.ev_root_container)


			-- ================================== References tab ========================================
			create ev_references_tab_vbox
			ev_root_container.extend (ev_references_tab_vbox)
			ev_root_container.set_item_text (ev_references_tab_vbox, get_text (ec_references_tab_text))

			-- other details - Hash <String, String>
			create evx_references.make_linked ("",
				agent :detachable HASH_TABLE [STRING, STRING]
					do
						if attached source_archetype.description as desc and then attached desc.references as od then
							Result := od
						end
					end,
				agent (a_key, a_val: STRING) do if attached source_archetype.description as desc then desc.put_references_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached source_archetype.description as desc then desc.remove_references_item (a_key) end end,
				undo_redo_chain,
				2, 0, True, Void)
			gui_controls.extend (evx_references)
			ev_references_tab_vbox.extend (evx_references.ev_root_container)

			-- ================================== Other Details tab ========================================
			create ev_other_details_tab_vbox
			ev_root_container.extend (ev_other_details_tab_vbox)
			ev_root_container.set_item_text (ev_other_details_tab_vbox, get_text (ec_other_details_tab_text))

			-- other details - Hash <String, String>
			create evx_other_details.make_linked ("",
				agent :detachable HASH_TABLE [STRING, STRING]
					do
						if attached source_archetype.description as desc and then attached desc.other_details as od then
							Result := od
						end
					end,
				agent (a_key, a_val: STRING) do if attached source_archetype.description as desc then desc.put_other_details_item (a_key, a_val) end end,
				agent (a_key: STRING) do if attached source_archetype.description as desc then desc.remove_other_details_item (a_key) end end,
				undo_redo_chain,
				2, 0, True, Void)
			gui_controls.extend (evx_other_details)
			ev_other_details_tab_vbox.extend (evx_other_details.ev_root_container)


			-- =========== set up events ==========
			ev_root_container.set_data (Current)
			ev_root_container.select_item (ev_governance_tab_vbox)
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

feature {NONE} -- Implementation (governance controls)

	ev_governance_tab_vbox: EV_VERTICAL_BOX

	evx_lifecycle_state_combo: EVX_COMBO_TEXT_SELECTOR_CONTROL

	evx_custodian_frame: EVX_FRAME_CONTROL

	evx_custodian_namespace_text, evx_custodian_organisation_text: EVX_SINGLE_LINE_TEXT_CONTROL

	evx_original_publisher_frame: EVX_FRAME_CONTROL

	evx_original_namespace_text, evx_original_publisher_text: EVX_SINGLE_LINE_TEXT_CONTROL

	evx_ip_frame: EVX_FRAME_CONTROL

	evx_licence_text, evx_copyright_text: EVX_MULTILINE_TEXT_CONTROL

	evx_ip_acknowledgements: EVX_HASH_TABLE_CONTROL

	evx_source_status_frame: EVX_FRAME_CONTROL

	evx_generated_cb: EVX_CHECK_BOX_CONTROL

	evx_conversion_details: EVX_HASH_TABLE_CONTROL

feature {NONE} -- Implementation (authoring controls)

	ev_author_tab_vbox, ev_trans_author_accreditation_vbox: EV_VERTICAL_BOX

	evx_auth_frame, evx_lang_frame, evx_package_frame: EVX_FRAME_CONTROL

	evx_original_author, evx_trans_author, evx_trans_other_details: EVX_HASH_TABLE_CONTROL

	evx_auth_contrib_list: EVX_TEXT_LIST_CONTROL

	ev_details_hbox, ev_lang_translations_hbox, ev_lang_original_trans_hbox: EV_HORIZONTAL_BOX

	evx_original_language_text: EVX_SINGLE_LINE_TEXT_CONTROL

	evx_trans_languages_combo: EVX_COMBO_CONTROL

	evx_trans_accreditation_text: EVX_MULTILINE_TEXT_CONTROL

feature {NONE} -- Implementation (description controls)

	ev_description_tab_vbox: EV_VERTICAL_BOX

	evx_details_frame, evx_resource_frame: EVX_FRAME_CONTROL

	evx_resource_package: EVX_SINGLE_LINE_TEXT_CONTROL

	evx_original_resources, evx_description_other_details: EVX_HASH_TABLE_CONTROL

	evx_keywords_list: EVX_TEXT_LIST_CONTROL

	evx_purpose_text, evx_use_text, evx_misuse_text: EVX_MULTILINE_TEXT_CONTROL

feature {NONE} -- Implementation (other details controls)

	evx_other_details: EVX_HASH_TABLE_CONTROL

	ev_other_details_tab_vbox: EV_VERTICAL_BOX

feature {NONE} -- Implementation (references controls)

	evx_references: EVX_HASH_TABLE_CONTROL

	ev_references_tab_vbox: EV_VERTICAL_BOX

feature {NONE} -- Implementation

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
				Result := source_archetype.translation_for_language (evx_trans_languages_combo.selected_text)
			end
		end

	get_archetype_is_generated: BOOLEAN
		do
			if attached source_archetype as att_arch then
				Result := att_arch.is_generated
			end
		end

end



