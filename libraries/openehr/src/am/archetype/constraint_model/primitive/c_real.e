indexing

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

	ADL_DEFINITIONS
		export
			{NONE} all
		undefine
			out
		end

create
	make_interval, make_list

feature -- Initialisation
	
	make_interval(an_interval: OE_INTERVAL[REAL]) is
		require
			Interval_exists: an_interval /= Void
		do
			interval := an_interval
		end
		
	make_list(a_list: LIST[REAL]) is
			-- make from a list of integers
		require
			a_list_exists: a_list /= Void and then not a_list.is_empty
		do
			list := a_list
		ensure
			List_set: list = a_list
		end

feature -- Access

	interval: OE_INTERVAL[REAL]

	list: LIST[REAL]

	default_value: REAL_REF is
		do
			create Result 
			if interval /= Void then
				Result.set_item(interval.lower)
			else
				Result.set_item(list.first)
			end
		end
	
feature -- Status Report

	valid_value (a_value: REAL_REF): BOOLEAN is 
		do
			if interval /= Void then
				Result := interval.has(a_value.item)
			else
				Result := list.has(a_value.item)
			end
		end

feature -- Output

	as_string: STRING is
		local
			out_val: STRING
		do
			create Result.make(0)
			if interval /= Void then
				Result.append("|" + interval_as_string + "|")
			else
				from
					list.start
				until
					list.off
				loop
					if not list.isfirst then
						Result.append(", ")
					end
					
					-- FIXME: REAL.out is broken; forgets to output '.0'
					out_val := list.item.out
					if out_val.index_of('.', 1) = 0 then
						out_val.append(".0")
					end
					Result.append(out_val)

					list.forth
				end
			end
			if assumed_value /= Void then
				-- FIXME: REAL.out is broken; forgets to output '.0'
				out_val := assumed_value.out
				if out_val.index_of('.', 1) = 0 then
					out_val.append(".0")
				end
				Result.append("; " + out_val)
			end			
		end

	as_canonical_string:STRING is
		do
			Result := as_string
		end

	interval_as_string: STRING is
			-- FIXME: this is a copy of INTERVAL.as_STRING, slightly modified to make Reals 
			-- which have no decimals still print out with a '.0' at the end - so as to be
			-- symmetric on output and input
		local
			lstr, ustr: STRING
		do
			lstr := interval.lower.out
			ustr := interval.upper.out
			if lstr.index_of('.', 1) <= 0 then
				lstr.append(".0")
			end
			if ustr.index_of('.', 1) <= 0 then
				ustr.append(".0")
			end

			create Result.make(0)
			if interval.lower_unbounded then
				if interval.upper_included then
					Result.append("<= " + ustr)
				else
					Result.append("< " + ustr)
				end
			elseif interval.upper_unbounded then
				if interval.lower_included then
					Result.append(">= " + lstr)
				else
					Result.append("> " + lstr)
				end
			elseif not interval.limits_equal then
				Result.append(lstr + ".." + ustr)
			else
				Result.append(ustr) 
			end
		end

		
invariant
	interval /= Void xor list /= Void

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
