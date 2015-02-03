note
	component:   "openEHR ADL Tools"
	description: "Source template overlay abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TEMPLATE_OVERLAY

inherit
	ARCHETYPE

create
	default_create

create {ADL_14_ENGINE, ADL_2_ENGINE, ARCHETYPE}
	make

create {P_ARCHETYPE}
	make_all

create {ARCH_LIB_ARCHETYPE}
	make_empty_differential, make_empty_differential_child

end


