note
	component:   "openEHR ADL Tools"
	description: "Shared state information for all nodes of visualisation tree"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_UI_GRAPH_STATE

inherit
	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all;
			{ANY} is_deep_equal, standard_is_equal, deep_copy, deep_twin, twin
		end

create
	make, make_editable

feature -- Initialisation

	make (aca: ARCH_LIB_ARCHETYPE; an_rm: BMM_MODEL; differential_view_flag: BOOLEAN)
		require
			aca.is_valid
		do
			source := aca
			in_differential_view := differential_view_flag
			ref_model := an_rm
			archetype := aca.select_archetype (differential_view_flag, False)
			flattened_archetype := source.select_flattened_archetype
			flattened_terminology := flattened_archetype.terminology
			if aom_profiles_access.has_profile_for_rm_schema (an_rm.model_id) and then attached aom_profiles_access.profile_for_rm_schema (an_rm.model_id) as att_ap then
				aom_profile := att_ap
				archetype_parent_class := att_ap.archetype_parent_class
				archetype_data_value_parent_class := att_ap.archetype_data_value_parent_class
				archetype_visualise_descendants_of := att_ap.archetype_visualise_descendants_of
			end
		end

	make_editable (aca: ARCH_LIB_ARCHETYPE; an_rm: BMM_MODEL; an_undo_redo_chain: UNDO_REDO_CHAIN)
		require
			aca.is_valid
		do
			source := aca
			in_differential_view := False
			ref_model := an_rm
			archetype := source.flat_archetype_editable
			flattened_archetype := source.select_flattened_archetype
			flattened_terminology := archetype.terminology
			undo_redo_chain := an_undo_redo_chain
			if aom_profiles_access.has_profile_for_rm_schema (an_rm.model_id) and then attached aom_profiles_access.profile_for_rm_schema (an_rm.model_id) as att_ap then
				aom_profile := att_ap
				archetype_parent_class := att_ap.archetype_parent_class
				archetype_data_value_parent_class := att_ap.archetype_data_value_parent_class
				archetype_visualise_descendants_of := att_ap.archetype_visualise_descendants_of
			end
			if attached aca.specialisation_parent as par_aca then
				parent_archetype := par_aca.flat_archetype
			end
		ensure
			flattened_archetype = source.flat_archetype
		end

feature -- Access

	source: ARCH_LIB_ARCHETYPE

	archetype: ARCHETYPE

	flattened_archetype: AUTHORED_ARCHETYPE

	parent_archetype: detachable ARCHETYPE

	in_differential_view: BOOLEAN

	flattened_terminology: ARCHETYPE_TERMINOLOGY

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	ref_model: BMM_MODEL

	aom_profile: detachable AOM_PROFILE

	archetype_data_value_parent_class: detachable STRING

	archetype_parent_class: detachable STRING

	archetype_visualise_descendants_of: detachable STRING

feature -- Status Report

	editing_enabled: BOOLEAN
		do
			Result := attached undo_redo_chain
		end

feature -- Modification

	set_flat_terminology (a_flat_terminology: ARCHETYPE_TERMINOLOGY)
		require
			Terminology_is_flat: a_flat_terminology.is_flat
		do
			flattened_terminology := a_flat_terminology
		end

end


