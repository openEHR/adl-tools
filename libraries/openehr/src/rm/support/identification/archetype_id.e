indexing
	component:   "openEHR Common Reference Model"

	description: "[
				 Multi-axial archetype identifier of the form:
				 		qualified_rm_entity.domain_concept.version
				 	where:
				 		qualified_rm_entity	= rm_originator-rm_name-rm_entity_name
				 		domain_concept = string name of concept, including specialised parts
				 						 separated by '-'s
				 		version = string
				 ]"
	keywords:    "archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_ID

inherit
	OBJECT_ID
		redefine
			default_create, infix "<"
		end

create
	make,
	make_from_string,
	default_create

feature -- Definitions

	Default_id: STRING is "openehr-ehr-ENTRY.any.v1"

	axis_separator: CHARACTER is '.'
			-- major separator between values on the different axes

	section_separator: CHARACTER is '-'
			-- separator between sections in an axis

feature -- Initialisation

	make (a_rm_originator, a_rm_name, a_rm_entity, a_domain_concept, a_version_id: STRING) is
			-- Create from "rm_originator-rm_name-rm_entity.domain_concept.ver_id".
		require
			a_rm_originator /= Void and then not a_rm_originator.is_empty
			a_rm_name /= Void and then not a_rm_name.is_empty
			a_rm_entity /= Void and then not a_rm_entity.is_empty
			a_domain_concept /= Void and then not a_domain_concept.is_empty
			a_version_id /= Void and then not a_version_id.is_empty
		do
			create value.make(0)
			value.append(a_rm_originator)
			value.append_character(section_separator)
			value.append(a_rm_name)
			value.append_character(section_separator)
			value.append(a_rm_entity)

			value.append_character(axis_separator)
			value.append(a_domain_concept)
			if domain_concept.has(section_separator) then
				is_specialised := True
			end

			value.append_character(axis_separator)
			value.append(a_version_id)
		end

	make_from_string (an_id: STRING) is
			-- Create from "rm_entity.domain_concept.ver_id".
		require
			an_id /= Void and then valid_id(an_id)
		do
			value := an_id
			if domain_concept.has(section_separator) then
				is_specialised := True
			end
		end

	default_create is
			-- Create a default id.
		do
			make_from_string (Default_id)
		end

feature -- Access

	qualified_rm_entity: STRING is
			-- identification of Reference Model entity being archetyped
			-- e.g. openehr-ehr_rm-entry, hl7-cda-section, hl7-rim-act_relationship
		local
			p: INTEGER
		do
			p := value.index_of (axis_separator, 1) - 1
			Result := value.substring (1, p)
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

	domain_concept: STRING is
			-- shortened version of concept name, e.g.
			-- "blood_pressure", "problem-diagnosis"
			-- extracted from `value'
		local
			p, q: INTEGER
		do
			p := value.index_of (axis_separator, 1) + 1
			q := value.index_of (axis_separator, p) - 1
			Result := value.substring (p, q)
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

	version_id: STRING is
		local
			p: INTEGER
		do
			p := value.index_of(axis_separator, 1) + 1
			p := value.index_of(axis_separator, p) + 1
			Result := value.substring(p, value.count)
		end

	rm_originator: STRING is
			-- name of organisation which created the reference model on
			-- which archetypes in this system are based, e.g. "openehr"
			-- Extracted from qualified_rm_entity
		local
			s: STRING
			p: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of(section_separator, 1) - 1
			Result := s.substring(1, p)
		ensure
			Result_valid: Result /= Void and then not Result.is_empty
		end

	rm_name: STRING is
			-- name of the reference model on which the identified archetype is based,
			-- e.g. "ehr", "demographic", "rim"
			-- Extracted from qualified_rm_entity
		local
			s: STRING
			p, q: INTEGER
		do
			s := qualified_rm_entity
			p := s.index_of(section_separator, 1) + 1
			q := s.index_of(section_separator, p) - 1
			Result := s.substring(p, q)
		ensure
			Result_valid: Result /= Void and then not Result.is_empty
		end

	rm_entity: STRING is
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
			p := s.index_of(section_separator, 1) + 1
			p := s.index_of(section_separator, p) + 1
			Result := s.substring(p, s.count)
		ensure
			Result_valid: Result /= Void and then not Result.is_empty
		end

	specialisation: STRING is
			-- Optional specialisation of `domain_concept'.
			-- I.e. "problem-diagnosis-histological" -> "diagnosis-histological"
		require
			specialised: is_specialised
		local
			s: STRING
		do
			s := domain_concept
			Result := s.substring (s.index_of (section_separator, 1), s.count)
		ensure
			not_empty: not Result.is_empty
		end

	domain_concept_tail: STRING is
			-- The last part of the domain concept.
			-- I.e. "problem"                        -> "problem"
			--      "problem-diagnosis"              -> "diagnosis"
			--      "problem-diagnosis-histological" -> "histological"
		local
			p: INTEGER
		do
			Result := domain_concept
			p := Result.last_index_of (section_separator, Result.count)

			if p > 0 then
				Result := Result.substring (p + 1, Result.count)
			end
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
			domain_concept_unless_specialised: not is_specialised implies domain_concept.is_equal (Result)
			last_specialisation: is_specialised implies domain_concept.is_equal (domain_concept_base + section_separator.out + Result)
		end

	domain_concept_base: STRING is
			-- The part of the domain concept excluding the last specialisation.
			-- I.e. "problem"                        -> "" (no specialisation)
			--      "problem-diagnosis"              -> "problem"
			--      "problem-diagnosis-histological" -> "problem-diagnosis"
		local
			p: INTEGER
		do
			Result := domain_concept
			p := Result.last_index_of (section_separator, Result.count) - 1
			Result := Result.substring (1, p)
		ensure
			attached: Result /= Void
			empty_unless_specialised: not is_specialised implies Result.is_empty
			excludes_last_specialisation: is_specialised implies domain_concept.is_equal (Result + section_separator.out + domain_concept_tail)
		end

	sortable_id, semantic_id: STRING is
			-- Semantic id as a string minus the version part at the end (which interferes with sensible sorting).
		local
			p: INTEGER
		do
			p := value.last_index_of (axis_separator, value.count) - 1
			Result := value.substring (1, p)
		ensure
			attached: Result /= Void
			rm_entity_plus_domain_concept: Result.is_equal (qualified_rm_entity + axis_separator.out + domain_concept)
		end

	semantic_parent_id: STRING is
			-- Semantic id of parent as a string minus the version part at the end.
			-- Equivalent to `semantic_id' including `domain_concept_base' only.
		local
			p: INTEGER
			separator: CHARACTER
		do
			Result := semantic_id

			if is_specialised then
				separator := section_separator
			else
				separator := axis_separator
			end

			p := Result.last_index_of (separator, Result.count) - 1
			Result := Result.substring (1, p)
		ensure
			attached: Result /= Void
			empty_unless_specialised: not is_specialised implies Result.is_equal (qualified_rm_entity)
			excludes_last_specialisation: is_specialised implies Result.is_equal (qualified_rm_entity + axis_separator.out + domain_concept_base)
		end

	specialisation_depth: INTEGER is
			-- specialisation level of this archetype id; non-specialised -> 0
		do
			Result := domain_concept.occurrences (section_separator)
		end

feature -- Status Report

	is_specialised: BOOLEAN
			-- Is this id a specialisation?

	valid_id (an_id: STRING): BOOLEAN is
			-- Does `an_id' have the correct form for an archetype id?
		do
			Result := id_pattern_regex.matches (an_id)
		end

feature -- Factory

	create_specialised_id(a_spec_domain_concept: STRING): ARCHETYPE_ID is
			-- Create a specialised archetype id based on this one, using `a_spec_domain_concept'.
			-- If the current id looks like:
			--  openehr-ehr-OBSERVATION.lab_result.v3
			-- The result of this call will be:
			--  openehr-ehr-OBSERVATION.lab_result-XXXX.v3
			-- where the XXXX is the supplied specialised domain concept.
		require
			Concept_valid: a_spec_domain_concept /= Void and then not a_spec_domain_concept.is_empty
		do
			create Result.make(rm_originator, rm_name, rm_entity, domain_concept + section_separator.out + a_spec_domain_concept, version_id)
			is_specialised := True
		ensure
			Result_exists: Result /= Void
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		do
			Result := sortable_id < other.sortable_id
		end

feature -- Output

	as_string: STRING is
		do
			Result := value.twin
		ensure
			attached: Result /= Void
			not_empty: not Result.is_empty
		end

feature {NONE} -- Implementation

	id_pattern_regex: LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		once
			-- note that the final [a-z]* should be removed one day to prevent archaic naming like .v1draft
			create Result.compile_case_insensitive ("^[a-z][a-z0-9()#_]+(-[a-z0-9()#_]+){2}\.[a-z][a-z0-9()#-_]+\.v[0-9]+[a-z]*$")
		ensure
			attached: Result /= Void
		end

end



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_id.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
