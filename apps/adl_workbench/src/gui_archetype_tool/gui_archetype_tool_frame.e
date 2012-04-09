note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype common tool frame for archetype tools and editors. The Frame consists of the 
				 toolbar containing widgets for archetype id, flat/differential controls, language combo, 
				 and ADL version indicator; and a notebook for the main content.
				 ]"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class GUI_ARCHETYPE_TOOL_FRAME

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

feature -- Definitions

	arch_notebook_min_height: INTEGER = 350

	arch_notebook_min_width: INTEGER = 500

feature {NONE}-- Initialization

	make
		do
			-- create root widget
			create ev_root_container
			ev_root_container.set_data (Current)

			-- text field handling
			create text_widget_handler.make (ev_root_container)

			-- create subordinate widgets
			create ev_action_bar
			create ev_archetype_id
			create ev_view_label
			create ev_view_tool_bar
			create ev_differential_view_button
			create ev_flat_view_button
			create ev_language_label
			create ev_language_combo
			create ev_adl_version_label
			create ev_adl_version_text

			create ev_notebook

			-- connect widgets
			ev_root_container.extend (ev_action_bar)
			ev_root_container.extend (ev_notebook)

			ev_action_bar.extend (ev_archetype_id)
			ev_action_bar.extend (ev_view_label)
			ev_action_bar.extend (ev_view_tool_bar)
			ev_view_tool_bar.extend (ev_differential_view_button)
			ev_view_tool_bar.extend (ev_flat_view_button)
			ev_action_bar.extend (ev_language_label)
			ev_action_bar.extend (ev_language_combo)
			ev_action_bar.extend (ev_adl_version_label)
			ev_action_bar.extend (ev_adl_version_text)

			-- set visual characteristics
			ev_root_container.disable_item_expand (ev_action_bar)
			ev_action_bar.set_padding (10)
			ev_action_bar.set_border_width (4)
			ev_action_bar.disable_item_expand (ev_view_label)
			ev_action_bar.disable_item_expand (ev_view_tool_bar)
			ev_action_bar.disable_item_expand (ev_language_label)
			ev_action_bar.disable_item_expand (ev_language_combo)
			ev_action_bar.disable_item_expand (ev_adl_version_label)
			ev_action_bar.disable_item_expand (ev_adl_version_text)
			ev_archetype_id.disable_edit
			ev_view_label.set_text ("View ")
			ev_differential_view_button.set_pixmap (get_icon_pixmap ("tool/diff_class"))
			ev_flat_view_button.set_pixmap (get_icon_pixmap ("tool/flat_class"))
			ev_differential_view_button.set_tooltip (create_message_content ("differential_view_button_tooltip", Void))
			ev_flat_view_button.set_tooltip (create_message_content ("flat_view_button_tooltip", Void))
			ev_language_label.set_text (create_message_content ("language_label", Void))
			ev_language_label.set_minimum_width (70)
			ev_language_label.set_minimum_height (23)
			ev_language_label.align_text_right
			ev_language_combo.set_tooltip (create_message_content ("language_combo_tooltip", Void))
			ev_language_combo.set_minimum_width (60)
			ev_language_combo.set_minimum_height (23)
			ev_language_combo.disable_edit
			ev_adl_version_label.set_text (create_message_content ("adl_version_label_text", Void))
			ev_adl_version_label.set_minimum_width (80)
			ev_adl_version_label.align_text_right
			ev_adl_version_label.set_tooltip (create_message_content ("adl_version_label_tooltip", Void))

			ev_notebook.set_minimum_width (arch_notebook_min_width)
			ev_notebook.set_minimum_height (arch_notebook_min_height)

			-- set events: action bar
			ev_differential_view_button.select_actions.extend (agent on_differential_view)
			ev_flat_view_button.select_actions.extend (agent on_flat_view)
			ev_language_combo.select_actions.extend (agent on_select_language)

			-- set events: select a notebook tab
			ev_notebook.selection_actions.extend (agent on_select_archetype_notebook)

			differential_view := True
			ev_differential_view_button.enable_select
			set_tab_texts
		end

feature -- Access

	ev_archetype_id: EV_TEXT_FIELD

	ev_root_container: EV_VERTICAL_BOX

	ev_notebook: EV_NOTEBOOK

feature -- Events

	on_select_archetype_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			if attached {GUI_ARCHETYPE_TARGETTED_TOOL} ev_notebook.selected_item.data as arch_tool and attached source then
				if (source /= arch_tool.source or else
					not arch_tool.is_populated or else
					arch_tool.last_populate_timestamp < source.last_compile_attempt_timestamp or
					differential_view /= arch_tool.differential_view or
					selected_language /= arch_tool.selected_language) and
					arch_tool.can_populate (source)
				then
					arch_tool.populate (source, differential_view, selected_language)
				end
			end
		end

feature -- Commands

	select_flat_view
			-- Called from MAIN_WINDOW View menu
		do
			if not ev_flat_view_button.is_selected then
				ev_flat_view_button.enable_select
				set_view (False)
			end
		end

	select_differential_view
			-- Called from MAIN_WINDOW View menu
		do
			if not ev_differential_view_button.is_selected then
				ev_differential_view_button.enable_select
				set_view (True)
			end
		end

feature {NONE} -- Events

	on_flat_view
			-- Called by `select_actions' of `ev_flat_view_button' in this tool
		do
			set_view (False)
		end

	on_differential_view
			-- Called by `select_actions' of `ev_differential_view_button' in this tool
		do
			set_view (True)
		end

	set_view (differential_flag: BOOLEAN)
			-- set view one way or the other
		do
			if (differential_flag and not differential_view) or -- changing from flat to diff
				(not differential_flag and differential_view)  -- changing from diff to flat
			then
				differential_view := differential_flag
				set_tab_texts
				on_select_archetype_notebook
			end
		end

	on_select_language
			-- Repopulate the view of the archetype when the user selects a different language.
		do
			selected_language := ev_language_combo.text.as_string_8
			on_select_archetype_notebook
		end

feature {NONE} -- Implementation

	do_clear
			-- Wipe out content from visual controls.
		do
			ev_archetype_id.remove_text
			ev_adl_version_text.remove_text
			ev_language_combo.wipe_out
			ev_language_combo.remove_text
		end

	do_populate
		do
			ev_archetype_id.set_text (source.qualified_name)
			if source.is_valid then
				ev_adl_version_text.set_text (source.differential_archetype.adl_version)
				selected_language := source.differential_archetype.original_language.code_string
				populate_languages
			end
		end

	text_widget_handler: GUI_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours

	ev_action_bar: EV_HORIZONTAL_BOX

	ev_view_tool_bar: EV_TOOL_BAR

	ev_differential_view_button, ev_flat_view_button: EV_TOOL_BAR_RADIO_BUTTON

	ev_view_label, ev_language_label, ev_adl_version_label, ev_adl_version_text: EV_LABEL

	ev_language_combo: EV_COMBO_BOX

	populate_languages
			-- Populate `language_combo' in the toolbar for currently selected archetype
		do
			ev_language_combo.select_actions.block
			ev_language_combo.set_strings (source.differential_archetype.languages_available)
			ev_language_combo.do_all (agent (li: EV_LIST_ITEM) do if li.text.same_string (selected_language) then li.enable_select end end)
			ev_language_combo.select_actions.resume
		end

	set_tab_texts
			-- set taxt on tabs depending on view
		do
			-- serialised rich text tab
			if differential_view then
				set_differential_tab_texts
			else
				set_flat_tab_texts
			end
		end

	set_differential_tab_texts
			-- set text on tabs for differential form of archetype
		deferred
		end

	set_flat_tab_texts
			-- set text on tabs for flat form of archetype
		deferred
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
--| The Original Code is gui_archetype_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 20011
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
