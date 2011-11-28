note
	component:   "openEHR Common Reference Model"

	description: "[
				 Defines a revision history, which is logically a list of
				 audits of a versioned resource, keyed by revision number.
				 The list is in most-recent-first order.
				 ]"
	keywords:    "version control"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005-2010 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class REVISION_HISTORY

feature -- Access

	items: detachable LIST [REVISION_HISTORY_ITEM]
			-- Complete history of items

	item_count: INTEGER
			-- number of entries in revision history
		do
			Result := items.count
		end

	most_recent_version: STRING
			-- The version id of the most recent item, as a String.
		do
			Result := items.last.version_id.value
		ensure
			Result.is_equal (items.last.version_id.value)
		end

	most_recent_version_time_committed: STRING
			-- The commit date/time of the most recent item, as a String.
		do
			Result := items.last.audits.first.time_committed.value
		ensure
			Result.is_equal (items.last.audits.first.time_committed.value)
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
--| The Original Code is revision_history_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2005
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
