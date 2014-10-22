note
	component:   "openEHR ADL Tools"
	description: "Editor plug-in for ARCH_CAT_ARCHETYPE"
	keywords:    "ADL, archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ALA_EDITOR_STATE

create
	make

feature -- Initialisation

	make (aca: ARCH_LIB_ARCHETYPE_EDITABLE)
		do
			target := aca
		end

	set_editable (an_undo_redo_chain: UNDO_REDO_CHAIN)
		do
			if not attached editor_context then
				create editor_context.make_editable (target, target.rm_schema, an_undo_redo_chain)
			end
		ensure
			attached editor_context
		end

feature -- Access

	target: ARCH_LIB_ARCHETYPE_EDITABLE

	differential_display_context: ARCHETYPE_UI_GRAPH_ROOT
		do
			if attached differential_display_context_cache as ddcc then
				Result := ddcc
			else
				create Result.make (target, target.rm_schema, True)
				differential_display_context_cache := Result
			end
		end

	flat_display_context: ARCHETYPE_UI_GRAPH_ROOT
		do
			if attached flat_display_context_cache as fdcc then
				Result := fdcc
			else
				create Result.make (target, target.rm_schema, False)
				flat_display_context_cache := Result
			end
		end

	editor_context: detachable ARCHETYPE_UI_GRAPH_ROOT

feature -- Commands

	on_commit
		do
			differential_display_context_cache := Void
			flat_display_context_cache := Void
		end

feature {NONE} -- Implementation

	differential_display_context_cache: detachable ARCHETYPE_UI_GRAPH_ROOT
			-- differential archetype display context

	flat_display_context_cache: detachable ARCHETYPE_UI_GRAPH_ROOT
			-- differential archetype display context

end



