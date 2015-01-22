note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an authored archetype in the archetype library."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_TEMPLATE

inherit
	ARCH_LIB_AUTHORED_ARCHETYPE
		redefine
			file_mgr, flat_archetype, differential_archetype, artefact_type
		end

create {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE}
	make_new_specialised, make

feature -- Identification

	artefact_type: ARTEFACT_TYPE
		once
			create Result.make_template
		end

feature -- Artefacts

	differential_archetype: detachable TEMPLATE

	flat_archetype: TEMPLATE
			-- inheritance-flattened form of archetype
		do
			check attached {TEMPLATE} precursor as flat_tpl then
				Result := flat_tpl
			end
		end

	operational_template: OPERATIONAL_TEMPLATE
			-- inheritance-flattened form of archetype
		require
			compilation_state = Cs_validated
		do
			if operational_template_cache = Void then
				expand
			end
			check attached operational_template_cache as fac then
				Result := fac
			end
		end

feature -- File Access

	file_mgr: TEMPLATE_PERSISTENCE_MGR

	clear_overlays
		do
			file_mgr.clear_overlays
		end

	add_overlay (an_ovl_adl_text, an_archetype_id: STRING)
		do
			file_mgr.add_overlay (an_ovl_adl_text, an_archetype_id)
		end

feature {NONE} -- Flattening

	expand
			-- expand by substitution of all references with their structures
		local
			fillers_index: HASH_TABLE [ARCHETYPE, STRING]
		do
			-- perform template filler substitution
			create fillers_index.make (0)
			across suppliers_index as supp_arch_csr loop
				fillers_index.put (supp_arch_csr.item.flat_archetype, supp_arch_csr.key)
			end
			template_flattener.execute (flat_archetype, fillers_index)
			operational_template_cache := template_flattener.template
		end

	operational_template_cache: detachable OPERATIONAL_TEMPLATE

end

