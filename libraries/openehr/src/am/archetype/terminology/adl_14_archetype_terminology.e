note
	component:   "openEHR ADL Tools"
	description: "[
				 ADL 1.4 terminology class; used only to materialise ADL 1.4 style ontology section 
				 prior to conversion to ADL 1.5 terminology
				 ]"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ADL_14_ARCHETYPE_TERMINOLOGY

inherit
	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

create 
	make_dt

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- assumed args are <<original_language, concept_code>>
		do
			if attached {STRING} make_args[1] as str then
				original_language := str
			end
			if attached {STRING} make_args[2] as str then
				concept_code := str
			end
		end

feature -- Access

	original_language:  STRING
			-- original language of the terminology, as set at archetype creation or parsing time; must
			-- be a code in the ISO 639-1 2 character language code-set.

	concept_code: STRING
			-- term code of the concept of the terminology as a whole

	term_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	constraint_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	term_bindings: HASH_TABLE [HASH_TABLE [TERMINOLOGY_CODE, STRING], STRING]
			-- tables of bindings of external terms to internal codes and/or paths, keyed by external terminology id
        attribute
            create Result.make (0)
        end

	constraint_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology
        attribute
            create Result.make (0)
        end

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation
		do
			sync_stored_properties
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("term_definitions")
			Result.extend ("constraint_definitions")
			Result.extend ("term_bindings")
			Result.extend ("constraint_bindings")
		end

end


