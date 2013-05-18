note
	component:   "openEHR ADL Tools"
	description: "Serialiser Manager for all ADL serialiser types"
	keywords:    "test, CADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_SERIALISER_MGR

inherit
	SHARED_ARCHETYPE_SERIALISERS

create
	make

feature -- Initialisation

	make (an_archetype: ARCHETYPE; format: STRING)
			-- create a new manager targetted to the ADL archetype 'a_target'
		require
			Format_valid: has_archetype_serialiser_format (format)
		do
			target := an_archetype
			serialiser := archetype_serialiser_for_format (format)
			serialiser.reset
		end

feature -- Command

	serialise (lang_serialised, desc_serialised, def_serialised: STRING; inv_serialised: STRING; ont_serialised: STRING; ann_serialised, comp_onts_serialised: STRING)
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			serialiser.serialise_from_parts (target, lang_serialised, desc_serialised, def_serialised, inv_serialised, ont_serialised, ann_serialised, comp_onts_serialised)
		end

feature -- Access

	target: ARCHETYPE

	last_result: STRING
		do
			Result := serialiser.last_result
		end

feature {NONE} -- Implementation

	serialiser: ARCHETYPE_MULTIPART_SERIALISER

end


