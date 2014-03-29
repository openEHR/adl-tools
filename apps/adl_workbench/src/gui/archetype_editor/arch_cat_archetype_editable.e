note
	component:   "openEHR ADL Tools"
	description: "Version of ARCH_CAT_ARCHETYPE with additional GUI tool state"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class ARCH_CAT_ARCHETYPE_EDITABLE

inherit
	ARCH_CAT_ARCHETYPE
		redefine
			clear_cache, signal_from_scratch
		end

create
	make, make_new_archetype, make_new_specialised_archetype

feature -- Status Report

	has_gui_context: BOOLEAN
		do
			Result := attached gui_context
		end

feature -- Modification

	set_gui_context (a_context: ACA_EDITOR_STATE)
		do
			gui_context := a_context
		end

feature -- Compilation

	signal_from_scratch
			-- signal rebuild from scratch; this rebuilds from existing differential; it only uses legacy if no
			-- differential yet available. This is because changes in legacy will be detected independently
		do
			precursor
			gui_context := Void
		end

feature -- Access

	gui_context: detachable ACA_EDITOR_STATE

	flat_archetype_clone: FLAT_ARCHETYPE
			-- produce a clone of the current `flat_archetype'
		do
			if attached flat_archetype_clone_cache as facc then
				Result := facc
			else
				create Result.make_from_other (flat_archetype)
				flat_archetype_clone_cache := Result
			end
		end

	commit
			-- commit modified flat clone to archetype as new differential
		local
			archetype_comparator: ARCHETYPE_COMPARATOR
		do
			-- do something with previous version of archetype

			-- do diff on flat_archetype_clone
			if is_specialised then
				create archetype_comparator.make_create_differential (Current)
				differential_archetype := archetype_comparator.differential_output
			else
				create differential_archetype.make_from_flat (flat_archetype_clone)
			end

			differential_archetype.clear_is_generated
			is_source_generated := False
			if attached gui_context as gc then
				gc.on_commit
			end
			save_differential_validated
			create last_modify_timestamp.make_now

			-- regenerate flat form
			flatten (False)

			-- set revision appropriately
		ensure
			Differential_is_primary: not is_source_generated and not differential_archetype.is_generated
		end

feature {NONE} -- Implementation

	flat_archetype_clone_cache: detachable FLAT_ARCHETYPE

	clear_cache
		do
			precursor
			flat_archetype_clone_cache := Void
			if has_gui_context then
				gui_context.on_commit
			end
		end

end



