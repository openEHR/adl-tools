note
	component:   "openEHR ADL Tools"
	description: "Basic archetype definitions"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- openEHR Foundation <http://www.openehr.org>"
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

	Tuple_left_delimiter: CHARACTER = '['

	Tuple_right_delimiter: CHARACTER = ']'

	Generated_flag_string: STRING = "generated"

	Adl_version_string: STRING = "adl_version"

feature -- File and artefact types

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
		once ("PROCESS")
			Result :=  ".*\" + Aom_profile_file_extension + "$"
		end

	Aom_profile_file_extension: STRING = ".arp"

	Default_aom_profile_name: STRING = "unknown"

	Archetype_category: IMMUTABLE_STRING_8
		once
			create Result.make_from_string ("archetypes")
		end

	Template_category: IMMUTABLE_STRING_8
		once
			create Result.make_from_string ("templates")
		end

feature -- Export Types

	export_formats: ARRAYED_SET [STRING]
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (syntax_type_odin)
			Result.extend (syntax_type_xml)
			Result.extend (syntax_type_json)
			Result.extend (syntax_type_yaml)
		end

feature -- Archetype identifiers

	archetype_id_checker: ARCHETYPE_HRID_PARSER
		once ("PROCESS")
			create Result.make
		end

feature -- Version identification

	Adl_version_string_regex: STRING
		once ("PROCESS")
			Result := Adl_version_string + "[ \t]*=[ \t]*" + Standard_version_regex
		end

	Adl_version_string_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		once ("PROCESS")
			create Result.make
			Result.compile (adl_version_string_regex)
		end

	Adl_versions: ARRAYED_LIST [STRING]
			-- list of ADL versions known in this tool
		once ("PROCESS")
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

	Adl_id_code_version: IMMUTABLE_STRING_8
			-- version in which new id-codes are present
		once
			create Result.make_from_string ("1.5.1")
		end

	Latest_adl_version: IMMUTABLE_STRING_8
		once ("PROCESS")
			Result := (create {OPENEHR_VERSION}).version_to_build
		end

	Latest_adl_minor_version: IMMUTABLE_STRING_8
		once ("PROCESS")
			Result := (create {OPENEHR_VERSION}).version_to_minor
		end

	Latest_adl_major_version: IMMUTABLE_STRING_8
		once ("PROCESS")
			Result := (create {OPENEHR_VERSION}).major.out
		end

feature -- Comparison

	archetype_term_keys: ARRAYED_LIST [STRING]
			-- set of 'key's of an ARCHETYPE_TERM, currently 'text' and 'description'
		once ("PROCESS")
			Result := (create {ARCHETYPE_TERM}.default_create).Keys
		end

	Unknown_value: STRING = "(Unknown)"

	Adl_tag_remove_characters: STRING = "'%"#^!£$?"
			-- characters that will be removed from strings being used to generate API tags from paths

	Adl_tag_underscore_characters: STRING = "-:; %T()[]{}/"
			-- characters that will be removed from strings being used to generate API tags from paths

	Adl_tag_character_replacements: HASH_TABLE [STRING, CHARACTER]
			-- characters that will be replaced in strings being used to generate API tags from paths
		once ("PROCESS")
			create Result.make (0)
			Result.put ("_percent_", '%%')
			Result.put ("_equals_", '=')
			Result.put ("_plus_", '+')
			Result.put ("_star_", '*')
			Result.put ("_lt_", '<')
			Result.put ("_gt_", '>')
			Result.put ("_and_", '&')
		end

feature -- Enumerations

	aft_archetype: IMMUTABLE_STRING_8
		once
	 		create Result.make_from_string ("archetype")
	 	end

	aft_template: IMMUTABLE_STRING_8
		once
	 		create Result.make_from_string ("template")
	 	end

	aft_temlate_overlay: IMMUTABLE_STRING_8
		once
	 		create Result.make_from_string ("template_overlay")
	 	end

	aft_operational_template: IMMUTABLE_STRING_8
		once
	 		create Result.make_from_string ("operational_template")
	 	end

	artefact_types_table: HASH_TABLE [IMMUTABLE_STRING_8, IMMUTABLE_STRING_8]
			-- table of formal class typenames like "AUTHORED_ARCHETYPE" to artefact types, e.g. "archetype" etc
			-- Defines the correspondence between the AOM class name and the first keyword in an ADL file for
			-- each kind of artefact
		once
			create Result.make(0)
			Result.extend(aft_archetype, bare_type_name (({AUTHORED_ARCHETYPE}).name))
			Result.extend(aft_template, bare_type_name (({TEMPLATE}).name))
			Result.extend(aft_temlate_overlay, bare_type_name (({TEMPLATE_OVERLAY}).name))
			Result.extend(aft_operational_template, bare_type_name (({OPERATIONAL_TEMPLATE}).name))
		end

	artefact_types: ARRAYED_LIST [IMMUTABLE_STRING_8]
			-- list of archetype type names: "archetype", "template" etc
		once
			create Result.make(0)
			Result.compare_objects
			across artefact_types_table as at_csr loop
				Result.extend (at_csr.item)
			end
		end

	artefact_type_from_class (a_class_name: STRING): IMMUTABLE_STRING_8
		require
			artefact_types_table.has (a_class_name)
		do
			check attached artefact_types_table.item (a_class_name) as att_aft then
				Result := att_aft
			end
		end

	valid_artefact_type (an_artefact_type: STRING): BOOLEAN
		do
			Result := artefact_types.has (an_artefact_type)
		end

--	c_object_constraint_types: HASH_TABLE [STRING, STRING]
--			-- C_OBJECT meanings keyed by class-names (meanings are message tags to be converted to
--			-- natural language via calls to get_text ())
--		once ("PROCESS")
--			create Result.make (0)
--			Result.put ("c_type_complex_object", bare_type_name (({C_COMPLEX_OBJECT}).name))
--			Result.put ("c_type_primitive_object", bare_type_name (({C_PRIMITIVE_OBJECT}).name))
--			Result.put ("c_type_internal_reference", bare_type_name (({C_COMPLEX_OBJECT_PROXY}).name))
--			Result.put ("c_type_archetype_reference", bare_type_name (({C_ARCHETYPE_ROOT}).name))
--			Result.put ("c_type_slot", bare_type_name (({ARCHETYPE_SLOT}).name))
--			Result.put ("c_type_code_phrase", bare_type_name (({C_TERMINOLOGY_CODE}).name))
--		end

	c_primitive_subtypes: HASH_TABLE [STRING, STRING]
			-- Table of assumed AOM type names keyed by lower-case RM primitive subtype
		once ("PROCESS")
			create Result.make (0)
			Result.compare_objects
			Result.extend (bare_type_name(({C_INTEGER}).name), "INTEGER")
			Result.extend (bare_type_name(({C_REAL}).name), "REAL")
			Result.extend (bare_type_name(({C_BOOLEAN}).name), "BOOLEAN")
			Result.extend (bare_type_name(({C_STRING}).name), "STRING")
			Result.extend (bare_type_name(({C_DATE}).name), "DATE")
			Result.extend (bare_type_name(({C_TIME}).name), "TIME")
			Result.extend (bare_type_name(({C_DATE_TIME}).name), "DATE_TIME")
			Result.extend (bare_type_name(({C_DURATION}).name), "DURATION")
			Result.extend (bare_type_name(({C_TERMINOLOGY_CODE}).name), "TERMINOLOGY_CODE")
		end

	occurrences_default_list: HASH_TABLE [MULTIPLICITY_INTERVAL, STRING]
			-- full set of all possible occurrences values:
			-- 0..0, 0..1, 1..1, 0..*, 1..*
		local
			mult_int: MULTIPLICITY_INTERVAL
		once ("PROCESS")
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


