indexing
	component:   "openEHR Reusable Libraries"
	description: "[
			 Database of unit tables, designed on the basis of the Unified Code for Units
	             of Measure (UCUM), developed by Gunther Schadow and Clement J. McDonald of
			 The Regenstrief Institute For Health Care, Indianapolis.
			 Published at http://aurora.rg.iupui.edu/UCUM.
	             ]"
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class UNIT_DATABASE

inherit
	STRING_UTILITIES
		export
			{NONE} all
		redefine
			out
		end

creation
	make

feature -- Definitions

	File_extension: STRING is ".txt"
	
feature -- Initialisation

	make(unit_groups_path_name, prefixes_file_name:STRING) is
			-- look for unit group files ending in ".txt" in `unit_groups_path_name' directory, and 
			-- prefixes file called `prefixes_file_name'
		require
			Groups_path_name_exists: unit_groups_path_name /= Void and then not unit_groups_path_name.is_empty
			Prefixes_file_name_exists: prefixes_file_name /= Void and then not prefixes_file_name.is_empty
		local
			dir:DIRECTORY
			files:ARRAYED_LIST[STRING]
			file_name:STRING
			a_unit_group:UNIT_GROUP
		do
			create dir.make_open_read(unit_groups_path_name)
			create unit_groups.make(0)
			files := dir.linear_representation
			from 
				files.start
			until 
				files.off 
			loop
				if files.item.count >= File_extension.count and then files.item.substring_index(File_extension, 1) > 0 then
					file_name := unit_groups_path_name.twin + operating_environment.directory_separator.out + files.item
					create a_unit_group.make(file_name)
					unit_groups.put(a_unit_group, a_unit_group.group_name)		
				end
				files.forth
			end

			create metric_prefixes.make(prefixes_file_name)
		end

feature -- Access

	unit_groups:HASH_TABLE [UNIT_GROUP, STRING]
			-- all unit tables

	metric_prefixes:PREFIXES

	unit_group(a_unit_name:STRING):UNIT_GROUP is
			-- unit group for unit `a_unit_name' or Void if not found
		require
			Name_exists: a_unit_name /= Void and then not a_unit_name.is_empty
		do
			from 
				unit_groups.start 
			until 
				unit_groups.off or else unit_groups.item_for_iteration.has_unit(a_unit_name) 
			loop
				unit_groups.forth
			end

			if not unit_groups.off then
				Result := unit_groups.item_for_iteration
			end
		end

	unit_group_for_symbol(a_unit_symbol:STRING):UNIT_GROUP is
			-- unit group for unit `a_unit_symbol' or Void if not found.
			-- finds the unit group containing the longest match for `a_unit_symbol'. 
			-- E.g. the unit "ppm" will match "m" and also "ppm"; the algorithm will
			-- choose the group containing "ppm"
		require
			Name_exists: a_unit_symbol /= Void and then not a_unit_symbol.is_empty
		local
			i, match_len:INTEGER
		do
			from 
				unit_groups.start 
			until 
				unit_groups.off 
			loop
				i := unit_groups.item_for_iteration.match_length_for_symbol(a_unit_symbol)
				if i > match_len then
					Result := unit_groups.item_for_iteration
					match_len := i
				end
				unit_groups.forth
			end
		end

	unit_descriptor(a_unit_name:STRING):UNIT_DESCRIPTOR is
			-- unit descriptor for unit `a_unit_name' or Void if not found
		require
			Name_exists: a_unit_name /= Void and then not a_unit_name.is_empty
		local
			ug:UNIT_GROUP
		do
			ug := unit_group(a_unit_name)
			if ug /= Void then
				Result := ug.units.item(a_unit_name)
			end
		end

	unit_descriptor_for_symbol(a_unit_symbol:STRING):UNIT_DESCRIPTOR is
			-- unit descriptor for unit `a_unit_symbol' (case/sensitive symbol) or Void if not found
		require
			Name_exists: a_unit_symbol /= Void and then not a_unit_symbol.is_empty
		local
			ug:UNIT_GROUP
		do
			ug := unit_group_for_symbol(a_unit_symbol)
			if ug /= Void then
				Result := ug.units_by_symbol.item(a_unit_symbol)
			end
		end

	has_unit(a_name:STRING):BOOLEAN is
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			Result := unit_group(a_name) /= Void
		end

	has_prefix(a_prefix:STRING):BOOLEAN is
		require
			Prefix_exists: a_prefix /= Void and then not a_prefix.is_empty
		do
			Result := metric_prefixes.has_prefix(a_prefix)
		end

	has_prefix_symbol(a_symbol:STRING):BOOLEAN is
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			Result := metric_prefixes.has_prefix_symbol(a_symbol)
		end

	is_metric_unit(a_unit_name:STRING):BOOLEAN is
			-- unit `a_unit_name' is allowed to have a metric prefix
		require
			Unit_valid: a_unit_name /= Void and then has_unit(a_unit_name)
		do
			Result := unit_descriptor(a_unit_name).is_metric
		end

feature -- Output

	out:STRING is
		do
			create Result.make(0)
			Result.append("METRIC PREFIXES%N")
			Result.append(indented(metric_prefixes.out, "%T"))
			Result.append("%NUNIT GROUPS%N")
			from unit_groups.start until unit_groups.off loop
				Result.append("%N" + indented(unit_groups.item_for_iteration.out, "%T"))
				unit_groups.forth
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
--| The Original Code is unit_database.e.
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
