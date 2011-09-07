note
	component:   "openEHR Archetype Project"
	description: "Persistent form of C_DV_QUANTITY"
	keywords:    "quantity, archetype, clinical type, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_C_DV_QUANTITY

inherit
	P_C_DEFINED_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_c_dvq: C_DV_QUANTITY)
		do
			precursor (a_c_dvq)
			property := a_c_dvq.property.as_string
			list := a_c_dvq.list
		end

feature -- Access

	property: STRING
			-- property

	list: ARRAYED_LIST [C_QUANTITY_ITEM]
			-- list of items constraining magnitude/units pairs

feature -- Factory

	create_c_dv_quantity: attached C_DV_QUANTITY
		do
			create Result.make
			Result.set_property (create {CODE_PHRASE}.make_from_string(property))
			if attached list then
				Result.set_list (list)
			end
			populate_c_instance (Result)
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
--| The Original Code is cadl_object_term.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
