note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper class for retrieving object structure of repository configurations from .cfg file ODIN structure
				 typical example:

				 repository_table = <
					 ["CKM"] = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
					 ["abc"] = <"C:\\some\\other\\ref\\dir">
				 >
				 ]"
	keywords:    "repository"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORIES_TABLE

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

	TABLE_ITERABLE [STRING, STRING]
		undefine
			default_create
		end

create
	make, default_create

feature -- Definitions

	root_attribute_name: STRING = "repositories"
			-- name of the attribute within a parent object at which this object can be found

feature -- Initialisation

	default_create
			-- Basic make routine to guarantee validity on creation.
		do
			create locations.make (0)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- Basic make routine to guarantee validity on creation.
		do
			default_create
		end

	make (a_repos: HASH_TABLE [STRING, STRING])
			-- Make from a hash table of repository paths.
		do
			locations := a_repos
		ensure
			repos_set: locations = a_repos
		end

feature -- Access

	repository_path (a_repo_name: STRING): STRING
		require
			has_repository (a_repo_name)
		do
			check attached locations.item (a_repo_name) as cfg then
				Result := cfg
			end
		end

	count: INTEGER
			-- Number of repositories.
		do
			Result := locations.count
		end

	keys: ARRAY [STRING]
			-- New array containing all repository names.
		do
			Result := locations.current_keys
		ensure
			good_count: Result.count = count
		end

feature -- Status Report

	has_repository (a_repo_name: STRING): BOOLEAN
		do
			Result := locations.has (a_repo_name)
		end

	is_empty: BOOLEAN
			-- True if no repositories
		do
			Result := locations.is_empty
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [STRING, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := locations.new_cursor
		end

feature -- Modification

	put_repository (a_repository: STRING; a_repo_name: STRING)
			-- put `a_repository', replacing any previous repository of that name
		require
			name_not_empty: not a_repo_name.is_empty
		do
			locations.force (a_repository, a_repo_name)
		ensure
			has_repository: has_repository (a_repo_name)
		end

	remove_repository (a_repo_name: STRING)
		require
			has_repository (a_repo_name)
		do
			locations.remove (a_repo_name)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

feature {NONE} -- Implementation

	locations: HASH_TABLE [STRING, STRING]
			-- Hash table of repositories, keyed by their names.

end


