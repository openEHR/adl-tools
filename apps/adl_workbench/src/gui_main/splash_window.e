note
	component:   "openEHR Archetype Project"
	description: "Splash window"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	license:     "See notice at bottom of class"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SPLASH_WINDOW

inherit
	EV_POPUP_WINDOW
		redefine
			initialize
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make

feature {NONE} -- Initialization

	make
			-- Create to be visible for at least 5 seconds.
		local
			screen: EV_SCREEN
		do
			make_with_shadow

			create screen
			set_position (app_x_position + (screen.width - width) // 2, app_y_position + (screen.height - height) // 2)

			create timer.make_with_interval (5000)
			timer.actions.extend (agent close)
		end

	initialize
			-- Add the openEHR logo with the text label to its right.
		local
			hb, border: EV_HORIZONTAL_BOX
			label: EV_LABEL
		do
			Precursor

			create border
			border.set_border_width (2)
			extend (border)

			create hb
			hb.set_padding (10)
			hb.set_border_width (15)
			border.extend (hb)

			if has_icon_directory then
				hb.extend (adl_workbench_icon)
			end

			create label
			label.align_text_left
			label.set_text (splash_text)
			hb.extend (label)

			set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			propagate_background_color
			border.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (240, 240, 200))
		end

feature {NONE} -- Implementation

	timer: EV_TIMEOUT
			-- Timer to keep window visible for a limited number of seconds.

	close
			-- Close the window and destroy `timer'.
		do
			timer.destroy
			hide
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
--| The Original Code is splash_window.e.
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
