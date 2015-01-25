note
	component:   "openEHR ADL Tools"
	description: "Persistent form of archetype used for standard serialisations"
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_ARCHETYPE

inherit
	DT_CONVERTIBLE

create
	make, make_dt

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		do
		end

	make (an_archetype: like artefact_type)
			-- basic make routine to guarantee validity on creation
		do
			artefact_object_type := an_archetype.generating_type
			create archetype_id.make (an_archetype.archetype_id)
			parent_archetype_id := an_archetype.parent_archetype_id
			create definition.make (an_archetype.definition)
			rules := an_archetype.rules
			create terminology.make (an_archetype.terminology)
			is_generated := an_archetype.is_generated
		end

feature -- Access

	artefact_object_type: detachable STRING
			-- records object model type of the original artefact

	archetype_id: detachable P_ARCHETYPE_HRID

	parent_archetype_id: detachable STRING
			-- id of specialisation parent of this archetype

	definition: detachable P_C_COMPLEX_OBJECT

	rules: detachable ARRAYED_LIST [ASSERTION]

	terminology: detachable P_ARCHETYPE_TERMINOLOGY

feature -- Status Report

	is_generated: BOOLEAN

	has_path (a_path: STRING): BOOLEAN
			-- True if `a_path' is found in resource; define in descendants
		do
		end

feature -- Factory

	create_archetype: detachable like artefact_type
		local
			o_archetype_id: detachable ARCHETYPE_HRID
			arch_terminology: ARCHETYPE_TERMINOLOGY
		do
			if attached archetype_id as att_aid
				and attached definition as o_definition
				and attached terminology as p_terminology
			then
				create o_archetype_id.make_from_string (att_aid.physical_id)
				create arch_terminology.make_differential ((create {TERMINOLOGY_CODE}.default_create).code_string, o_definition.node_id)
				p_terminology.populate_terminology (arch_terminology)
				arch_terminology.finalise_dt

				create Result.make_all (
					o_archetype_id,
					parent_archetype_id,
					o_definition.create_c_complex_object,
					rules,
					arch_terminology
				)

				if is_generated then
					Result.set_is_generated
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

feature {NONE} -- Implementation

	artefact_type: ARCHETYPE
		do
			create Result
		end

end

