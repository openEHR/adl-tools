note
	component:   "openEHR ADL Tools"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class FLAT_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			terminology
		end

create
	make, make_all, make_from_other

create {ARCHETYPE_FLATTENER}
	make_specialised, make_non_specialised

feature {ARCHETYPE_FLATTENER} -- Initialisation

	make_non_specialised (a_diff: DIFFERENTIAL_ARCHETYPE)
			-- initialise from a differential archetype
		do
			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin,
					a_diff.uid,
					a_diff.description.safe_deep_twin,
					a_diff.definition.deep_twin, a_diff.terminology.to_flat)
			if attached a_diff.translations as a_diff_trans then
				translations := a_diff_trans.deep_twin
			end
			if attached a_diff.rules as a_diff_invs then
				rules := a_diff_invs.deep_twin
			end
			if attached a_diff.annotations as a_diff_annots then
				annotations := a_diff_annots.safe_deep_twin
			end
			rebuild
			is_generated := True
		ensure
			Generated: is_generated
			Top_level: not is_specialised
		end

	make_specialised (a_diff: DIFFERENTIAL_ARCHETYPE; a_flat_parent: FLAT_ARCHETYPE)
			-- initialise from a differential archetype and its flat parent, as preparation
			-- for generating a flat archetype. The following items from the differential are used:
			-- 	* artefact_type
			--	* archetype_id
			--	* uid
			--	* original_language
			--	* translations
			--
			-- The following items from the flat parent:
			-- 	* definition (with root node id from differential definition)
			--  * terminology !!! with languages removed that are not in the orig_lang/translations of the diff
			-- 	* rules
			--	* annotations
			--
		local
			desc: like description
			flat_treminology: FLAT_ARCHETYPE_TERMINOLOGY
		do
			-- basic identifying info, and language from from child
			-- definition comes from parent, waiting for flattening of child on top
			-- ontology comes from child, waiting for parent items to be merged on top
			if attached a_diff.description as orig_desc then
				desc := orig_desc.safe_deep_twin
			end

			flat_treminology := a_flat_parent.terminology.deep_twin
			flat_treminology.reduce_languages_to (a_diff.languages_available)

			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin, a_diff.uid, desc,
					a_flat_parent.definition.deep_twin,
					flat_treminology)
			definition.set_node_id (a_diff.definition.node_id.twin)

			-- other metadata is created from parent, with child meta-data
			-- merged on top, overwriting any values of the same key
			other_metadata := a_flat_parent.other_metadata

			-- translations are what is available in the child archetype
			if attached a_diff.translations as a_diff_trans then
				translations := a_diff_trans.deep_twin
			end

			-- invariants starts with what is in the parent archetype and
			-- child invariants are merged
			if attached a_flat_parent.rules as parent_invs then
				rules := parent_invs.deep_twin
			end

			-- annotations starts with what is in the parent archetype and
			-- child annotations are merged
			if attached a_flat_parent.annotations as parent_annots then
				annotations := parent_annots.safe_deep_twin
			end

			rebuild
			is_generated := True
		ensure
			Generated: is_generated
			Specialised: is_specialised
		end

feature -- Access

	terminology: FLAT_ARCHETYPE_TERMINOLOGY

end


