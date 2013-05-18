note
	component:   "openEHR ADL Tools"
	description: "[
				 Obsolete class retained so that the old-style 'profiles configuration' can be read from 
				 existing ADL tool .cfg files. This class encodes the inner-most objects in the following
				 old .cfg structure:

				 	profile = <
						current_profile_name = <"CKM">
						profiles = <
							["adl15-test"] = <
								reference_repository = <"C:\\project\\openehr\\adl-archetypes\\ADL15-reference">
							>
							["CKM"] = <
								reference_repository = <"C:\\project\\openehr\\adl-archetypes\\Reference\\CKM_2012_08_08">
								work_repository = <"C:\\project\\openehr\\archetypes\\Work\\CKM-archs">
							>
						>
					>
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_PROFILE

feature -- Access

	reference_repository: STRING
			-- path to reference repository
			-- NOTE: this attribute is used for dADL persistence in the .cfg file
        attribute
            create Result.make_empty
        end

	work_repository: detachable STRING
			-- [optional] path to work repository
			-- NOTE: this attribute is used for dADL persistence in the .cfg file

end



