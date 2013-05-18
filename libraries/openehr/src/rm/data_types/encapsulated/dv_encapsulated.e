note
	component:   "openEHR ADL Tools"

	description: "[
	             Abstract class defining the common meta-data of all types of encapsulated data
			 ]"
	keywords:    "multimedia, data"

	requirements:"ISO 18308 TS V1.0 STR 2.6"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DV_ENCAPSULATED

inherit
	DATA_VALUE

	EXTERNAL_ENVIRONMENT_ACCESS

feature -- Access

	charset: CODE_PHRASE
		attribute
			create Result
		end

	language: CODE_PHRASE
		attribute
			create Result
		end

	size: INTEGER

invariant
	Size_positive: size >= 0
	Language_valid: code_set("languages").has (language)
	charset_valid: code_set("character sets").has (charset)

end



