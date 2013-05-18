note
	component:   "openEHR ADL Tools"
	description: "[
			 A specialisation of DV_ENCAPSULATED for audiovisual and biosignal types. 
			 Includes further metadata relating to multimedia types which are not 
			 applicable to other subtypes of DV_ENCAPSULATED.
			 ]"

	requirements:"ISO 18308 TS V1.0 STR 3.1"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_MULTIMEDIA

inherit
	DV_ENCAPSULATED

feature -- Initialization

	make_from_string(str:STRING)
		do
		end

	make_from_canonical_string(str:STRING)
		do
		end
		
feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

feature -- Access

	alternate_text: STRING
			-- Text to display in lieu of multimedia display/replay

	uri: DV_URI
			-- URI reference to electronic information stored outside the record as a file, 
			-- database entry etc, if supplied as a reference. 

	data: ARRAY [CHARACTER]
			-- the actual data found at 'uri', if supplied inline

	media_type: CODE_PHRASE
			-- Data media type as per IANA MIME types - 
			-- see: http://www.isi.edu/in-notes/iana/assignments/media-types/media-types

	compression_algorithm: CODE_PHRASE
			-- compression type, taken from the HL7v3 domain “CompressionAlgorithm”, or Void = no compression

	integrity_check: ARRAY[CHARACTER]

	integrity_check_algorithm: CODE_PHRASE
			-- integrity check type, taken from the HL7v3 domain “IntegrityCheckAlgorithm”, or Void = no check

	thumbnail: DV_MULTIMEDIA

feature -- Status

	is_external: BOOLEAN
		do
			Result := uri /= Void
		ensure
			uri /= Void implies Result
		end

	is_inline: BOOLEAN
		do
			Result := data /= Void
		ensure
			data /= Void implies Result
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
		end
	
	as_canonical_string: STRING
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
		end
		
invariant
	Not_empty: is_inline or is_external
	Media_type_terminology: media_type /= Void and then 
	code_set("media types").all_codes.has(media_type)
	Compression_algorithm_terminology: compression_algorithm /= Void implies 
		code_set(Code_set_id_compression_algorithms).has(compression_algorithm)
	Integrity_check_validity: integrity_check /= Void implies 
		integrity_check_algorithm /= Void
	Integrity_check_algorithm_terminology: integrity_check_algorithm /= Void implies 
		code_set(code_set_id_integrity_check_algorithms).has(integrity_check_algorithm)

end



