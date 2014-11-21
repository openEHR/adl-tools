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
	ARCHETYPE
		redefine
			make_flat_specialised, synchronise_adl, annotated_path
		end

create
	make_flat_specialised

feature -- Initialisation

	make_flat_specialised (a_diff, a_flat_parent: ARCHETYPE)
		do
			precursor (a_diff, a_flat_parent)
			create artefact_type.make_operational_template
		end

feature -- Access

	component_terminologies: HASH_TABLE [ARCHETYPE_TERMINOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier
		attribute
			create Result.make (0)
		end

feature -- Modification

	add_component_terminology (a_terminology: ARCHETYPE_TERMINOLOGY; an_archetype_id: STRING)
		require
			Archetype_id_attached: not an_archetype_id.is_empty
			Terminology_is_flat: a_terminology.is_flat
		do
			component_terminologies.put (a_terminology, an_archetype_id)
		end

feature -- Modification

	annotated_path (a_phys_path, a_language: STRING; with_codes: BOOLEAN): STRING
			-- generate a logical path in 'a_language' from a physical path
			-- if `with_code' then generate annotated form of each code, i.e. "code|text|"
		local
			id_code, log_str: STRING
			og_phys_path, og_log_path: OG_PATH
			ref_terminology: ARCHETYPE_TERMINOLOGY
		do
			ref_terminology := terminology
			create og_phys_path.make_from_string (a_phys_path)
			create og_log_path.make_from_other (og_phys_path)
			from
				og_phys_path.start
				og_log_path.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					id_code := og_phys_path.item.object_id
					if is_valid_id_code (id_code) and then ref_terminology.has_id_code (id_code) then
						if with_codes then
							log_str := annotated_code (id_code, ref_terminology.term_definition (a_language, id_code).text, "")
						else
							log_str := ref_terminology.term_definition (a_language, id_code).text
						end
						og_log_path.item.set_object_id (log_str)
					else
						og_log_path.item.set_object_id (id_code)
						if component_terminologies.has (og_phys_path.item.object_id) and then attached component_terminologies.item (og_phys_path.item.object_id) as att_ct then
							ref_terminology := att_ct
						end
					end
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		end

feature -- Serialisation

	synchronise_adl
			-- synchronise object representation of archetype to forms suitable for
			-- serialisation
		do
			precursor
			across component_terminologies as terminologies_csr loop
				terminologies_csr.item.synchronise_to_tree
			end
		end

end


