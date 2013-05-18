note
	component:   "openEHR ADL Tools"
	description: "Access to services in the external environment"
	keywords:    "external access, environment"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXTERNAL_ENVIRONMENT_ACCESS

inherit
	TERMINOLOGY_SERVICE
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	MEASUREMENT_SERVICE
		export
			{NONE} all
		end

end


