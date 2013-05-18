note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_CODE_PHRASE"
	keywords:    "codephrase, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_CODE_PHRASE

inherit
	P_C_DEFINED_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (a_ccp: C_CODE_PHRASE)
			-- Make from a C_CODE_PHRASE
		do
			precursor (a_ccp)
			terminology_id := a_ccp.terminology_id.value
			code_list := a_ccp.code_list
		end

feature -- Access

	terminology_id: STRING

	code_list: detachable ARRAYED_LIST [STRING]
			-- list of codes in terminology designated by terminology_id

feature -- Factory

	create_c_code_phrase: C_CODE_PHRASE
		do
			create Result.make_from_terminology_id (terminology_id)
			if attached code_list as cl then
				Result.set_code_list (cl)
			end
			populate_c_instance (Result)
		end

end


