note
	component:   "openEHR ADL Tools"

	description: "Representation of a value domain"
	keywords:    "terminology, vocabulary"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safe:	 "yes"

class TERMINOLOGY_GROUP

create
	make

feature -- Initialisation

	make (a_name: STRING)
			-- make a terminology interface with `a_name'
		require
			Name_valid: not a_name.is_empty
		do
			name := a_name
			create terms.make (0)
		ensure
			Name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- identifier of this terminology value set (group)

	term (a_code: STRING): detachable DV_CODED_TEXT
		require
			has_term (a_code)
		do
			Result := terms.item (a_code)
		end

feature -- Status Report

	has_term (a_concept_code: STRING): BOOLEAN
			-- 	True if a_concept_code exists in this code set
		do
			Result := terms.has (a_concept_code)
		end

feature -- Modification

	add_term (a_term: DV_CODED_TEXT)
		require
			not has_term (a_term.defining_code.code_string)
		do
			terms.put (a_term, a_term.defining_code.code_string)
		end

feature {NONE} -- mplementation

	terms: HASH_TABLE [DV_CODED_TEXT, STRING]
			-- table of terms indexed by concept code


end



