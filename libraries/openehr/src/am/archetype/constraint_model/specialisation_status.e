indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Status of node definition in source text, i.e. what is define in this archetype,
				 what is inherited, what is redefined here, what is added here.
				 ]"
	keywords:    "ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics<support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SPECIALISATION_STATUS

inherit
	SPECIALISATION_STATUSES

create
	make

feature -- Initialisation

	make(a_value: INTEGER) is
			-- make with an ss_xxx value
		require
			Valid_valid: valid_specialisation_status(a_value)
		do
			value := a_value
		end

feature -- Access

	value: INTEGER
			-- the specialisation status value	

feature -- Comparison

	specialisation_dominant_status(other_status: SPECIALISATION_STATUS): SPECIALISATION_STATUS is
			-- determine which of Current and other_status is dominant at a given node, due
			-- to sub-node values; order is:
			-- added, redefined, inherited, propagated
		do
			create Result.make(value.min(other_status.value))
		end

invariant
	Valid_value: valid_specialisation_status(value)

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
