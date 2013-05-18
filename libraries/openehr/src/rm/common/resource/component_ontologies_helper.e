note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper class containing just the component_ontologies part of an OPERATIONAL_TEMPLATE.
				 Used to facilitate serialisation until ADL2 dADL serialisation is adopted.
				 ]"
	keywords:    "helper, serialisation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class COMPONENT_ONTOLOGIES_HELPER

inherit
	DT_CONVERTIBLE

create
	make, make_dt

feature -- Initialisation

	make
			-- default make
		do
		end

	make_dt (make_args: ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

feature -- Access

	component_ontologies: HASH_TABLE [FLAT_ARCHETYPE_ONTOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier
		attribute
			create Result.make (0)
		end

feature -- Modification

	set_component_ontologies (comp_onts: like component_ontologies)
		do
			component_ontologies := comp_onts
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("component_ontologies")
		end

end


