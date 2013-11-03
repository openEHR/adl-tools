note
	component:   "openEHR ADL Tools"
	description: "Hand-built-parser for ARCHETYPE_HRIDs."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_HRID_PARSER

inherit
	ANY_VALIDATOR
		redefine
			reset
		end

	VERSION_STATUSES
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			reset
		end

feature -- Access

	namespace: detachable INTERNET_ID
			-- Reverse domain name namespace identifier.

	rm_publisher: STRING
			-- Name of the Reference Model publisher.

	rm_closure: STRING
			-- Name of the package in whose closure the rm_class class is found (there can be more than
			-- one possibility in a reference model).

	rm_class: STRING
			-- Name of the root class of this archetype.

	concept_id: STRING
			-- The short concept name of the archetype as used in the multi-axial archetype_hrid.

	release_version: STRING
			-- The full numeric version of this archetype consisting of 3 parts, e.g. 1.8.2. The archetype_hrid
			-- feature includes only the major version.

	version_status: INTEGER
			-- status of version: release candidate, released, build, unstable

	commit_number: INTEGER
			-- Commit number of this archetype. This is a number that advances from 1 and is reset for
			-- each new value of release_version.

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
		do
			Result := adl14_id_regex.recognizes (an_id) or else adl15_id_regex.recognizes (an_id)
		end

	is_adl14_id: BOOLEAN

	is_adl15_id: BOOLEAN

feature -- Commands

	execute (an_id: STRING)
		local
			strs, qual_class_strs: LIST [STRING]
			ns_idx, start_pos, end_pos, sym_pos: INTEGER
			local_hrid, ver_str, sym: STRING
		do
			reset
			if adl15_id_regex.matches (an_id) then
				is_adl15_id := True

				-- look for namespace in first section
				ns_idx := an_id.substring_index (namespace_separator, 1)
				if ns_idx > 0 then
					create namespace.make (an_id.substring (1, ns_idx - 1))
					start_pos := ns_idx + namespace_separator.count
				else
					start_pos := 1
				end
				local_hrid := an_id.substring (start_pos, an_id.count)

				strs := local_hrid.split (axis_separator)

				-- separate the qualified class part
				qual_class_strs := strs.i_th (1).split (section_separator)
				rm_publisher := qual_class_strs.i_th (1)
				rm_closure := qual_class_strs.i_th (2)
				rm_class := qual_class_strs.i_th (3)

				-- concept part
				concept_id := strs.i_th (2)

				-- version part: looks like vN.M.P or vN.M.P+Q or vN.M.P-rcQ or vN.M.P+uQ
				ver_str := an_id.substring (an_id.substring_index (version_axis_delimiter, 1), an_id.count)
				start_pos := 1 + version_axis_delimiter.count

				sym := version_status_symbol_text (vs_unstable)
				sym_pos := ver_str.substring_index (sym, start_pos)

				-- case: +uQ
				if sym_pos > 0 then
					end_pos := sym_pos - 1
					commit_number := ver_str.substring (sym_pos + sym.count, ver_str.count).to_integer
					version_status := vs_unstable
				else
					-- case: -rcQ
					sym := version_status_symbol_text (vs_release_candidate)
					sym_pos := ver_str.substring_index (sym, start_pos)
					if sym_pos > 0 then
						end_pos := sym_pos - 1
						commit_number := ver_str.substring (sym_pos + sym.count, ver_str.count).to_integer
						version_status := vs_release_candidate
					else
						-- case: +Q
						sym := version_status_symbol_text (vs_build)
						sym_pos := ver_str.substring_index (sym, start_pos)
						if sym_pos > 0 then
							end_pos := sym_pos - 1
							commit_number := ver_str.substring (sym_pos + sym.count, ver_str.count).to_integer
							version_status := vs_build
						else
							end_pos := ver_str.count
							version_status := vs_released
						end
					end
				end
				release_version := ver_str.substring (start_pos, end_pos)

			elseif adl14_id_regex.matches (an_id) then
				is_adl14_id := True

				strs := an_id.split (axis_separator)

				-- separate the qualified class part
				qual_class_strs := strs.i_th (1).split (section_separator)
				rm_publisher := qual_class_strs.i_th (1)
				rm_closure := qual_class_strs.i_th (2)
				rm_class := qual_class_strs.i_th (3)

				-- concept part
				concept_id := strs.i_th (2)

				-- version part
				release_version := strs.i_th (3).substring (1 + Version_delimiter.count, strs.i_th (3).count)
				release_version.append (".0.0")
			else
			end
		end

	validate
		do
		end

feature {NONE} -- Implementation

	reset
		do
			precursor
			namespace := Void
			create rm_publisher.make_empty
			create rm_closure.make_empty
			create rm_class.make_empty
			create concept_id.make_empty
			create release_version.make_empty
			version_status := 0
			commit_number := 0
		end

	adl14_id_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for all archetype ids.
			-- openEHR-EHR-ENTRY.any.v1
			-- openEHR-EHR-ENTRY.any.v22
			-- openEHR-EHR-ENTRY.any-thing.v22
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[0-9]+$")
		end

	adl15_id_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for ADL 1.5 archetype ids, with optional namespace;
			-- 	will match ids like:
			-- openEHR-EHR-ENTRY.any.v1.0.1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1-rc204
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1+u105
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1+334
		once
			create Result.make
			Result.compile ("^([a-zA-Z][a-zA-Z0-9_]*(\.[a-zA-Z0-9_]+)*::)?[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[0-9]+(\.[0-9]+){2}((-rc|\+u|\+)[0-9]+)?$")
		end

end

