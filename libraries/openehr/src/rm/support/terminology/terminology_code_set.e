note
	component:   "openEHR ADL Tools"

	description: "Representation of a value domain whose codes are also the meanings"
	keywords:    "terminology, vocabulary"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2012 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TERMINOLOGY_CODE_SET

create
	make

feature -- Initialisation

	make (an_id, an_issuer: STRING)
			-- make a terminology interface with `a_name'
		require
			Id_valid: not an_id.is_empty
			Issuer_valid: not an_issuer.is_empty
		do
			openehr_id := an_id
			issuer := an_issuer
			create codes.make
			codes.compare_objects
		ensure
			Openehr_id_set: openehr_id = an_id
			Issuer_set: issuer = an_issuer
		end

feature -- Access

	openehr_id: STRING
			-- identifier of this code_set

	issuer: STRING

	codes: TWO_WAY_SORTED_SET [STRING]
			-- list of codes

feature -- Status Report

	has_code (a_code: STRING): BOOLEAN
			-- 	True if a_code exists in this code set
		do
			Result := codes.has (a_code)
		end

feature -- Modification

	add_code (a_code: STRING)
		require
			not has_code (a_code)
		do
			codes.extend (a_code)
		end

end



