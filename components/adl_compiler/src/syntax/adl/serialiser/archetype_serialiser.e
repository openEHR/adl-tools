note
	component:   "openEHR ADL Tools"
	description: "Parent of all archetype serialisers."
	keywords:    "serialisation, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_SERIALISER

inherit
	ANY_SERIALISER

feature -- Serialisation

	serialise (an_archetype: ARCHETYPE)
		deferred
		end

feature {NONE} -- Access

	archetype: detachable ARCHETYPE
		note
			option: stable
		attribute
		end

end


