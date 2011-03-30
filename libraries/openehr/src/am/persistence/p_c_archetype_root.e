note
	component:   "openEHR Archetype Project"
	description: "Persistent form of C_ARCHETYPE_ROOT."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class P_C_ARCHETYPE_ROOT

inherit
	P_C_COMPLEX_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_car: attached C_ARCHETYPE_ROOT)
		do
			precursor (a_car)
			slot_node_id := a_car.slot_node_id
		end

feature -- Access

	slot_node_id: STRING
			-- record node id of slot in parent archetype that this object fills, in the case a slot exists;
			-- only set in flat form of archetype

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
--| The Original Code is p_c_archetype_root.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
