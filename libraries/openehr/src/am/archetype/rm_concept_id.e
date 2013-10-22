note
	component:   "openEHR ADL Tools"

	description: "[
				 Multi-axial identifier to support Archetype and Template ids, of the form:
				 		qualified_rm_entity.domain_concept.version
				 	where:
				 		qualified_rm_entity	= rm_originator-rm_name-rm_entity_name
				 		domain_concept = string name of concept
				 		version = string
				 ]"
	keywords:    "archetype"
	void_safety: "initial"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class RM_CONCEPT_ID

inherit
	OBJECT_ID
		redefine
			default_create,
			is_less
		end

feature -- Definitions

	namespace_separator: STRING = "::"
			-- separator between namespace and rest of id

	axis_separator: CHARACTER = '.'
			-- major separator between values on the different axes

	axis_separator_string: STRING = "."
			-- major separator between values on the different axes

	section_separator: CHARACTER = '-'
			-- separator between sections in an axis

	section_separator_string: STRING = "-"
			-- separator between sections in an axis

	Default_concept: STRING = "any"

	Version_delimiter: STRING = "v"

	Default_version_id: STRING = "v1"

	Default_id: STRING
		deferred
		end

feature -- Initialisation

	make (a_rm_originator, a_rm_name, a_rm_entity, a_domain_concept, a_version_id: STRING)
			-- Create from "rm_originator-rm_name-rm_entity.domain_concept.ver_id".
		require
			not a_rm_originator.is_empty
			not a_rm_name.is_empty
			not a_rm_entity.is_empty
			not a_domain_concept.is_empty
			not a_version_id.is_empty
		do
			create value.make(0)
			value.append (a_rm_originator)
			value.append_character(section_separator)
			value.append (a_rm_name)
			value.append_character(section_separator)
			value.append (a_rm_entity)

			value.append_character(axis_separator)
			value.append (a_domain_concept)

			value.append_character(axis_separator)
			value.append (a_version_id)
		end

	make_new (a_qualified_rm_entity: STRING)
			-- Create a new id for a given RM/closure/class
		require
			a_qualified_rm_entity.occurrences (section_separator) = 2 and a_qualified_rm_entity.occurrences (axis_separator) = 0
		do
			create value.make(0)
			value.append (a_qualified_rm_entity)

			value.append_character(axis_separator)
			value.append (Default_concept)

			value.append_character(axis_separator)
			value.append (Default_version_id)
		end

	default_create
			-- Create a default id.
		do
			make_from_string (Default_id)
		end

feature -- Access

	qualified_rm_entity: STRING
			-- identification of Reference Model entity being archetyped
			-- e.g. openEHR-EHR-OBSERVATION, HL7-CDA-SECTION
		local
			p: INTEGER
		do
			p := value.index_of (axis_separator, 1) - 1
			Result := value.substring (1, p)
		ensure
			not_empty: not Result.is_empty
		end

	qualified_package_name, qualified_rm_name: STRING
			-- identification of Reference Model name
			-- e.g. openEHR-EHR, HL7-CDA
		local
			s: STRING
			p, q: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of(section_separator, 1) + 1
			q := s.index_of(section_separator, p) - 1
			Result := s.substring(1, q)
		ensure
			not_empty: not Result.is_empty
		end

	package_name: STRING
			-- identification of Reference Model (package) name
			-- e.g. EHR, DEMOGRAPHIC
		local
			s: STRING
			p, q: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of(section_separator, 1) + 1
			q := s.index_of(section_separator, p) - 1
			Result := s.substring(p, q)
		ensure
			not_empty: not Result.is_empty
		end

	package_class_name: STRING
			-- identification of Reference Model (package) + class name
			-- e.g. EHR-OBSERVATION, DEMOGRAPHIC-PARTY
		local
			s: STRING
			p: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of(section_separator, 1) + 1
			Result := s.substring(p, s.count)
		ensure
			not_empty: not Result.is_empty
		end

	domain_concept: STRING
			-- shortened form of concept name, e.g.
			-- "blood_pressure", "problem-diagnosis"
		local
			p, q: INTEGER
		do
			p := value.index_of (axis_separator, 1) + 1
			q := value.index_of (axis_separator, p) - 1
			Result := value.substring (p, q)
		ensure
			not_empty: not Result.is_empty
		end

	domain_concept_version: STRING
			-- short concept part of id + version
			-- "blood_pressure.v2", "problem-diagnosis.v0.9.0"
		local
			p: INTEGER
		do
			p := value.index_of (axis_separator, 1) + 1
			Result := value.substring (p, value.count)
		ensure
			not_empty: not Result.is_empty
		end

	version_id: STRING
			-- a string of the form 'vN'
		local
			p: INTEGER
		do
			p := value.index_of (axis_separator, 1) + 1
			p := value.index_of (axis_separator, p) + 1
			Result := value.substring (p, value.count)
		end

	rm_originator: STRING
			-- name of organisation which created the reference model on
			-- which archetypes in this system are based, e.g. "openehr"
			-- Extracted from qualified_rm_entity
		local
			s: STRING
			p: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of (section_separator, 1) - 1
			Result := s.substring(1, p)
		ensure
			Result_valid: not Result.is_empty
		end

	rm_name: STRING
			-- name of the reference model on which the identified archetype is based,
			-- e.g. "ehr", "demographic", "rim"
			-- Extracted from qualified_rm_entity
		local
			s: STRING
			p, q: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of (section_separator, 1) + 1
			q := s.index_of (section_separator, p) - 1
			Result := s.substring(p, q)
		ensure
			Result_valid: not Result.is_empty
		end

	rm_entity: STRING
			-- level in the reference model which this archetype applies to, e.g.
			-- "organiser", "transaction", "entry" in the openehr RM;
			-- "headed_section", "composition" in CEN 13606
			-- "act", "act_context" in HL7 RIM
			-- Extracted from qualified_rm_entity
		local
			s: STRING
			p: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of (section_separator, 1) + 1
			p := s.index_of (section_separator, p) + 1
			Result := s.substring (p, s.count)
		ensure
			Result_valid: not Result.is_empty
		end

	sortable_id, semantic_id: STRING
			-- Semantic id as a string minus the version part at the end (which interferes with sensible sorting).
		local
			p: INTEGER
		do
			p := value.index_of (axis_separator, 1) + 1
			p := value.index_of (axis_separator, p) - 1

			Result := value.substring (1, p)
		ensure
			rm_entity_plus_domain_concept: Result.is_equal (qualified_rm_entity + axis_separator.out + domain_concept)
		end

feature -- Status Report

	valid_id (an_id: STRING): BOOLEAN
			-- Does `an_id' have the correct form for an archetype id?
		do
			Result := id_pattern_regex.matches (an_id)
		end

	valid_domain_concept (a_concept: STRING): BOOLEAN
			-- Is `a_concept' a valid string to be part of an archetype id?
		do
			Result := domain_concept_pattern_regex.matches (a_concept)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := sortable_id < other.sortable_id
		end

feature -- Modification

	set_domain_concept (a_concept: STRING)
			-- set semantic_id part of identifier
		require
			valid_domain_concept (a_concept)
		local
			p, q: INTEGER
		do
			p := value.index_of (axis_separator, 1) + 1
			q := value.index_of (axis_separator, p) - 1
			value.replace_substring (a_concept, p, q)
		ensure
			domain_concept.is_equal (a_concept)
		end

feature -- Output

	as_string: STRING
		do
			Result := value.twin
		ensure
			not_empty: not Result.is_empty
		end

	as_abbreviated_string: STRING
			-- generate a shortened form suitable for use in GUI widgets
			-- made up of shortened rm_entity '.' shortened domain_concept '.' version
		do
			create Result.make_empty
			Result.append (rm_entity.substring (1, 3))
			Result.append_character (axis_separator)
			Result.append (domain_concept.substring (1, domain_concept.count.min (8)))
			Result.append_character (axis_separator)
			Result.append (version_id)
		end

feature {NONE} -- Implementation

	id_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		deferred
		end

	domain_concept_pattern_regex: RX_PCRE_REGULAR_EXPRESSION
			-- Pattern matcher for concept part of archetype ids.
		once
			create Result.make
			Result.compile ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*$")
		end

end



