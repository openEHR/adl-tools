note
	component:   "openEHR Archetype Project"
	description: "Persistent form of archetype used for standard serialisations"
	keywords:    "archetype, persistence"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class P_ARCHETYPE

inherit
	AUTHORED_RESOURCE

	DT_CONVERTIBLE

create
	make, make_dt

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		do
		end

	make (an_archetype: ARCHETYPE)
			-- basic make routine to guarantee validity on creation
		do
			artefact_object_type := an_archetype.generating_type

			make_from_other (an_archetype)

			archetype_id := an_archetype.archetype_id.as_string
			adl_version := an_archetype.adl_version
			artefact_type := an_archetype.artefact_type.type_name

			if an_archetype.is_specialised then
				parent_archetype_id := an_archetype.parent_archetype_id.as_string
			end

			is_generated := an_archetype.is_generated

			uid := an_archetype.uid.value

			other_metadata := an_archetype.other_metadata

			create definition.make (an_archetype.definition)

			invariants := an_archetype.invariants

			create ontology.make (an_archetype.ontology)

			if attached {OPERATIONAL_TEMPLATE} an_archetype as opt and then attached opt.component_ontologies then
				create component_ontologies.make(0)
				across opt.component_ontologies as opt_comp_onts_csr loop
					component_ontologies.put (create {P_ARCHETYPE_ONTOLOGY}.make (opt_comp_onts_csr.item), opt_comp_onts_csr.key)
				end
			end
		end

feature -- Access

	artefact_object_type: detachable STRING
			-- records object model type of the original artefact

	archetype_id: detachable STRING

	other_metadata: detachable HASH_TABLE [STRING, STRING]

	adl_version: detachable STRING
			-- ADL version of this archetype

	artefact_type: detachable STRING
			-- design type of artefact, archetype, template, template-component, etc

	parent_archetype_id: detachable STRING
			-- id of specialisation parent of this archetype

	uid: detachable STRING

	definition: detachable P_C_COMPLEX_OBJECT

	invariants: detachable ARRAYED_LIST [ASSERTION]

	ontology: detachable P_ARCHETYPE_ONTOLOGY

	component_ontologies: detachable HASH_TABLE [P_ARCHETYPE_ONTOLOGY, STRING]

feature -- Status Report

	is_generated: BOOLEAN

	has_path (a_path: STRING): BOOLEAN
			-- True if `a_path' is found in resource; define in descendants
		do
		end

feature -- Factory

	create_archetype: detachable ARCHETYPE
		local
			o_parent_archetype_id, o_archetype_id: detachable ARCHETYPE_ID
			o_diff_arch_ont: DIFFERENTIAL_ARCHETYPE_ONTOLOGY
			o_flat_arch_ont: FLAT_ARCHETYPE_ONTOLOGY
			o_artefact_type: ARTEFACT_TYPE
			o_uid: detachable HIER_OBJECT_ID
		do
			if attached parent_archetype_id as pid then
				create o_parent_archetype_id.make_from_string (pid)
			end

			if attached archetype_id as aid and attached artefact_type as at and attached adl_version as o_adl_version and
				attached original_language as o_original_language and attached description as o_description and
				attached definition as o_definition and attached ontology as ont
			then
				create o_archetype_id.make_from_string (aid)
				create o_artefact_type.make_from_type_name (at)
				if attached uid as att_uid then
					create o_uid.make_from_string (att_uid)
				end

				if artefact_object_type.same_string ("DIFFERENTIAL_ARCHETYPE") then
					create o_diff_arch_ont.make (original_language.as_string, o_definition.node_id)
					ont.populate_ontology (o_diff_arch_ont)
					o_diff_arch_ont.finalise_dt

					create {DIFFERENTIAL_ARCHETYPE} Result.make_all (
						o_artefact_type,
						o_adl_version,
						o_archetype_id,
						o_parent_archetype_id,
						is_controlled,
						o_uid,
						other_metadata,
						o_original_language,
						translations,
						o_description,
						o_definition.create_c_complex_object,
						invariants,
						o_diff_arch_ont,
						annotations
					)

				else
					create o_flat_arch_ont.make (original_language.as_string, o_definition.node_id)
					ont.populate_ontology (o_flat_arch_ont)
					o_flat_arch_ont.finalise_dt

					create {FLAT_ARCHETYPE} Result.make_all (
						o_artefact_type,
						o_adl_version,
						o_archetype_id,
						o_parent_archetype_id,
						is_controlled,
						o_uid,
						other_metadata,
						o_original_language,
						translations,
						o_description,
						o_definition.create_c_complex_object,
						invariants,
						o_flat_arch_ont,
						annotations
					)
				end

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

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is p_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
