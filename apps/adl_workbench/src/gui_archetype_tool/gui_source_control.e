note
	component:   "openEHR Archetype Project"
	description: "Archetype source text control"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	GUI_SOURCE_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

	GUI_DEFINITIONS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE}-- Initialization

	make
		do
			-- create root widget
			create ev_root_container
			ev_root_container.set_data (Current)
			create ev_souce_rich_text
			create ev_source_controls_vbox
			create ev_line_numbers_cb
			create ev_source_padding_cell

			-- connect widgets
			ev_root_container.extend (ev_souce_rich_text)
			ev_root_container.extend (ev_source_controls_vbox)
			ev_source_controls_vbox.extend (ev_line_numbers_cb)
			ev_source_controls_vbox.extend (ev_source_padding_cell)

			-- set visual characteristics
			ev_souce_rich_text.disable_edit
			ev_root_container.disable_item_expand (ev_source_controls_vbox)
			ev_source_controls_vbox.disable_item_expand (ev_line_numbers_cb)
			ev_source_controls_vbox.set_border_width (border_width)
			ev_source_controls_vbox.set_padding_width (padding_width)
			ev_line_numbers_cb.set_text (create_message_content ("line_numbers_cb_text", Void))
			ev_souce_rich_text.set_tab_width ((ev_souce_rich_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars

			-- set events: serialisation controls
			ev_line_numbers_cb.select_actions.extend (agent try_repopulate_with_line_numbers)

			differential_view := True
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature {NONE} -- Implementation

	ev_souce_rich_text: EV_RICH_TEXT

	ev_source_rb_vbox, ev_source_controls_vbox: EV_VERTICAL_BOX

	ev_source_padding_cell: EV_CELL

	ev_line_numbers_cb: EV_CHECK_BUTTON

	try_repopulate_with_line_numbers
		do
			set_show_line_numbers (ev_line_numbers_cb.is_selected)
			try_repopulate
		end

	do_clear
		do
			ev_souce_rich_text.remove_text
		end

	do_populate
		do
			if source.has_legacy_flat_file then
				populate_source_text_with_line_numbers (source.legacy_flat_text)
			else
				populate_source_text_with_line_numbers (source.differential_text)
			end
		end

	populate_source_text_with_line_numbers (text: attached STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		local
			s: STRING
			len, left_pos, right_pos, number: INTEGER
		do
			if show_line_numbers then
				from
					len := text.count
					create s.make (len)
					left_pos := 1
					number := 1
				until
					left_pos > len
				loop
					s.append (number.out)

					if number < 1000 then
						s.append ("%T")
					end

					s.append (" ")

					right_pos := text.index_of ('%N', left_pos)

					if right_pos = 0 then
						right_pos := len
					end

					s.append (text.substring (left_pos, right_pos))
					left_pos := right_pos + 1
					number := number + 1
				end
			else
				s := text
			end

			ev_souce_rich_text.set_text (utf8 (s))
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
--| The Original Code is gui_serialisation_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
