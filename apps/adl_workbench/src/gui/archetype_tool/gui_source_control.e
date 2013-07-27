note
	component:   "openEHR ADL Tools"
	description: "Archetype source text control"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_SOURCE_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

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
			ev_source_controls_vbox.set_border_width (Default_border_width)
			ev_source_controls_vbox.set_padding_width (Default_padding_width)

			ev_line_numbers_cb.set_text (get_msg (ec_add_line_numbers_text, Void))
			ev_line_numbers_cb.set_tooltip (get_msg (ec_add_line_numbers_tooltip, Void))

			ev_souce_rich_text.set_tab_width ((ev_souce_rich_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars

			-- set events: serialisation controls
			ev_line_numbers_cb.select_actions.extend (agent do set_show_line_numbers (ev_line_numbers_cb.is_selected) end)
			ev_line_numbers_cb.select_actions.extend (agent try_repopulate)

			differential_view := True

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature {NONE} -- Implementation

	ev_souce_rich_text: EV_RICH_TEXT

	ev_source_controls_vbox: EV_VERTICAL_BOX

	ev_source_padding_cell: EV_CELL

	ev_line_numbers_cb: EV_CHECK_BUTTON

	do_clear
		do
			ev_souce_rich_text.remove_text
		end

	do_populate
		do
			if source.has_legacy_flat_file and then attached source.legacy_flat_text as ft then
				populate_source_text (ft)
			elseif attached source.differential_text as dt then
				populate_source_text (dt)
			end
		end

	populate_source_text (text: STRING)
			-- Display `text' in `source_rich_text', optionally with each line preceded by line numbers.
		local
			s: STRING
		do
			if show_line_numbers then
				s := add_line_numbers (text, 4, " ")
			else
				s := text
			end
			ev_souce_rich_text.set_text (utf8_to_utf32 (s))
		end

end



