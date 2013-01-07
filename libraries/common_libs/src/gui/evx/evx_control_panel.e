note
	component:   "openEHR Archetype Project"
	description: "Collapsable control panel container for adding to right or left of main viewing area in a window."
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_CONTROL_PANEL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} standard_is_equal, deep_twin, is_deep_equal
		end

create
	make

feature -- Initialisation

	make
		local
			hbox: EV_HORIZONTAL_BOX
		do
			create ev_root_container
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.set_padding_width (Default_padding_width)

			-- add collapse / expand button group
			create hbox
			ev_root_container.extend (hbox)
			ev_root_container.disable_item_expand (hbox)

			-- add an expanding cell
			hbox.extend (create {EV_CELL})

			-- add button
			create collapse_expand_button
			collapse_expand_button.set_text (get_text ("collapse_button_text"))
			collapse_expand_button.select_actions.extend (agent do_collapse_expand)
			hbox.extend (collapse_expand_button)
			hbox.disable_item_expand (collapse_expand_button)

			-- add main box
			create ev_main_vbox
			ev_root_container.extend (ev_main_vbox)
			ev_root_container.disable_item_expand (ev_main_vbox)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature -- Commands

	collapse
		do
			ev_main_vbox.hide
			collapse_expand_button.set_text (get_text ("expand_button_text"))
		end

	expand
		do
			ev_main_vbox.show
			collapse_expand_button.set_text (get_text ("collapse_button_text"))
		end

feature -- Modification

	add_frame_control (a_frame_ctl: EVX_FRAME_CONTROL; can_expand: BOOLEAN)
			-- extend current container with frame inside `a_frame_ctl'
		do
			add_frame (a_frame_ctl.ev_root_container, can_expand)
		end

	add_frame (a_frame: EV_FRAME; can_expand: BOOLEAN)
			-- extend current container with `a_frame'
		do
			ev_main_vbox.extend (a_frame)
			if not can_expand then
				ev_main_vbox.disable_item_expand (a_frame)
			end
		end

feature {NONE} -- Implementation

	ev_main_vbox: EV_VERTICAL_BOX

	collapse_expand_button: EV_TOGGLE_BUTTON

	do_collapse_expand
			-- collapse control except button
		do
			if collapse_expand_button.is_selected then
				ev_main_vbox.hide
				collapse_expand_button.set_text (get_text ("expand_button_text"))
			else
				ev_main_vbox.show
				collapse_expand_button.set_text (get_text ("collapse_button_text"))
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
