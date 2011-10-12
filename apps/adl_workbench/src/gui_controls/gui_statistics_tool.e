note
	component:   "openEHR Archetype Project"
	description: "GUI Statistics Tool"
	keywords:    "ADL, archetype workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_STATISTICS_TOOL

inherit
	GUI_DEFINITIONS
		export
			{NONE} all
		end

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

feature {NONE} -- Initialisation

	make
		local
			bg_colour: EV_COLOR
		do
			create bg_colour.make_with_8_bit_rgb (240, 240, 240)

			-- create root widget
			create ev_root_container

			-- text field handling
			create text_widget_handler.make (ev_root_container)

			-- create subordinate widgets
			create ev_statistics_vbox
			create ev_arch_total_count_hbox
			create ev_label_1
			create ev_arch_total_count_tf
			create ev_arch_spec_count_hbox
			create ev_label_2
			create ev_arch_spec_count_tf
			create ev_arch_slotted_count_hbox
			create ev_label_3
			create ev_arch_slotted_count_tf
			create ev_arch_used_by_count_hbox
			create ev_label_4
			create ev_arch_used_by_count_tf
			create ev_arch_bad_count_hbox
			create ev_label_5
			create ev_arch_bad_count_tf
			create ev_term_bindings_info_frame
			create ev_term_bindings_info_list

			-- connect them together
			ev_root_container.extend (ev_statistics_vbox)
			ev_statistics_vbox.extend (ev_arch_total_count_hbox)
			ev_arch_total_count_hbox.extend (ev_label_1)
			ev_arch_total_count_hbox.extend (ev_arch_total_count_tf)
			ev_statistics_vbox.extend (ev_arch_spec_count_hbox)
			ev_arch_spec_count_hbox.extend (ev_label_2)
			ev_arch_spec_count_hbox.extend (ev_arch_spec_count_tf)
			ev_statistics_vbox.extend (ev_arch_slotted_count_hbox)
			ev_arch_slotted_count_hbox.extend (ev_label_3)
			ev_arch_slotted_count_hbox.extend (ev_arch_slotted_count_tf)
			ev_statistics_vbox.extend (ev_arch_used_by_count_hbox)
			ev_arch_used_by_count_hbox.extend (ev_label_4)
			ev_arch_used_by_count_hbox.extend (ev_arch_used_by_count_tf)
			ev_statistics_vbox.extend (ev_arch_bad_count_hbox)
			ev_arch_bad_count_hbox.extend (ev_label_5)
			ev_arch_bad_count_hbox.extend (ev_arch_bad_count_tf)
			ev_root_container.extend (ev_term_bindings_info_frame)
			ev_term_bindings_info_frame.extend (ev_term_bindings_info_list)

			-- set visual characteristics
			ev_root_container.set_minimum_height (200)
			ev_root_container.set_padding (padding_width)
			ev_root_container.set_border_width (15)
			ev_root_container.disable_item_expand (ev_statistics_vbox)
			ev_statistics_vbox.set_minimum_width (250)
			ev_statistics_vbox.set_padding (padding_width)
			ev_statistics_vbox.set_border_width (border_width)
			ev_statistics_vbox.disable_item_expand (ev_arch_total_count_hbox)
			ev_statistics_vbox.disable_item_expand (ev_arch_spec_count_hbox)
			ev_statistics_vbox.disable_item_expand (ev_arch_slotted_count_hbox)
			ev_statistics_vbox.disable_item_expand (ev_arch_used_by_count_hbox)
			ev_statistics_vbox.disable_item_expand (ev_arch_bad_count_hbox)
			ev_arch_total_count_hbox.set_padding (10)
			ev_arch_total_count_hbox.set_border_width (border_width)
			ev_arch_total_count_hbox.disable_item_expand (ev_arch_total_count_tf)
			ev_label_1.set_text ("Total Archetypes:")
			ev_label_1.set_minimum_width (140)
			ev_label_1.align_text_right
			ev_arch_total_count_tf.set_background_color (bg_colour)
			ev_arch_total_count_tf.disable_edit
			ev_arch_total_count_tf.align_text_right
			ev_arch_spec_count_hbox.set_padding (10)
			ev_arch_spec_count_hbox.set_border_width (border_width)
			ev_arch_spec_count_hbox.disable_item_expand (ev_arch_spec_count_tf)
			ev_label_2.set_text ("Specialised Archetypes:")
			ev_label_2.set_minimum_width (140)
			ev_label_2.align_text_right
			ev_arch_spec_count_tf.set_background_color (bg_colour)
			ev_arch_spec_count_tf.disable_edit
			ev_arch_spec_count_tf.align_text_right
			ev_arch_slotted_count_hbox.set_padding (10)
			ev_arch_slotted_count_hbox.set_border_width (border_width)
			ev_arch_slotted_count_hbox.disable_item_expand (ev_arch_slotted_count_tf)
			ev_label_3.set_text ("Archetypes Containing Slots:")
			ev_label_3.set_minimum_width (140)
			ev_label_3.align_text_right
			ev_arch_slotted_count_tf.set_background_color (bg_colour)
			ev_arch_slotted_count_tf.disable_edit
			ev_arch_slotted_count_tf.align_text_right
			ev_arch_used_by_count_hbox.set_padding (padding_width)
			ev_arch_used_by_count_hbox.set_border_width (border_width)
			ev_arch_used_by_count_hbox.disable_item_expand (ev_arch_used_by_count_tf)
			ev_label_4.set_text ("Archetypes Used In Slots:")
			ev_label_4.set_minimum_width (140)
			ev_label_4.align_text_right
			ev_arch_used_by_count_tf.set_background_color (bg_colour)
			ev_arch_used_by_count_tf.disable_edit
			ev_arch_used_by_count_tf.align_text_right
			ev_arch_bad_count_hbox.set_padding (10)
			ev_arch_bad_count_hbox.set_border_width (border_width)
			ev_arch_bad_count_hbox.disable_item_expand (ev_arch_bad_count_tf)
			ev_label_5.set_text ("Invalid Archetype Files:")
			ev_label_5.set_minimum_width (140)
			ev_label_5.align_text_right
			ev_arch_bad_count_tf.set_background_color (bg_colour)
			ev_arch_bad_count_tf.disable_edit
			ev_arch_bad_count_tf.align_text_right
			ev_term_bindings_info_frame.set_text ("Terminology Bindings")
			ev_term_bindings_info_list.set_background_color (bg_colour)
			ev_term_bindings_info_list.set_minimum_width (200)
			ev_term_bindings_info_list.set_minimum_height (100)
			ev_term_bindings_info_list.set_column_titles (<<"terminology", "archetypes">>)

			-- set events
			ev_arch_total_count_tf.focus_in_actions.extend (agent text_widget_handler.on_select_all)
			ev_arch_spec_count_tf.focus_in_actions.extend (agent text_widget_handler.on_select_all)
			ev_arch_slotted_count_tf.focus_in_actions.extend (agent text_widget_handler.on_select_all)
			ev_arch_used_by_count_tf.focus_in_actions.extend (agent text_widget_handler.on_select_all)
			ev_arch_bad_count_tf.focus_in_actions.extend (agent text_widget_handler.on_select_all)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature -- Commands

	populate
			-- Populate the statistics tab.
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
			i: INTEGER
		do
			if has_current_profile then
				ev_arch_total_count_tf.set_text (current_arch_cat.total_archetype_count.out)
				ev_arch_spec_count_tf.set_text (current_arch_cat.specialised_archetype_count.out)
				ev_arch_slotted_count_tf.set_text (current_arch_cat.client_archetype_count.out)
				ev_arch_used_by_count_tf.set_text (current_arch_cat.supplier_archetype_count.out)
				ev_arch_bad_count_tf.set_text (current_arch_cat.bad_archetype_count.out)

				-- do terminology bindings statistics
				from current_arch_cat.terminology_bindings_info.start until current_arch_cat.terminology_bindings_info.off loop
					from ev_term_bindings_info_list.start until ev_term_bindings_info_list.off or
						ev_term_bindings_info_list.item.first.is_equal (current_arch_cat.terminology_bindings_info.key_for_iteration)
					loop
						ev_term_bindings_info_list.forth
					end
					if not ev_term_bindings_info_list.off then
						ev_term_bindings_info_list.item.finish
						ev_term_bindings_info_list.item.remove
						ev_term_bindings_info_list.item.extend (utf8 (current_arch_cat.terminology_bindings_info.item_for_iteration.count.out))
					else
						create list_row
						list_row.extend (utf8 (current_arch_cat.terminology_bindings_info.key_for_iteration))
						list_row.extend (utf8 (current_arch_cat.terminology_bindings_info.item_for_iteration.count.out))
						ev_term_bindings_info_list.extend (list_row)
						from i := 1 until i > ev_term_bindings_info_list.column_count loop
							ev_term_bindings_info_list.resize_column_to_content (i)
							if ev_term_bindings_info_list.column_width (i) < 100 then
								ev_term_bindings_info_list.set_column_width (100, i)
							end
							i := i + 1
						end
					end

					current_arch_cat.terminology_bindings_info.forth
				end
			end
		end

feature {NONE} -- Implementation

	text_widget_handler: GUI_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours

	ev_arch_total_count_tf, ev_arch_spec_count_tf, ev_arch_slotted_count_tf, ev_arch_used_by_count_tf, ev_arch_bad_count_tf, ev_arch_test_processed_count: EV_TEXT_FIELD

	ev_term_bindings_info_frame: EV_FRAME

	ev_label_1, ev_label_2, ev_label_3, ev_label_4, ev_label_5: EV_LABEL

	ev_term_bindings_info_list: EV_MULTI_COLUMN_LIST

	ev_arch_total_count_hbox, ev_arch_spec_count_hbox, ev_arch_slotted_count_hbox, ev_arch_used_by_count_hbox, ev_arch_bad_count_hbox: EV_HORIZONTAL_BOX

	ev_statistics_vbox: EV_VERTICAL_BOX

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
--| The Original Code is gui_statistics_tool.e
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
