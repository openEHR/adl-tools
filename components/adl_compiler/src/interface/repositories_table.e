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
			default_create, finalise_dt
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

	repository_paths: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			Result.append (locations.linear_representation)
		end

	count: INTEGER
			-- Number of repositories.
		do
			Result := locations.count
		end

	keys: ARRAY [STRING]
			-- New array containing all keys.
		do
			Result := locations.current_keys
		ensure
			good_count: Result.count = count
		end

feature -- Status Report

	has_repository (a_path: STRING): BOOLEAN
		do
			Result := repository_paths.has (a_path)
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

	put_repository (a_path: STRING)
			-- put `a_repository', replacing any previous repository of that name
		require
			Path_not_empty: not a_path.is_empty and not has_repository (a_path)
		local
			cand_key_val: INTEGER
		do
			from cand_key_val := locations.count + 1 until not locations.has (cand_key_val.out)	loop
				cand_key_val := cand_key_val + 1
			end
			locations.put (a_path, cand_key_val.out)
		ensure
			has_repository: has_repository (a_path)
		end

	remove_repository (a_path: STRING)
		require
			has_repository (a_path)
		local
			remove_key: detachable STRING
		do
			across locations as locs_csr loop
				if locs_csr.item.is_equal (a_path) then
					remove_key := locs_csr.key
				end
			end
			if attached remove_key as att_key then
				locations.remove (att_key)
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- FIXME: retain for a few versions starting at first 2.0.5 release, to rejig repositories table
		local
			new_locs: HASH_TABLE [STRING, STRING]
		do
			if not across locations as locs_csr all locs_csr.key.is_integer end then
				create new_locs.make (0)
				across locations as locs_csr loop
					new_locs.put (locs_csr.item, locs_csr.cursor_index.out)
				end
				locations := new_locs
			end
		end

feature {NONE} -- Implementation

	locations: HASH_TABLE [STRING, STRING]
			-- Hash table of repositories, keyed by their names.

end


