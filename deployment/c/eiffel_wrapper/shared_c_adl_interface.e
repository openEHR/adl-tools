note
	component:   "openEHR ADL Tools"
	description: "[
			 Shared C_ADL_INTERFACE Object for testing purposes - used
			 by test application to access C_ADL_INTERFACE to simulate java calls.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_C_ADL_INTERFACE

inherit
	SHARED_APPLICATION_CONTEXT

feature {NONE} -- Implementation

	c_adl_interface: C_ADL_INTERFACE
		once
			create Result.make
		end

end



