note
	component:   "openEHR ADL Tools"

	description: "[
				 Multi-axial human readable archetype identifier of the form:
				 		qualified_rm_class.domain_concept.version
				 	where:
				 		qualified_rm_class	= rm_publisher-closure_name-rm_class
				 		domain_concept = string name of concept, including specialised parts
				 						 separated by '-'s
				 		version = string
				 ]"
	keywords:    "archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_HRID

inherit
	COMPARABLE
		undefine
			default_create
		end

	VERSION_STATUSES
		export
			{NONE} all;
			{ANY} valid_version_status, vs_released
		undefine
			default_create, is_equal
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
		undefine
			is_equal
		redefine
			default_create
		end

create
	make, make_adl14, make_namespaced,
	make_from_string, make_from_string_reference,
	make_new,
	default_create

feature -- Definitions

	namespace_regex: STRING = "[a-zA-Z][a-zA-Z0-9_]+(\.[a-zA-Z][a-zA-Z0-9_]+)*"
			-- Regex for namespace part of archetype ids.

	qualified_rm_class_regex: STRING = "[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+){2}"
			-- Regex for qualified rm_class part of archetype ids.

	concept_id_regex: STRING = "[a-zA-Z0-9][a-zA-Z0-9_]+(-[a-zA-Z0-9_]+)*"
			-- Regex for concept_id part of archetype ids.

	segment_regex: STRING = "[a-zA-Z][a-zA-Z0-9_]+"
			-- Regex for any segment of an archetype id

	release_version_regex: STRING = "[0-9]+(\.[0-9]+){2}"
			-- Regex for ADL 2 release version
			-- 	will match string of form N.M.P

	version_regex: STRING = "v[0-9]+(\.[0-9]+){2}((-rc|-alpha)(\.[0-9]+)?)?"
			-- Regex for ADL 1.5 release version
			-- 	will match string of form vN.M.P with or without -rc.N, +alpha.N at the end

	version_reference_regex: STRING = "v[0-9]+(\.[0-9]+){0,2}"
			-- regex for matching version part of an archetype id, which can have 1, 2 or 3 parts, i.e. .v1, .v1.2, .v1.2.1

	major_version_regex: STRING = "v[0-9]+"
			-- regex for matching major version part of an archetype id

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

	Default_id: STRING = "openehr-ehr-ENTRY.any.v0.0.1"

	Default_qualified_rm_class: STRING = "openEHR-EHR-ENTRY"

	Default_rm_publisher: STRING = "openEHR"

	Default_rm_closure: STRING = "EHR"

	Default_rm_class: STRING = "ENTRY"

	Default_concept: STRING = "any"

	Default_release_version: STRING = "0.0.1"

	Adl14_id_regex: STRING
		once ("PROCESS")
			Result := "^" + qualified_rm_class_regex + "\" + Axis_separator.out + concept_id_regex + "\" + Axis_separator.out + major_version_regex + "$"
		ensure
			Result.is_equal ("^" + qualified_rm_class_regex + "\" + Axis_separator.out + concept_id_regex + "\" + Axis_separator.out + major_version_regex + "$")
		end

	Id_matcher_regex: STRING
			-- matcher for archetype ids, which must include full version
		once ("PROCESS")
			Result := "^" + root_regex + "\" + Axis_separator.out + version_regex + "$"
		ensure
			Result.is_equal ("^" + root_regex + "\" + Axis_separator.out + version_regex + "$")
		end

	Id_reference_matcher_regex: STRING
			-- matcher for references to archetypes, which may include partial (i.e. interface) form of the version part
			-- and no +u or -rc extension
		once ("PROCESS")
			Result := "^" + root_regex + "\" + Axis_separator.out + version_reference_regex + "$"
		ensure
			Result.is_equal ("^" + root_regex + "\" + Axis_separator.out + version_reference_regex + "$")
		end

	root_regex: STRING
			-- core part of id up to but not including the '.' before the vN part
		once ("PROCESS")
			Result := "(" + namespace_regex + Namespace_separator + ")?" +
				qualified_rm_class_regex + "\" + Axis_separator.out +
				concept_id_regex
		ensure
			Result.is_equal ("(" + namespace_regex + Namespace_separator + ")?" +
				qualified_rm_class_regex + "\" + Axis_separator.out +
				concept_id_regex)
		end

feature -- Initialisation

	make_adl14 (a_rm_publisher, a_rm_closure, a_rm_class, a_concept_id, a_version: STRING)
			-- Create from rm_publisher - rm_closure - rm_class . concept_id .v N
		require
			Valid_version: a_version.is_integer
		do
			make (a_rm_publisher, a_rm_closure, a_rm_class, a_concept_id, a_version + ".0.0", vs_released, 0)
			is_adl14_id := True
		ensure
			is_adl14_id
		end

	make_namespaced (a_namespace, a_rm_publisher, a_rm_closure, a_rm_class, a_concept_id, a_release_version: STRING; a_version_status, a_commit_number: INTEGER)
			-- Create from namespace :: rm_publisher - rm_closure - rm_class . concept_id .v release_version [version_status_text commit_number]
		require
			Valid_namespace: valid_namespace (a_namespace)
		do
			create namespace.make (a_namespace)
			make (a_rm_publisher, a_rm_closure, a_rm_class, a_concept_id, a_release_version, a_version_status, a_commit_number)
		ensure
			not is_adl14_id
		end

	make (a_rm_publisher, a_rm_closure, a_rm_class, a_concept_id, a_release_version: STRING; a_version_status, a_commit_number: INTEGER)
			-- Create from rm_publisher - rm_closure - rm_class . concept_id .v release_version [version_status_text commit_number]
		require
			Valid_rm_publisher: valid_id_segment (a_rm_publisher)
			Valid_rm_publisher: valid_id_segment (a_rm_closure)
			Valid_rm_publisher: valid_id_segment (a_rm_class)
			Valid_concept_id: valid_id_segment (a_concept_id)
			Valid_release_version: valid_release_version (a_release_version)
			Valid_version_status: valid_version_status (a_version_status)
			Valid_commit_number: a_commit_number >= 0
		do
			rm_publisher := a_rm_publisher
			rm_package := a_rm_closure
			rm_class := a_rm_class
			concept_id := a_concept_id
			release_version := a_release_version
			version_status := a_version_status
			build_count := a_commit_number
		ensure
			not is_adl14_id
		end

	make_from_string (a_str: STRING)
			-- make from a string full identifier that is recognised by either
			-- the ADL 1.4 id matcher or the ADL 1.5 id matcher
		require
			Valid_id: valid_id (a_str)
		do
			id_parser.execute (a_str)
			namespace := id_parser.namespace
			rm_publisher := id_parser.rm_publisher
			rm_package := id_parser.rm_closure
			rm_class := id_parser.rm_class
			concept_id := id_parser.concept_id
			release_version := id_parser.release_version
			version_status := id_parser.version_status
			build_count := id_parser.commit_number
			is_adl14_id := id_parser.is_adl14_id
		end

	make_from_string_reference (a_str: STRING)
			-- make from a string identifier that is recognised by either
			-- the ADL 1.4 id matcher or the ADL 1.5 id reference matcher, which
			-- treats version numbers after the major version as optional
		require
			Valid_id_ref: valid_id_reference (a_str)
		do
			id_parser.execute (a_str)
			namespace := id_parser.namespace
			rm_publisher := id_parser.rm_publisher
			rm_package := id_parser.rm_closure
			rm_class := id_parser.rm_class
			concept_id := id_parser.concept_id
			release_version := id_parser.release_version
			version_status := id_parser.version_status
			build_count := id_parser.commit_number
		end

	make_new (a_qualified_rm_class: STRING)
			-- Create a new id for a given RM publisher/closure/class
			-- `a_qualified_rm_class' has the form "openEHR-EHR-ENTRY"
		require
			valid_qualified_rm_class (a_qualified_rm_class)
		local
			qual_class_strs: LIST [STRING]
		do
			default_create
			qual_class_strs := a_qualified_rm_class.split (Section_separator)
			rm_publisher := qual_class_strs.i_th (1)
			rm_package := qual_class_strs.i_th (2)
			rm_class := qual_class_strs.i_th (3)
		ensure
			not is_adl14_id
		end

	default_create
		do
			create rm_publisher.make_from_string (Default_rm_publisher)
			create rm_package.make_from_string (Default_rm_closure)
			create rm_class.make_from_string (Default_rm_class)
			create concept_id.make_from_string (Default_concept)
			create release_version.make_from_string (Default_release_version)
		end

feature -- Access

	namespace: detachable INTERNET_ID
			-- Reverse domain name namespace identifier.

	namespace_string: STRING
			-- Reverse domain name namespace identifier as a string;
			-- empty string if not present
		do
			if attached namespace as ns then
				Result := ns.value
			else
				create Result.make_empty
			end
		end

	rm_publisher: STRING
			-- Name of the Reference Model publisher.

	rm_package: STRING
			-- Name of the package in whose closure the rm_class class is found (there can be more than
			-- one possibility in a reference model).

	rm_class: STRING
			-- Name of the root class of this archetype.

	qualified_rm_class: STRING
			-- identification of Reference Model class being archetyped
			-- e.g. openEHR-EHR-OBSERVATION, HL7-CDA-SECTION
		do
			create Result.make_empty
			Result.append (rm_publisher)
			Result.append (Section_separator.out)
			Result.append (rm_package)
			Result.append (Section_separator.out)
			Result.append (rm_class)
		end

	semantic_id: IMMUTABLE_STRING_8
			-- The interface form of the HRID, i.e. down to the major version
		local
			str: STRING
		do
			if attached semantic_id_cache as att_sem_id then
				Result := att_sem_id
			else
				str := hrid_root
				str.append_character (Axis_separator)
				str.append (Version_delimiter)
				str.append (major_version)
				create Result.make_from_string (str)
				semantic_id_cache := Result
			end
		end

	concept_id: STRING
			-- The short concept name of the archetype as used in the multi-axial archetype_hrid.

	concept_id_version: STRING
			-- short concept part of id + version
			-- "blood_pressure.v2", "problem-diagnosis.v0.9.0"
		do
			create Result.make_empty
			Result.append (concept_id)
			Result.append_character (Axis_separator)
			Result.append (Version_delimiter)
			Result.append (version_id)
		end

	display_semantic_id: STRING
			-- namespace + domain concept part of archetype id + version; for AL 1.4 ids that are specialised, only include
			-- the last piece of `concept_id' after the last '-'
		do
			create Result.make_empty
			if attached namespace then
				Result.append (namespace_string)
				Result.append (namespace_separator)
			end
			if is_adl14_id and concept_id.has (section_separator) then
				Result.append (concept_id.substring (concept_id.last_index_of (section_separator, concept_id.count) + 1, concept_id.count))
				Result.append_character (Axis_separator)
				Result.append (Version_delimiter)
				Result.append (version_id)
			else
				Result.append (concept_id_version)
			end
		end

	release_version: STRING
			-- The full numeric version of this archetype consisting of 3 parts, e.g. 1.8.2. The archetype_hrid
			-- feature includes only the major version.

	major_version: STRING
			-- Major version of this archetype, extracted from release_version.
		do
			Result := release_version.substring (1, release_version.index_of (Axis_separator, 1) - 1)
		end

	minor_version: STRING
			-- Minor version of this archetype, extracted from release_version.
		local
			p: INTEGER
		do
			p := release_version.index_of (Axis_separator, 1) + 1
			Result := release_version.substring (p, release_version.index_of (Axis_separator, p) - 1)
		end

	patch_version: STRING
			-- Patch version of this archetype, extracted from release_version. Equivalent to patch version in patch version in semver.org sytem.
		local
			p: INTEGER
		do
			p := release_version.index_of (Axis_separator, 1) + 1
			Result := release_version.substring (release_version.index_of (Axis_separator, p) + 1, release_version.count)
		end

	version_status: INTEGER
			-- status of version: release candidate, released, build, unstable

	build_count: INTEGER
			-- Commit number of this archetype. This is a number that advances from 1 and is reset for
			-- each new value of release_version.

	physical_id: IMMUTABLE_STRING_8
			-- The ‘physical’ form of the HRID, i.e. with complete version information.
		local
			str: STRING
		do
			if attached physical_id_cache as att_phys_id then
				Result := att_phys_id
			else
				str := hrid_root
				str.append_character (Axis_separator)
				str.append (Version_delimiter)
				str.append (version_id)
				create Result.make_from_string (str)
				physical_id_cache := Result
			end
		end

	version_id: STRING
			-- Full version identifier string, based on release_version and lifecycle, e.g. 1.8.2-rc4.
		do
			create Result.make_empty
			Result.append (release_version)
			if version_status /= vs_released then
				Result.append (version_status_symbol_text (version_status))
				if build_count > 0 then
					Result.append_character (Axis_separator)
					Result.append (build_count.out)
				else
					-- need to remove trailing '.'
					Result.remove_tail (1)
				end
			end
		end

	qualified_rm_closure: STRING
			-- closure name qualified by RM publisher
			-- e.g. openEHR-EHR, HL7-CDA
		do
			create Result.make_empty
			Result.append (rm_publisher)
			Result.append_character (Section_separator)
			Result.append (rm_package)
		end

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			-- True if `an_id' is either a valid ADL 1.4 id or 1.5 id
		do
			Result := id_parser.valid_id (an_id)
		end

	valid_id_reference (a_ref: STRING): BOOLEAN
			-- True if `a_ref' is a valid reference to an archetype, i.e. a value archetype id
			-- down to the major version, with optional minor and patch version, no extension
		do
			Result := id_parser.valid_id_reference (a_ref)
		end

	valid_id_segment (a_segment: STRING): BOOLEAN
			-- check that `a_segment' has no section or axis separators, and consists
			-- only of alphanumerics + underscore
		do
			Result := segment_regex_matcher.recognizes (a_segment)
		end

	valid_concept_id (a_concept_id: STRING): BOOLEAN
			-- Is `a_concept_id' a valid string to be part of an archetype id?
		do
			Result := concept_id_regex_matcher.recognizes (a_concept_id)
		end

	valid_qualified_rm_class (a_qualified_rm_class: STRING): BOOLEAN
			-- Is `a_qualified_rm_class' a valid string to be part of an archetype id?
		do
			Result := qualified_rm_class_regex_matcher.recognizes (a_qualified_rm_class)
		end

	valid_namespace (a_namespace: STRING): BOOLEAN
			-- Is `a_namespace' a valid string to be part of an archetype id?
		do
			Result := namespace_regex_matcher.recognizes (a_namespace)
		end

	valid_release_version (a_release_version: STRING): BOOLEAN
		do
			Result := release_version_regex_matcher.recognizes (a_release_version)
		end

	is_adl14_id: BOOLEAN
			-- True if this id is for an ADL 1.4 archetype

feature -- Modification

	set_concept_id (a_concept_id: STRING)
		require
			valid_concept_id (a_concept_id)
		do
			concept_id := a_concept_id
			physical_id_cache := Void
			semantic_id_cache := Void
		end

	set_release_version (a_release_version: STRING)
		require
			valid_release_version (a_release_version)
		do
			release_version := a_release_version
			physical_id_cache := Void
			semantic_id_cache := Void
		end

	set_version_status (a_version_status: INTEGER)
		require
			valid_version_status (a_version_status)
		do
			version_status := a_version_status
			physical_id_cache := Void
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := physical_id < other.physical_id
		end

feature -- Output

	as_string: STRING
		do
			Result := physical_id.as_string_8
		end

	as_filename: STRING
			-- form of `as_string' legal on most file systems
		do
			create Result.make_from_string (physical_id)
			Result.replace_substring_all (namespace_separator, "__")
		end

	as_abbreviated_string: STRING
			-- generate a shortened form suitable for use in GUI widgets
			-- made up of shortened rm_entity '.' shortened domain_concept '.' version
		do
			create Result.make_empty
			Result.append (rm_class.substring (1, 3))
			Result.append_character (Axis_separator)
			Result.append (concept_id.substring (1, concept_id.count.min (8)))
			Result.append_character (Axis_separator)
			Result.append (major_version)
		end

feature {NONE} -- Implementation

	hrid_root: STRING
			-- The root part of the HRID, i.e. excluding any version information
		do
			create Result.make_empty
			if attached namespace as att_ns then
				Result.append (att_ns.value)
				Result.append (namespace_separator)
			end
			Result.append (qualified_rm_class)
			Result.append_character (Axis_separator)
			Result.append (concept_id)
		end

	namespace_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for namespace part of archetype ids.
		once ("PROCESS")
			create Result.make
			Result.compile ("^" + namespace_regex + "$")
		end

	qualified_rm_class_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for qualified rm_class part of archetype ids.
		once ("PROCESS")
			create Result.make
			Result.compile ("^" + qualified_rm_class_regex + "$")
		end

	concept_id_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for concept_id part of archetype ids.
		once ("PROCESS")
			create Result.make
			Result.compile ("^" + concept_id_regex + "$")
		end

	segment_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for any segment of an archetype id
		once ("PROCESS")
			create Result.make
			Result.compile ("^" + segment_regex + "$")
		end

	release_version_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for ADL 1.5 release version
			-- 	will match string of form N.M.P
		once ("PROCESS")
			create Result.make
			Result.compile ("^" + release_version_regex + "$")
		end

	id_parser: ARCHETYPE_HRID_PARSER
		once ("PROCESS")
			create Result.make
		end

	physical_id_cache: detachable IMMUTABLE_STRING_8

	semantic_id_cache: detachable IMMUTABLE_STRING_8

invariant
	Rm_publisher_validity: not rm_publisher.is_empty
	Rm_closure_validity: not rm_package.is_empty
	Rm_class: not rm_class.is_empty
	Concept_id_validity: not concept_id.is_empty
	Release_version_validity: not release_version.is_empty
	Version_status_validity: valid_version_status (version_status)
	Commit_number_validity: build_count > 0

end

