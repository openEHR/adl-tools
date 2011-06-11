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
	GUI_UTILITIES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_main_window: attached MAIN_WINDOW)
			-- Create to control `a_main_window'.
		do
			gui := a_main_window
			gui.arch_desc_resource_orig_res_mlist.hide_title_row
			gui.arch_desc_auth_orig_auth_mlist.hide_title_row
		ensure
			gui_set: gui = a_main_window
			purpose_wrapping: gui.arch_desc_purpose_text.has_word_wrapping
			use_wrapping: gui.arch_desc_use_text.has_word_wrapping
			misuse_wrapping: gui.arch_desc_misuse_text.has_word_wrapping
			copyright_wrapping: gui.arch_desc_copyright_text.has_word_wrapping
			purpose_read_only: not gui.arch_desc_purpose_text.is_editable
			use_read_only: not gui.arch_desc_use_text.is_editable
			misuse_read_only: not gui.arch_desc_misuse_text.is_editable
			copyright_read_only: not gui.arch_desc_copyright_text.is_editable
		end

feature -- Commands

	clear
			-- Wipe out content.
		do
			gui.description_term_mappings_list.wipe_out
			gui.arch_desc_status_text.remove_text

			gui.arch_desc_auth_orig_auth_mlist.wipe_out
			gui.arch_desc_auth_contrib_list.wipe_out
			gui.arch_desc_original_language_text.remove_text

			gui.arch_desc_purpose_text.remove_text
			gui.arch_desc_use_text.remove_text
			gui.arch_desc_misuse_text.remove_text
			gui.arch_desc_keywords_list.wipe_out

			gui.arch_desc_resource_package_text.remove_text
			gui.arch_desc_resource_orig_res_mlist.wipe_out

			gui.arch_desc_copyright_text.remove_text
		end

	populate
			-- Populate ontology controls.
		require
			has_current_profile
		local
			archetype: ARCHETYPE
		do
			clear
			if current_arch_cat.has_validated_selected_archetype then
				archetype := current_arch_cat.selected_archetype.differential_archetype
				gui.description_term_mappings_list.set_strings (archetype.ontology.terminologies_available)
				if attached archetype.description then
					populate_authorship
					populate_details
					populate_resources
					populate_copyright
				end
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	populate_authorship
			-- populate authorship fields
		require
			archetype_selected: current_arch_cat.has_selected_archetype
		do
			-- original author: tagged list of strings
			populate_ev_multi_list_from_hash (gui.arch_desc_auth_orig_auth_mlist, current_arch_cat.selected_archetype.differential_archetype.description.original_author)

			-- status
			if attached current_arch_cat.selected_archetype.differential_archetype.description.lifecycle_state as sts then
				gui.arch_desc_status_text.set_text (utf8 (sts))
			end

			-- original language
			gui.arch_desc_original_language_text.set_text (utf8 (current_arch_cat.selected_archetype.differential_archetype.original_language.code_string))

			-- contributors: list of strings
			if attached current_arch_cat.selected_archetype.differential_archetype.description.other_contributors as contribs then
				create utf_str_list.make (0)
				contribs.do_all (agent (utf8_str: STRING) do utf_str_list.extend (utf8 (utf8_str)) end)
				gui.arch_desc_auth_contrib_list.set_strings (utf_str_list)
			end
		end

	populate_details
			-- Populate details (language sensitive).
		require
			archetype_selected: current_arch_cat.has_selected_archetype
		do
			if attached current_arch_cat.selected_archetype.differential_archetype.description.details.item(current_language) as arch_desc_item then
				if attached arch_desc_item.purpose then
					gui.arch_desc_purpose_text.set_text (utf8 (arch_desc_item.purpose))
				end

				if attached arch_desc_item.use then
					gui.arch_desc_use_text.set_text (utf8 (arch_desc_item.use))
				end

				if attached arch_desc_item.misuse then
					gui.arch_desc_misuse_text.set_text (utf8 (arch_desc_item.misuse))
				end

				if attached arch_desc_item.keywords then
					create utf_str_list.make (0)
					arch_desc_item.keywords.do_all (agent (utf8_str: STRING) do utf_str_list.extend (utf8 (utf8_str)) end)
					gui.arch_desc_keywords_list.set_strings (utf_str_list)
				end
			end
		end

	populate_resources
			-- populate resources fields
		require
			archetype_selected: current_arch_cat.has_selected_archetype
		do
			-- package URI
			if attached current_arch_cat.selected_archetype.differential_archetype.description.resource_package_uri as arch_pkg_uri then
				gui.arch_desc_resource_package_text.set_text (utf8 (arch_pkg_uri.out))
			end

			-- list of URI resources
			if attached current_arch_cat.selected_archetype.differential_archetype.description.details.item(current_language) as arch_desc_item then
				populate_ev_multi_list_from_hash (gui.arch_desc_resource_orig_res_mlist, arch_desc_item.original_resource_uri)
			end
		end

	populate_copyright
			-- populate copyright field
		require
			archetype_selected: current_arch_cat.has_selected_archetype
		do
			if attached current_arch_cat.selected_archetype.differential_archetype.description.details.item(current_language) as arch_desc_item  and then
				attached arch_desc_item.copyright
			then
				gui.arch_desc_copyright_text.set_text (utf8 (arch_desc_item.copyright))
			end
		end

feature {NONE} -- Implementation

	utf_str_list: ARRAYED_LIST [STRING_32]

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
