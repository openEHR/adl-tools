note
	component:   "openEHR ADL Tools"
	description: "Persistent form of archetype used for standard serialisations"
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_OPERATIONAL_TEMPLATE

inherit
	P_AUTHORED_ARCHETYPE
		redefine
			make, create_archetype, artefact_class_type
		end

create
	make, make_dt

feature -- Initialisation

	make (an_archetype: like artefact_class_type)
		do
			precursor (an_archetype)

			if attached an_archetype.component_terminologies then
				create component_terminologies.make(0)
				across an_archetype.component_terminologies as opt_comp_onts_csr loop
					component_terminologies.put (create {P_ARCHETYPE_TERMINOLOGY}.make (opt_comp_onts_csr.item), opt_comp_onts_csr.key)
				end
			end
		end

feature -- Access

	component_terminologies: detachable HASH_TABLE [P_ARCHETYPE_TERMINOLOGY, STRING]

feature -- Factory

	create_archetype: detachable like artefact_class_type
		local
			arch_terminology: ARCHETYPE_TERMINOLOGY
		do
			Result := precursor
			if attached component_terminologies as att_terminologies then
				across att_terminologies as terminologies_csr loop
					create arch_terminology.make_differential (terminologies_csr.item.original_language, Result.definition.node_id)
					terminologies_csr.item.populate_terminology (arch_terminology)
					arch_terminology.finalise_dt
					Result.add_component_terminology (arch_terminology, terminologies_csr.key)
				end
			end
		end

feature {NONE} -- Implementation

	artefact_class_type: OPERATIONAL_TEMPLATE
		do
			create Result
		end

end

