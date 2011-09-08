note
	component:   "openEHR Reusable Libraries"
	description: "test object for method dispatcher tests"
	keywords:    "test, method dispatcher"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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
