note
	component:   "openEHR ADL Tools"
	description: "Operational template abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OPERATIONAL_TEMPLATE

inherit
	FLAT_ARCHETYPE
		redefine
			make_specialised, synchronise_adl15
		end

create
	make_specialised

feature -- Initialisation

	make_specialised (a_diff: DIFFERENTIAL_ARCHETYPE; a_flat_parent: FLAT_ARCHETYPE)
		do
			precursor (a_diff, a_flat_parent)
			create artefact_type.make_operational_template
		end

feature -- Access

	component_terminologies: HASH_TABLE [FLAT_ARCHETYPE_TERMINOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier
		attribute
			create Result.make (0)
		end

feature -- Modification

	add_component_terminology (a_terminology: FLAT_ARCHETYPE_TERMINOLOGY; an_archetype_id: STRING)
		require
			Archetype_id_attached: not an_archetype_id.is_empty
		do
			component_terminologies.put (a_terminology, an_archetype_id)
		end

feature -- Serialisation

	synchronise_adl15
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			precursor
			across component_terminologies as terminologies_csr loop
				terminologies_csr.item.synchronise_to_tree
			end
		end

end


