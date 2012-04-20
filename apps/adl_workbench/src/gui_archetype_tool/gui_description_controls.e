note
	component:   "openEHR Archetype Project"
	description: "Description controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_DESCRIPTION_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate, can_edit, disable_edit, enable_edit
		end

create
	make

feature -- Definitions

	min_text_height: INTEGER = 35

	min_list_height: INTEGER = 50

	min_entry_control_width: INTEGER = 150

	desc_label_width: INTEGER = 70

feature {NONE} -- Initialisation

	make (a_text_box_select_all_handler: PROCEDURE [ANY, TUPLE])
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_data (Current)

			create gui_data_controls.make (0)

			-- ====== Authoring tab =======
			create admin_vbox
			ev_root_container.extend (admin_vbox)
			ev_root_container.set_item_text (admin_vbox, create_message_content ("authoring_tab_text", Void))
			create authoring_tab_undo_redo_chain.make
			create lifecycle_state_text_ctl.make (create_message_content ("lifecycle_state_label_text", Void),
				agent :STRING do Result := source_archetype.description.lifecycle_state end,
				0, 250, True, False, a_text_box_select_all_handler)
			gui_data_controls.extend (lifecycle_state_text_ctl)
			admin_vbox.extend (lifecycle_state_text_ctl.ev_root_container)
			admin_vbox.disable_item_expand (lifecycle_state_text_ctl.ev_root_container)

			create auth_frame_ctl.make (create_message_content ("auth_frame_text", Void), 70, 0, True)
			admin_vbox.extend (auth_frame_ctl.ev_root_container)
			create original_author_ctl.make (create_message_content ("auth_orig_auth_label_text", Void),
				agent :HASH_TABLE [STRING, STRING] do Result := source_archetype.description.original_author end,
				65, min_entry_control_width, False)

			gui_data_controls.extend (original_author_ctl)
			create auth_contrib_list_ctl.make (create_message_content ("auth_contrib_label_text", Void),
				agent :LIST [STRING] do if attached source_archetype.description.other_contributors then Result := source_archetype.description.other_contributors end end,
				30, min_entry_control_width, False)
			gui_data_controls.extend (auth_contrib_list_ctl)
			auth_frame_ctl.extend (original_author_ctl.ev_root_container, True)
			auth_frame_ctl.extend (auth_contrib_list_ctl.ev_root_container, True)

			create lang_frame_ctl.make (create_message_content ("lang_frame_text", Void), 130, 0, False)
			admin_vbox.extend (lang_frame_ctl.ev_root_container)
			create lang_original_trans_hbox
			lang_frame_ctl.extend (lang_original_trans_hbox, False)

			create original_language_text_ctl.make (create_message_content ("original_language_label_text", Void),
				agent :STRING do Result := source_archetype.original_language.code_string end,
				0, 0, True, False, a_text_box_select_all_handler)
			gui_data_controls.extend (original_language_text_ctl)
			lang_original_trans_hbox.extend (original_language_text_ctl.ev_root_container)

			create trans_languages_ctl.make (create_message_content ("trans_languages_label_text", Void),
				agent :LIST [STRING]
					do
						if source_archetype.has_translations then
							Result := create {ARRAYED_LIST [STRING]}.make_from_array (source_archetype.translations.current_keys)
						end
					end,
				0, 0, True)
			lang_original_trans_hbox.extend (trans_languages_ctl.ev_root_container)
			gui_data_controls.extend (trans_languages_ctl)

			create lang_translations_hbox
			lang_frame_ctl.extend (lang_translations_hbox, True)
			create trans_author_accreditation_vbox
			lang_translations_hbox.extend (trans_author_accreditation_vbox)
			create trans_author_ctl.make (create_message_content ("author_label_text", Void),
				agent :HASH_TABLE [STRING, STRING] do if source_archetype.has_translations then Result := translation_details.author end end,
				65, min_entry_control_width, False)
			gui_data_controls.extend (trans_author_ctl)
			trans_languages_ctl.add_linked_control (trans_author_ctl)
			trans_author_accreditation_vbox.extend (trans_author_ctl.ev_root_container)

			create trans_accreditation_text_ctl.make (create_message_content ("accreditation_label_text", Void),
				agent :STRING do if source_archetype.has_translations then Result := translation_details.accreditation end end,
				0, 0, False, a_text_box_select_all_handler)
			gui_data_controls.extend (trans_accreditation_text_ctl)
			trans_author_accreditation_vbox.extend (trans_accreditation_text_ctl.ev_root_container)
			trans_languages_ctl.add_linked_control (trans_accreditation_text_ctl)

			create trans_other_details_ctl.make (create_message_content ("other_details_label_text", Void),
				agent :HASH_TABLE [STRING, STRING] do if source_archetype.has_translations then Result := translation_details.other_details end end,
				40, min_entry_control_width, False)
			gui_data_controls.extend (trans_other_details_ctl)
			trans_languages_ctl.add_linked_control (trans_other_details_ctl)
			lang_translations_hbox.extend (trans_other_details_ctl.ev_root_container)

			create copyright_text_ctl.make (create_message_content ("copyright_label_text", Void),
				agent :STRING do if attached description_details then Result := description_details.copyright end end,
				44, min_entry_control_width, True, a_text_box_select_all_handler)
			gui_data_controls.extend (copyright_text_ctl)
			admin_vbox.extend (copyright_text_ctl.ev_root_container)
			admin_vbox.disable_item_expand (copyright_text_ctl.ev_root_container)


			-- ======== Descriptive tab =========
			create description_vbox
			ev_root_container.extend (description_vbox)
			ev_root_container.set_item_text (description_vbox, create_message_content ("descriptive_tab_text", Void))

			create details_hbox
			description_vbox.extend (details_hbox)
			create details_frame_ctl.make (create_message_content ("archetype_details_label_text", Void), 70, 0, False)
			details_hbox.extend (details_frame_ctl.ev_root_container)

			create purpose_text_ctl.make (create_message_content ("purpose_label_text", Void),
				agent :STRING do if attached description_details then Result := description_details.purpose end end,
				0, 0, True, a_text_box_select_all_handler)
			gui_data_controls.extend (purpose_text_ctl)
			create use_text_ctl.make (create_message_content ("use_label_text", Void),
				agent :STRING do if attached description_details then Result := description_details.use end end,
				0, 0, True, a_text_box_select_all_handler)
			gui_data_controls.extend (use_text_ctl)
			create misuse_text_ctl.make (create_message_content ("misuse_label_text", Void),
				agent :STRING do if attached description_details then Result := description_details.misuse end end,
				0, 0, True, a_text_box_select_all_handler)
			gui_data_controls.extend (misuse_text_ctl)
			details_frame_ctl.extend (purpose_text_ctl.ev_root_container, True)
			details_frame_ctl.extend (use_text_ctl.ev_root_container, True)
			details_frame_ctl.extend (misuse_text_ctl.ev_root_container, True)

			create keywords_list_ctl.make (create_message_content ("keywords_label_text", Void),
				agent :LIST [STRING] do if attached description_details then Result := description_details.keywords end end,
				0, 200, False)
			gui_data_controls.extend (keywords_list_ctl)
			details_hbox.extend (keywords_list_ctl.ev_root_container)
			details_hbox.disable_item_expand (keywords_list_ctl.ev_root_container)

			create resource_frame_ctl.make (create_message_content ("resources_label_text", Void), 90, 0, False)
			description_vbox.extend (resource_frame_ctl.ev_root_container)
			description_vbox.disable_item_expand (resource_frame_ctl.ev_root_container)

			create resource_package_ctl.make (create_message_content ("packages_label_text", Void),
				agent :STRING
					do
						if attached source_archetype.description.resource_package_uri then
							Result := source_archetype.description.resource_package_uri.out
						end
					end,
				0, 0, True, True, a_text_box_select_all_handler)
			gui_data_controls.extend (resource_package_ctl)
			resource_frame_ctl.extend (resource_package_ctl.ev_root_container, False)

			create original_resources_ctl.make (create_message_content ("resource_orig_res_label_text", Void),
				agent :HASH_TABLE [STRING, STRING]
					do
						if attached description_details as dd and then attached dd.original_resource_uri then
							Result := dd.original_resource_uri
						end
					end,
				44, 0, True)
			gui_data_controls.extend (original_resources_ctl)
			resource_frame_ctl.extend (original_resources_ctl.ev_root_container, False)

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

	disable_edit
			-- disable editing
		do
			precursor
			gui_data_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.disable_edit end)
		end

	enable_edit
			-- enable editing
		do
			precursor
			gui_data_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.enable_edit end)
		end

feature {NONE} -- Implementation

	admin_vbox, description_vbox, trans_author_accreditation_vbox: EV_VERTICAL_BOX

	details_hbox, lang_translations_hbox, lang_original_trans_hbox: EV_HORIZONTAL_BOX

	auth_frame_ctl, lang_frame_ctl, details_frame_ctl, resource_frame_ctl: GUI_FRAME_CONTROL

	lifecycle_state_text_ctl, original_language_text_ctl, resource_package_ctl: GUI_SINGLE_LINE_TEXT_CONTROL

	original_author_ctl, trans_author_ctl, trans_other_details_ctl, original_resources_ctl: GUI_HASH_TABLE_CONTROL

	auth_contrib_list_ctl, keywords_list_ctl: GUI_TEXT_LIST_CONTROL

	trans_accreditation_text_ctl, copyright_text_ctl, purpose_text_ctl, use_text_ctl, misuse_text_ctl: GUI_MULTILINE_TEXT_CONTROL

	trans_languages_ctl: GUI_COMBO_CONTROL

	gui_data_controls: ARRAYED_LIST [GUI_DATA_CONTROL]

	authoring_tab_undo_redo_chain, description_tab_undo_redo_chain: UNDO_REDO_CHAIN

	do_clear
			-- Wipe out content.
		do
			gui_data_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.do_clear end)
		end

	do_populate
		do
			gui_data_controls.do_all (agent (an_item: GUI_DATA_CONTROL) do an_item.do_populate end)
			if editing_enabled and source.is_valid then
				original_author_ctl.set_editing_agents (authoring_tab_undo_redo_chain,
					agent (source_archetype.description).add_original_author_item,
					agent (source_archetype.description).replace_original_author_item,
					agent (source_archetype.description).remove_original_author_item)
			end
		end

	description_details: detachable RESOURCE_DESCRIPTION_ITEM
		do
			if attached source_archetype.description.details then
				Result := source_archetype.description.details.item (selected_language)
			end
		end

	translation_details: detachable TRANSLATION_DETAILS
		do
			if source_archetype.has_translations then
				Result := source_archetype.translations.item (trans_languages_ctl.ev_data_control.text)
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
--| The Original Code is adl_ontology_controls.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
