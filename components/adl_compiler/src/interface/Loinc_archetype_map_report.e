note
	component:   "openEHR ADL Tools"
	description: "LOINC to archetype id map"
	keywords:    "export, archetype, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2015- openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class LOINC_ARCHETYPE_MAP_REPORT

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
			Result := "Loinc_archetype_id_map"
		end

	title: STRING
		do
			Result := "LOINC to Archetype id map"
		end

	output_table: ARRAYED_LIST [TUPLE [loinc_code, arch_id, id_code, path, description: STRING]]
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
					-- or else the whole path is bound
					create binding_key.make_empty
					create loinc_code.make_empty
					if terminology.has_term_binding (loinc_terminology_id, id_code) then
						binding_key := id_code
					elseif terminology.has_term_binding (loinc_terminology_id, path_csr.item) then
						binding_key := path_csr.item
					end

					if not binding_key.is_empty then
						loinc_code.append (terminology.term_binding (loinc_terminology_id, binding_key).as_string)

						-- build the text: start with archetype concept
						create item_text.make_from_string (concept_desc)
						if not path.is_root then
							if attached locatable_descriptions.item (path_csr.item) as desc then
								item_text.append (Text_field_delimiter + desc)
							else
								item_text.append (Text_field_delimiter + "(ITEM NOT FOUND}")
							end
						end

						output_table.extend ([loinc_code, auth_ara.id.as_string, id_code, path_csr.item, text_quote_agent.item([item_text])])
					end
				end
			end
		end

	process_archetype2 (auth_ara: ARCH_LIB_AUTHORED_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			flat_terminology: ARCHETYPE_TERMINOLOGY
			binding_key, binding_text: STRING
			binding_path: OG_PATH
			locatable_descriptions: HASH_TABLE [STRING, STRING]
		do
			flat_terminology := auth_ara.flat_archetype.terminology

			-- find the language key
			check flat_terminology.languages_available.has (Default_language) end

			locatable_descriptions := auth_ara.locatable_descriptions (True, False, Default_language, Text_field_delimiter)

			-- process any LOINC codes inside terminology
			across flat_terminology.term_bindings_for_terminology (Loinc_terminology_id) as bindings_csr loop

				-- we ignore at-codes
--				if not is_value_code (binding_key) then

--					-- here we figure out which id-code the binding key corresponds to. There are 3 possibilities:
--					--      * an id-code
--					--      * the root path '/', which means the code is the concept code from the terminology
--					--		* a path containing one or more id-codes
--					binding_key := bindings_csr.key
--					if is_id_code (binding_key) then
--						binding_text := flat_terminology.term_definition (Default_language, bindings_csr.key).text

--					-- assume path
--					else
--						create binding_path.make_from_string (binding_key)
--						if binding_path.is_root then
--							binding_text := flat_terminology.term_definition (Default_language, flat_terminology.concept_code).text
--						else
--							create binding_text.make_empty
--							across binding_path as path_csr loop
--								if is_id_code (path_csr.item.object_id) then
--									if flat_terminology.has_code (path_csr.item.object_id) then
--										binding_text.append (flat_terminology.term_definition (Default_language, path_csr.item.object_id).text)
--									else
--										binding_text.append (path_csr.item.attr_name)
--									end
--								end
--								if not path_csr.is_last then
--									binding_text.append ("/")
--								end
--							end
--						end
--					end
--					output_table.extend ([bindings_csr.item.as_string, auth_ara.id.as_string, bindings_csr.key, text_quote_agent.item([binding_text])])
--				end
			end
		end

end
