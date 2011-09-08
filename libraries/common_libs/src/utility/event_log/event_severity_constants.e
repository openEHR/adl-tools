note
	component:   "openEHR Reusable Libraries"
	description: "Event logging severity constants"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EVENT_SEVERITY_CONSTANTS

feature -- Access

	Default_event_level, Information: INTEGER = 0

	Warning: INTEGER = 101

	Error: INTEGER = 102

	No_events: INTEGER = 110
			-- pseudo level (not a severity) for masking all events	

	Severities: HASH_TABLE[STRING, INTEGER]
		once
			create Result.make(0)
			Result.put("Information", Information)
			Result.put("Warning", Warning)
			Result.put("Error", Error)
		end

	Event_levels:HASH_TABLE[INTEGER, STRING]
		once
			create Result.make(0)
			Result.put(Information,	"all")
			Result.put(Information,	"information")
			Result.put(Warning, 	"warning")
			Result.put(Error,		"error")
			Result.put(No_events,	"none")
		end

	event_severity_threshold(a_threshold:STRING):INTEGER
			-- send events of this severity and higher to log device; default to all
		do
			if a_threshold = Void then
				Result := Information
			else
				a_threshold.to_lower
				if Event_levels.has(a_threshold) then
					Result := Event_levels.item(a_threshold)
				else
					Result := Default_event_level
				end
			end
		ensure
			Validity: is_valid_severity(Result) or else Result = No_events
		end

feature -- Status

	is_valid_severity(n:INTEGER):BOOLEAN
		do
			Result := n = Information or else (n >= Warning and n <= Error)
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
--| The Original Code is event_severity_constants.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2005
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
