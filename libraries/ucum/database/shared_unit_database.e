note
	component:   "openEHR ADL Tools"
	description: "Shared Database of unit tables."
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_UNIT_DATABASE

feature -- Initialisation

	initialise_unit_database(unit_groups_path_name, prefixes_file_name:STRING)
			-- initialise unit database from supplied directory & filename
		require
			Groups_path_name_exists: unit_groups_path_name /= Void and then not unit_groups_path_name.is_empty
			Prefixes_file_name_exists: prefixes_file_name /= Void and then not prefixes_file_name.is_empty
		local
			ud:UNIT_DATABASE
			dir:DIRECTORY
			a_file:RAW_FILE
		do
			create dir.make(unit_groups_path_name)
			create a_file.make(prefixes_file_name)
			if not (dir.exists and dir.is_readable) then
				io.put_string("ERROR - directory " + unit_groups_path_name + " does not exist or not readable%N")
			elseif not (a_file.exists and a_file.is_readable) then
				io.put_string("ERROR - file " + prefixes_file_name + " does not exist or not readable%N")
			else
				create ud.make(unit_groups_path_name, prefixes_file_name)
				shared_unit_database.put(ud)
			end
		end

feature -- Access

	unit_database:UNIT_DATABASE
		do
			Result := shared_unit_database.item
		end

feature {NONE} -- Implementation

	shared_unit_database:CELL[UNIT_DATABASE]
		once
			create Result.put(Void)
		end

end

