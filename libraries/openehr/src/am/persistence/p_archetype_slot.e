note
	component:   "openEHR ADL Tools"
	description: "Persistent form of ARCHETYPE_SLOT."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_ARCHETYPE_SLOT

inherit
	P_C_OBJECT
		redefine
			make
		end

create
	make

feature -- Initialisation

	make (an_as: ARCHETYPE_SLOT)
		do
			precursor (an_as)
			if not an_as.includes.is_empty then
				includes := an_as.includes
			end
			if not an_as.excludes.is_empty then
				excludes := an_as.excludes
			end
			is_closed := an_as.is_closed
		end

feature -- Access

	includes: detachable ARRAYED_LIST [ASSERTION]

	excludes: detachable ARRAYED_LIST [ASSERTION]

	is_closed: BOOLEAN

feature -- Factory

	create_archetype_slot: ARCHETYPE_SLOT
		do
			create Result.make (rm_type_name, node_id)
			populate_c_instance (Result)
			if attached includes as incls then
				Result.set_includes (incls)
			end
			if attached excludes as excls then
				Result.set_excludes (excls)
			end
			if is_closed then
				Result.set_closed
			end
		end

end


