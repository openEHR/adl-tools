note
	component:   "openEHR ADL Tools"
	description: "[
				 Interface class for ontologies in an archetype specialisation lineage. This is used
				 by other classes such as the serialisation class in order to serialise archetypes, 
				 providing access to the ontologies of the current archetype and all parents. This is 
				 needed because archetype terms from parent archetypes can be mentioned in any child.
				 ]"
	keywords:    "archetype, ontology, specialisation"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_LINEAGE_ONTOLOGY

inherit
	ARCHETYPE_TERM_CODE_TOOLS

create
	make

feature -- Initialisation

	make(an_ontology: ARCHETYPE_ONTOLOGY)
			-- make with the ontology of the current archetype (add parents later)
		require
			an_ontology /= Void and then an_ontology.is_differential
		do
			create ontologies.make(0)
			ontologies.put(an_ontology, an_ontology.specialisation_level)
		end

feature -- Access

	has_ontology(an_ontology: ARCHETYPE_ONTOLOGY): BOOLEAN
			-- check if the ontology object has already been added to the lineage
		require
			Ontology_valid: an_ontology /= Void
		do
			Result := ontologies.has_item(an_ontology)
		end

	has_specialisation_level(a_level: INTEGER): BOOLEAN
			-- check if the specialisation level is known in this ontology object
		require
			a_level >= 0
		do
			Result := ontologies.has(a_level)
		end

feature -- Modification

	add_ontology(an_ontology: ARCHETYPE_ONTOLOGY)
			-- add an ontology that is from a parent archetype of the original ontology used in make()
		require
			Ontology_valid: an_ontology /= Void and then an_ontology.is_differential
				and then not has_ontology(an_ontology)
				and then not has_specialisation_level(an_ontology.specialisation_level)
		do
			ontologies.put(an_ontology, an_ontology.specialisation_level)
		end

feature {NONE} -- Implementation

	ontologies: HASH_TABLE [ARCHETYPE_ONTOLOGY, INTEGER]

invariant
	Ontologies_valid: ontologies /= Void

end


