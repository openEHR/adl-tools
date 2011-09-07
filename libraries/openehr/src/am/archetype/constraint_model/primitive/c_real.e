note

	component:   "openEHR Common Archetype Model"

	description: "Constrainer type for instances of REAL"
	keywords:    "archetype, boolean, data"

	design:      "openEHR Common Archetype Model 0.2"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_REAL

inherit
	C_PRIMITIVE

create
	make_range, make_list

feature -- Initialisation

	make_range (an_interval: attached INTERVAL[REAL])
		do
			range := an_interval
		end

	make_list (a_list: attached LIST[REAL])
			-- make from a list of integers
		require
			a_list_valid: not a_list.is_empty
		do
			create list.make(0)
			list.append (a_list)
		end

feature -- Access

	range: INTERVAL [REAL]

	list: ARRAYED_LIST [REAL]

	prototype_value: REAL_REF
		do
			if attached range then
				Result := range.lower
			else
				Result := list.first
			end
		end

feature -- Status Report

	valid_value (a_value: REAL_REF): BOOLEAN
		do
			if attached range then
				Result := range.has (a_value)
			else
				Result := list.has (a_value)
			end
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if attached range and attached other.range then
				Result := other.range.contains (range)
			elseif attached list and attached other.list then
				from list.start until list.off or not other.list.has (list.item) loop
					list.forth
				end
				Result := list.off
			end
		end

feature -- Output

	as_string: STRING
		local
			out_val: STRING
		do
			create Result.make(0)
			if attached range then
				Result.append ("|" + range.as_string + "|")
			else
				from list.start until list.off loop
					if not list.isfirst then
						Result.append (", ")
					end

					-- FIXME: REAL.out is broken; forgets to output '.0'
					out_val := list.item.out
					if out_val.index_of('.', 1) = 0 then
						out_val.append (".0")
					end
					Result.append (out_val)

					list.forth
				end
			end
			if attached assumed_value then
				-- FIXME: REAL.out is broken; forgets to output '.0'
				out_val := assumed_value.out
				if out_val.index_of('.', 1) = 0 then
					out_val.append (".0")
				end
				Result.append ("; " + out_val)
			end
		end

invariant
	attached range xor attached list

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
--| The Original Code is c_real.e.
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
