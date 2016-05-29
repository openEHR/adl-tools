note
	component:   "openEHR ADL Tools"
	description: "Version of persistence manager that implements functions for template overlays"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TPL_OVL_PERSISTENCE_MGR

inherit
	ARCH_PERSISTENCE_MGR

create {ARCH_LIB_TEMPLATE_OVERLAY}
	make

feature {NONE} -- Initialisation

	make (an_archetype_id: ARCHETYPE_HRID; a_tpl_pers_mgr: TEMPLATE_PERSISTENCE_MGR)
		do
			id := an_archetype_id
			tpl_pers_mgr := a_tpl_pers_mgr
		end

feature -- Access

	source_text: STRING
		do
			Result := tpl_pers_mgr.source_text_for_overlay (id.physical_id)
		end

	source_id: STRING
			-- a reliable identifier for the source
		do
			create Result.make_from_string (tpl_pers_mgr.source_id + ": " + id.physical_id)
		end

feature -- Thumbnail state

	artefact_type: ARTEFACT_TYPE
			-- type of artefact i.e. archetype, template, template_component, operational_template
			-- known in file on disk at least read
		once
			create Result.make_template_overlay
		end

	adl_version: STRING
		do
			Result := tpl_pers_mgr.adl_version
		end

feature -- Status Report

	is_adhoc: BOOLEAN
			-- True if this is an adhoc archetype
		do
			Result := tpl_pers_mgr.is_adhoc
		end

	has_source: BOOLEAN
		do
			Result := tpl_pers_mgr.has_source
		end

	is_source_modified: BOOLEAN
			-- Should this archetype be recompiled due to changes on the file system?
		do
			Result := tpl_pers_mgr.is_source_modified
		end

feature -- File Operations

	refresh_from_source
			-- refresh from disk files that have been modified externally
		do
			tpl_pers_mgr.refresh_from_source
		end

feature {NONE} -- Implementation

	tpl_pers_mgr: TEMPLATE_PERSISTENCE_MGR

end

