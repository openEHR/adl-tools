note
	description: "Help dialog acting as a legend for the various icons displayed in ADL Workbench."
	date: "$Date$"
	revision: "$Revision$"

class
	ICON_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end

	EVX_DEFINITIONS
		undefine
			is_equal, default_create, copy
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			-- Create widgets.
			create ev_vbox_1
			create icon_help_list
			create ev_hbox_1
			create ev_cell_1
			create ok_button
			create ev_cell_2

			-- connect widgets
			extend (ev_vbox_1)
			ev_vbox_1.extend (icon_help_list)
			ev_vbox_1.extend (ev_hbox_1)
			ev_hbox_1.extend (ev_cell_1)
			ev_hbox_1.extend (ok_button)
			ev_hbox_1.extend (ev_cell_2)

			-- set visual characteristics
			ev_vbox_1.set_minimum_width (340)
			ev_vbox_1.disable_item_expand (ev_hbox_1)
			icon_help_list.set_background_color (editable_colour)
			icon_help_list.set_minimum_width (300)
			icon_help_list.set_minimum_height (400)
			ev_hbox_1.set_padding (15)
			ev_hbox_1.set_border_width (10)
			ev_hbox_1.disable_item_expand (ok_button)
			ok_button.set_text ("OK")
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			set_minimum_width (450)
			set_minimum_height (700)
			set_title ("ADL Workbench Icon Key")
			set_icon_pixmap (adl_workbench_icon)

			-- connect events
			ok_button.select_actions.extend (agent hide)
			set_default_cancel_button (ok_button)
			set_default_push_button (ok_button)
			add_help_items
			show_actions.extend (agent icon_help_list.set_focus)
		end

feature {NONE} -- Implementation

	add_help_items
			-- Add icon explanation row items
		local
			list_item: EV_LIST_ITEM
			help: STRING
		do
--			from semantic_icon_table.start until semantic_icon_table.off loop
--				help := semantic_icon_table.item_for_iteration.help

--				if help /= Void then
--					create list_item.make_with_text (help)

--					if pixmaps.has (semantic_icon_table.key_for_iteration) then
--						list_item.set_pixmap (pixmaps [semantic_icon_table.key_for_iteration])
--					end

--					icon_help_list.extend (list_item)
--				end

--				semantic_icon_table.forth
--			end
		end

	ev_vbox_1: EV_VERTICAL_BOX
	icon_help_list: EV_LIST
	ev_hbox_1: EV_HORIZONTAL_BOX
	ev_cell_1, ev_cell_2: EV_CELL
	ok_button: EV_BUTTON

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
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
--| The Original Code is icon_dialog.e.
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
