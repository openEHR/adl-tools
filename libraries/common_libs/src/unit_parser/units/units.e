indexing
	component:   "openEHR Reusable Libraries"
	description: "[
		       Units as used for measuring quantities. Made of a series of 
			 UNIT_DEFINITION/exponent atoms.
			 ]"
	keywords:    "unit"
	description: "Model of a unit atom with prefix, suffix, name, property and unit group"
	keywords:    "units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class UNITS

inherit 
	QUANTIFIABLE
		redefine
			out
		end

create
	make

feature -- Initialisation

	make(item_list:ARRAYED_LIST[UNITS_ITEM]) is
		require
			Unit_list_valid: item_list /= Void and then not item_list.is_empty
		do
			items := item_list
		ensure
			Simple_units_set: items = item_list
		end

feature -- Access

	items:ARRAYED_LIST[UNITS_ITEM]

feature -- Element Change

	add_unit (a_unit: UNITS_ITEM) is
			-- FIXME: this probably needs to be in UNITS
		require
			Unit_valid: a_unit /= Void and then not items.has(a_unit)
		do
			if items = Void then
				create items.make (1)
				items.compare_objects
			end
			items.extend(a_unit)
		end

feature -- Output

	as_string:STRING is
		do
			create Result.make(0)
			from items.start until items.off loop
				if not items.isfirst then
				    Result.append_character('.')
				end
				Result.append(items.item.unit.as_string)
				if items.item.exponent > 1 then
					Result.append("^" + items.item.exponent.out)
				end
				items.forth
			end
		end

	out:STRING is
		do
			create Result.make(0)
			Result.append(as_string)
			from items.start until items.off loop
				if not items.isfirst then
				    Result.append("%N")
				end
				Result.append(items.item.out)
				items.forth
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
--| The Original Code is units.e.
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
