note
	component:   "openEHR ADL Tools"
	description: "Archetype annotations grid control. We use a grid here to allow for a more tree-like representation in the future"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class GUI_ANNOTATIONS_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			can_edit, can_populate, can_repopulate, source_archetype
		end

create
	make, make_editable

feature -- Definitions

	Grid_path_col: INTEGER = 1
	Grid_ann_key_col: INTEGER = 2
	Grid_ann_value_col: INTEGER = 3

feature {NONE} -- Initialisation

	make_editable (an_undo_redo_update_agent: attached like undo_redo_update_agent)
		do
			undo_redo_update_agent := an_undo_redo_update_agent
			create undo_redo_chain.make (an_undo_redo_update_agent)
			make
		end

	make
			-- Create controller for the annotations grid.
		do
			-- set visual characteristics & events
			create ev_root_container
			ev_root_container.set_data (Current)
			ev_root_container.enable_tree
		end

feature -- Access

	ev_root_container: EV_GRID_KBD_MOUSE

	source_archetype: AUTHORED_ARCHETYPE
			-- differential or flat version of archetype, depending on setting of `differential_view'
		do
			check attached {AUTHORED_ARCHETYPE} precursor as auth_arch then
				Result := auth_arch
			end
		end

feature -- Status Report

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := True
		end

	can_populate (a_source: attached like source; a_params: TUPLE [diff_view: BOOLEAN; a_lang: STRING]): BOOLEAN
		do
			Result := a_source.is_valid and then attached {AUTHORED_ARCHETYPE} a_source.select_archetype (a_params.diff_view, editing_enabled)
		end

	can_repopulate: BOOLEAN
		do
			Result := attached source as att_source and then
				att_source.is_valid and then attached {AUTHORED_ARCHETYPE} att_source.select_archetype (differential_view, editing_enabled)
		end

feature -- Commands

   	set_row_pixmap (row: attached EV_GRID_ROW)
   			-- Set the icon appropriate to the item attached to `row'.
   		do
			if attached {EV_GRID_LABEL_ITEM} row.item (1) as gli and attached {ARCH_LIB_ITEM} row.data as ari then
				gli.set_pixmap (get_icon_pixmap ("archetype/" + ari.group_name))
			end
		end

	toggle_expand_tree
			-- toggle expanded status of tree view
		do
--			if is_expanded then
--				is_expanded := False
--			else
--				is_expanded := True
--			end
		end

feature {NONE} -- Implementation

	undo_redo_update_agent: detachable PROCEDURE [ANY, TUPLE [UNDO_REDO_CHAIN]]

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	do_clear
			-- Wipe out content from widgets.
		do
			ev_root_container.wipe_out
		end

	do_populate
			-- populate the ADL tree control by creating it from scratch
		local
			lang_key: STRING
			anns_by_path: HASH_TABLE [RESOURCE_ANNOTATION_NODE_ITEMS, STRING]
			ann_list: HASH_TABLE [STRING, STRING]
			gli: EV_GRID_LABEL_ITEM
			path_row, ann_row: EV_GRID_ROW
		do
			-- figure out if there are any annotations, and what actual language tag they are under
			check attached selected_language end
			if source_archetype.has_annotations and then source_archetype.annotations.has_matching_language_tag (selected_language) then
				lang_key := source_archetype.annotations.matching_language_tag (selected_language)

				-- populate grid
				anns_by_path := source_archetype.annotations.node_table_for_language (lang_key).items
				from anns_by_path.start until anns_by_path.off loop
					-- put the path in the first column
					create gli.make_with_text (source_archetype.annotated_path (anns_by_path.key_for_iteration, selected_language, True))
					ev_root_container.set_item (Grid_path_col, ev_root_container.row_count + 1, gli)
					path_row := gli.row

					-- for each item in the annotations list, add a sub-row with the key in col 2 and the value in col 3
					ann_list := anns_by_path.item_for_iteration.items
					from ann_list.start until ann_list.off loop

						-- create a new sub row
						path_row.insert_subrow (path_row.subrow_count + 1)

						-- get the sub row
						ann_row := path_row.subrow (path_row.subrow_count)
						create gli.make_with_text (ann_list.key_for_iteration)
						ann_row.set_item (Grid_ann_key_col, gli)

						create gli.make_with_text (ann_list.item_for_iteration)
						ann_row.set_item (Grid_ann_value_col, gli)

						ann_list.forth
					end
					if path_row.is_expandable then
						path_row.expand
					end
					anns_by_path.forth
				end

				-- put names on columns
				if ev_root_container.column_count > 0 then
					ev_root_container.column (Grid_path_col).set_title (get_msg (ec_annotation_path_text, Void))
					ev_root_container.column (Grid_path_col).resize_to_content
					ev_root_container.column (Grid_ann_key_col).set_title (get_msg (ec_annotation_key_text, Void))
					ev_root_container.column (Grid_ann_key_col).resize_to_content
					ev_root_container.column (Grid_ann_value_col).set_title (get_msg (ec_annotation_value_text, Void))
					ev_root_container.column (Grid_ann_value_col).resize_to_content
				end
			end
		end

end


