note
	component:   "openEHR ADL Tools"
	description: "Definitions of terminology identifiers used in the openEHR models; also known as vocabulary domains in HL7"
	keywords:    "terminology, vocabulary, identifiers"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OPENEHR_TERMINOLOGY_IDS

feature -- Definitions

	Terminology_UnitsOfMeasureProperties: STRING = "openEHR:UnitsOfMeasureProperties"

	Terminology_id_Units_of_measure_properties: HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- not yet defined by anyone yet - should be HL7
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make(Terminology_UnitsOfMeasureProperties)
			Result.put(term_id, term_id.value)
		end

	Terminology_ISO_639_1: STRING = "ISO_639-1"
			-- two character language names

	Terminology_ISO_639_2: STRING = "ISO_639-2"
			-- three character language names

	Terminology_id_Languages: HASH_TABLE [TERMINOLOGY_ID, STRING]
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

	Terminology_ISO_3166_1: STRING = "ISO_3166-1"

	Terminology_ISO_3166_2: STRING = "ISO_3166-2"

	Terminology_id_Countries: HASH_TABLE [TERMINOLOGY_ID, STRING]
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

	Terminology_id_Charsets: HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- this is the full IANA set of names; the HL7 domain "charset" only
			-- lists 10 character sets.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("IANA_charsets")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Compression_algorithms: HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- HL7 Compression Algorithm.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7_CompressionAlgorithm")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Integrity_check_algorithms: HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- HL7 Integrity Check Algorithms.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7_IntegrityCheckAlgorithm")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Media_types: HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- HL7 media types, derived from the IANA media types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:MediaType")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Null_flavours: HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- null flavour types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:NullFlavor")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Participation_modes:  HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- participation mode types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:ParticipationModes")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Attestation_statuses:  HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- participation mode types.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("HL7:ParticipationSignature")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Provider_functions:  HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- Entry Information Provider functions.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("openEHR:Provider_relationships")
			Result.put(term_id, term_id.value)
		end

	Terminology_id_Subject_relationships:  HASH_TABLE [TERMINOLOGY_ID, STRING]
			-- Provider relationships.
		local
			term_id: TERMINOLOGY_ID
		do
			create Result.make(0)
			create term_id.make("openEHR:Subject_relationships")
			Result.put(term_id, term_id.value)
		end

end



