note
	component:   "openEHR ADL Tools"
	description: "Shared state information for all nodes of editor tree"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCH_ED_CONTEXT_STATE

create
	make, make_editable

feature -- Initialisation

	make (aca: ARCH_CAT_ARCHETYPE_EDITABLE; an_rm_schema: BMM_SCHEMA; differential_view_flag: BOOLEAN)
		do
			source := aca
			in_differential_view := differential_view_flag
			rm_schema := an_rm_schema
			if differential_view_flag then
				check attached source.differential_archetype as da then
					archetype := da
				end
			else
				check attached source.flat_archetype as fa then
					archetype := fa
				end
			end
			flat_ontology := source.flat_archetype.ontology
		end

	make_editable (aca: ARCH_CAT_ARCHETYPE_EDITABLE; an_rm_schema: BMM_SCHEMA; an_undo_redo_chain: UNDO_REDO_CHAIN)
		do
			source := aca
			in_differential_view := False
			rm_schema := an_rm_schema
			archetype := source.flat_archetype_clone
			flat_ontology := source.flat_archetype_clone.ontology
			undo_redo_chain := an_undo_redo_chain
			if attached aca.specialisation_parent as par_aca then
				parent_archetype := par_aca.flat_archetype
			end
		end

feature -- Access

	source: ARCH_CAT_ARCHETYPE_EDITABLE

	archetype: ARCHETYPE

	parent_archetype: detachable ARCHETYPE

	in_differential_view: BOOLEAN

	flat_ontology: FLAT_ARCHETYPE_ONTOLOGY

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	rm_schema: BMM_SCHEMA

feature -- Status Report

	editing_enabled: BOOLEAN
		do
			Result := attached undo_redo_chain
		end

feature -- Modification

	set_flat_ontology (a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY)
		do
			flat_ontology := a_flat_ontology
		end

end


