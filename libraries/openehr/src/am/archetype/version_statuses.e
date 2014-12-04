note
	component:   "openEHR ADL Tools"
	description: "VERSION_STATUS values and string renderings"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class VERSION_STATUSES

feature -- Definitions

	vs_unstable: INTEGER = -2
			-- unstable version, i.e. unknown differences added to underlying release version

	vs_release_candidate: INTEGER = -1
			-- version not guaranteed to satisfy underlying release definition but normally only slightly
			-- different from it

	vs_released: INTEGER = 0
			-- definitive release

	vs_build: INTEGER = 1
			-- additional build of release; doesn't change semantics

feature -- Access

	version_status_text (a_ver_status: INTEGER): STRING
		require
			valid_version_status (a_ver_status)
		do
			check attached version_status_texts.item (a_ver_status) as att_vs then
				Result := att_vs
			end
		end

	version_status_symbol_text (a_ver_status: INTEGER): STRING
		require
			valid_version_status (a_ver_status)
		do
			check attached version_status_symbol_texts.item (a_ver_status) as att_vs then
				Result := att_vs
			end
		end

feature -- Validity

	valid_version_status (a_val: INTEGER): BOOLEAN
		do
			Result := a_val >= vs_unstable and a_val <= vs_build
		end

	valid_version_status_symbol (a_str: STRING): BOOLEAN
		do
			Result := version_statuses.has (a_str)
		end

feature {NONE} -- Implementation

	version_status_texts: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put ("unstable", vs_unstable)
			Result.put ("release candidate", vs_release_candidate)
			Result.put ("released", vs_released)
			Result.put ("build", vs_build)
		end

	version_status_symbol_texts: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make (0)
			Result.put ("-alpha.", vs_unstable)
			Result.put ("-rc.", vs_release_candidate)
			Result.put ("", vs_released)
			Result.put ("+", vs_build)
		end

	version_statuses: HASH_TABLE [INTEGER, STRING]
		once
			create Result.make (0)
			Result.put (vs_unstable, "alpha")
			Result.put (vs_release_candidate, "rc")
		end

end

