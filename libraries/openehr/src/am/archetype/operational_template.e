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

	component_ontologies: HASH_TABLE [FLAT_ARCHETYPE_ONTOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier
		attribute
			create Result.make (0)
		end

feature -- Modification

	add_component_ontology (an_ontology: attached FLAT_ARCHETYPE_ONTOLOGY; an_archetype_id: attached STRING)
		require
			Archetype_id_attached: not an_archetype_id.is_empty
		do
			component_ontologies.put (an_ontology, an_archetype_id)
		end

feature -- Serialisation

	synchronise_adl15
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			precursor
			from component_ontologies.start until component_ontologies.off loop
				component_ontologies.item_for_iteration.synchronise_to_tree
				component_ontologies.forth
			end
		end

end


