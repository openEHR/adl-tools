note
	component:   "openEHR Archetype Project"
	description: "Abstract idea of a GUI tool in docking arrangement"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class GUI_TOOL

feature -- Access

	source: ANY
			-- source object to which this tool is targetted

	ev_root_container: EV_CONTAINER
		deferred
		end

	last_populate_timestamp: attached DATE_TIME
			-- timestamp of last populate or repopulate

	tool_unique_id: INTEGER
			-- unique id of this tool instance over the session
		do
			Result := ev_root_container.object_id
		end

feature -- Status Report

	can_populate (a_source: attached like source): BOOLEAN
		do
			Result := True
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated
		end

	is_populated: BOOLEAN
		do
			Result := attached source
		end

feature -- Commands

	clear
			-- Wipe out content from visual controls and reset controls to reasoonable state
		do
			last_populate_timestamp := Void
			do_clear
		end

	populate (a_source: attached like source)
			-- populate the control by creating it from scratch
		require
			can_populate (a_source)
		do
			source := a_source
			clear
			do_populate
			create last_populate_timestamp.make_now
		end

	repopulate
			-- repopulate current tree items if needed
		require
			can_repopulate: can_repopulate
		do
			do_populate
			create last_populate_timestamp.make_now
		end

	try_repopulate
			-- repopulate if possible; useful for buttons on tool that would cause live repopulate
		do
			if can_repopulate then
				repopulate
			end
		end

feature {NONE} -- Implementation

	do_clear
		deferred
		end

	do_populate
		deferred
		end

invariant
	Reverse_link_set: ev_root_container.data = Current

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
--| The Original Code is gui_archetype_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 20011
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
