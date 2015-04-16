note
	component:   "openEHR ADL Tools"
	description: "parent of all XML serialisers"
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_XML_SERIALISER

inherit
	ARCHETYPE_SERIALISER

	ADL_2_TOKENS
		export
			{NONE} all
		end

	XML_SERIALISER_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Serialisation

	serialise (an_archetype: attached ARCHETYPE)
		do
		end

end


