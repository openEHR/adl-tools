note
	component:   "openEHR ADL Tools"
	description: "[
				 Config of one repository profile, i.e. the innermost objects in the following:

				 xxxx = <
					 current_repository = <"CKM">
					 repositories = <
						 ["CKM"] = <
						 	reference_path = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
						 >
						 ["abc"] = <
						 	reference_path = <"C:\\some\\other\\ref\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "archetype, repository"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_CONFIG

create
	make

feature -- Initialisation

	make (a_ref_path: STRING)
		do
			reference_path := a_ref_path
		end

feature -- Access

	reference_path: STRING
			-- path to reference repository
			-- NOTE: this attribute is used for ODIN persistence in the .cfg file
        attribute
            create Result.make_empty
        end

feature -- Modification

	set_reference_path (a_path: STRING)
			-- Set the path to the reference repository.
		require
			not a_path.is_empty
		do
			reference_path := a_path
		end

end



