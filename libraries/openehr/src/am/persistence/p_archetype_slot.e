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
				create includes.make (0)
				across an_as.includes as includes_csr loop
					includes.extend (create {P_ASSERTION}.make (includes_csr.item))
				end
			end

			if not an_as.excludes.is_empty then
				create excludes.make (0)
				across an_as.excludes as excludes_csr loop
					excludes.extend (create {P_ASSERTION}.make (excludes_csr.item))
				end
			end

			is_closed := an_as.is_closed
		end

feature -- Access

	includes: detachable ARRAYED_LIST [P_ASSERTION]

	excludes: detachable ARRAYED_LIST [P_ASSERTION]

	is_closed: BOOLEAN

feature -- Factory

	create_archetype_slot: ARCHETYPE_SLOT
		do
			create Result.make (rm_type_name, node_id)
			populate_c_instance (Result)
			if attached includes as incls then
				across incls as p_includes_csr loop
					Result.add_include (p_includes_csr.item.create_assertion)
				end
			end
			if attached excludes as excls then
				across excls as p_excludes_csr loop
					Result.add_exclude (p_excludes_csr.item.create_assertion)
				end
			end
			if is_closed then
				Result.set_closed
			end
		end

end


