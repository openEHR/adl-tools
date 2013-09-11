note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class UNIT_DATABASE

inherit
	STRING_UTILITIES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal
		redefine
			out
		end

create
	make

feature -- Definitions

	File_extension: STRING = ".txt"

feature -- Initialisation

	make(unit_groups_path_name, prefixes_file_name:STRING)
			-- look for unit group files ending in ".txt" in `unit_groups_path_name' directory, and
			-- prefixes file called `prefixes_file_name'
		require
			Groups_path_name_exists: not unit_groups_path_name.is_empty
			Prefixes_file_name_exists: not prefixes_file_name.is_empty
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

	unit_group(a_unit_name:STRING):UNIT_GROUP
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

	unit_group_for_symbol(a_unit_symbol:STRING):UNIT_GROUP
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

	unit_descriptor(a_unit_name:STRING):UNIT_DESCRIPTOR
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

	unit_descriptor_for_symbol(a_unit_symbol:STRING):UNIT_DESCRIPTOR
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

	has_unit(a_name:STRING):BOOLEAN
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			Result := unit_group(a_name) /= Void
		end

	has_prefix(a_prefix:STRING):BOOLEAN
		require
			Prefix_exists: a_prefix /= Void and then not a_prefix.is_empty
		do
			Result := metric_prefixes.has_prefix(a_prefix)
		end

	has_prefix_symbol(a_symbol:STRING):BOOLEAN
		require
			Symbol_exists: a_symbol /= Void and then not a_symbol.is_empty
		do
			Result := metric_prefixes.has_prefix_symbol(a_symbol)
		end

	is_metric_unit(a_unit_name:STRING):BOOLEAN
			-- unit `a_unit_name' is allowed to have a metric prefix
		require
			Unit_valid: a_unit_name /= Void and then has_unit(a_unit_name)
		do
			Result := unit_descriptor(a_unit_name).is_metric
		end

feature -- Output

	out:STRING
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

