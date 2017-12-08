note
	component:   "openEHR ADL Tools"
	description: "[
				 Values of status of node definition in source text, i.e. what is define 
				 in this archetype, what is inherited, what is redefined here, what is 
				 added here.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SPECIALISATION_STATUSES

feature -- Definitions

	ss_undefined: INTEGER = -1
			-- this node status is not defined

	ss_added: INTEGER = 0
			-- this node was defined here for the first time

	ss_redefined: INTEGER = 1
			-- this node is inherited and redefined here

	ss_inherited: INTEGER = 2
			-- this node is inherited here unchanged

feature -- Access

	specialisation_status_names: HASH_TABLE [STRING, INTEGER]
			-- names of specialisation statuses for UI use
			-- NOTE: ss_id_redefined is treated here as having the same name as ss_redefined,
			-- to avoid needing special icons etc for the id_redefined case
		once
			create Result.make (0)
			Result.put ("undefined", ss_undefined)
			Result.put ("added", ss_added)
			Result.put ("inherited", ss_inherited)
			Result.put ("redefined", ss_redefined)
		end

	specialisation_status_name (a_status: INTEGER): STRING
		require
			valid_status: valid_specialisation_status (a_status)
		do
			check attached specialisation_status_names.item (a_status) as str then
				Result := str
			end
		end

	specialisation_status_symbols: HASH_TABLE [STRING, INTEGER]
			-- symbols, probably only useful for debugging onto the console
		once
			create Result.make (0)
			Result.put ("?", ss_undefined)
			Result.put ("+", ss_added)
			Result.put ("^", ss_inherited)
			Result.put ("/", ss_redefined)
		end

feature -- Status Report

	valid_specialisation_status (a_status: INTEGER): BOOLEAN
			-- True if a_status is a valid source status
		do
			Result := a_status >= ss_undefined and a_status <= ss_inherited
		end

	specialisation_dominant_status (this_status, other_status: INTEGER): INTEGER
			-- determine which of Current and other_status is dominant at a given node, due
			-- to sub-node values; order is:
			-- added, redefined, inherited
		do
			Result := this_status.min (other_status)
		end

end


