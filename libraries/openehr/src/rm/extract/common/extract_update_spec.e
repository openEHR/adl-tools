note
	component:   "openEHR ADL Tools"

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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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


