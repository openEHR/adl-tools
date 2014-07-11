note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper class for retrieving object structure of repository configurations from .cfg file ODIN structure
				 typical example:

				 repository_config_table = <
					 current_repository = <"CKM">
					 repositories = <
						 ["CKM"] = <
						 	reference_path = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
							work_path = <"">
						 >
						 ["abc"] = <
						 	reference_path = <"C:\\some\\other\\ref\\dir">
							work_path = <"C:\\some\\other\\work\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_CONFIG_TABLE

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

	TABLE_ITERABLE [REPOSITORY_CONFIG, STRING]
		undefine
			default_create
		end

create
	make, make_from_old, default_create

feature -- Definitions

	root_attribute_name: STRING = "repository_config_table"
			-- name of the attribute within a parent object at which this object can be found

feature -- Initialisation

	default_create
			-- Basic make routine to guarantee validity on creation.
		do
			create repositories.make (0)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- Basic make routine to guarantee validity on creation.
		do
			default_create
		end

	make (a_repos: HASH_TABLE [REPOSITORY_CONFIG, STRING])
			-- Make from a given hash table of repository repositories.
		do
			repositories := a_repos
		ensure
			repos_set: repositories = a_repos
		end

	make_from_old (an_old_config: REPOSITORY_PROFILE_CONFIG)
			-- create structure from old-style profile
		local
			a_repo_config: REPOSITORY_CONFIG
		do
			default_create
			if attached an_old_config.current_profile_name as opn then
				current_repository_name := opn
			end
			across an_old_config.profiles as profs_csr loop
				create a_repo_config.make_from_old (profs_csr.item)
				repositories.put (a_repo_config, profs_csr.key)
			end
		end

feature -- Access

	current_repository_name: detachable STRING
			-- name of repository that is currently in use

	current_repository: detachable REPOSITORY_CONFIG
			-- return current repository object, if `current_repository_name' set and corresponds to
			-- a repository, else return first repository available, if any exist.
		local
			curr_prof_name: STRING
		do
			if not is_empty then
				if attached current_repository_name as cpn and then has_repository (cpn) then
					Result := repository (cpn)
				else
					repositories.start
					curr_prof_name := repositories.key_for_iteration
					current_repository_name := curr_prof_name
					Result := repository (curr_prof_name)
				end
			end
		end

	repository (a_repo_name: STRING): REPOSITORY_CONFIG
		require
			has_repository (a_repo_name)
		do
			check attached repositories.item (a_repo_name) as cfg then
				Result := cfg
			end
		end

	current_reference_repository_path: STRING
			-- path of root of ADL file tree
		do
			if attached current_repository as cfg then
				Result := cfg.reference_path
			else
				create Result.make_empty
			end
		end

	current_work_repository_path: STRING
			-- path of root of ADL file tree
		do
			if attached current_repository as cfg and then attached cfg.work_path as wp then
				Result := wp
			else
				create Result.make_empty
			end
		end

	count: INTEGER
			-- Number of repositories.
		do
			Result := repositories.count
		end

	names: ARRAY [STRING]
			-- New array containing all repository names.
		do
			Result := repositories.current_keys
		ensure
			good_count: Result.count = count
		end

feature -- Status Report

	has_current_repository: BOOLEAN
		do
			Result := attached current_repository_name and then not current_repository_name.is_empty
		end

	has_repository (a_repo_name: STRING): BOOLEAN
		do
			Result := repositories.has (a_repo_name)
		end

	is_empty: BOOLEAN
			-- True if no repositories
		do
			Result := repositories.is_empty
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [REPOSITORY_CONFIG, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := repositories.new_cursor
		end

	first_repository: STRING
		require
			not is_empty
		do
			repositories.start
			Result := repositories.key_for_iteration
		end

feature -- Modification

	put_repository (a_repository: REPOSITORY_CONFIG; a_repo_name: STRING)
			-- put `a_repository', replacing any previous repository of that name
		require
			name_not_empty: not a_repo_name.is_empty
		do
			repositories.force (a_repository, a_repo_name)
			if not has_current_repository then
				current_repository_name := a_repo_name
			end
		ensure
			has_repository: has_repository (a_repo_name)
			has_current_repository: has_current_repository
			current_repository_set: old not has_current_repository implies current_repository_name ~ a_repo_name
		end

	remove_repository (a_repo_name: STRING)
		require
			has_repository (a_repo_name)
		do
			repositories.remove (a_repo_name)
			if is_empty or (attached current_repository_name as cpn and then a_repo_name.same_string (cpn)) then
				clear_current_repository
			end
		end

	rename_repository (old_repo_name, new_repo_name: STRING)
		require
			old_name_not_empty: not old_repo_name.is_empty
			new_name_not_empty: not new_repo_name.is_empty
			has_old_name: has_repository (old_repo_name)
			hasnt_new_name: not has_repository (new_repo_name)
		do
			repositories.replace_key (new_repo_name, old_repo_name)
			if current_repository_name ~ old_repo_name then
				current_repository_name := new_repo_name
			end
		ensure
			old_name_gone: not has_repository (old_repo_name)
			has_new_name: has_repository (new_repo_name)
			has_current_repository: has_current_repository
			current_name_replaced: old current_repository_name.twin ~ old_repo_name implies current_repository_name ~ new_repo_name
		end

	set_current_repository_name (a_repo_name: STRING)
		require
			name_not_empty: not a_repo_name.is_empty
			has_repository (a_repo_name)
		do
			current_repository_name := a_repo_name
		ensure
			has_current_repository: has_current_repository
			current_name_set: current_repository_name ~ a_repo_name
		end

	clear_current_repository
			-- remove the current repository so there is no current repository
		do
			current_repository_name := Void
		ensure
			hasnt_current_repository: not has_current_repository
			current_name_void: not attached current_repository_name
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

feature {NONE} -- Implementation

	repositories: HASH_TABLE [REPOSITORY_CONFIG, STRING]
			-- Hash table of repositories, keyed by their names.

invariant
-- FIXME: This is commented because we cannot satisfy the invariant immediately after creation via DT_OBJECT_CONVERTER:
--	Valid_current_repository: not is_empty implies has_current_repository

end


