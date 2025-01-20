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

	make (an_archetype: like artefact_class_type)
			-- basic make routine to guarantee validity on creation
		local
			a_c_iterator: OG_CONTENT_ITERATOR
			c_p_factory: C_P_FACTORY
		do
			create archetype_id.make (an_archetype.archetype_id)
			parent_archetype_id := an_archetype.parent_archetype_id

			create c_p_factory.make (an_archetype)
			create a_c_iterator.make (an_archetype.definition.representation, c_p_factory)
			a_c_iterator.do_all
			definition := c_p_factory.p_c_object

			if attached an_archetype.rules as arch_rules then
				create rules.make (0)
				across arch_rules as arch_rules_csr loop
					rules.extend (create {P_ASSERTION}.make (arch_rules_csr.item))
				end
			end

			create terminology.make (an_archetype.terminology)
			is_generated := an_archetype.is_generated
			is_differential := an_archetype.is_differential
		end

feature -- Access

	archetype_id: detachable P_ARCHETYPE_HRID

	is_differential: BOOLEAN

	parent_archetype_id: detachable STRING
			-- id of specialisation parent of this archetype

	definition: detachable P_C_COMPLEX_OBJECT

	rules: detachable ARRAYED_LIST [P_ASSERTION]

	terminology: detachable P_ARCHETYPE_TERMINOLOGY

feature -- Status Report

	is_generated: BOOLEAN

	has_path (a_path: STRING): BOOLEAN
			-- True if `a_path' is found in resource; define in descendants
		do
		end

feature -- Factory

	create_archetype: detachable like artefact_class_type
		local
			o_archetype_id: ARCHETYPE_HRID
			arch_terminology: ARCHETYPE_TERMINOLOGY
			o_rules: ARRAYED_LIST [ASSERTION]
		do
			if attached archetype_id as att_aid
				and attached definition as o_definition
				and attached terminology as p_terminology
			then
				o_archetype_id := att_aid.create_archetype_hrid
				create arch_terminology.make_differential ((create {TERMINOLOGY_CODE}.default_create).code_string, o_definition.node_id)
				p_terminology.populate_terminology (arch_terminology)
				arch_terminology.finalise_dt

				if attached rules as att_rules then
					create o_rules.make (0)
					across att_rules as p_rules_csr loop
						o_rules.extend (p_rules_csr.item.create_assertion)
					end
				end

				create Result.make_all (
					o_archetype_id,
					parent_archetype_id,
					o_definition.create_c_complex_object,
					o_rules,
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

	artefact_class_type: ARCHETYPE
		do
			create Result
		end

end

