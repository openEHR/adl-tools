note
	component:   "openEHR ADL Tools"
	description: "test object for method dispatcher tests"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SUB_PART

create
	make

feature -- Initialisation

	make(a_name:STRING)
		do
		    name := a_name
		end

feature -- Access

	name:STRING

end
