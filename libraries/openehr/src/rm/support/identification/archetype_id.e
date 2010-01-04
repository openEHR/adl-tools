note
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
	RM_CONCEPT_ID
		redefine
			make, make_from_string
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

create
	make,
	make_from_string,
	old_make_from_string,
	default_create

feature -- Definitions

	Default_id: STRING = "openehr-ehr-ENTRY.any.v1"

feature -- Initialisation

	make (a_rm_originator, a_rm_name, a_rm_entity, a_domain_concept, a_version_id: STRING)
			-- Create from "rm_originator-rm_name-rm_entity.domain_concept.ver_id".
		do
			precursor(a_rm_originator, a_rm_name, a_rm_entity, a_domain_concept, a_version_id)
			if domain_concept.has(section_separator) then
				is_specialised := True
			end
		end

	make_from_string (an_id: STRING)
			-- Create from "rm_entity.domain_concept.ver_id".
		do
			precursor(an_id)
			if domain_concept.has(section_separator) then
				is_specialised := True
			end
		end

	old_make_from_string (an_id: STRING)
			-- Create from "rm_entity.domain_concept.ver_id", allows 'draft' in the version name
		require
			an_id /= Void and then old_valid_id (an_id)
		do
			value := an_id
			if domain_concept.has(section_separator) then
				is_specialised := True
			end
		end

feature -- Access

	specialisation: STRING
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

	semantic_parent_id: attached STRING
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
			empty_unless_specialised: not is_specialised implies Result.is_equal (qualified_rm_entity)
			excludes_last_specialisation: is_specialised implies Result.is_equal (qualified_rm_entity + axis_separator.out + domain_concept_base)
		end

	specialisation_depth: INTEGER
			-- specialisation level of this archetype id; non-specialised -> 0
		do
			Result := domain_concept.occurrences (section_separator)
		ensure
			non_negative: Result >= 0
		end

feature -- Status Report

	old_valid_id (an_id: STRING): BOOLEAN
			-- Does `an_id' have the correct form for an archetype id?
		do
			Result := old_archetype_id_pattern_regex.matches (an_id)
		end

feature -- Factory

	create_specialised_id (a_spec_domain_concept: STRING): attached ARCHETYPE_ID
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
		end

feature {NONE} -- Implementation

	id_pattern_regex: LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		once
			create Result.compile_case_insensitive ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[1-9][0-9]*$")
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
