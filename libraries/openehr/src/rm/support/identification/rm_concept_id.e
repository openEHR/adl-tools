note
	component:   "openEHR Support Information Model"

	description: "[
				 Multi-axial identifier to support Archetype and Template ids, of the form:
				 		qualified_rm_entity.domain_concept.version
				 	where:
				 		qualified_rm_entity	= rm_originator-rm_name-rm_entity_name
				 		domain_concept = string name of concept
				 		version = string
				 ]"
	keywords:    "archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class RM_CONCEPT_ID

inherit
	OBJECT_ID
		redefine
			default_create,
			is_less
		end

feature -- Definitions

	axis_separator: CHARACTER = '.'
			-- major separator between values on the different axes

	section_separator: CHARACTER = '-'
			-- separator between sections in an axis

	Default_id: STRING
		deferred
		end

feature -- Initialisation

	make (a_rm_originator, a_rm_name, a_rm_entity, a_domain_concept, a_version_id: STRING)
			-- Create from "rm_originator-rm_name-rm_entity.domain_concept.ver_id".
		require
			a_rm_originator /= Void and then not a_rm_originator.is_empty
			a_rm_name /= Void and then not a_rm_name.is_empty
			a_rm_entity /= Void and then not a_rm_entity.is_empty
			a_domain_concept /= Void and then not a_domain_concept.is_empty
			a_version_id /= Void and then not a_version_id.is_empty
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

	make_from_string (an_id: STRING)
			-- Create from "rm_entity.domain_concept.ver_id".
		require
			an_id /= Void and then valid_id (an_id)
		do
			value := an_id
		end

	default_create
			-- Create a default id.
		do
			make_from_string (Default_id)
		end

feature -- Access

	qualified_rm_entity: attached STRING
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

	qualified_package_name, qualified_rm_name: attached STRING
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

	package_name: attached STRING
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

	package_class_name: attached STRING
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

	domain_concept: attached STRING
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
			not_empty: not Result.is_empty
		end

	version_id: STRING
		local
			p: INTEGER
		do
			p := value.index_of(axis_separator, 1) + 1
			p := value.index_of(axis_separator, p) + 1
			Result := value.substring(p, value.count)
		end

	version_number: INTEGER
			-- generate the version number as an integer, for comparison purposes; if the version number is
			-- not a valid numeric, 0 is returned
		local
			s: STRING
		do
			s := version_id
			s.remove_head (1)
			if s.is_integer then
				Result := s.to_integer
			end
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
			p := s.index_of(section_separator, 1) - 1
			Result := s.substring(1, p)
		ensure
			Result_valid: Result /= Void and then not Result.is_empty
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
			p := s.index_of(section_separator, 1) + 1
			q := s.index_of(section_separator, p) - 1
			Result := s.substring(p, q)
		ensure
			Result_valid: Result /= Void and then not Result.is_empty
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
			p := s.index_of(section_separator, 1) + 1
			p := s.index_of(section_separator, p) + 1
			Result := s.substring(p, s.count)
		ensure
			Result_valid: Result /= Void and then not Result.is_empty
		end

	sortable_id, semantic_id: attached STRING
			-- Semantic id as a string minus the version part at the end (which interferes with sensible sorting).
		local
			p: INTEGER
		do
			p := value.last_index_of (axis_separator, value.count) - 1
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

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := sortable_id < other.sortable_id
		end

feature -- Output

	as_string: attached STRING
		do
			Result := value.twin
		ensure
			not_empty: not Result.is_empty
		end

feature {NONE} -- Implementation

	id_pattern_regex: attached LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		deferred
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
