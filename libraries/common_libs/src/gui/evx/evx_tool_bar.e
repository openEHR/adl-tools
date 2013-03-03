note
	component:   "openEHR Archetype Project"
	description: "[
				 Tool bar in which any normal widget can be placed.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_TOOL_BAR

inherit
	EVX_DEFINITIONS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make, make_vertical

feature -- Definitions

	Minimum_height: INTEGER = 23

feature -- Initialisation

	make
		do
			create {EV_HORIZONTAL_BOX} ev_root_container
			set_defaults
		end

	make_vertical
		do
			create {EV_VERTICAL_BOX} ev_root_container
			set_defaults
		end

feature -- Access

	ev_root_container: EV_BOX

	last_label: detachable EV_LABEL

	last_text_field: detachable EV_TEXT_FIELD

	last_tool_bar: detachable EV_TOOL_BAR

	last_tool_bar_radio_button: detachable EV_TOOL_BAR_RADIO_BUTTON

	last_tool_bar_button: detachable EV_TOOL_BAR_BUTTON

	last_combo_box: detachable EV_COMBO_BOX

feature -- Status Report

	has_ev_tool_bar: BOOLEAN
			-- True if there is an EV_TOOL_BAR set up
		do
			Result := attached last_tool_bar
		end

feature -- Modification

	add_label (a_text: STRING; a_min_width: INTEGER; expandable, align_right: BOOLEAN)
			-- add an EV_LABEL. If `a_min_width' = 0, don't set width
		local
			new_label: EV_LABEL
		do
			create new_label
			last_label := new_label
			new_label.set_text (a_text)
			if a_min_width > 0 then
				new_label.set_minimum_width (a_min_width)
			end
			if align_right then
				new_label.align_text_right
			end
			ev_root_container.extend (new_label)
			if not expandable then
				ev_root_container.disable_item_expand (new_label)
			end
		end

	add_titled_label (a_title, a_text, a_tooltip_text: STRING; a_min_width: INTEGER)
		do
			add_label (a_title, 0, False, True)
			if not a_tooltip_text.is_empty and attached last_label as new_label then
				new_label.set_tooltip (a_tooltip_text)
			end
			add_label (a_text, a_min_width, False, False)
		end

	add_expanding_text_field (a_title, a_tooltip_text: STRING)
			-- add an EV_TEXT_FIELD
		local
			new_text_field: EV_TEXT_FIELD
		do
			if not a_title.is_empty then
				add_label (a_title, 0, False, True)
			end
			create new_text_field
			last_text_field := new_text_field
			if not a_tooltip_text.is_empty then
				new_text_field.set_tooltip (a_tooltip_text)
			end
			ev_root_container.extend (new_text_field)
		end

	add_fixed_text_field (a_title, a_tooltip_text: STRING; a_min_width: INTEGER)
			-- add a fixed width EV_TEXT_FIELD
		do
			add_expanding_text_field (a_title, a_tooltip_text)
			if attached last_text_field as new_text_field then
				new_text_field.set_minimum_width (a_min_width)
				ev_root_container.disable_item_expand (new_text_field)
		end
		end

	add_expanding_combo_box (a_title, a_tooltip_text: STRING; a_select_action: detachable PROCEDURE [ANY, TUPLE])
			-- add an EV_COMBO_BOX; if `a_title' or `a_tooltip_text' are empty, don't add them
		local
			new_combo_box: EV_COMBO_BOX
		do
			if not a_title.is_empty then
				add_label (a_title, 0, False, True)
			end
			create new_combo_box
			last_combo_box := new_combo_box
			new_combo_box.set_tooltip (a_tooltip_text)
			ev_root_container.extend (new_combo_box)
			if attached a_select_action then
				new_combo_box.select_actions.extend (a_select_action)
			end
		end

	add_fixed_combo_box (a_title, a_tooltip_text: STRING; a_min_combo_width: INTEGER; a_select_action: detachable PROCEDURE [ANY, TUPLE])
			-- add a fixed width EV_COMBO_BOX
		do
			add_expanding_combo_box (a_title, a_tooltip_text, a_select_action)
			if attached last_combo_box as new_combo_box then
				ev_root_container.disable_item_expand (new_combo_box)
				new_combo_box.set_minimum_width (a_min_combo_width)
			end
		end

	add_tool_bar
			-- add an EV_TOOL_BAR;
			-- calls to `add_tool_bar_*' will add to this toolbar
			-- until another call is made to this routine
		local
			new_tool_bar: EV_TOOL_BAR
		do
			create new_tool_bar
			last_tool_bar := new_tool_bar
			ev_root_container.extend (new_tool_bar)
			ev_root_container.disable_item_expand (new_tool_bar)
		ensure
			has_ev_tool_bar
		end

	add_tool_bar_with_title (a_title: STRING)
			-- add an EV_TOOL_BAR with a leader title;
			-- calls to `add_tool_bar_*' will add to this toolbar
			-- until another call is made to this routine
		do
			add_label (a_title, 0, False, False)
			add_tool_bar
		end

	add_tool_bar_radio_button (an_active_pixmap: detachable EV_PIXMAP; a_tooltip_text: detachable STRING; a_select_action: detachable PROCEDURE [ANY, TUPLE])
			-- add a radio button to current EV_TOOL_BAR
		local
			new_tb_radio_button: EV_TOOL_BAR_RADIO_BUTTON
		do
			create new_tb_radio_button
			last_tool_bar_radio_button := new_tb_radio_button
			if attached an_active_pixmap then
				new_tb_radio_button.set_pixmap (an_active_pixmap)
			end
			if attached a_tooltip_text then
				new_tb_radio_button.set_tooltip (a_tooltip_text)
			end
			if attached a_select_action then
				new_tb_radio_button.select_actions.extend (a_select_action)
			end
			if attached last_tool_bar as last_tb then
				last_tb.extend (new_tb_radio_button)
			end
		end

	add_tool_bar_button (an_active_pixmap, an_inactive_pixmap: detachable EV_PIXMAP; a_tooltip_text: detachable STRING; a_select_action: detachable PROCEDURE [ANY, TUPLE])
			-- add a normal button to current EV_TOOL_BAR
		require
			has_ev_tool_bar: has_ev_tool_bar
		local
			gui_button: EVX_TOOL_BAR_BUTTON
		do
			create gui_button.make (an_active_pixmap, an_inactive_pixmap, a_tooltip_text, a_select_action)
			last_tool_bar_button := gui_button.ev_button
			gui_button.ev_button.set_data (gui_button)
			if attached last_tool_bar as last_tb then
				last_tb.extend (gui_button.ev_button)
			end
		end

	activate_tool_bar_button (a_tool_bar_button: EV_TOOL_BAR_BUTTON)
		do
			if attached {EVX_TOOL_BAR_BUTTON} a_tool_bar_button.data as gui_button then
				gui_button.enable_active
			end
		end

	deactivate_tool_bar_button (a_tool_bar_button: EV_TOOL_BAR_BUTTON)
		do
			if attached {EVX_TOOL_BAR_BUTTON} a_tool_bar_button.data as gui_button then
				gui_button.disable_active
			end
		end

feature {NONE} -- Implementation

	set_defaults
		do
			ev_root_container.set_padding_width (Default_padding_width * 3)
			ev_root_container.set_border_width (Default_border_width)
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
--| The Original Code is gui_hash_table.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
