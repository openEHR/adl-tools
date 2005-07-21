indexing
	component:   "openEHR EHR Reference Model"

	description: "[
	              General model of information-carrying entries in transactions. All
			  ENTRYs are about some subject, normally 'self', but may be about
			  people related to the subject of the record. 
			  An ENTRY corresponds to a 'clinical statement' in some people's terminology.
			  ]"
	keywords:    "content, clinical"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 4.1"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/composition/content/entry/SCCS/s.entry.e $"
	revision:    "$Revision$"
	last_change: "$Date: 05/06/27 12:42:13+01:00 $"

deferred class ENTRY

inherit
	EXTERNAL_ENVIRONMENT_ACCESS

	CONTENT_ITEM

feature -- Definitions

	Default_subject_relationship_name: STRING is "self"

	default_subject_relationship: DV_CODED_TEXT is
		do
		ensure
			default_value: Result.value.is_equal (default_subject_relationship_name)
		end

feature -- Access

	language: CODE_PHRASE	
			-- Mandatory indicator of the localised language in which this 
			-- Entry is written. Coded from openEHR Code Set “languages”.
			
	encoding: CODE_PHRASE
			-- Name of character set in which text values in this Entry are encoded. 
			-- Coded from openEHR Code Set “character sets”.

	subject: RELATED_PARTY
			-- Identity of human subject of the information in this entry

	provider: PARTICIPATION
			-- party providing the information
		
	protocol: ITEM_STRUCTURE
			-- method of obtaining information: observation method; method of arriving at
			-- subjective or prescriptive information
			-- Description of why the information in this entry was arrived at. 
			-- This may take the form of references to guidelines, including manually 
			-- followed and executable; knowledge references such as a paper in 
			-- Medline; clinical reasons within a largercare process.

	act_id: STRING	
			-- Optional act identifier used by e.g. a workflow system for an act 
			-- to which this ENTRY corresponds in some way. This identifier might 
			-- have internal syntax and meaning to an external processor.

	act_status: DV_CODED_TEXT	
			-- Optional act status indicator for this entry.

	guideline_id: OBJECT_REF	
			-- Identifier of guideline creating this action if relevant

	other_participations: LIST [PARTICIPATION]
			-- Other participations at ENTRY level - archetypable.

invariant
	Subject_exists: subject /= Void
	Provider_valid: provider /= Void
	Act_status_valid: act_status /= Void implies 
		terminology("openehr").codes_for_group_name("act status", "en")
		.has(act_status.defining_code)
	Other_participations_valid: other_participations /= Void implies not other_participations.is_empty
	Archetype_root_point: is_archetype_root
	Language_valid: language /= Void and then code_set("languages").has(language)
	Encoding_valid: encoding /= Void and then code_set("character sets").has(encoding)
	
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
--| The Original Code is entry.e.
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
