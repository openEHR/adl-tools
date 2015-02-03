note
	component:   "openEHR ADL Tools"
	description: "Editor stub class for ARCH_LIB_ARCHETYPE in non-GUI builds"
	keywords:    "ADL, archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ALA_EDITOR_STATE

create
	make

feature -- Initialisation

	make (aca: ARCH_LIB_ARCHETYPE_ITEM)
		do
			target := aca
		end

feature -- Access

	target: ARCH_LIB_ARCHETYPE_ITEM

feature -- Commands

	on_commit
		do

		end

end



