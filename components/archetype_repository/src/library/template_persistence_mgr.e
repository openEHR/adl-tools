note
	component:   "openEHR ADL Tools"
	description: "Version of persistence manager that implements functions for template overlays"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TEMPLATE_PERSISTENCE_MGR

inherit
	AUTH_ARCH_PERSISTENCE_MGR

create {ARCH_LIB_TEMPLATE}
	make, make_legacy, make_new_archetype

feature -- Access

	source_text_for_overlay (an_arch_id: STRING): STRING
			-- extract source text of overlay with id `an_arch_id' from source text of template
		do
			create Result.make_empty
		end

end

