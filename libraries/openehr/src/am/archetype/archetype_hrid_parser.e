note
	component:   "openEHR ADL Tools"
	description: "Hand-built-parser for ARCHETYPE_HRIDs."
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
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

	version_status: STRING
			-- status of version: release candidate, released, build, unstable

	build_count: STRING
			-- Commit number of this archetype. This is a number that advances from 1 and is reset for
			-- each new value of release_version.

feature -- Status Report

	valid_adl2_archetype_id (an_id: STRING): BOOLEAN
			-- True for archetype IDs with 3-part version
		do
			Result := adl2_archetype_id_matcher.recognizes (an_id)
		end

	valid_adl14_archetype_id (an_id: STRING): BOOLEAN
			-- True for archetype IDs with only major version
		do
			Result := adl14_archetype_id_matcher.recognizes (an_id)
		end

	valid_adl2_archetype_ref (a_ref: STRING): BOOLEAN
			-- True for archetype IDs with 1, 2, or 3-part version;
			-- Use for checking refs used in inheritance relationships
		do
			Result := adl2_archetype_ref_matcher.recognizes (a_ref)
		end

	valid_adl2_archetype_open_ref (a_ref: STRING): BOOLEAN
			-- True for archetype IDs with 0, 1, 2, or 3-part version;
			-- Allows for non-conformant (different major version archetypes).
			-- Use for checking refs used in composition, but not inheritance relationships
		do
			Result := adl2_archetype_open_ref_matcher.recognizes (a_ref)
		end

	valid_adl14_archetype_ref (a_ref: STRING): BOOLEAN
			-- True for archetype IDs with only major version
		do
			Result := adl14_archetype_id_matcher.recognizes (a_ref)
		end

	is_adl14_id: BOOLEAN

	is_adl2_id: BOOLEAN

feature -- Commands

	execute (an_id: STRING)
		local
			strs, qual_class_strs: LIST [STRING]
			ns_idx, sym_len, start_pos, sym_pos: INTEGER
			local_hrid: STRING
		do
			reset
			if adl2_archetype_id_matcher.matches (an_id) then
				is_adl2_id := True

				-- look for namespace in first section
				ns_idx := an_id.substring_index ({ARCHETYPE_HRID}.namespace_separator, 1)
				if ns_idx > 0 then
					create namespace.make (an_id.substring (1, ns_idx - 1))
					start_pos := ns_idx + {ARCHETYPE_HRID}.namespace_separator.count
				else
					start_pos := 1
				end
				local_hrid := an_id.substring (start_pos, an_id.count)

				-- split on axis separator; may get something like:
				-- 	openEHR-EHR-COMPOSITION, encounter, v1, 0, 4-rc, 47
				-- 	openEHR-EHR-COMPOSITION, encounter, v1, 0, 4-alpha
				-- 	openEHR-EHR-COMPOSITION, encounter, v1, 0, 4+78
				strs := local_hrid.split ({ARCHETYPE_HRID}.axis_separator)

				-- separate the qualified class part
				qual_class_strs := strs.i_th (1).split ({ARCHETYPE_HRID}.section_separator)
				rm_publisher := qual_class_strs.i_th (1)
				rm_closure := qual_class_strs.i_th (2)
				rm_class := qual_class_strs.i_th (3)

				-- concept part
				concept_id := strs.i_th (2)

				-- version part: looks like vN.M.P or vN.M.P-rc.NNN or vN.M.P-alpha.NNN or vN.M.P+78
				-- first part: "vNNN"
				release_version.append (strs.i_th (3).substring (2, strs.i_th (3).count))
				release_version.append_character ({ARCHETYPE_HRID}.Axis_separator)

				-- second part should just be a number
				release_version.append (strs.i_th (4))
				release_version.append_character ({ARCHETYPE_HRID}.Axis_separator)

				-- third part may have a "-xxx" section, e.g. "-rc';
				sym_pos := strs.i_th (5).index_of ({ARCHETYPE_HRID}.Version_status_separator, 1)
				sym_len := 1
				if strs.i_th (5).has ({ARCHETYPE_HRID}.Version_status_separator) then
					release_version.append (strs.i_th (5).substring (1, sym_pos - sym_len))
					version_status := strs.i_th (5).substring (sym_pos + sym_len, strs.i_th (5).count)

					-- get any build count in the next string
					if strs.count = 6 then
						build_count := strs.i_th (6)
					end

				-- or a '+NNN' at the end
				else
					sym_pos := strs.i_th (5).substring_index ({VERSION_STATUSES}.vs_build, 1)
					sym_len := {VERSION_STATUSES}.vs_build.count
					if sym_pos > 0 then
						release_version.append (strs.i_th (5).substring (1, sym_pos - sym_len))
						version_status := vs_build
						build_count := strs.i_th (5).substring (sym_pos + sym_len, strs.i_th (5).count)

					-- or it may just be a number
					else
						release_version.append (strs.i_th (5))
					end
				end

			elseif adl14_archetype_id_matcher.matches (an_id) then
				is_adl14_id := True

				strs := an_id.split ({ARCHETYPE_HRID}.axis_separator)

				-- separate the qualified class part
				qual_class_strs := strs.i_th (1).split ({ARCHETYPE_HRID}.section_separator)
				rm_publisher := qual_class_strs.i_th (1)
				rm_closure := qual_class_strs.i_th (2)
				rm_class := qual_class_strs.i_th (3)

				-- concept part
				concept_id := strs.i_th (2)

				-- version part
				release_version := strs.i_th (3).substring (1 + {ARCHETYPE_HRID}.Version_delimiter.count, strs.i_th (3).count)
				release_version.append (".0.0")

			-- try for open archetype ref match, i.e. with no version section at all
			elseif adl2_archetype_open_ref_matcher.matches (an_id) then
				strs := an_id.split ({ARCHETYPE_HRID}.axis_separator)

				-- separate the qualified class part
				qual_class_strs := strs.i_th (1).split ({ARCHETYPE_HRID}.section_separator)
				rm_publisher := qual_class_strs.i_th (1)
				rm_closure := qual_class_strs.i_th (2)
				rm_class := qual_class_strs.i_th (3)

				-- concept part
				concept_id := strs.i_th (2)

				-- default the version part to 0.0.0
				release_version.append ("0.0.0")
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
			create version_status.make_empty
			build_count := "0"
			is_adl14_id := False
			is_adl2_id := False
		end

	adl14_archetype_id_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for all archetype ids.
			-- openEHR-EHR-ENTRY.any.v1
			-- openEHR-EHR-ENTRY.any.v22
			-- openEHR-EHR-ENTRY.any-thing.v22
		once
			create Result.make
			Result.compile ((create {ARCHETYPE_HRID}).Adl14_id_regex)
		end

	adl2_archetype_id_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for ADL 1.5 archetype ids, with optional namespace;
			-- 	will match ids like:
			-- openEHR-EHR-ENTRY.any.v1.0.1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1-rc.2
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1-alpha.105
		once
			create Result.make
			Result.compile ((create {ARCHETYPE_HRID}).Adl2_archetype_id_regex)
		end

	adl2_archetype_ref_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for ADL 1.5 archetype id references, with optional namespace and optional versioning;
			-- 	will match refs like:
			-- openEHR-EHR-ENTRY.any.v1.0.1
			-- openEHR-EHR-ENTRY.any.v1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0
		once
			create Result.make
			Result.compile ((create {ARCHETYPE_HRID}).Adl2_archetype_ref_regex)
		end

	adl2_archetype_open_ref_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for open (i.e. non-conformant) ADL 2 archetype id references, with optional namespace and optional versioning;
			-- 	will match refs like:
			-- openEHR-EHR-ENTRY.any.v1.0.1
			-- openEHR-EHR-ENTRY.any.v1
			-- openEHR-EHR-ENTRY.any
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0.1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1.0
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any.v1
			-- uk.gov.nhs::openEHR-EHR-ENTRY.any
		once
			create Result.make
			Result.compile ((create {ARCHETYPE_HRID}).Adl2_archetype_open_ref_regex)
		end

end

