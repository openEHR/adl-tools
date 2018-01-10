note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_STRING"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2016- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_STRING_UI_NODE

inherit
	C_PRIMITIVE_OBJECT_UI_NODE
		redefine
			arch_node, update_constraint
		end

create
	make, make_rm

feature -- Access

	arch_node: detachable C_STRING

feature -- Editing

	update_constraint (orig_text: STRING; an_ev_row: detachable EV_GRID_ROW)
			-- action to perform if constraint is edited by user. Constraint is in one of the forms:
			--   * /xxx/					a single regex
			--	 * "xxx"					a single string
			--	 * "xxx", "yyy", "zzz"		a list of strings
		local
			new_val: STRING
			old_constraint: ARRAYED_LIST [STRING]
		do
			if attached evx_grid as att_evx_grid and attached an_ev_row as ev_row and attached arch_node as a_n then
				if attached {EV_GRID_EDITABLE_ITEM} ev_row.item (Definition_grid_col_constraint) as ev_ed_cell then
					-- if no change, don't do anything
					new_val := utf32_to_utf8 (ev_ed_cell.text)
					if not new_val.same_string (a_n.as_string) then
						-- make a value copy of current C_STRING
						old_constraint := a_n.constraint

						-- create a new one and copy its fields in
						a_n.set_from_ui_string (new_val)

						-- set up undo/redo
						ui_graph_state.undo_redo_chain.add_link_simple (att_evx_grid.ev_grid,
							agent a_n.set_constraint (old_constraint),
							agent a_n.set_from_ui_string (utf32_to_utf8 (ev_ed_cell.text)))
					end
				end
			end
		end

end


