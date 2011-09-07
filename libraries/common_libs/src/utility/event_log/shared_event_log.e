note
	component:   "openEHR Reusable Libraries"
	description: "Shared access to event log."
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_EVENT_LOG

inherit

	EVENT_SEVERITY_CONSTANTS

feature -- Initialisation

	set_log_facility(a_lf: EVENT_LOG_FACILITY)
		require
			Facility_exists: a_lf /= Void
		do
			log_facility.put(a_lf)
		end

feature -- Event Logging

	log_event(class_name, op_name, msg:STRING; severity:INTEGER)
		do
			log_facility.item.append_event(class_name, op_name, msg, severity)
		end

	log_event2(class_name, op_name:STRING; msg_items:ARRAY[ANY]; severity:INTEGER)
		local
			msg:STRING
			i:INTEGER
		do
			create msg.make(0)
			from i := msg_items.lower until i > msg_items.upper loop
				msg.append(msg_items.item(i).out)
				i := i + 1
			end
			log_facility.item.append_event(class_name, op_name, msg, severity)
		end

feature {NONE} -- Implementation

	log_facility: CELL[EVENT_LOG_FACILITY]
	    once
	        create Result.put(Void)
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
--| The Original Code is shared_event_log.e.
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
