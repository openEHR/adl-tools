note
	component:   "openEHR ADL Tools"
	description: "Parent of root classes whose construction is mediated by archetypes."
	keywords:    "archetype"

	design:      "openEHR Common Reference Model 2.0"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPED

create
	make

feature -- Initialisation

	make (an_archetype_id: STRING)
		do
			create archetype_id.make_from_string (an_archetype_id)
		end

feature -- Access

	archetype_id: ARCHETYPE_ID
			-- id of the archetype in the global archetype library

	rm_version: STRING = "1"
			-- relevant for exchange and implementations the version  of  the  RM  at  the  time  of creation
			-- of this archetyped object.

	access_control: detachable ACCESS_GROUP_REF
			-- Access control settings for this archetyped structure

end



