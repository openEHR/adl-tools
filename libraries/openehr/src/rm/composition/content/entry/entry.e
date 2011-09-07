note
	component:   "openEHR EHR Reference Model"

	description: "[
	              General model of any information-carrying entry in a Composition
				  ENTRYs are about some subject, normally 'self', but may be about
				  people related to the subject of the record. 
				  An ENTRY corresponds to a 'clinical statement' in some people's terminology.
			      ]"
	keywords:    "content, clinical"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR EHR Reference Model 5.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ENTRY

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end

	CONTENT_ITEM

feature -- Definitions

	Default_subject_relationship: PARTY_SELF
		do
		end

feature -- Access

	language: CODE_PHRASE	
			-- Mandatory indicator of the localised language in which this 
			-- Entry is written. Coded from openEHR Code Set “languages”.
			
	encoding: CODE_PHRASE
			-- Name of character set in which text values in this Entry are encoded. 
			-- Coded from openEHR Code Set “character sets”.

	subject: PARTY_PROXY
			-- Identity of human subject of the information in this entry

	provider: PARTY_PROXY
			-- party providing the information
		
	other_participations: LIST [PARTICIPATION]
			-- Other participations at ENTRY level - archetypable.

	workflow_id: OBJECT_REF
			-- Identifier of externally held workflow engine data for this workflow 
			-- execution, for this subject of care.

	parent: LOCATABLE
			-- parent node of this node in compositional structure (could be a 
			-- Section or a Composition)
				
invariant
	Subject_exists: subject /= Void
	Provider_valid: provider /= Void
	Other_participations_valid: other_participations /= Void implies not other_participations.is_empty
	Archetype_root_point: is_archetype_root
	Language_valid: language /= Void and then code_set(code_set_id_languages).has(language)
	Encoding_valid: encoding /= Void and then code_set(code_set_id_character_sets).has(encoding)
	
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
--| Portions created by the Initial Developer are Copyright (C) 2003-2005
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
