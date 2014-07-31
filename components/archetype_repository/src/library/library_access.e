note
	component:   "openEHR ADL Tools"
	description: "[
				 Source repositories providing access to source archetypes & templates.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class LIBRARY_ACCESS

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

create
	make

feature -- Definitions

	Group_id_adhoc: INTEGER = 1

	Group_id_primary: INTEGER = 2

feature -- Initialisation

	make (a_primary_path: STRING)
		require
			dir_name_valid: directory_exists (a_primary_path)
		do
			create adhoc_source.make (Group_id_adhoc)
			check attached file_system.canonical_pathname (a_primary_path) as cpn then
				create {ARCHETYPE_INDEXED_FILE_LIBRARY_IMP} primary_source.make (cpn, Group_id_primary)
			end
		end

feature -- Access

	primary_source: ARCHETYPE_INDEXED_LIBRARY_I
			-- primary physical artefact source

	adhoc_source: ARCHETYPE_ADHOC_FILE_SOURCE
			-- An additional 'source' where archetypes may be found, but not necessarily classified
			-- under any structure - used e.g. to represent the file local system where isolated archetypes
			-- may be found, e.g. in c:\temp, /tmp or wherever. This repository is just a list of
			-- archetypes keyed by path on the file system. They are not merged onto the directory
			-- but 'grafted' - a simpler operation.

end


