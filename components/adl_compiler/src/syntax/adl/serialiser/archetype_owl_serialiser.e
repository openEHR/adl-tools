note
	component:   "openEHR ADL Tools"
	description: "OWL archetype serialiser"
	keywords:    "serialisation, OWL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ARCHETYPE_OWL_SERIALISER

inherit
	ARCHETYPE_MULTIPART_SERIALISER

create
	make

feature -- Serialisation

	serialise (an_archetype: attached ARCHETYPE)
		do
		end

	serialise_from_parts (an_archetype: attached ARCHETYPE;
				lang_serialised, desc_serialised, def_serialised: attached STRING;
				inv_serialised: STRING;
				ont_serialised: attached STRING;
				ann_serialised, comp_onts_serialised: STRING)
		do
			archetype := an_archetype

			serialise_initialise
			serialise_archetype_id
			serialise_archetype_specialise
			serialise_archetype_concept

			if not desc_serialised.is_empty then
				last_result.append(desc_serialised)
			end

			if not def_serialised.is_empty then
				last_result.append(def_serialised)
			end

			if attached inv_serialised then
				last_result.append(inv_serialised)
			end

			if not ont_serialised.is_empty then
				last_result.append(ont_serialised)
			end

			if attached ann_serialised then
				last_result.append(ann_serialised)
			end

			if attached comp_onts_serialised then
				last_result.append(comp_onts_serialised)
			end

			serialise_finalise
		end

	serialise_initialise
		do
			last_result.append("Namespace(rdf = http://www.w3.org/1999/02/22-rdf-syntax-ns#)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(xsd = http://www.w3.org/2001/XMLSchema:)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(rdfs = http://www.w3.org/2000/01/rdf-schema:)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(rdfs = http://www.w3.org/2002/07/owl#)")
			last_result.append(format_item(FMT_NEWLINE))

			last_result.append("Namespace(ba = http://www.openEHR.org/base_archetype#)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(rm = http://www.openEHR.org/rm/release0.9#)")
			last_result.append(format_item(FMT_NEWLINE))
		end

	serialise_archetype_id
		do
			last_result.append("Namespace(this = http://archetypes.org/" + target.archetype_id.as_string + "#)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Ontology (")
			last_result.append(format_item(FMT_NEWLINE))
		end

	serialise_archetype_concept
		do
		end

	serialise_archetype_specialise
		do
		end

	serialise_finalise
		do
			last_result.append(")")
			last_result.append(format_item(FMT_NEWLINE))
		end

end


