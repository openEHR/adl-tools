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

	vs_alpha: STRING = "alpha"
			-- alpha version, i.e. unknown differences added to underlying release version

	vs_beta: STRING = "beta"
			-- beta version, i.e. unknown differences added to underlying release version

	vs_release_candidate: STRING = "rc"
			-- version not guaranteed to satisfy underlying release definition but normally only slightly
			-- different from it

	vs_released: STRING = ""
			-- definitive release

	vs_build: STRING = "+"
			-- additional build of release; doesn't change semantics

feature -- Access

	version_status_symbol_text (a_ver_status: STRING): STRING
		require
			valid_version_status (a_ver_status)
		do
			check attached version_status_symbol_texts.item (a_ver_status) as att_vs then
				Result := att_vs
			end
		end

feature -- Validity

	valid_version_status (a_val: STRING): BOOLEAN
		do
			Result := a_val.is_empty or else version_status_symbol_texts.has (a_val)
		end

feature {NONE} -- Implementation

	version_status_symbol_texts: HASH_TABLE [STRING, STRING]
		once
			create Result.make (0)
			Result.put ({ARCHETYPE_HRID}.Version_status_separator.out + vs_alpha + ".", vs_alpha)
			Result.put ({ARCHETYPE_HRID}.Version_status_separator.out + vs_beta + ".", vs_beta)
			Result.put ({ARCHETYPE_HRID}.Version_status_separator.out + vs_release_candidate + ".", vs_release_candidate)
			Result.put ("", vs_released)
			Result.put (vs_build, vs_build)
		end

end

