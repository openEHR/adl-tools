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

feature -- Access

	archetype_id: ARCHETYPE_HRID
			-- id of the archetype in the global archetype library

	rm_version: STRING = "1"
			-- relevant for exchange and implementations the version  of  the  RM  at  the  time  of creation
			-- of this archetyped object.

	access_control: ACCESS_GROUP_REF
			-- Access control settings for this archetyped structure

end



