note
	component:   "openEHR ADL Tools"

	description: "[
				 Defines a revision history, which is logically a list of
				 audits of a versioned resource, keyed by revision number.
				 The list is in most-recent-first order.
				 ]"
	keywords:    "version control"
	design:      "openEHR Common Reference Model 2.0"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REVISION_HISTORY

feature -- Access

	items: ARRAYED_LIST [REVISION_HISTORY_ITEM]
			-- Complete history of items
		attribute
			create Result.make (0)
		end

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


