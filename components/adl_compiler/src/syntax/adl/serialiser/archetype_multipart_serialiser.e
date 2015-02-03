note
	component:   "openEHR ADL Tools"
	description: "Parent of ADL multi-part serialisers, where serialisation is done by separate serialisation of pieces, followed by concatenation"
	keywords:    "serialisation, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_MULTIPART_SERIALISER

inherit
	ARCHETYPE_SERIALISER

feature -- Serialisation

	serialise_from_parts (an_archetype: ARCHETYPE;
			lang_serialised, desc_serialised, def_serialised,
			inv_serialised, ont_serialised,
			ann_serialised, comp_onts_serialised:  STRING)
		deferred
		end

	serialise_initialise
		deferred
		end

	serialise_archetype_id
		deferred
		end

	serialise_archetype_specialise
		deferred
		end

	serialise_finalise
		deferred
		end

end


