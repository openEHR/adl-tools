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
	make, make_from_string, default_create
	
feature -- Definitions

	Default_id: STRING is "openehr-ehr-ENTRY.any.v1"
	
	axis_separator: CHARACTER is '.'
			-- major separator between values on the different axes
	
	section_separator: CHARACTER is '-'
			-- separator between sections in an axis
			
feature -- Initialisation

	make(a_rm_originator, a_rm_name, a_rm_entity, a_domain_concept, a_version_id: STRING) is
			-- make from rm_originator-rm_name-rm_entity.domain_concept.ver_id
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
		
	make_from_string(an_id: STRING) is
			-- make from "rm_entity.domain_concept.ver_id"
		require
			an_id /= Void and then valid_id(an_id)
		do
			value := an_id
			if domain_concept.has(section_separator) then
				is_specialised := True				
			end
		end

	default_create is
			-- make a default id
		do
			make_from_string(Default_id)
		end
		
feature -- Access

	qualified_rm_entity: STRING is
			-- identification of Reference Model entity being archetyped
			-- e.g. openehr-ehr_rm-entry, hl7-cda-section, hl7-rim-act_relationship
		local
			p: INTEGER
		do
			p := value.index_of(axis_separator, 1) - 1
			Result := value.substring(1, p)
		end
		
	domain_concept: STRING is
			-- shortened version of concept name, e.g.
			-- "blood_pressure", "problem-diagnosis"
			-- extracted from `value'
		local
			p, q: INTEGER
		do
			p := value.index_of(axis_separator, 1) + 1
			q := value.index_of(axis_separator, p) - 1
			Result := value.substring(p, q)
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
			-- optional specialisation of concept, e.g. "blood lipids"
			-- extracted from domain_concept
		require
			is_specialised
		local
			s: STRING
		do
			s := domain_concept
			Result := s.substring(s.index_of(Section_separator, 1), s.count)
		ensure
			Result_valid: Result /= Void implies not Result.is_empty
		end

	domain_concept_base: STRING is
			-- the part of the domain concept excluding the last specialisation
			-- i.e. "problem" 						-> "problem" (no specialisation)
			--		"problem-diagnosis" 			-> "problem"
			--		"problem-diagnosis-histological" -> "problem-diagnosis"
		local
			s: STRING
			loc: INTEGER
		do
			s := domain_concept
			loc := s.last_index_of(Section_separator, s.count) - 1
			if loc < 0 then
				loc := s.count
			end
			Result := s.substring(1, loc)
		ensure
			Result_valid: Result /= Void implies not Result.is_empty
		end

	sortable_id: STRING is
			-- id as a string minus the version part at the end 
			-- (which interferes with sensible sorting)
		local
			p: INTEGER
		do
			p := value.last_index_of(axis_separator, value.count) - 1
			Result := value.substring(1, p)
		end
	
feature -- Status Report

	is_specialised: BOOLEAN
	
	valid_id(an_id: STRING):BOOLEAN is
		do
			Result := an_id.occurrences(axis_separator) = 2 and an_id.occurrences(section_separator) >= 2
		end
		
feature -- Factory

	create_specialised_id(a_spec_domain_concept: STRING): ARCHETYPE_ID is
			-- create a specialised archetype id based on this one, using `a_spec_domain_concept'
			-- if the current id looks like:
			--	openehr-ehr-OBSERVATION.lab_result.v3
			-- the result of this call will be:
			--	openehr-ehr-OBSERVATION.lab_result-XXXX.v3
			-- where the XXXX is the supplied specialised domain concept
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
			create Result.make(value.count)
			Result.append(value)
		end
		

invariant
	Qualified_rm_entity_valid: qualified_rm_entity /= Void and then not qualified_rm_entity.is_empty
	Domain_concept_valid: domain_concept /= Void and then not domain_concept.is_empty

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
