note
	component:   "openEHR ADL Tools"
	description: "Id-code extractor"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2024- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ID_CODE_REPORT

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
			Result := "Id_code_report"
		end

	title: STRING
		do
			Result := "Id-codes in library"
		end

	output_table: ARRAYED_LIST[TUPLE [arch_id, id_code, path, description, loinc_code: STRING]]
		once
			create Result.make(0)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	process_archetype (auth_ara: ARCH_LIB_AUTHORED_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			id_code, loinc_code: STRING
			terminology: ARCHETYPE_TERMINOLOGY
			path: OG_PATH
			binding_key, item_text: STRING
			finished: BOOLEAN
			locatable_descriptions: HASH_TABLE [STRING, STRING]
			concept_desc: IMMUTABLE_STRING
-- save_flag: BOOLEAN
		do
			if not attached {ARCH_LIB_TEMPLATE} auth_ara then
				terminology := auth_ara.differential_archetype.terminology
				create concept_desc.make_from_string (terminology.term_definition (Default_language, terminology.concept_code).text)

				-- find the language key
				check terminology.languages_available.has (Default_language) end

				locatable_descriptions := auth_ara.locatable_descriptions (True, False, Default_language, Text_field_delimiter)

				-- create a report row for each path, of the form: archetype_id, path, meaning
				across auth_ara.locatable_paths (True, False) as path_csr loop
					-- first work out if the path terminal node has a terminology defined code; if not, ignore it
					create path.make_from_string (path_csr.item)
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
						elseif terminology.has_term_binding (loinc_terminology_id, path_csr.item) then
							binding_key := path_csr.item
						end

						if not binding_key.is_empty then
							loinc_code.append (terminology.term_binding (loinc_terminology_id, binding_key).as_string)
						end

						-- build the text: start with archetype concept
						create item_text.make_from_string (concept_desc)
						if not path.is_root then
							if attached locatable_descriptions.item (path_csr.item) as desc then
								item_text.append (Text_field_delimiter + desc)
							else
								item_text.append (Text_field_delimiter + "(ITEM NOT FOUND}")
							end
						end

						output_table.extend ([auth_ara.id.as_string, id_code, path_csr.item, text_quote_agent.item([item_text]), loinc_code])
--if not loinc_code.is_empty then
--	terminology.remove_term_binding (binding_key, loinc_terminology_id)
--	terminology.put_term_binding (create {URI}.make_from_string (loinc_code), loinc_terminology_id, id_code)
--	save_flag := True
--end
					end
				end
--if save_flag then
--	auth_ara.save_differential_text
--end
			end
		end

end
