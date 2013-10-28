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
			{ANY} axis_separator
		undefine
			is_equal
		redefine
			default_create
		end

create
	make, make_adl14, make_namespaced,
	make_from_string, make_new,
	default_create

feature -- Definitions

	Default_id: STRING = "openehr-ehr-ENTRY.any.v0.0.1"

	Default_qualified_rm_class: STRING = "openEHR-EHR-ENTRY"

	Default_concept: STRING = "any"

	Default_release_version: STRING = "0.0.1"

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
			rm_closure := a_rm_closure
			rm_class := a_rm_class
			concept_id := a_concept_id
			release_version := a_release_version
			version_status := a_version_status
			commit_number := a_commit_number
		end

	make_from_string (a_str: STRING)
		require
			Valid_id: valid_id (a_str)
		do
			id_parser.execute (a_str)
			namespace := id_parser.namespace
			rm_publisher := id_parser.rm_publisher
			rm_closure := id_parser.rm_closure
			rm_class := id_parser.rm_class
			concept_id := id_parser.concept_id
			release_version := id_parser.release_version
			version_status := id_parser.version_status
			commit_number := id_parser.commit_number
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
			qual_class_strs := a_qualified_rm_class.split (section_separator)
			rm_publisher := qual_class_strs.i_th (1)
			rm_closure := qual_class_strs.i_th (2)
			rm_class := qual_class_strs.i_th (3)
		end

	default_create
		do
			make_from_string (Default_id)
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

	qualified_rm_class: STRING
			-- identification of Reference Model class being archetyped
			-- e.g. openEHR-EHR-OBSERVATION, HL7-CDA-SECTION
		do
			create Result.make_empty
			Result.append (rm_publisher)
			Result.append (section_separator.out)
			Result.append (rm_closure)
			Result.append (section_separator.out)
			Result.append (rm_class)
		end

	interface_id: STRING
			-- The ‘interface’ form of the HRID, i.e. down to the major version
		do
			Result := hrid_root
			Result.append_character (axis_separator)
			Result.append (Version_delimiter)
			Result.append (major_version)
		end

	concept_id: STRING
			-- The short concept name of the archetype as used in the multi-axial archetype_hrid.

	concept_id_version: STRING
			-- short concept part of id + version
			-- "blood_pressure.v2", "problem-diagnosis.v0.9.0"
		do
			create Result.make_empty
			Result.append (concept_id)
			Result.append_character (axis_separator)
			Result.append (Version_delimiter)
			Result.append (version_id)
		end

	release_version: STRING
			-- The full numeric version of this archetype consisting of 3 parts, e.g. 1.8.2. The archetype_hrid
			-- feature includes only the major version.

	major_version: STRING
			-- Major version of this archetype, extracted from release_version.
		do
			Result := release_version.substring (1, release_version.index_of (axis_separator, 1) - 1)
		end

	minor_version: STRING
			-- Minor version of this archetype, extracted from release_version.
		local
			p: INTEGER
		do
			p := release_version.index_of (axis_separator, 1) + 1
			Result := release_version.substring (p, release_version.index_of (axis_separator, p) - 1)
		end

	patch_version: STRING
			-- Patch version of this archetype, extracted from release_version. Equivalent to patch version in patch version in semver.org sytem.
		local
			p: INTEGER
		do
			p := release_version.index_of (axis_separator, 1) + 1
			Result := release_version.substring (release_version.index_of (axis_separator, p) + 1, release_version.count)
		end

	version_status: INTEGER
			-- status of version: release candidate, released, build, unstable

	commit_number: INTEGER
			-- Commit number of this archetype. This is a number that advances from 1 and is reset for
			-- each new value of release_version.

	physical_id: STRING
			-- The ‘physical’ form of the HRID, i.e. with complete version information.
		do
			Result := hrid_root
			Result.append_character (axis_separator)
			Result.append (Version_delimiter)
			Result.append (version_id)
		end

	version_id: STRING
			-- Full version identifier string, based on release_version and lifecycle, e.g. 1.8.2-rc4.
		do
			create Result.make_empty
			Result.append (release_version)
			Result.append (version_status_symbol_text (version_status))
			if commit_number > 0 then
				Result.append (commit_number.out)
			end
		end

	qualified_rm_closure: STRING
			-- closure name qualified by RM publisher
			-- e.g. openEHR-EHR, HL7-CDA
		do
			create Result.make_empty
			Result.append (rm_publisher)
			Result.append_character (section_separator)
			Result.append (rm_closure)
		end

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
		do
			Result := id_parser.valid_id (an_id)
		end

	valid_id_segment (a_segment: STRING): BOOLEAN
			-- check that `a_segment' has no section or axis separators, and consists only of alphanumerics +
			-- underscore
		do
			Result := segment_regex.recognizes (a_segment)
		end

	valid_concept_id (a_concept_id: STRING): BOOLEAN
			-- Is `a_concept_id' a valid string to be part of an archetype id?
		do
			Result := concept_id_regex.recognizes (a_concept_id)
		end

	valid_qualified_rm_class (a_qualified_rm_class: STRING): BOOLEAN
			-- Is `a_qualified_rm_class' a valid string to be part of an archetype id?
		do
			Result := qualified_rm_class_regex.recognizes (a_qualified_rm_class)
		end

	valid_namespace (a_namespace: STRING): BOOLEAN
			-- Is `a_namespace' a valid string to be part of an archetype id?
		do
			Result := namespace_regex.recognizes (a_namespace)
		end

	valid_release_version (a_release_version: STRING): BOOLEAN
		do
			Result := release_version_regex.recognizes (a_release_version)
		end

	is_adl14_id: BOOLEAN
			-- True if this id is for an ADL 1.4 archetype

feature -- Modification

	set_concept_id (a_concept_id: STRING)
		require
			valid_concept_id (a_concept_id)
		do
			concept_id := a_concept_id
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
			Result := physical_id
		end

	as_abbreviated_string: STRING
			-- generate a shortened form suitable for use in GUI widgets
			-- made up of shortened rm_entity '.' shortened domain_concept '.' version
		do
			create Result.make_empty
			Result.append (rm_class.substring (1, 3))
			Result.append_character (axis_separator)
			Result.append (concept_id.substring (1, concept_id.count.min (8)))
			Result.append_character (axis_separator)
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
			Result.append_character (axis_separator)
			Result.append (concept_id)
		end

	namespace_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for namespace part of archetype ids.
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(\.[a-zA-Z][a-zA-Z0-9_]+)*$")
		end

	qualified_rm_class_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for qualified rm_class part of archetype ids.
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*$")
		end

	concept_id_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for concept_id part of archetype ids.
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*$")
		end

	segment_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for any segment of an archetype id
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+$")
		end

	release_version_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for ADL 1.5 release version
			-- 	will match string of form N.M.P
		once
			create Result.make
			Result.compile ("^[0-9]+(\.[0-9]+){2}$")
		end

	id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

invariant
	Rm_publisher_validity: not rm_publisher.is_empty
	Rm_closure_validity: not rm_closure.is_empty
	Rm_class: not rm_class.is_empty
	Concept_id_validity: not concept_id.is_empty
	Release_version_validity: not release_version.is_empty
	Version_status_validity: valid_version_status (version_status)
	Commit_number_validity: commit_number > 0

end

