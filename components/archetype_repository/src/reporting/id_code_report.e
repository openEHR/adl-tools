note
	component:   "openEHR ADL Tools"
	description: "Id-code extractor"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class LIBRARY_ELEMENTS_REPORT

inherit
	ARCHETYPE_LIBRARY_REPORT
		export
			{NONE} all
		redefine
			output_table
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Access

	id: STRING
		do
			Result := "library_elements_report"
		end

	title: STRING
		do
			Result := "All id-coded nodes in archetype library"
		end

	output_table: ARRAYED_LIST[TUPLE [arch_id, id_code, path, use_ref, description, loinc_code: READABLE_STRING_8]]
		once
			create Result.make(0)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	process_archetype (auth_ara: ARCH_LIB_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			id_code, loinc_code: STRING
			terminology: ARCHETYPE_TERMINOLOGY
			path: OG_PATH
			binding_key, item_text: STRING
			finished: BOOLEAN
			locatable_descriptions: HASH_TABLE [STRING, STRING]
			concept_desc: IMMUTABLE_STRING
			use_ref: STRING
		do
			if not (attached {ARCH_LIB_TEMPLATE} auth_ara or attached {ARCH_LIB_TEMPLATE_OVERLAY} auth_ara) then
				terminology := auth_ara.differential_archetype.terminology
				create concept_desc.make_from_string (terminology.term_definition (Default_language, terminology.concept_code).text)

				-- find the language key
				check terminology.languages_available.has (Default_language) end

				locatable_descriptions := auth_ara.locatable_descriptions (True, False, Default_language, Text_field_delimiter)

				-- create a report row for each path, of the form: archetype_id, path, meaning
				across auth_ara.locatable_path_map (True, False) as path_csr loop
					-- first work out if the path terminal node has a terminology defined code; if not, ignore it
					create path.make_from_string (path_csr.key)
					if path.is_root then
						id_code := terminology.concept_code
					else
						id_code := path.last.object_id
					end

					-- if the terminal id-code in the path is defined in the terminology,
					-- we keep it, else we ignore this path
					if terminology.has_code (id_code) then
						create loinc_code.make_empty
						create binding_key.make_empty
						if terminology.has_term_binding (loinc_terminology_id, id_code) then
							binding_key := id_code
						elseif terminology.has_term_binding (loinc_terminology_id, path_csr.key) then
							binding_key := path_csr.key
						end

						if not binding_key.is_empty then
							loinc_code.append (terminology.term_binding (loinc_terminology_id, binding_key).as_string)
						end

						-- build the text: start with archetype concept
						create item_text.make_from_string (concept_desc)
						if not path.is_root then
							if attached locatable_descriptions.item (path_csr.key) as desc then
								item_text.append (Text_field_delimiter + desc)
							else
								item_text.append (Text_field_delimiter + "(ITEM NOT FOUND}")
							end
						end

						-- if it is a C_ARCHETYPE_ROOT node, get the reference
						create use_ref.make_empty
						if attached {C_ARCHETYPE_ROOT} path_csr.item as car then
							if attached current_library.archetype_matching_ref (car.archetype_ref) as att_ala then
								use_ref.append (att_ala.id.as_string)
							else
								use_ref.append ("ERR: unmatched use_reference")
							end
						end

						output_table.extend ([auth_ara.id.as_string, id_code, path_csr.key, use_ref, text_quote_agent.item([item_text]), loinc_code])
					end
				end
			end
		end

end
