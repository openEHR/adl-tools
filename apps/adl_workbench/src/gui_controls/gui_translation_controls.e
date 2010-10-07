note
	component:   "openEHR Archetype Project"
	description: "Populate translation controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_TRANSLATION_CONTROLS

inherit
	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_main_window: MAIN_WINDOW)
		require
			a_main_window /= Void
		do
			gui := a_main_window
			gui.arch_translations_author_mlist.hide_title_row
			gui.arch_translations_other_details_mlist.hide_title_row
		end

feature -- Commands

	clear
			-- wipe out content
		do
			gui.arch_translations_languages_list.wipe_out
			clear_items
		end

	clear_items
			-- wipe out content
		do
			gui.arch_translations_accreditation_text.remove_text
			gui.arch_translations_author_mlist.wipe_out
			gui.arch_translations_other_details_mlist.wipe_out
		end

	populate
			-- populate controls
		do
			clear

			if current_arch_dir.has_validated_selected_archetype then
				if current_arch_dir.selected_archetype.differential_archetype.translations /= Void then
					populate_ev_list_from_hash_keys (gui.arch_translations_languages_list, current_arch_dir.selected_archetype.differential_archetype.translations)
					populate_items
				end
			end
		end

	populate_items
			-- populate controls
		local
			trans_item: TRANSLATION_DETAILS
		do
			clear_items

			-- determine selected language
			if gui.arch_translations_languages_list.selected_item = Void then
				translation_language := gui.arch_translations_languages_list.first.text.as_string_8
			else
				translation_language := gui.arch_translations_languages_list.selected_item.text.as_string_8
			end

			if current_arch_dir.has_validated_selected_archetype then
				trans_item := current_arch_dir.selected_archetype.differential_archetype.translations.item(translation_language)

				-- populate author hash
				populate_ev_multi_list_from_hash(gui.arch_translations_author_mlist, trans_item.author)

				if trans_item.accreditation /= Void then
					gui.arch_translations_accreditation_text.set_text (utf8 (trans_item.accreditation))
				end

				-- populate other_details
				populate_ev_multi_list_from_hash(gui.arch_translations_other_details_mlist, trans_item.other_details)
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

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
