note
	component:   "openEHR ADL Tools"
	description: "Editor context for a C_ARCHETYPE_ROOT"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT_ED_CONTEXT

inherit
	C_COMPLEX_OBJECT_ED_CONTEXT
		redefine
			arch_node, rm_properties
		end

create
	make

feature -- Initialisation

feature -- Access

	arch_node: detachable C_ARCHETYPE_ROOT
			-- archetype node being edited

	rm_properties: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			create Result.make (0)
		end

feature -- Modification


end


