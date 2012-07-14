note
	component:   "openEHR Archetype Project"
	description: "[
				 Values of status of node definition in source text, i.e. what is define 
				 in this archetype, what is inherited, what is redefined here, what is 
				 added here.
				 ]"
	keywords:    "ADL"

	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2102 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SPECIALISATION_STATUSES

feature -- Definitions

	ss_undefined: INTEGER = -1
			-- this node status is not defined

	ss_added: INTEGER = 0
			-- this node was defined here for the first time

	ss_redefined: INTEGER = 1
			-- this node is inherited and redefined here

	ss_id_redefined: INTEGER = 2
			-- this node is inherited and its id only is redefined here

	ss_inherited: INTEGER = 3
			-- this node is inherited here unchanged

	ss_propagated: INTEGER = 4
			-- this node's status is the same as its parent's

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
			Result.put ("node id redefined", ss_id_redefined)
			Result.put ("propagated", ss_propagated)
		end

	specialisation_status_symbols: HASH_TABLE [STRING, INTEGER]
			-- symbols, probably only useful for debugging onto the console
		once
			create Result.make (0)
			Result.put ("?", ss_undefined)
			Result.put ("+", ss_added)
			Result.put ("^", ss_inherited)
			Result.put ("/+", ss_redefined)
			Result.put ("/", ss_id_redefined)
			Result.put ("=", ss_propagated)
		end

feature -- Status Report

	valid_specialisation_status (a_status: INTEGER): BOOLEAN
			-- True if a_status is a valid source status
		do
			Result := a_status >= ss_undefined and a_status <= ss_propagated
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
--| The Original Code is source_statuses.e
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
