note
	component:   "openEHR Reusable Libraries"
	description: "Unit definition/exponent atom, as used in units"
	keywords:    "units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


class UNITS_ITEM

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Initialisation

	make(a_unit:UNIT_REFERENCE; an_exponent:INTEGER)
		require
			Unit_exists: a_unit /= Void
		do
			unit := a_unit
			exponent := an_exponent
		end

feature -- Access

	unit: UNIT_REFERENCE

	exponent:INTEGER

feature -- Modify

	set_exponent(i:INTEGER)
		do
			exponent := i
		end

feature -- Output

	out:STRING
		do
			create Result.make(0)
			Result.append(unit.out)
			if exponent /= 1 then
				Result.append(" ^ ")
				Result.append_integer(exponent)
			end
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
--| The Original Code is units_item.e.
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
