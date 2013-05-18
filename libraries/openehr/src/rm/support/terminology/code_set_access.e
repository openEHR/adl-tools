note
	component:   "openEHR ADL Tools"

	description: "Simple code set interface definition"
	keywords:    "terminology, vocabulary, code set"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CODE_SET_ACCESS

create
	make

feature -- Initialisation

	make (an_id: STRING)
			-- make a code_set interface with `an_id'
		require
			Id_valid: not an_id.is_empty
		do
			id := an_id
			create code_sets.make (0)
		ensure
			Id_set: id = an_id
		end

feature -- Access

	id: STRING
			-- identifier of this terminology

	all_codes: SET [CODE_PHRASE]
		do
			create {LINKED_SET[CODE_PHRASE]} Result.make
		end

feature -- Status Report

	has (a_code: CODE_PHRASE): BOOLEAN
			-- 	True if a_code exists in thsi code set
		require
			Code_exists: a_code /= Void
		do
			-- FIXME: TO_BE_IMPLEM
			Result := True
		end

	has_code (a_code: STRING): BOOLEAN
		require
			a_code_valid: not a_code.is_empty
		do
			-- FIXME: TO_BE_IMPLEM
			Result := True
		end

feature {NONE} -- Implementation

	code_sets: HASH_TABLE [TERMINOLOGY_CODE_SET, STRING]

end



