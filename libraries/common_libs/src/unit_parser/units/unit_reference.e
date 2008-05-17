indexing
	component:   "openEHR Reusable Libraries"
	description: "Model of a unit atom with prefix, suffix, name, property and unit group"
	keywords:    "units"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class UNIT_REFERENCE

inherit
	QUANTIFIABLE
		redefine
			out
		end

create
	make

feature -- Definitions

	Suffix_start:STRING is "["

	Suffix_end:STRING is "]"

feature -- Initialisation

	make(a_name, a_property, a_group:STRING) is
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
			Property_exists: a_property /= Void and then not a_property.is_empty
			group_exists: a_group /= Void and then not a_group.is_empty
		do
			name := a_name.twin
			property := a_property.twin
			group := a_group.twin
		ensure
			Name_set: name.is_equal(a_name)
			Property_set: property.is_equal(a_property)
			Group_set: group.is_equal(a_group)
		end

feature -- Access

	name:STRING
			-- name of this unit in `group'

	group:STRING
			-- unit group from which this unit comes

	metric_prefix:STRING
			-- metric prefix symbol used with this unit instance, e.g. "k" for "kilo";
			-- can be used to key into prefix table in units database

	suffix:STRING
			-- string whose inclusion changes the meaning of the unit, e.g.
			-- Hg in "mm[Hg]"

feature -- Modify

	set_metric_prefix(str:STRING) is
			-- set metric prefix
		require
			str /= Void and then not str.is_empty
		do
			metric_prefix := str.twin
		end

	set_suffix(str:STRING) is
			-- suffix is a string whose inclusion changes the meaning of the unit, e.g.
			-- "m" = distance, but "m[H2O]" means pressure
		require
			str /= Void and then not str.is_empty
		do
			suffix := str.twin
		end

feature -- Output

	as_string:STRING is
		do
			create Result.make(0)
			Result.append(metric_prefix_as_string + name.out + suffix_out)
		end

	out:STRING is
		do
			create Result.make(0)
			Result.append(metric_prefix_out + name.out + suffix_out + " {" + property.out + ", " + group.out + "}")
		end

feature {UNITS} -- Implementation

	suffix_out:STRING is
		do
			create Result.make(0)
			if suffix /= Void then
				Result.append(Suffix_start + suffix + Suffix_end)
			end
		end

	metric_prefix_as_string:STRING is
		do
			create Result.make(0)
			if metric_prefix /= Void then
				Result.append(metric_prefix)
			end
		end

	metric_prefix_out:STRING is
		do
			create Result.make(0)
			if metric_prefix /= Void then
				Result.append(metric_prefix  + "_")
			end
		end

invariant
	Name_exists: name /= Void and then not name.is_empty
	Property_exists: property /= Void and then not property.is_empty
	group_exists: group /= Void and then not group.is_empty

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
--| The Original Code is unit_reference.e.
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
