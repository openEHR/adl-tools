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
		require
			has_overlay (an_arch_id)
		do
			if attached overlay_texts.item (an_arch_id) as att_text then
				Result := att_text
			else
				create Result.make_empty
			end
		end

feature -- Status_report

	has_overlay (an_arch_id: STRING): BOOLEAN
			-- True if there is an overlay with id `an_arch_id'
		do
			Result := overlay_texts.has (an_arch_id)
		end

feature -- Commands

	clear_overlays
		do
			overlay_texts.wipe_out
		end

	add_overlay (an_ovl_adl_text, an_archetype_id: STRING)
		do
			overlay_texts.put (an_ovl_adl_text, an_archetype_id)
		end

feature {NONE} -- Implementation

	overlay_texts: HASH_TABLE [STRING, STRING]
			-- table of overlay ADL text,keyed by Archetype id
		attribute
			create Result.make (0)
		end

end

