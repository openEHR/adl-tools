note
	component:   "openEHR ADL Tools"
	description: "Shared access to application root object"
	keywords:    "application, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ARCHETYPE_FLATTENER

feature -- Access

	arch_flattener: ARCHETYPE_FLATTENER
		once ("PROCESS")
			create Result
		end

	rm_flattener: RM_FLATTENER
		once ("PROCESS")
			create Result
		end

	template_flattener: TEMPLATE_FLATTENER
		once ("PROCESS")
			create Result
		end

end



