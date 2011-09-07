note
	component:   "openEHR EHR Reference Model"

	description: "[
				  Specification of the how Request should be processed by server. The Request can 
				  be persisted in the server, meaning that a) it can be re-activated by the 
				  requesting system simply by indicating Request id, and b) that a changes-only 
				  pattern of Extract updates can be set up. To achieve this, the server has to 
				  remember what was send in the previous reponse.

				  The update mode may be event-driven and periodic update or a mixture of both. 
				  The candidate items to be sent each time are the result of re-evaluating the 
				  content and versioning parts of the specification; what is actually sent is 
				  determined by the send_changes_only flag.
				  ]"
	keywords:    "ehr, extract"

	design:      "openEHR EHR Exztract Reference Model rev 2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class EXTRACT_UPDATE_SPEC

feature -- Access

	persist_in_server: BOOLEAN
			-- If True, this Request is persisted in the server until further notice.

	repeat_period: DV_DURATION
			-- Period of repetition of this request if periodic; Void if not

	trigger_events: LIST [ STRING]
			-- Set of Event names that will cause sending of update Extracts. Event types include:
			--   “any_change” - any change in content items matched by content specification, 
			--                  e.g. new versions of persistent compositions. If the content list 
			--                  allows matching of any, or a wide range of archetypes, this event type 
			--                  will match any additions to the record.
			-- “correction” - match error corrections only, including deletions.
			-- “update” - match updates (i.e. new versions) of included content items.

	send_changes_only: BOOLEAN
			-- If True, send only items that are changed (including logical deletions) 
			-- or new since last send. For persist_in_server Requests only.

invariant
	Overall_validity: repeat_period /= Void or trigger_events /= Void
	Trigger_events_validity: trigger_events /= Void implies not trigger_events.is_empty
	Send_changes_only_validity: send_changes_only implies persist_in_server

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
--| The Original Code is extract_request.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
