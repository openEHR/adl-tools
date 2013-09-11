note
	component:   "openEHR ADL Tools"
	description: "Abstract model of a unit property and unit group"
	keywords:    "unit"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class QUANTIFIABLE

feature -- Access

	property: STRING
			-- physical property being measured by the unit, e.g. "length"
	     
	as_string:STRING
		deferred
		end

end


