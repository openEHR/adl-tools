note
	component:   "openEHR Archetype Project"
	description: "Populate description controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_DESCRIPTION_CONTROLS

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_populate, can_repopulate
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

			create admin_vbox
			create author_lang_term_hbox
			create auth_frame
			create status_auth_contrib_vbox
			create status_hbox
			create status_label
			create status_text
			create l_ev_cell_1
			create auth_orig_auth_contrib_hbox
			create auth_orig_auth_vbox
			create auth_orig_auth_label
			create auth_orig_auth_mlist
			create contrib_vbox
			create auth_contrib_label
			create auth_contrib_list
			create lang_frame
			create lang_vbox
			create original_languages_hbox
			create original_language_label
			create original_language_text
			create lang_translations_hbox
			create trans_languages_vbox
			create trans_languages_label
			create trans_languages_list
			create trans_author_vbox
			create ev_author_label
			create trans_author_mlist
			create ev_accreditation_label
			create trans_accreditation_text
			create trans_other_deails_vbox
			create ev_other_details_label
			create trans_other_details_mlist
			create copyright_hbox
			create copyright_label
			create copyright_text
			create desc_box
			create details_frame
			create details_hbox
			create purpose_use_misuse_vbox
			create purpose_hbox
			create purpose_label
			create purpose_text
			create use_hbox
			create use_label
			create use_text
			create misuse_hbox
			create misuse_label
			create misuse_text
			create keywords_vbox
			create keywords_label
			create keywords_list
			create resource_frame
			create resource_vbox
			create resource_package_hbox
			create resource_package_label
			create resource_package_text
			create resource_orig_res_hbox
			create resource_orig_res_label
			create resource_orig_res_mlist
			create term_hbox
			create terminology_vbox
			create ev_terminology_label
			create term_mappings_list
			create refset_vbox
			create ev_refset_bindings_label
			create refset_bindings_list

			-- connect them together
			ev_root_container.extend (admin_vbox)
			admin_vbox.extend (author_lang_term_hbox)
			author_lang_term_hbox.extend (auth_frame)
			auth_frame.extend (status_auth_contrib_vbox)
			status_auth_contrib_vbox.extend (status_hbox)
			status_hbox.extend (status_label)
			status_hbox.extend (status_text)
			status_hbox.extend (l_ev_cell_1)
			status_auth_contrib_vbox.extend (auth_orig_auth_contrib_hbox)
			auth_orig_auth_contrib_hbox.extend (auth_orig_auth_vbox)
			auth_orig_auth_vbox.extend (auth_orig_auth_label)
			auth_orig_auth_vbox.extend (auth_orig_auth_mlist)
			auth_orig_auth_contrib_hbox.extend (contrib_vbox)
			contrib_vbox.extend (auth_contrib_label)
			contrib_vbox.extend (auth_contrib_list)
			admin_vbox.extend (lang_frame)
			lang_frame.extend (lang_vbox)
			lang_vbox.extend (original_languages_hbox)
			original_languages_hbox.extend (original_language_label)
			original_languages_hbox.extend (original_language_text)
			lang_vbox.extend (lang_translations_hbox)
			lang_translations_hbox.extend (trans_languages_vbox)
			trans_languages_vbox.extend (trans_languages_label)
			trans_languages_vbox.extend (trans_languages_list)
			lang_translations_hbox.extend (trans_author_vbox)
			trans_author_vbox.extend (ev_author_label)
			trans_author_vbox.extend (trans_author_mlist)
			trans_author_vbox.extend (ev_accreditation_label)
			trans_author_vbox.extend (trans_accreditation_text)
			lang_translations_hbox.extend (trans_other_deails_vbox)
			trans_other_deails_vbox.extend (ev_other_details_label)
			trans_other_deails_vbox.extend (trans_other_details_mlist)
			admin_vbox.extend (copyright_hbox)
			copyright_hbox.extend (copyright_label)
			copyright_hbox.extend (copyright_text)
			ev_root_container.extend (desc_box)
			desc_box.extend (details_frame)
			details_frame.extend (details_hbox)
			details_hbox.extend (purpose_use_misuse_vbox)
			purpose_use_misuse_vbox.extend (purpose_hbox)
			purpose_hbox.extend (purpose_label)
			purpose_hbox.extend (purpose_text)
			purpose_use_misuse_vbox.extend (use_hbox)
			use_hbox.extend (use_label)
			use_hbox.extend (use_text)
			purpose_use_misuse_vbox.extend (misuse_hbox)
			misuse_hbox.extend (misuse_label)
			misuse_hbox.extend (misuse_text)
			details_hbox.extend (keywords_vbox)
			keywords_vbox.extend (keywords_label)
			keywords_vbox.extend (keywords_list)
			desc_box.extend (resource_frame)
			resource_frame.extend (resource_vbox)
			resource_vbox.extend (resource_package_hbox)
			resource_package_hbox.extend (resource_package_label)
			resource_package_hbox.extend (resource_package_text)
			resource_vbox.extend (resource_orig_res_hbox)
			resource_orig_res_hbox.extend (resource_orig_res_label)
			resource_orig_res_hbox.extend (resource_orig_res_mlist)
			ev_root_container.extend (term_hbox)
			term_hbox.extend (terminology_vbox)
			terminology_vbox.extend (ev_terminology_label)
			terminology_vbox.extend (term_mappings_list)
			term_hbox.extend (refset_vbox)
			refset_vbox.extend (ev_refset_bindings_label)
			refset_vbox.extend (refset_bindings_list)

			-- set visual characteristics
			ev_root_container.set_item_text (admin_vbox, create_message_content ("administrative_tab_text", Void))
			ev_root_container.set_item_text (desc_box, create_message_content ("descriptive_tab_text", Void))
			ev_root_container.set_item_text (term_hbox, create_message_content ("term_bindings_tab_text", Void))
			admin_vbox.disable_item_expand (copyright_hbox)
			author_lang_term_hbox.set_padding (padding_width)
			author_lang_term_hbox.set_border_width (border_width)

			auth_frame.set_text (create_message_content ("auth_frame_text", Void))
			auth_frame.set_minimum_height (70)
			auth_frame.set_style (1)
			status_auth_contrib_vbox.set_minimum_height (65)
			status_auth_contrib_vbox.set_padding (padding_width)
			status_auth_contrib_vbox.set_border_width (border_width)
			status_auth_contrib_vbox.disable_item_expand (status_hbox)
			status_hbox.set_padding (padding_width)
			status_hbox.set_border_width (border_width)
			status_hbox.disable_item_expand (status_label)
			status_hbox.disable_item_expand (status_text)
			status_label.set_text (create_message_content ("status_label_text", Void))
			status_text.set_background_color (editable_colour)
			status_text.set_minimum_width (70)
			status_text.disable_edit

			auth_orig_auth_contrib_hbox.set_padding (padding_width)
			auth_orig_auth_contrib_hbox.set_border_width (border_width)
			auth_orig_auth_vbox.set_minimum_height (65)
			auth_orig_auth_vbox.set_padding (padding_width)
			auth_orig_auth_vbox.set_border_width (border_width)
			auth_orig_auth_vbox.disable_item_expand (auth_orig_auth_label)
			auth_orig_auth_label.set_text (create_message_content ("auth_orig_auth_label_text", Void))
			auth_orig_auth_label.set_minimum_width (desc_label_width)
			auth_orig_auth_mlist.set_background_color (editable_colour)
			auth_orig_auth_mlist.set_minimum_width (min_entry_control_width)
			auth_orig_auth_mlist.set_minimum_height (min_list_height)
			contrib_vbox.set_minimum_height (65)
			contrib_vbox.set_padding (padding_width)
			contrib_vbox.set_border_width (border_width)
			contrib_vbox.disable_item_expand (auth_contrib_label)
			auth_contrib_label.set_text (create_message_content ("auth_contrib_label_text", Void))
			auth_contrib_label.set_minimum_width (desc_label_width)
			auth_contrib_list.set_background_color (editable_colour)
			auth_contrib_list.set_minimum_width (min_entry_control_width)
			auth_contrib_list.set_minimum_height (30)
			lang_frame.set_text (create_message_content ("lang_frame_text", Void))
			lang_frame.set_minimum_height (130)
			lang_frame.set_style (1)
			lang_vbox.disable_item_expand (original_languages_hbox)
			original_languages_hbox.set_padding (padding_width)
			original_languages_hbox.set_border_width (border_width)
			original_languages_hbox.disable_item_expand (original_language_label)
			original_languages_hbox.disable_item_expand (original_language_text)
			original_language_label.set_text (create_message_content ("original_language_label_text", Void))
			original_language_text.set_minimum_width (35)
			original_language_text.disable_edit
			lang_translations_hbox.set_padding (padding_width)
			lang_translations_hbox.set_border_width (border_width)
			lang_translations_hbox.disable_item_expand (trans_languages_vbox)
			trans_languages_vbox.set_minimum_height (40)
			trans_languages_vbox.set_padding (padding_width)
			trans_languages_vbox.set_border_width (border_width)
			trans_languages_vbox.disable_item_expand (trans_languages_label)
			trans_languages_label.set_text (create_message_content ("trans_languages_label_text", Void))
			trans_languages_label.set_minimum_width (desc_label_width)
			trans_languages_list.set_background_color (editable_colour)
			trans_languages_list.set_minimum_width (100)
			trans_languages_list.set_minimum_height (min_list_height)
			trans_author_vbox.set_minimum_height (110)
			trans_author_vbox.set_padding (padding_width)
			trans_author_vbox.set_border_width (border_width)
			trans_author_vbox.disable_item_expand (ev_author_label)
			trans_author_vbox.disable_item_expand (ev_accreditation_label)
			ev_author_label.set_text (create_message_content ("author_label_text", Void))
			trans_author_mlist.set_minimum_height (min_text_height)
			ev_accreditation_label.set_text (create_message_content ("acreditation_label_text", Void))
			trans_accreditation_text.set_background_color (editable_colour)
			trans_accreditation_text.set_minimum_width (min_entry_control_width)
			trans_accreditation_text.set_minimum_height (min_text_height)
			trans_accreditation_text.disable_edit
			trans_other_deails_vbox.set_padding (padding_width)
			trans_other_deails_vbox.set_border_width (border_width)
			trans_other_deails_vbox.disable_item_expand (ev_other_details_label)
			ev_other_details_label.set_text (create_message_content ("other_details_label_text", Void))
			trans_other_details_mlist.set_minimum_height (40)
			copyright_hbox.set_padding (padding_width)
			copyright_hbox.set_border_width (border_width)
			copyright_hbox.disable_item_expand (copyright_label)
			copyright_label.set_text (create_message_content ("copyright_label_text", Void))
			copyright_label.set_minimum_width (desc_label_width)
			copyright_text.set_background_color (editable_colour)
			copyright_text.set_minimum_height (44)
			copyright_text.disable_edit
			desc_box.disable_item_expand (resource_frame)
			details_frame.set_text (create_message_content ("archetype_details_label_text", Void))
			details_frame.set_minimum_height (150)
			details_frame.set_style (1)
			details_hbox.set_padding (padding_width)
			details_hbox.set_border_width (border_width)
			details_hbox.disable_item_expand (keywords_vbox)
			purpose_use_misuse_vbox.set_padding (padding_width)
			purpose_use_misuse_vbox.set_border_width (border_width)
			purpose_hbox.disable_item_expand (purpose_label)
			purpose_label.set_text (create_message_content ("purpose_label_text", Void))
			purpose_label.set_minimum_width (desc_label_width)
			purpose_text.set_background_color (editable_colour)
			purpose_text.set_minimum_width (min_entry_control_width)
			purpose_text.set_minimum_height (min_text_height)
			purpose_text.disable_edit
			use_hbox.disable_item_expand (use_label)
			use_label.set_text (create_message_content ("use_label_text", Void))
			use_label.set_minimum_width (desc_label_width)
			use_text.set_background_color (editable_colour)
			use_text.set_minimum_width (min_entry_control_width)
			use_text.set_minimum_height (min_text_height)
			use_text.disable_edit
			misuse_hbox.disable_item_expand (misuse_label)
			misuse_label.set_text (create_message_content ("misuse_label_text", Void))
			misuse_label.set_minimum_width (desc_label_width)
			misuse_text.set_background_color (editable_colour)
			misuse_text.set_minimum_width (min_entry_control_width)
			misuse_text.set_minimum_height (min_text_height)
			misuse_text.disable_edit
			keywords_vbox.set_padding (padding_width)
			keywords_vbox.set_border_width (border_width)
			keywords_vbox.disable_item_expand (keywords_label)
			keywords_label.set_text (create_message_content ("keywords_label_text", Void))
			keywords_label.set_minimum_width (75)
			keywords_list.set_background_color (editable_colour)
			keywords_list.set_minimum_width (100)
			keywords_list.set_minimum_height (min_list_height)
			resource_frame.set_text (create_message_content ("resources_label_text", Void))
			resource_frame.set_style (1)
			resource_vbox.disable_item_expand (resource_package_hbox)
			resource_vbox.disable_item_expand (resource_orig_res_hbox)
			resource_package_hbox.set_padding (padding_width)
			resource_package_hbox.set_border_width (border_width)
			resource_package_hbox.disable_item_expand (resource_package_label)
			resource_package_label.set_text (create_message_content ("packages_label_text", Void))
			resource_package_label.set_minimum_width (desc_label_width)
			resource_package_text.set_background_color (editable_colour)
			resource_package_text.set_minimum_width (min_entry_control_width)
			resource_package_text.disable_edit
			resource_orig_res_hbox.set_padding (padding_width)
			resource_orig_res_hbox.set_border_width (border_width)
			resource_orig_res_hbox.disable_item_expand (resource_orig_res_label)
			resource_orig_res_label.set_text (create_message_content ("resource_orig_res_label_text", Void))
			resource_orig_res_label.set_minimum_width (desc_label_width)
			resource_orig_res_mlist.set_background_color (editable_colour)
			resource_orig_res_mlist.set_minimum_width (min_entry_control_width)
			resource_orig_res_mlist.set_minimum_height (min_list_height)
			terminology_vbox.set_minimum_height (40)
			terminology_vbox.set_padding (padding_width)
			terminology_vbox.set_border_width (border_width)
			terminology_vbox.disable_item_expand (ev_terminology_label)
			ev_terminology_label.set_text (create_message_content ("terminology_label_text", Void))
			term_mappings_list.set_background_color (editable_colour)
			term_mappings_list.set_minimum_width (100)
			term_mappings_list.set_minimum_height (min_list_height)
			refset_vbox.set_minimum_height (40)
			refset_vbox.set_padding (padding_width)
			refset_vbox.set_border_width (border_width)
			refset_vbox.disable_item_expand (ev_refset_bindings_label)
			ev_refset_bindings_label.set_text (create_message_content ("refset_bindings_label_text", Void))
			refset_bindings_list.set_background_color (editable_colour)
			refset_bindings_list.set_minimum_width (100)
			refset_bindings_list.set_minimum_height (min_list_height)

			resource_orig_res_mlist.hide_title_row
			auth_orig_auth_mlist.hide_title_row
			trans_author_mlist.hide_title_row
			trans_other_details_mlist.hide_title_row

			-- set events
			status_text.focus_in_actions.extend (a_text_box_select_all_handler)
			original_language_text.focus_in_actions.extend (a_text_box_select_all_handler)
			trans_languages_list.select_actions.extend (agent translations_select_language)
			copyright_text.focus_in_actions.extend (a_text_box_select_all_handler)
			purpose_text.focus_in_actions.extend (a_text_box_select_all_handler)
			use_text.focus_in_actions.extend (a_text_box_select_all_handler)
			misuse_text.focus_in_actions.extend (a_text_box_select_all_handler)
			resource_package_text.focus_in_actions.extend (a_text_box_select_all_handler)
			trans_languages_list.select_actions.extend (agent translations_select_language)
		ensure
			purpose_wrapping: purpose_text.has_word_wrapping
			use_wrapping: use_text.has_word_wrapping
			misuse_wrapping: misuse_text.has_word_wrapping
			copyright_wrapping: copyright_text.has_word_wrapping
			purpose_read_only: not purpose_text.is_editable
			use_read_only: not use_text.is_editable
			misuse_read_only: not misuse_text.is_editable
			copyright_read_only: not copyright_text.is_editable
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

feature -- Events

	translations_select_language
			-- Called by `select_actions' of `trans_languages_list'.
		do
			populate_translation_items
		end

feature {NONE} -- Implementation

	admin_vbox, status_auth_contrib_vbox, auth_orig_auth_vbox,
	contrib_vbox, lang_vbox, trans_languages_vbox, trans_author_vbox,
	trans_other_deails_vbox, desc_box, purpose_use_misuse_vbox, keywords_vbox,
	resource_vbox, terminology_vbox, refset_vbox: EV_VERTICAL_BOX

	author_lang_term_hbox, status_hbox, auth_orig_auth_contrib_hbox, original_languages_hbox,
	lang_translations_hbox, copyright_hbox, details_hbox, purpose_hbox,
	use_hbox, misuse_hbox, resource_package_hbox, resource_orig_res_hbox,
	term_hbox: EV_HORIZONTAL_BOX

	status_label, auth_orig_auth_label,
	auth_contrib_label, original_language_label, trans_languages_label,
	ev_author_label, ev_accreditation_label, ev_other_details_label, copyright_label, purpose_label,
	use_label, misuse_label, keywords_label, resource_package_label,
	resource_orig_res_label, ev_terminology_label, ev_refset_bindings_label: EV_LABEL

	auth_frame, lang_frame, details_frame, resource_frame: EV_FRAME

	status_text, original_language_text, resource_package_text: EV_TEXT_FIELD

	l_ev_cell_1: EV_CELL

	auth_orig_auth_mlist, trans_author_mlist, trans_other_details_mlist, resource_orig_res_mlist: EV_MULTI_COLUMN_LIST

	auth_contrib_list, trans_languages_list,
	keywords_list, term_mappings_list, refset_bindings_list: EV_LIST

	trans_accreditation_text, copyright_text, purpose_text, use_text,
	misuse_text: EV_TEXT

	do_clear
			-- Wipe out content.
		do
			term_mappings_list.wipe_out
			status_text.remove_text

			auth_orig_auth_mlist.wipe_out
			auth_contrib_list.wipe_out
			original_language_text.remove_text

			purpose_text.remove_text
			use_text.remove_text
			misuse_text.remove_text
			keywords_list.wipe_out

			resource_package_text.remove_text
			resource_orig_res_mlist.wipe_out

			copyright_text.remove_text

			clear_translations
		end

	do_populate
		do
			term_mappings_list.set_strings (source_archetype.ontology.terminologies_available)
			if attached source_archetype.description then
				populate_authorship
				populate_details
				populate_resources
				populate_copyright
				populate_translations
			end
		end

	populate_authorship
			-- populate authorship fields
		do
			-- original author: tagged list of strings
			populate_ev_multi_list_from_hash (auth_orig_auth_mlist, source_archetype.description.original_author)

			-- status
			if attached source_archetype.description.lifecycle_state as sts then
				status_text.set_text (utf8 (sts))
			end

			-- original language
			original_language_text.set_text (utf8 (source_archetype.original_language.code_string))

			-- contributors: list of strings
			if attached source_archetype.description.other_contributors as contribs then
				create utf_str_list.make (0)
				contribs.do_all (agent (utf8_str: STRING) do utf_str_list.extend (utf8 (utf8_str)) end)
				auth_contrib_list.set_strings (utf_str_list)
			end
		end

	populate_details
			-- Populate details (language sensitive).
		do
			if attached source_archetype.description.details.item(selected_language) as item then
				if attached item.purpose then
					purpose_text.set_text (utf8 (item.purpose))
				end

				if attached item.use then
					use_text.set_text (utf8 (item.use))
				end

				if attached item.misuse then
					misuse_text.set_text (utf8 (item.misuse))
				end

				if attached item.keywords then
					create utf_str_list.make (0)
					item.keywords.do_all (agent (utf8_str: STRING) do utf_str_list.extend (utf8 (utf8_str)) end)
					keywords_list.set_strings (utf_str_list)
				end
			end
		end

	populate_resources
			-- populate resources fields
		do
			-- package URI
			if attached source_archetype.description.resource_package_uri as arch_pkg_uri then
				resource_package_text.set_text (utf8 (arch_pkg_uri.out))
			end

			-- list of URI resources
			if attached source_archetype.description.details.item(selected_language) as item then
				populate_ev_multi_list_from_hash (resource_orig_res_mlist, item.original_resource_uri)
			end
		end

	populate_copyright
			-- populate copyright field
		do
			if attached source_archetype.description.details.item(selected_language) as item  and then
				attached item.copyright
			then
				copyright_text.set_text (utf8 (item.copyright))
			end
		end

	populate_translations
			-- populate controls
		do
			clear_translations
			if attached source_archetype.translations then
				trans_languages_list.set_strings (source_archetype.translations.current_keys)
				populate_translation_items
			end
		end

	clear_translations
		do
			trans_languages_list.wipe_out
			clear_translation_items
		end

	populate_translation_items
		local
			trans_item: TRANSLATION_DETAILS
		do
			clear_translation_items

			-- determine selected language
			if trans_languages_list.selected_item = Void then
				translation_language := trans_languages_list.first.text.as_string_8
			else
				translation_language := trans_languages_list.selected_item.text.as_string_8
			end

			trans_item := source_archetype.translations.item (translation_language)

			-- populate author hash
			populate_ev_multi_list_from_hash (trans_author_mlist, trans_item.author)

			if trans_item.accreditation /= Void then
				trans_accreditation_text.set_text (utf8 (trans_item.accreditation))
			end

			-- populate other_details
			populate_ev_multi_list_from_hash (trans_other_details_mlist, trans_item.other_details)
		end

	clear_translation_items
			-- wipe out content
		do
			trans_accreditation_text.remove_text
			trans_author_mlist.wipe_out
			trans_other_details_mlist.wipe_out
		end

	utf_str_list: ARRAYED_LIST [STRING_32]

	translation_language: STRING
			-- currently selected translation language

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
