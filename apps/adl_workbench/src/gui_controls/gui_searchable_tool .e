note
	component:   "openEHR Archetype Project"
	description: "Abstract idea of a GUI tool that can be searched from the addres bar"
	keywords:    "GUI, searchable"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

deferred class GUI_SEARCHABLE_TOOL

inherit
	GUI_TOOL

feature -- Access

	matching_ids (a_key: attached STRING): attached ARRAYED_SET [STRING]
			-- obtain a list of matching ids
		require
			Key_valid: not a_key.is_empty
		deferred
		end

	tool_unique_id: INTEGER
			-- unique id of this tool instance over the session
		do
			Result := ev_root_container.object_id
		end

feature -- Status Report

	item_selectable: BOOLEAN
		deferred
		end

	valid_item_id (a_key: attached STRING): BOOLEAN
			-- key is a valid identifier of an item managed in this tool
		deferred
		end

feature -- Commands

	select_item (id: attached STRING)
			-- Select `id' in the tool and go to its node in explorer tree
		require
			item_selectable
		deferred
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
