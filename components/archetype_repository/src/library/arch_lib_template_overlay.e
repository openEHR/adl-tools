note
	component:   "openEHR ADL Tools"
	description: "Descriptor of an authored archetype in the archetype library."
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_LIB_TEMPLATE_OVERLAY

inherit
	ARCH_LIB_ARCHETYPE
		redefine
			file_mgr, differential_archetype
		end

create {ADL_2_ENGINE}
	make

create {ARCHETYPE_LIBRARY, ARCHETYPE_LIBRARY_SOURCE}
	make_new

feature {NONE} -- Initialisation

	make (an_id: ARCHETYPE_HRID; a_parent_ref: STRING; alt: ARCH_LIB_TEMPLATE)
			-- Create empty, with connector to template represented by `alt'
		require
			Valid_id: has_rm_for_archetype_id (an_id)
		do
			-- basic state
			id := an_id
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)
			create last_compile_attempt_timestamp.make_now

			-- archetype state
			parent_ref := a_parent_ref

			-- create file workflow state
			create file_mgr.make (id, alt.file_mgr)

			reset
			compilation_state := Cs_lineage_known
			template := alt
		ensure
			Id_set: id = an_id
			Parent_id_set: parent_ref = a_parent_ref
			Compilation_state: compilation_state = Cs_lineage_known
		end

	make_new (an_id: ARCHETYPE_HRID; a_parent: ARCHETYPE; alt: ARCH_LIB_TEMPLATE)
			-- Create a new overlay in template represented by `alt'
		require
			Valid_id: has_rm_for_archetype_id (an_id)
			Valid_parent: a_parent.is_differential
		local
			a_diff_arch: attached like differential_archetype
		do
			id := an_id
			create status.make_empty
			create last_modify_timestamp.make_from_epoch (0)
			create last_compile_attempt_timestamp.make_now

			-- archetype state
			create a_diff_arch.make_empty_differential_child (a_parent.specialisation_depth + 1, an_id, a_parent.archetype_id.semantic_id, locale_language_short)
			differential_archetype := a_diff_arch
			parent_ref := a_parent.archetype_id.semantic_id

			-- create file workflow state
			create file_mgr.make (id, alt.file_mgr)

			reset
			compilation_state := Cs_validated
			template := alt
		ensure
			Id_set: id = an_id
			Archetype_attached: attached differential_archetype
			Compilation_state: compilation_state = Cs_validated
		end

feature -- Artefacts

	original_language: TERMINOLOGY_CODE
			-- obtain original language from owning template
		do
			if attached template.differential_archetype as da then
				Result := da.original_language
			else
				create Result
			end
		end

	differential_archetype: detachable TEMPLATE_OVERLAY

feature {ARCH_LIB_ARCHETYPE} -- Compilation

	compile_actions: HASH_TABLE [PROCEDURE [ARCH_LIB_ARCHETYPE, TUPLE], INTEGER]
		once
			Result := create_compile_actions
		end

feature -- File Access

	file_mgr: TPL_OVL_PERSISTENCE_MGR

feature -- Editing

	commit
			-- commit modified flat clone to archetype as new differential
		local
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			-- do something with previous version of archetype

			-- do diff on flat_archetype_clone
			check attached specialisation_parent as parent_aca then
				create archetype_comparator.make_create_differential (parent_aca.flat_archetype, flat_archetype_editable)
			end
--			differential_archetype := archetype_comparator.differential_output

--			differential_archetype.clear_is_generated
--			if attached editor_state as gc then
--				gc.on_commit
--			end
--			create last_modify_timestamp.make_now

			-- regenerate flat form
			flatten (False)

			-- set revision appropriately
		end

feature {NONE} -- Implementation

	template: ARCH_LIB_TEMPLATE
			-- owning template

invariant
	Is_specialised: is_specialised

end

