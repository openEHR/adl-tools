note
	component:   "openEHR Archetype Project"
	description: "[
				 EV_FRAME-based control, containing a vbox or hbox, and with some style setting.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_FRAME_CONTROL

inherit
	EVX_DEFINITIONS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

create
	make

feature -- Initialisation

	make (a_title: STRING; min_height, min_width: INTEGER; horizontal_flag: BOOLEAN)
		do
			create ev_root_container
			ev_root_container.set_text (a_title)
			ev_root_container.set_style (1)

			if horizontal_flag then
				create {EV_HORIZONTAL_BOX} ev_root_box
			else
				create {EV_VERTICAL_BOX} ev_root_box
			end
			ev_root_box.set_border_width (Default_border_width)
			ev_root_box.set_padding_width (Default_padding_width)
			ev_root_container.extend (ev_root_box)
			ev_current_box := ev_root_box
		end

feature -- Access

	ev_root_container: EV_FRAME

feature -- Modification

	extend (a_widget: EV_WIDGET; can_expand: BOOLEAN)
			-- extend current container with `a_widget'
		do
			ev_current_box.extend (a_widget)
			if not can_expand then
				ev_current_box.disable_item_expand (a_widget)
			end
		end

	add_row (can_expand: BOOLEAN)
			-- add an HBOX container; subsequent calls to `extend' will add to this HBOX
		do
			create {EV_HORIZONTAL_BOX} ev_current_box
			ev_root_box.extend (ev_current_box)
			if not can_expand then
				ev_root_box.disable_item_expand (ev_current_box)
			end
		end

feature {NONE} -- Implementation

	ev_root_box: EV_BOX

	ev_current_box: EV_BOX
			-- ref to box currently being added to

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
