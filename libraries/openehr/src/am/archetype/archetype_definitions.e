note
	component:   "openEHR ADL Tools"
	description: "Basic archetype definitions"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2009 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_DEFINITIONS

inherit
	BASIC_DEFINITIONS

	OG_DEFINITIONS

	ODIN_DEFINITIONS

feature -- Syntax Elements

	Archetype_any_constraint: STRING = "*"

	Archetype_slot_closed: STRING = "closed"

feature -- Definitions

	Syntax_type_adl: STRING = "adl"
			-- Name of native ADL syntax type.

	Syntax_type_adl_html: STRING = "html"
			-- Name of web publishing syntax type.

	File_ext_archetype_web_page: STRING = ".html"
			-- Extension of web page containing ADL syntax

	File_ext_archetype_adl14: STRING = ".adl"
			-- Extension for legacy flat form archetype files in ADL 1.4 syntax

	File_ext_archetype_flat: STRING = ".adlf"
			-- Extension for legacy flat form archetype files in ADL syntax

	File_ext_archetype_source: STRING = ".adls"
			-- Extension for source form (differential) archetype files in ADL 1.5 syntax

	File_ext_archetype_adl_diff: STRING = ".adlx"
			-- Extension for use with source/flat diff; we don't want to use
			-- the legitimate extension on these files because one is source
			-- and one is flat, and diff tools need to see the same extension;
			-- also we don't want users to get confused about what kind of files
			-- these are

	Namespace_separator: STRING = "::"
			-- separator between namespace and rest of id

	Axis_separator: CHARACTER = '.'
			-- major separator between values on the different axes

	Section_separator: CHARACTER = '-'
			-- separator between sections in an axis

	Section_separator_string: STRING = "-"
			-- separator between sections in an axis

	Version_delimiter: STRING = "v"

	Version_axis_delimiter: STRING = ".v"

	Aom_profile_file_match_regex: STRING
		once
			Result :=  ".*\" + Aom_profile_file_extension + "$"
		end

	Aom_profile_file_extension: STRING = ".arp"

	Default_aom_profile_name: STRING = "unknown"

	Adl_versions: ARRAYED_LIST [STRING]
			-- list of ADL versions known in this tool
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("1.4")
			Result.extend ("1.4.1")
			Result.extend ("1.5")
		end

	Latest_adl_version: STRING
			-- return current latest known ADL version in this tool
		once
			Result := Adl_versions.last
		end

	archetype_term_keys: ARRAYED_LIST [STRING]
			-- set of 'key's of an ARCHETYPE_TERM, currently 'text' and 'description'
		once
			Result := (create {ARCHETYPE_TERM}.default_create).Keys
		end

	Archetype_lifecycle_states: ARRAYED_LIST [STRING]
			-- list of archetype authoring lifecycle states
			-- TODO: obtain from openEHR terminology
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("unmanaged")
			Result.extend ("initial")
			Result.extend ("in_review")
			Result.extend ("suspended")
			Result.extend ("unstable")
			Result.extend ("release_candidate")
			Result.extend ("published")
			Result.extend ("obsolete")
			Result.extend ("superseded")
			Result.extend ("deprecated")
		end

	Unknown_value: STRING = "(Unknown)"

	c_object_constraint_types: HASH_TABLE [STRING, STRING]
			-- C_OBJECT meanings keyed by class-names (meanings are message tags to be converted to
			-- natural language via calls to get_text ())
		once
			create Result.make (0)
			Result.put ("c_type_complex_object", "C_COMPLEX_OBJECT")
			Result.put ("c_type_primitive_object", "C_PRIMITIVE_OBJECT")
			Result.put ("c_type_internal_reference", "ARCHETYPE_INTERNAL_REF")
			Result.put ("c_type_external_constraint_reference", "C_CONSTRAINT_REF")
			Result.put ("c_type_archetype_reference", "C_ARCHETYPE_ROOT")
			Result.put ("c_type_slot", "ARCHETYPE_SLOT")
			Result.put ("c_type_code_phrase", "C_TERMINOLOGY_CODE")
		end

	c_primitive_subtypes: ARRAYED_SET [STRING]
			-- FIXME: replace with reflection-based implementation as descendants of
			-- C_PRIMITIVE_OBJECT when compiling with Eiffel 7.3
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (bare_type_name(({C_INTEGER}).name))
			Result.extend (bare_type_name(({C_REAL}).name))
			Result.extend (bare_type_name(({C_BOOLEAN}).name))
			Result.extend (bare_type_name(({C_STRING}).name))
			Result.extend (bare_type_name(({C_DATE}).name))
			Result.extend (bare_type_name(({C_TIME}).name))
			Result.extend (bare_type_name(({C_DATE_TIME}).name))
			Result.extend (bare_type_name(({C_DURATION}).name))
			Result.extend (bare_type_name(({C_TERMINOLOGY_CODE}).name))
			Result.extend (bare_type_name(({CONSTRAINT_REF}).name))
		end

	occurrences_default_list: HASH_TABLE [MULTIPLICITY_INTERVAL, STRING]
			-- full set of all possible occurrences values:
			-- 0..0, 0..1, 1..1, 0..*, 1..*
		local
			mult_int: MULTIPLICITY_INTERVAL
		once
			create Result.make (0)
			create mult_int.make_optional
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_mandatory
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_prohibited
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_upper_unbounded (0)
			Result.put (mult_int, mult_int.as_string)
			create mult_int.make_upper_unbounded (1)
			Result.put (mult_int, mult_int.as_string)
		end

feature -- Comparison

	valid_adl_version (a_ver: STRING): BOOLEAN
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_string: not a_ver.is_empty
		local
			str: STRING
		do
			str := a_ver.twin
			str.prune_all ('.')
			Result := str.is_integer and a_ver.item(1) /= '.' and a_ver.item (a_ver.count) /= '.'
		end

end


