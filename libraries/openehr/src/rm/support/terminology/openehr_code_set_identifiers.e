note
	component:   "openEHR ADL Tools"
	
	description: "Names of code sets defined and used internally by openEHR"
	keywords:    "terminology, vocabulary, identifiers"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class OPENEHR_CODE_SET_IDENTIFIERS

feature -- Definitions

	Code_set_id_character_sets: STRING = "character sets"

	Code_set_id_compression_algorithms: STRING = "compression algorithms"

	Code_set_id_countries: STRING = "countries"

	Code_set_id_integrity_check_algorithms: STRING = "integrity check algorithms"
	
	Code_set_id_languages: STRING = "languages"

	Code_set_id_media_types: STRING = "media types"

feature -- Comparison

	valid_code_set_id (an_id: STRING): BOOLEAN
			-- True if an_id is in the set defined by this class
		do
			-- FIXME: to be implemented
		end
		
end



