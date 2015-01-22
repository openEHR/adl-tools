note
	component:   "openEHR ADL Tools"
	description: "Source template abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
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
	make_empty_differential, make_empty_differential_child

feature -- Access

	overlays: HASH_TABLE [TEMPLATE_OVERLAY, STRING]
			-- table of overlays used in this template
		attribute
			create Result.make (0)
		end

feature -- Modification

	add_overlay (an_overlay: TEMPLATE_OVERLAY)
		do
			overlays.put (an_overlay, an_overlay.archetype_id.physical_id)
		end

end


