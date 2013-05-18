note
	component:   "openEHR ADL Tools"
	description: "Test case for UML class creation"
	keywords:    "test, object graph, creation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_UML_CREATE_CLASS

inherit
	TEST_CASE
		redefine 
			check_result
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end

create
	make

feature -- Access

	title:STRING = "Create UML Class Object"

feature -- Initialisation

	make(arg:ANY)
		do
		end

	execute
		local
			uc_abstract, uc_concrete: UML_CLASS
			up_1: UML_PROPERTY
		do
			create uc_abstract.make ("ENTRY")
			uc_abstract.set_is_abstract
			create up_1.make_single_relationship ("subject", uc_abstract, True)

			uc_abstract.add_attribute (up_1)
			
			create uc_concrete.make ("OBSERVATION")
		end

feature -- Access

	check_result
	    do
	    end

end

