note
	component:   "openEHR ADL Tools"

	description: "[
			 Identifier of versions within a tree of versions. Must be
			 combined with the identifier of a Version to be useful for
			 referencing.
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.5"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class VERSION_TREE_ID

create
	make

feature -- Definitions

	Separator: CHARACTER = '.'

feature -- Initialisation

	make (s: STRING)
			-- make from a single string
		require
			String_valid: valid_version_tree_id (s)
		do
			value := s
		end

feature -- Access

	value: STRING
			-- numeric decimal style identifier, must be in either the
			-- form of a single integer, e.g "5", or else for a branch,
			-- in the form "1.2.3", i.e. with 2 decimal points and only
			-- integers in all slots

	trunk_version: STRING
			-- Trunk version number.
		do
			create Result.make_empty
		end

	branch_number: STRING
			-- Number of branch from the trunk point; empty if not a branch
		local
			decpoint1_pos, decpoint2_pos: INTEGER
		do
			create Result.make_empty
			decpoint1_pos := value.index_of (Separator, 1)
			if decpoint1_pos > 0 then
				decpoint2_pos := value.index_of (Separator, decpoint1_pos+1)
				Result.append (value.substring(decpoint1_pos+1, decpoint2_pos-1))
			end
		end

	branch_version: STRING
			-- Version of the branch; empty if not a branch
		local
			decpoint1_pos, decpoint2_pos: INTEGER
		do
			create Result.make_empty
			decpoint1_pos := value.index_of (Separator, 1)
			if decpoint1_pos > 0 then
				decpoint2_pos := value.index_of (Separator, decpoint1_pos+1)
				Result.append(value.substring(decpoint2_pos+1, value.count))
			end
		end

feature -- Status Report

	is_first: BOOLEAN
			-- True if this version is a first version - i.e. trunk_version = 1 and
			-- not is_branch
		do
			Result := trunk_version.to_integer = 1 and not is_branch
		end

	is_branch: BOOLEAN
			-- True if this version identifier represents a branch,
			-- i.e. has branch_number and branch_version parts.
		do
			Result := value.index_of (Separator, 1) = 0
		end

	valid_version_tree_id (s: STRING): BOOLEAN
			-- True if s is a valid id
		require
			String_valid: not s.is_empty
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > s.count or not (s.item (i).is_digit or s.item(i) = Separator)
			loop
				i := i + 1
			end
			Result := i > s.count
		end

invariant
	Value_valid: value /= Void and then not value.is_empty
	Trunk_version_valid: trunk_version /= Void and then trunk_version.is_integer
	Branch_number_valid: branch_number /= Void implies branch_number.is_integer
	Branch_version_valid: branch_version /= Void implies branch_version.is_integer
	Branch_validity: (branch_number = Void and branch_version = Void ) xor (branch_number /= Void and branch_version /= Void )
	Is_branch_validity: is_branch xor branch_number = Void
	Is_first_validity: not is_first xor trunk_version.is_equal("1")

end



