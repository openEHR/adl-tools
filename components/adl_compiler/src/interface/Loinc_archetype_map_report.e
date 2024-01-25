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
			output_table, initialise
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

feature -- Definitions

	id: STRING
		do
			Result := "Loinc_archetype_id_map"
		end

	title: STRING
		do
			Result := "LOINC to Archetype id map"
		end

	output_table: HASH_TABLE[TUPLE [arch_id, path, description: STRING], STRING]
		once
			create Result.make(0)
		end

feature {ARCHETYPE_REPORTER} -- Processing

	initialise
		do
			output_table.wipe_out
		end

	process_archetype (auth_ara: ARCH_LIB_AUTHORED_ARCHETYPE)
			-- Generate serialised output under `output_dir' from `ara', optionally building it first if necessary.
		local
			loinc_code: STRING
			flat_terminology: ARCHETYPE_TERMINOLOGY
			binding_key, binding_text: STRING
			binding_path: OG_PATH
		do
			flat_terminology := auth_ara.flat_archetype.terminology

			-- find the language key
			check flat_terminology.languages_available.has (Default_language) end

			-- Get the LOINC code for the archetype as a whole (= root node = concept code)
--			loinc_code := flat_terminology.term_binding_for_concept_code (Loinc_terminology_id)
--			if not loinc_code.is_empty then
--				output_table.put ([auth_ara.id.as_string, flat_terminology.concept_code, flat_terminology.term_definition (Default_language, flat_terminology.concept_code).text], loinc_code)
--			end

			-- process any LOINC codes inside terminology
			across flat_terminology.term_bindings_for_terminology (Loinc_terminology_id) as bindings_csr loop

				-- here we figure out which id-code the binding key corresponds to. There are 3 possibilities:
				--      * an id-code (DEPRECATED)
				--      * the root path '/', which means the code is the concept code from the terminology
				--		* a path containing one or more id-codes
				binding_key := bindings_csr.key
				if is_id_code (binding_key) then
					binding_text := flat_terminology.term_definition (Default_language, bindings_csr.key).text
				else
					-- assume path
					create binding_path.make_from_string (binding_key)
					if binding_path.is_root then
						binding_text := flat_terminology.term_definition (Default_language, flat_terminology.concept_code).text
					else
						create binding_text.make_empty
						across binding_path as path_csr loop
							if is_id_code (path_csr.item.object_id) then
								binding_text.append (flat_terminology.term_definition (Default_language, path_csr.item.object_id).text)
							end
							if not path_csr.is_last then
								binding_text.append ("/")
							end
						end
					end
				end
				output_table.put ([auth_ara.id.as_string, bindings_csr.key, binding_text], bindings_csr.item.as_string)
			end
		end

end
