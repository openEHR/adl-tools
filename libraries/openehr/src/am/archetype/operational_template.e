note
	component:   "openEHR ADL Tools"
	description: "Operational template abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OPERATIONAL_TEMPLATE

inherit
	AUTHORED_ARCHETYPE
		redefine
			annotated_path, persistent_attributes
		end

create
	default_create, make_from_other

feature -- Access

	component_terminologies: HASH_TABLE [ARCHETYPE_TERMINOLOGY, STRING]
			-- Compendium of flattened ontologies of all archetypes/templates used in this
			-- archetype/template, keyed by identifier
		attribute
			create Result.make (0)
		end

	component_terminology (an_archetype_id: STRING): ARCHETYPE_TERMINOLOGY
			-- terminology for `an_archetype_id'
		require
			has_component_terminology (an_archetype_id)
		do
			check attached component_terminologies.item (an_archetype_id) as att_terminology then
				Result := att_terminology
			end
		end

feature -- Access

	has_component_terminology (an_archetype_id: STRING): BOOLEAN
			-- True if there is a component terminology for `an_archetype_id'
		do
			Result := component_terminologies.has (an_archetype_id)
		end

feature -- Modification

	add_component_terminology (a_terminology: ARCHETYPE_TERMINOLOGY; an_archetype_id: STRING)
		require
			Archetype_id_attached: not an_archetype_id.is_empty
			Terminology_is_flat: a_terminology.is_flat
		do
			component_terminologies.put (a_terminology, an_archetype_id)
		end

	merge_component_terminologies (other_opt: OPERATIONAL_TEMPLATE)
			-- merge component terminologies from `other_opt'
		do
			component_terminologies.merge (other_opt.component_terminologies)
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

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("uid")
			Result.extend ("rm_release")
			Result.extend ("build_uid")
			Result.extend ("adl_version")
			Result.extend ("is_generated")
			Result.extend ("original_language")
			Result.extend ("translations")
			Result.extend ("description")

			Result.extend ("archetype_id")
			Result.extend ("parent_archetype_id")
			Result.extend ("is_differential")
			Result.extend ("is_generated")
			Result.extend ("definition")
			Result.extend ("artefact_type")
			Result.extend ("rules")
			Result.extend ("terminology")

			Result.extend ("annotations")

			Result.extend ("component_terminologies")
		end
end


