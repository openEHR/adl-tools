note
	component:   "openEHR ADL Tools"
	description: "Shared access to terminology"
	keywords:    "terminology, vocabulary, identifiers"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_TERMINOLOGY_SERVICE

feature -- Access

	ts: TERMINOLOGY_SERVICE
		once
			create Result
		end

end



