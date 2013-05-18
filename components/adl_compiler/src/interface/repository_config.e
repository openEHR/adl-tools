note
	component:   "openEHR ADL Tools"
	description: "[
				 Config of one repository profile, i.e. the innermost objects in the following:

				 xxxx = <
					 current_repository = <"CKM">
					 repositories = <
						 ["CKM"] = <
						 	reference_path = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
							work_path = <"">
						 >
						 ["abc"] = <
						 	reference_path = <"C:\\some\\other\\ref\\dir">
							work_path = <"C:\\some\\other\\work\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_CONFIG

create
	make_from_old, make

feature -- Initialisation

	make (a_ref_path: STRING; a_work_path: detachable STRING)
		do
			reference_path := a_ref_path
			if attached a_work_path as wp and then not wp.is_empty then
				work_path := a_work_path
			end
		end

	make_from_old (an_old_config: REPOSITORY_PROFILE)
		do
			reference_path := an_old_config.reference_repository
			if attached an_old_config.work_repository as wr then
				work_path := wr
			end
		end

feature -- Access

	reference_path: STRING
			-- path to reference repository
			-- NOTE: this attribute is used for dADL persistence in the .cfg file
        attribute
            create Result.make_empty
        end

	work_path: detachable STRING
			-- [optional] path to work repository
			-- NOTE: this attribute is used for dADL persistence in the .cfg file

feature -- Status Report

	has_work_path: BOOLEAN
			-- True if there is a work_repository
		do
			Result := attached work_path and then not work_path.is_empty
		end

feature -- Modification

	set_reference_path (a_path: STRING)
			-- Set the path to the reference repository.
		require
			not a_path.is_empty
		do
			reference_path := a_path
		end

	set_work_path (a_path: STRING)
			-- Set the path to the work repository.
		do
			work_path := a_path
		end

end



