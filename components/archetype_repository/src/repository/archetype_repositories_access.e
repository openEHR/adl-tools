note
	component:   "openEHR ADL Tools"
	description: "Set of archetype repositories read by tool at startup"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORIES_ACCESS

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
		end

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			clear
		end

feature -- Access

	repositories: HASH_TABLE [ARCHETYPE_REPOSITORY_DEFINITION, STRING]
			-- loaded repositories

	repository_accessors: HASH_TABLE [ARCHETYPE_REPOSITORY_ACCESS, STRING]
			-- repositor accessor objects

feature -- Status Report

	found_repositories: BOOLEAN
			-- True if any valid repositories were found
		do
			Result := not repositories.is_empty
		end

feature -- Commands

	clear
		do
			create repositories.make (0)
			create repository_accessors.make (0)
		end

	load
			-- reload repositories
		local
			dir: KL_DIRECTORY
			file_repo: FILE_REPOSITORY
			arch_rep: ARCHETYPE_REPOSITORY_ACCESS
		do
		end

end



