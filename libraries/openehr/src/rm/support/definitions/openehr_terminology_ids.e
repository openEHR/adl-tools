indexing
	component:   "openEHR common definitions"
	
	description: "Definitions of terminology identifiers used in the openEHR models; also known as vocabulary domains in HL7"
	keywords:    "terminology, vocabulary, identifiers"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OPENEHR_TERMINOLOGY_IDS

feature -- Definitions

	Terminology_UnitsOfMeasureProperties: STRING is "openEHR:UnitsOfMeasureProperties"

	Terminology_id_Units_of_measure_properties: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- not yet defined by anyone yet - should be HL7
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make(Terminology_UnitsOfMeasureProperties)
			Result.put(term_id, term_id.value)
		end

	Terminology_ISO_639_1: STRING is "ISO_639-1"
			-- two character language names

	Terminology_ISO_639_2: STRING is "ISO_639-2"
			-- three character language names
	
	Terminology_id_Languages: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- Language name terminologies, including ISO 639-1:1988 2 char language names
			-- and ISO 639-2:1998 3 char names
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make(Terminology_ISO_639_1)
			Result.put(term_id, term_id.value)
			create term_id.make(Terminology_ISO_639_2)
			Result.put(term_id, term_id.value)
		end

	Terminology_ISO_3166_1: STRING is "ISO_3166-1"

	Terminology_ISO_3166_2: STRING is "ISO_3166-2"

	Terminology_id_Countries: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- country code terminologies including ISO 3166-1, 3166-2
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make(Terminology_ISO_3166_1)
			Result.put(term_id, term_id.value)
			create term_id.make(Terminology_ISO_3166_2)
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Charsets: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- this is the full IANA set of names; the HL7 domain "charset" only 
			-- lists 10 character sets.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("IANA_charsets")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Compression_algorithms: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- HL7 Compression Algorithm.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7_CompressionAlgorithm")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Integrity_check_algorithms: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- HL7 Integrity Check Algorithms.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7_IntegrityCheckAlgorithm")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Media_types: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- HL7 media types, derived from the IANA media types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:MediaType")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Null_flavours: HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- null flavour types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:NullFlavor")
			Result.put(term_id, term_id.value)
		end
	
	Terminology_id_Participation_modes:  HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- participation mode types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:ParticipationModes")
			Result.put(term_id, term_id.value)
		end
		
	Terminology_id_Attestation_statuses:  HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- participation mode types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:ParticipationSignature")
			Result.put(term_id, term_id.value)
		end
		
	Terminology_id_Provider_functions:  HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- Entry Information Provider functions.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("openEHR:Provider_relationships")
			Result.put(term_id, term_id.value)
		end
		
	Terminology_id_Subject_relationships:  HASH_TABLE [TERMINOLOGY_ID, STRING] is 
			-- Provider relationships.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("openEHR:Subject_relationships")
			Result.put(term_id, term_id.value)
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
--| The Original Code is openehr_terminology_ids.e.
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
