note
	component:   "openEHR ADL Tools"
	description: "Source template abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TEMPLATE

inherit
	AUTHORED_ARCHETYPE

create
	default_create

create {ARCHETYPE_FLATTENER}
	make_from_other

create {ADL_14_ENGINE, ARCHETYPE}
	make

create {ADL_2_ENGINE, P_ARCHETYPE}
	make_all

create {ARCH_LIB_ARCHETYPE}
	make_empty_differential, make_empty_differential_child, make_dt

feature -- Access

	overlays: ARRAYED_LIST [STRING]
			-- table of overlay archetype ids used in this template
		attribute
			create Result.make (0)
		end

feature -- Modification

	clear_overlays
		do
			overlays.wipe_out
		end

	add_overlay (an_overlay_id: STRING)
		do
			overlays.extend (an_overlay_id)
		end

	set_overlays (an_overlays: like overlays)
		do
			overlays := an_overlays
		end

end


