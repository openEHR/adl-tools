indexing
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

	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make

feature {NONE} -- Initialization

	make is
			-- Create to be visible for one-and-a-half seconds.
		local
			screen: EV_SCREEN
		do
			make_with_shadow

			create screen
			set_position ((screen.width - width) // 2, (screen.height - height) // 2)

			create timer.make_with_interval (1500)
			timer.actions.extend (agent close)
		end

	initialize is
			-- Add the Ocean logo with the text label to its right.
		local
			hb: EV_HORIZONTAL_BOX
			cell: EV_CELL
			label: EV_LABEL
			pixmap: EV_PIXMAP
		do
			Precursor

			create hb
			hb.set_padding (50)
			hb.set_border_width (30)
			extend (hb)

			if has_icon_directory then
				pixmap := pixmaps ["Ocean logo"]
				create cell
				cell.extend (pixmap)
				cell.set_minimum_size (pixmap.width, pixmap.height)
				hb.extend (cell)
			end

			create label
			label.align_text_left
			label.set_text (splash_text)
			hb.extend (label)

			set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			propagate_background_color

			if cell /= Void then
				cell.set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 255))
			end
		end

feature {NONE} -- Implementation

	timer: EV_TIMEOUT
			-- Timer to keep window visible for a limited number of seconds.

	close is
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
