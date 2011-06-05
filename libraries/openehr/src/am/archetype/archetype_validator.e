note
	component:   "openEHR Archetype Project"
	description: "[
				 Validator of standalone archetype (i.e. without reference to parent archetypes
				 in the case of specialised archetypes). The validation done here checks the use
				 of codes defined in the ontology against their use in the definition of the 
				 archetype.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ARCHETYPE_VALIDATOR

inherit
	AUTHORED_RESOURCE_VALIDATOR
		rename
			initialise as initialise_authored_resource
		redefine
			target
		end

	OPERATOR_TYPES
		export
			{NONE} all
		end

	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

feature -- Definitions

	Regex_any_pattern: STRING = ".*"

feature {ADL15_ENGINE} -- Initialisation

	initialise (ara: attached ARCH_REP_ARCHETYPE; an_rm_schema: attached BMM_SCHEMA)
			-- set target_descriptor
			-- initialise reporting variables
		require
			valid_candidate: validation_candidiate (ara)
		do
			rm_schema := an_rm_schema
			target_descriptor := ara
			initialise_authored_resource (target_descriptor.differential_archetype)
		ensure
			target_descriptor_set: target_descriptor = ara
			target_set: attached target
		end

feature -- Access

	target_descriptor: attached ARCH_REP_ARCHETYPE
			-- differential archetype being validated

	target: ARCHETYPE
			-- differential archetype being validated

	ontology: attached ARCHETYPE_ONTOLOGY
			-- The ontology of the current archetype.
		do
			Result := target.ontology
		end

feature -- Status Report

	validation_candidiate (ara: attached ARCH_REP_ARCHETYPE): BOOLEAN
		deferred
		end

feature {NONE} -- Implementation

	rm_schema: attached BMM_SCHEMA

	archetype_id_matches_slot (an_id: attached STRING; a_slot: attached ARCHETYPE_SLOT): BOOLEAN
			-- test an archetype id against slot spec (it might pass, even if no archetypes matching the slot were found)
		require
			Archetype_id_valid: not an_id.is_empty
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
			regex_matcher: LX_DFA_REGULAR_EXPRESSION
		do
			-- process the includes
			includes := a_slot.includes
			excludes := a_slot.excludes
			if not includes.is_empty and not assertion_matches_any (includes.first) and not excludes.is_empty then
				from includes.start until includes.off or Result loop
					if attached {STRING} extract_regex(includes.item) as a_regex then
						create regex_matcher.compile_case_insensitive (a_regex)
						if regex_matcher.is_compiled then
							Result := regex_matcher.matches (an_id)
						end
					end
					includes.forth
				end
			elseif not excludes.is_empty and not assertion_matches_any (excludes.first) and includes.is_empty then
				from excludes.start until excludes.off or not Result loop
					if attached {STRING} extract_regex(excludes.item) as a_regex then
						create regex_matcher.compile_case_insensitive (a_regex)
						if regex_matcher.is_compiled then
							Result := not regex_matcher.matches (an_id)
						end
					end
					excludes.forth
				end
			else
				Result := True
			end
		end

	extract_regex (an_assertion: attached ASSERTION): STRING
			-- extract regex from id matches {/regex/} style assertion used in slots
		do
			if attached {EXPR_BINARY_OPERATOR} an_assertion.expression as bin_op and then bin_op.operator.value = op_matches then
				if attached {EXPR_LEAF} bin_op.right_operand as a_leaf then
					if attached {C_STRING} a_leaf.item as c_str then
						Result := c_str.regexp
					end
				end
			end
		end

	assertion_matches_any (an_assertion: attached ASSERTION): BOOLEAN
			-- True if the regex = {/.*/} i.e. matches anything
		do
			Result := extract_regex (an_assertion).is_equal (Regex_any_pattern)
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
--| The Original Code is archetype_local_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
