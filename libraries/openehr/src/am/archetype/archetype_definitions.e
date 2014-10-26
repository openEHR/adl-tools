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

	RESOURCE_DEFINITIONS

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

	Aom_profile_file_match_regex: STRING
		once
			Result :=  ".*\" + Aom_profile_file_extension + "$"
		end

	Aom_profile_file_extension: STRING = ".arp"

	Default_aom_profile_name: STRING = "unknown"

	Tuple_left_delimiter: CHARACTER = '['

	Tuple_right_delimiter: CHARACTER = ']'

feature -- Version identification

	Adl_version_string_regex: STRING = "adl_version[ \t]*=[ \t]*[0-9]+(\.[0-9]+)*"

	Adl_version_string_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.compile (adl_version_string_regex)
		end

	Adl_versions: ARRAYED_LIST [STRING]
			-- list of ADL versions known in this tool
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend (Adl_14_version)
			Result.extend (Adl_14_version + ".1")
			Result.extend ("1.5")
			Result.extend (Adl_id_code_version)
			Result.extend (Latest_adl_version)
		end

	Adl_14_version: STRING = "1.4"

	Is_adl_14_version (a_ver: STRING): BOOLEAN
			-- is `a_ver' any kind of 1.4 version?
		do
			Result := a_ver.starts_with (Adl_14_version)
		end

	Adl_id_code_version: STRING = "1.5.1"
			-- version in which new id-codes are present

	Latest_adl_version: STRING = "2.0.0"

	Standard_version_regex: STRING = "[0-9]+(\.[0-9]+){0,2}"
			-- Regex for 1, 2, or 3-part version string string of form N.M.P

	Standard_version_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.compile (Standard_version_regex)
		end

	version_less_than (lver, rver: STRING): BOOLEAN
			-- is `lver'' logically earlier than `rver' in a standard scheme of dot-separated version numbers?
		require
			lver_valid: valid_standard_version (lver)
			rver_valid: valid_standard_version (rver)
		local
			lver_strs, rver_strs: LIST [STRING]
			lver_num, rver_num: INTEGER
			continue: BOOLEAN
			i: INTEGER
		do
			lver_strs := lver.split ('.')
			from i := lver_strs.count until i >= 3 loop
				lver_strs.extend ("0")
			end
			rver_strs := rver.split ('.')
			from i := rver_strs.count until i >= 3 loop
				rver_strs.extend ("0")
			end

			from
				lver_strs.start
				rver_strs.start
				continue := True
			until
				not continue or lver_strs.off or rver_strs.off
			loop
				lver_num := lver_strs.item.to_integer
				rver_num := rver_strs.item.to_integer
				if lver_num < rver_num then
					Result := True
				elseif lver_num = rver_num then
					continue := True
				end
				lver_strs.forth
				rver_strs.forth
			end
		end

	valid_standard_version (a_ver: STRING): BOOLEAN
			-- True if `a_ver' fits the pattern of a 1, 2 or 3 part numeric version string
			-- with '.' separators
		do
			Result := Standard_version_regex_matcher.matches (a_ver)
		end

feature -- Comparison

	archetype_term_keys: ARRAYED_LIST [STRING]
			-- set of 'key's of an ARCHETYPE_TERM, currently 'text' and 'description'
		once
			Result := (create {ARCHETYPE_TERM}.default_create).Keys
		end

	Unknown_value: STRING = "(Unknown)"

	Adl_tag_remove_characters: STRING = "'%"#^!£$?"
			-- characters that will be removed from strings being used to generate API tags from paths

	Adl_tag_underscore_characters: STRING = "-:; %T()[]{}/"
			-- characters that will be removed from strings being used to generate API tags from paths

	Adl_tag_character_replacements: HASH_TABLE [STRING, CHARACTER]
			-- characters that will be replaced in strings being used to generate API tags from paths
		once
			create Result.make (0)
			Result.put ("_percent_", '%%')
			Result.put ("_equals_", '=')
			Result.put ("_plus_", '+')
			Result.put ("_star_", '*')
			Result.put ("_lt_", '<')
			Result.put ("_gt_", '>')
			Result.put ("_and_", '&')
		end

	c_object_constraint_types: HASH_TABLE [STRING, STRING]
			-- C_OBJECT meanings keyed by class-names (meanings are message tags to be converted to
			-- natural language via calls to get_text ())
		once
			create Result.make (0)
			Result.put ("c_type_complex_object", bare_type_name (({C_COMPLEX_OBJECT}).name))
			Result.put ("c_type_primitive_object", bare_type_name (({C_PRIMITIVE_OBJECT}).name))
			Result.put ("c_type_internal_reference", bare_type_name (({C_COMPLEX_OBJECT_PROXY}).name))
			Result.put ("c_type_archetype_reference", bare_type_name (({C_ARCHETYPE_ROOT}).name))
			Result.put ("c_type_slot", bare_type_name (({ARCHETYPE_SLOT}).name))
			Result.put ("c_type_code_phrase", bare_type_name (({C_TERMINOLOGY_CODE}).name))
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

end


