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
			annotated_path, semantic_path
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

feature -- Paths

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

					-- id-code
					if is_valid_id_code (id_code) then
						-- id-code of object under container attribute: will be in terminology
						if ref_terminology.has_id_code (id_code) then
							if with_codes then
								log_str := annotated_code (id_code, ref_terminology.term_definition (a_language, id_code).text, "")
							else
								log_str := ref_terminology.term_definition (a_language, id_code).text
							end
							og_log_path.item.set_object_id (log_str)

						-- id-code of single-valued attribute - no terminology entry
						else
							og_log_path.item.set_object_id (id_code)
						end

					-- assume it is a OPT root point archetype id
					else
						og_log_path.item.set_object_id (id_code)
						check component_terminologies.has (id_code) and then attached component_terminologies.item (id_code) as att_ct then
							ref_terminology := att_ct
						end
					end
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		end

	semantic_path (a_phys_path, a_language: STRING): OG_PATH
			-- generate a logical path in 'a_language' from a physical path
			-- if `with_code' then generate annotated form of each code, i.e. "code|text|"
		local
			id_code, log_str: STRING
			og_phys_path: OG_PATH
			ref_terminology: ARCHETYPE_TERMINOLOGY
			an_arch_id: ARCHETYPE_HRID
		do
			ref_terminology := terminology
			create og_phys_path.make_from_string (a_phys_path)
			create Result.make_from_other (og_phys_path)

			-- generate a human-readable path from the physical path
			from
				og_phys_path.start
				Result.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					id_code := og_phys_path.item.object_id

					-- only use the object address if it is valid (it could be an archetype id) and
					-- b) in the terminology (for objects under single-valued attributes, this is optional)
					if is_valid_id_code (id_code) then
						-- it's a code of a child node of a container attribute, so must be in terminology
						if ref_terminology.has_id_code (id_code) then
							Result.item.set_object_id (ref_terminology.term_definition (a_language, id_code).text)
						else
							Result.item.clear_object_id
						end
					elseif archetype_id.valid_id (id_code) then
						create an_arch_id.make_from_string (id_code)
						Result.item.set_object_id (an_arch_id.concept_id)
						check component_terminologies.has (id_code) and then attached component_terminologies.item (id_code) as att_ct then
							ref_terminology := att_ct
						end
					else
						Result.item.clear_object_id
					end
				else
					Result.item.clear_object_id
				end
				og_phys_path.forth
				Result.forth
			end
		end

end


