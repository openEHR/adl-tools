note
	component:   "openEHR Archetype Project"
	description: "EV_BUTTON with active/inactive setting."
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_BUTTON

inherit
	EVX_DEFINITIONS
		export
			{NONE} all
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_active_pixmap, an_inactive_pixmap: detachable EV_PIXMAP; a_tooltip_text: detachable STRING; a_select_action: detachable PROCEDURE [ANY, TUPLE])
		do
			active_pixmap := an_active_pixmap
			inactive_pixmap := an_inactive_pixmap
			select_action := a_select_action

			create ev_button
			if attached a_tooltip_text then
				ev_button.set_tooltip (a_tooltip_text)
			end
			is_active := True
			disable_active
		end

feature -- Access

	ev_button: EV_BUTTON

	active_pixmap: detachable EV_PIXMAP

	inactive_pixmap: detachable EV_PIXMAP

	select_action: detachable PROCEDURE [ANY, TUPLE]

feature -- Status Report

	is_active: BOOLEAN

feature -- Commands

	enable_active
			-- set active pixmap and install `select_action'
		do
			if not is_active then
				is_active := True
				if attached active_pixmap then
					ev_button.set_pixmap (active_pixmap)
				end
				if attached select_action then
					ev_button.select_actions.extend (select_action)
				end
			end
		end

	disable_active
			-- set inactive pixmap and uninstall `select_action'
		do
			if is_active then
				is_active := False
				if attached inactive_pixmap then
					ev_button.set_pixmap (inactive_pixmap)
				end
				ev_button.select_actions.wipe_out
			end
		end

feature {NONE} -- Implementation


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
