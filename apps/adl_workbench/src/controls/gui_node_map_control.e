indexing
	component:   "openEHR Archetype Project"
	description: "Node map control - Visualise an archetype structure as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_NODE_MAP_CONTROL

inherit
	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_DIRECTORY

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_main_window: MAIN_WINDOW)
		require
			a_main_window /= Void
		do
			gui := a_main_window
			gui_tree := gui.node_map_tree
			in_differential_mode := True

			in_technical_mode := show_technical_view
			if in_technical_mode then
				gui.node_map_technical_radio_button.enable_select
			else
				gui.node_map_domain_radio_button.enable_select
			end

			in_reference_model_mode := show_reference_model_view
			if in_reference_model_mode then
				gui.node_map_reference_model_check_button.enable_select
			else
				gui.node_map_reference_model_check_button.disable_select
			end
		ensure
			gui_set: gui = a_main_window
		end

feature -- Status Report

	in_technical_mode: BOOLEAN
			-- If True, show more technical detail on each node

	in_reference_model_mode: BOOLEAN
			-- True if reference model should be visible in tree

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

	in_differential_mode: BOOLEAN
			-- True if node visualisation should show definition status of each node,
			-- i.e. inherited, redefine etc

feature -- Commands

	set_technical_mode
			-- Set `in_technical_mode' on.
		do
			in_technical_mode := True
			set_show_technical_view (True)
			repopulate
		end

	set_domain_mode
			-- Set `in_technical_mode' off.
		do
			in_technical_mode := False
			set_show_technical_view (False)
			repopulate
		end

	set_reference_model_mode
			-- Set `in_reference_model_mode' on.
		do
			in_reference_model_mode := True
			set_show_reference_model_view (True)
			repopulate
		end

	set_no_reference_model_mode
			-- Set `in_reference_model_mode' off.
		do
			in_reference_model_mode := False
			set_show_reference_model_view (False)
			repopulate
		end

	set_differential_view
			-- Set `in_differential_mode' on.
		do
			in_differential_mode := True
			populate
		end

	set_flat_view
			-- Set `in_differential_mode' off.
		do
			in_differential_mode := False
			populate
		end

	clear is
		do
			gui_tree.wipe_out
		end

	populate is
			-- populate the ADL tree control by creating it from scratch
		local
			tree_iterator: OG_ITERATOR
		do
			clear
			archetype_tree_root_set := False
			create tree_item_stack.make (0)

			if archetype_directory.has_valid_selected_archetype then
				create tree_iterator.make (target_archetype.definition.representation)
				tree_iterator.do_all (agent node_build_enter_action (?, ?), agent node_build_exit_action (?, ?))

				if in_reference_model_mode then
					gui_tree.recursive_do_all (agent node_add_rm_attributes (?))
				end

				populate_invariants
				is_expanded := not expand_node_tree
				toggle_expand_tree

				if not in_differential_mode then
					roll_up_to_specialisation_level
				end
			end
		end

	repopulate is
			-- populate the ADL tree control by traversing the tree and modifying it
		do
			gui_tree.recursive_do_all (agent node_rebuild_enter_action (?))
			if in_reference_model_mode then
				gui_tree.recursive_do_all (agent node_add_rm_attributes (?))
			else
				gui_tree.recursive_do_all (agent node_remove_rm_attributes (?))
			end
		end

	item_select is
			-- Do something when an item is selected.
		local
			node_data: ANY
			obj_node: C_COMPLEX_OBJECT
			constraint_ref_node: CONSTRAINT_REF
			an_ordinal: ORDINAL
			s: STRING
		do
			node_data := gui_tree.selected_item.data
			obj_node ?= node_data

			if obj_node /= Void then
				if obj_node.is_addressable then
					gui.ontology_controls.select_term(obj_node.node_id)
				end
			else
				constraint_ref_node ?= node_data

				if constraint_ref_node /= Void then
					gui.ontology_controls.select_constraint(constraint_ref_node.target)
				else
					an_ordinal ?= node_data

					if an_ordinal /= Void then
						if an_ordinal.symbol.terminology_id.is_local then
							gui.ontology_controls.select_term(an_ordinal.symbol.code_string)
						end
					else
						s ?= node_data

						if s /= Void and then is_valid_code (s) then
							if archetype_directory.has_valid_selected_archetype then
								if ontology.has_term_code (s) then
									gui.ontology_controls.select_term (s)
								end
							end
						end
					end
				end
			end
		end

	toggle_expand_tree
			-- Expand or shrink the tree control.
		do
			is_expanded := not is_expanded

			if is_expanded then
				gui_tree.recursive_do_all (agent ev_tree_item_expand)
				gui.node_map_expand_button.set_text ("Collapse All")
			else
				gui_tree.recursive_do_all (agent ev_tree_item_shrink)
				gui.node_map_expand_button.set_text ("Expand All")
			end
		end

	shrink_to_level (a_type: STRING) is
			-- Shrink the tree control up to items of type `a_type'.
		do
			gui_tree.recursive_do_all (agent ev_tree_item_shrink_to_level (a_type, ?))
		end

	expand_one_level is
			-- Expand the tree control one level further.
		do
			create node_list.make (0)
			gui_tree.recursive_do_all (agent ev_tree_item_expand_one_level)

			from
				node_list.start
			until
				node_list.off
			loop
				node_list.item.expand
				node_list.forth
			end
		end

	shrink_one_level
			-- Shrink the tree control one level further.
		do
			create node_list.make (0)
			gui_tree.recursive_do_all (agent ev_tree_item_collapse_one_level)

			from
				node_list.start
			until
				node_list.off
			loop
				node_list.item.collapse
				node_list.forth
			end
		end

	roll_up_to_specialisation_level
			-- roll the tree up so that nodes whose rolled_up_specialisation_status is
			-- ss_inherited are closed, but nodes with
		require
			archetype_selected: archetype_directory.has_valid_selected_archetype
		do
			if target_archetype.is_specialised then
				create node_list.make(0)
				gui_tree.recursive_do_all(agent ev_tree_item_roll_up(?))

				from
					node_list.start
				until
					node_list.off
				loop
					node_list.item.collapse
					node_list.forth
				end
			end
		end

feature {NONE} -- Implementation

	target_archetype: ARCHETYPE
			-- Differential or flat version of archetype, depending on setting of `in_differential_mode'.
		require
			archetype_selected: archetype_directory.has_valid_selected_archetype
		do
			if in_differential_mode then
				Result := archetype_directory.selected_archetype.archetype_differential
			else
				Result := archetype_directory.selected_archetype.archetype_flat
			end
		ensure
			attached: Result /= Void
		end

	ontology: !ARCHETYPE_ONTOLOGY
			-- The ontology for `target_archetype'.
		require
			archetype_selected: archetype_directory.has_valid_selected_archetype
		do
			Result := target_archetype.ontology
		end

	gui: MAIN_WINDOW
			-- main window of system

	gui_tree: EV_TREE

	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	archetype_tree_root_set: BOOLEAN

	node_build_enter_action (an_og_node: OG_ITEM; indent_level: INTEGER) is
		require
			Node_exists: an_og_node /= Void
		local
			a_ti, a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			a_type, s: STRING
			pixmap: EV_PIXMAP
			assumed_flag: BOOLEAN
			arch_const: ARCHETYPE_CONSTRAINT
			pixmap_ext: STRING
			spec_sts: INTEGER
		do
			create s.make (0)
			a_type := an_og_node.content_item.generating_type

			-- determine source status of node in archetype text, i.e. inherited, redefined, added etc
			-- and use it to set the kind of pixmap to use
			create pixmap_ext.make (0)

			-- Always colourise inherited & overidden nodes. If we want a switch for this, implement a new flag.
			-- if in_differential_mode then
				if archetype_directory.has_valid_selected_archetype then
					arch_const ?= an_og_node.content_item
					spec_sts := arch_const.specialisation_status (target_archetype.specialisation_depth).value

					if spec_sts = ss_inherited or spec_sts = ss_redefined then
						pixmap_ext.append (".")
						pixmap_ext.append (specialisation_status_names.item (spec_sts))
					end
				end
			-- end

			if {c_attr: C_ATTRIBUTE} an_og_node.content_item then
				a_ti := attach_node(c_attribute_string(c_attr), pixmaps.item(c_attribute_pixmap_string(c_attr) + pixmap_ext), an_og_node)

			elseif {a_constraint_ref: CONSTRAINT_REF} an_og_node.content_item then
				a_ti := attach_node(constraint_ref_string(a_constraint_ref), pixmaps.item("CONSTRAINT_REF" + pixmap_ext), an_og_node)

			elseif {a_object_term: C_CODE_PHRASE} an_og_node.content_item then
				if not a_object_term.any_allowed then
					s.append(a_object_term.terminology_id.value)
				end

				a_ti := attach_node(s, pixmaps.item(a_object_term.generating_type + pixmap_ext), an_og_node)

				if a_object_term.code_count > 0 then
					from
						a_object_term.code_list.start
					until
						a_object_term.code_list.off
					loop
						assumed_flag := a_object_term.assumed_value /= Void and then
							a_object_term.assumed_value.code_string.is_equal(a_object_term.code_list.item)
						create a_ti_sub.make_with_text (utf8 (object_term_item_string (a_object_term.code_list.item, assumed_flag, a_object_term.is_local)))
						a_ti_sub.set_data(a_object_term.code_list.item) -- type STRING
						a_ti_sub.set_pixmap(pixmaps.item("TERM" + pixmap_ext))
						a_ti.extend(a_ti_sub)
						a_object_term.code_list.forth
					end
				end

			elseif {c_dv_ordinal: C_DV_ORDINAL} an_og_node.content_item then
				s.append(c_dv_ordinal.rm_type_name)
				a_ti := attach_node(s, pixmaps.item(c_dv_ordinal.generating_type + pixmap_ext), an_og_node)

				if not c_dv_ordinal.any_allowed then
					from
						c_dv_ordinal.items.start
					until
						c_dv_ordinal.items.off
					loop
						assumed_flag := c_dv_ordinal.assumed_value /= Void and then
							c_dv_ordinal.assumed_value.value = c_dv_ordinal.items.item.value
						create a_ti_sub.make_with_text (utf8 (object_ordinal_item_string (c_dv_ordinal.items.item, assumed_flag)))
						a_ti_sub.set_data(c_dv_ordinal.items.item) -- of type ORDINAL
						a_ti_sub.set_pixmap(pixmaps.item("ORDINAL" + pixmap_ext))
						a_ti.extend(a_ti_sub)
						c_dv_ordinal.items.forth
					end
				end

			elseif {c_q: C_DV_QUANTITY} an_og_node.content_item then
				if in_technical_mode then
					s.append(c_q.rm_type_name)
				end
				if c_q.property /= Void then
					s.append(" (" + c_q.property.as_string + ")")
				end
				a_ti := attach_node(s, pixmaps.item(c_q.generating_type + pixmap_ext), an_og_node)
				if c_q.list /= Void then
					from
						c_q.list.start
					until
						c_q.list.off
					loop
						create a_ti_sub.make_with_text (utf8 (object_c_quantity_item_string (c_q.list.item)))
						a_ti_sub.set_data (c_q.list.item)
						a_ti_sub.set_pixmap (pixmaps.item ("C_QUANTITY_ITEM" + pixmap_ext))
						a_ti.extend (a_ti_sub)
						c_q.list.forth
					end
				end

				if c_q.assumed_value /= Void then
					create a_ti_sub.make_with_text (utf8 (object_quantity_string (c_q.assumed_value, True)))
					a_ti_sub.set_data (c_q.assumed_value)
					a_ti_sub.set_pixmap (pixmaps.item ("C_QUANTITY_ITEM" + pixmap_ext))
					a_ti.extend (a_ti_sub)
				end

			elseif {c_p_o: C_PRIMITIVE_OBJECT} an_og_node.content_item then
				a_ti := attach_node(c_primitive_object_string(c_p_o), pixmaps.item(c_p_o.generating_type + pixmap_ext), an_og_node)

			elseif {c_c_o: C_COMPLEX_OBJECT} an_og_node.content_item then
				a_ti := attach_node(c_complex_object_string(c_c_o), pixmaps.item(c_complex_object_pixmap_string(c_c_o) + pixmap_ext), an_og_node)

			elseif {a_slot: ARCHETYPE_SLOT} an_og_node.content_item then
				if a_slot.occurrences.lower = 1 then
					pixmap := pixmaps.item(a_slot.generating_type + pixmap_ext)
				else
					pixmap := pixmaps.item(a_slot.generating_type + ".optional" + pixmap_ext)
				end

				a_ti := attach_node(archetype_slot_string(a_slot), pixmap, an_og_node)

				if a_slot.has_includes then
					from
						a_slot.includes.start
					until
						a_slot.includes.off
					loop
						create a_ti_sub2.make_with_text (utf8 (object_invariant_string (a_slot.includes.item)))
						a_ti_sub2.set_pixmap (pixmaps.item ("CADL_INCLUDE"))
						a_ti_sub2.set_data (a_slot.includes.item)
						a_ti.extend (a_ti_sub2)
						a_slot.includes.forth
					end

					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end

				if a_slot.has_excludes then
					from
						a_slot.excludes.start
					until
						a_slot.excludes.off
					loop
						create a_ti_sub2.make_with_text (utf8 (object_invariant_string (a_slot.excludes.item)))
						a_ti_sub2.set_pixmap (pixmaps.item ("CADL_EXCLUDE"))
						a_ti_sub2.set_data (a_slot.excludes.item)
						a_ti.extend (a_ti_sub2)
						a_slot.excludes.forth
					end

					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end

			elseif {a_node_ref: ARCHETYPE_INTERNAL_REF} an_og_node.content_item then
				a_ti := attach_node(archetype_internal_ref_string(a_node_ref), pixmaps.item(a_node_ref.generating_type + pixmap_ext), an_og_node)
			end
		end

	node_build_exit_action(an_og_node: OG_ITEM; indent_level: INTEGER) is
		require
			Node_exists: an_og_node /= Void
		do
			tree_item_stack.remove
		end

	node_rebuild_enter_action(a_tree_node: EV_TREE_NODE) is
		require
			Node_exists: a_tree_node /= Void
		local
			a_ti: EV_TREE_ITEM
			c_o: C_OBJECT
			a_type, s: STRING
			c_dv_ordinal: C_DV_ORDINAL
			a_node: ANY -- because includes STRING as well as ARCHETYPE_CONSTRAINT
			parent: EV_TREE_NODE
			assumed_flag: BOOLEAN
			arch_const: ARCHETYPE_CONSTRAINT
			pixmap_ext: STRING
			spec_sts: INTEGER
		do
			create s.make (0)
			a_ti ?= a_tree_node

			if a_ti /= Void then
				a_node := a_ti.data

				if a_node /= Void then
					c_o ?= a_node

					if c_o /= Void then
						if in_technical_mode then
							a_ti.set_tooltip (utf8 (c_o.representation.path.as_string))
						elseif archetype_directory.has_valid_selected_archetype then
							a_ti.set_tooltip (utf8 (ontology.physical_to_logical_path (c_o.representation.path.as_string, current_language)))
						end
					end

					create pixmap_ext.make(0)

					-- Always colourise inherited & overidden nodes. If we want a switch for this, implement a new flag.
					-- if in_differential_mode then
						arch_const ?= a_node

						if arch_const /= Void then
							if archetype_directory.has_valid_selected_archetype then
								spec_sts := arch_const.specialisation_status (target_archetype.specialisation_depth).value

								if spec_sts = ss_inherited or spec_sts = ss_redefined then
									pixmap_ext.append (".")
									pixmap_ext.append (specialisation_status_names.item (spec_sts))
								end
							end
						end
					-- end

					a_type := a_node.generating_type

					if {c_attr: C_ATTRIBUTE} a_node then
						a_ti.set_text (utf8 (c_attribute_string (c_attr)))
						a_ti.set_pixmap(pixmaps.item(c_attribute_pixmap_string(c_attr) + pixmap_ext))

					elseif a_type.substring_index ("STRING", 1) = 1 then
						s ?= a_node
						if {parent_ti1: EV_TREE_NODE} a_ti.parent then
							if {c_c_p: C_CODE_PHRASE} parent_ti1.data then
								assumed_flag := c_c_p.assumed_value /= Void and then c_c_p.assumed_value.code_string.is_equal(s)
								a_ti.set_text (utf8 (object_term_item_string (s, assumed_flag, c_c_p.is_local)))
								create pixmap_ext.make (0)

								if in_differential_mode then
									if archetype_directory.has_valid_selected_archetype then
										spec_sts := c_c_p.specialisation_status (target_archetype.specialisation_depth).value
										if spec_sts = ss_inherited or spec_sts = ss_redefined then
											pixmap_ext.append ("." + specialisation_status_names.item (spec_sts))
										end
									end
								end

								a_ti.set_pixmap(pixmaps.item("TERM" + pixmap_ext))
							end
						end

					elseif {a_constraint_ref: CONSTRAINT_REF} a_node then
						a_ti.set_text (utf8 (constraint_ref_string (a_constraint_ref)))
						a_ti.set_pixmap(pixmaps.item(a_constraint_ref.generating_type + pixmap_ext))

					elseif {a_c_p: C_CODE_PHRASE} a_node then
						a_ti.set_pixmap(pixmaps.item(a_c_p.generating_type + pixmap_ext))

					elseif {c_d_o: C_DV_ORDINAL} a_node then
						a_ti.set_pixmap(pixmaps.item(c_d_o.generating_type + pixmap_ext))

					elseif {an_ordinal: ORDINAL} a_node then
						parent ?= a_ti.parent
						c_dv_ordinal ?= parent.data
						assumed_flag := c_dv_ordinal.assumed_value /= Void and then c_dv_ordinal.assumed_value.value = an_ordinal.value

						a_ti.set_text (utf8 (object_ordinal_item_string (an_ordinal, assumed_flag)))
						create pixmap_ext.make(0)

						if in_differential_mode then
							if archetype_directory.has_valid_selected_archetype then
								spec_sts := c_dv_ordinal.specialisation_status (target_archetype.specialisation_depth).value

								if spec_sts = ss_inherited or spec_sts = ss_redefined then
									pixmap_ext.append (".")
									pixmap_ext.append (specialisation_status_names.item (spec_sts))
								end
							end
						end
						a_ti.set_pixmap(pixmaps.item("ORDINAL" + pixmap_ext))

					elseif {c_q: C_DV_QUANTITY} a_node then
						create s.make(0)
						if in_technical_mode then
							s.append(c_q.rm_type_name)
						end
						if c_q.property /= Void then
							s.append(" (" + c_q.property.as_string + ")")
						end
						a_ti.set_text (utf8 (s))
						a_ti.set_pixmap(pixmaps.item("C_DV_QUANTITY" + pixmap_ext))

					elseif {c_q_i: C_QUANTITY_ITEM} a_node then
						if {parent_ti: EV_TREE_NODE} a_ti.parent then
							if {c_q2: C_DV_QUANTITY} parent_ti.data then
								create pixmap_ext.make(0)
								if in_differential_mode and archetype_directory.has_valid_selected_archetype then
									spec_sts := c_q2.specialisation_status (target_archetype.specialisation_depth).value
									if spec_sts = ss_inherited or spec_sts = ss_redefined then
										pixmap_ext.append("." + specialisation_status_names.item(spec_sts))
									end
								end
							end
						end
						a_ti.set_pixmap(pixmaps.item(c_q_i.generating_type + pixmap_ext))

					elseif {c_p_o: C_PRIMITIVE_OBJECT} a_node then
						a_ti.set_text (utf8 (c_primitive_object_string (c_p_o)))
						a_ti.set_pixmap(pixmaps.item(c_p_o.generating_type + pixmap_ext))

					elseif {c_c_o: C_COMPLEX_OBJECT} a_node then
						a_ti.set_text (utf8 (c_complex_object_string (c_c_o)))
						a_ti.set_pixmap(pixmaps.item(c_complex_object_pixmap_string(c_c_o) + pixmap_ext))

					elseif {a_node_ref: ARCHETYPE_INTERNAL_REF} a_node then
						a_ti.set_text (utf8 (archetype_internal_ref_string (a_node_ref)))
						a_ti.set_pixmap(pixmaps.item(a_node_ref.generating_type + pixmap_ext))

					elseif {a_slot: ARCHETYPE_SLOT} a_node then
						a_ti.set_text (utf8 (archetype_slot_string (a_slot)))
						a_ti.set_pixmap(pixmaps.item(a_slot.generating_type + pixmap_ext))

					elseif {an_inv: ASSERTION} a_node then
						a_ti.set_text (utf8 (object_invariant_string (an_inv)))
					end
				end
			else
				-- must be an invariant node: FIXME
			end
		end

	node_add_rm_attributes(a_tree_node: EV_TREE_NODE) is
		require
			Node_exists: a_tree_node /= Void
		local
			a_node: ANY -- because includes STRING as well as ARCHETYPE_CONSTRAINT
			pixmap: EV_PIXMAP
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			attr_ti: EV_TREE_ITEM
		do
			if {a_ti: EV_TREE_ITEM} a_tree_node then
				a_node := a_ti.data
				if a_node /= Void and {c_c_o: C_COMPLEX_OBJECT} a_node then
					if rm_checker.has_class_definition (c_c_o.rm_type_name) then
						if in_differential_mode then
							props := rm_checker.properties_of(c_c_o.rm_type_name)
						else
							props := rm_checker.flat_properties_of(c_c_o.rm_type_name)
						end
						from props.start until props.off loop
							if not c_c_o.has_attribute(props.key_for_iteration) then
								if props.item_for_iteration.is_container then
									pixmap := pixmaps.item("C_ATTRIBUTE.multiple.reference_model")
								else
									pixmap := pixmaps.item("C_ATTRIBUTE.reference_model")
								end

								create attr_ti.make_with_text (utf8 (props.key_for_iteration + ": " + props.item_for_iteration.type.as_type_string))
								attr_ti.set_data (props.item_for_iteration)
								attr_ti.set_pixmap (pixmap)
								a_tree_node.extend (attr_ti)
							end
							props.forth
						end
					end
				end
			end
		end

	node_remove_rm_attributes(a_tree_node: EV_TREE_NODE) is
		require
			Node_exists: a_tree_node /= Void
		do
			if {c_c_o: C_COMPLEX_OBJECT} a_tree_node.data then
				from a_tree_node.start until a_tree_node.off loop
					if {a_bmm_prop: BMM_PROPERTY_DEFINITION} a_tree_node.item.data then
						a_tree_node.remove
					else
						a_tree_node.forth
					end
				end
			end
		end

	attach_node(str: STRING; pixmap: EV_PIXMAP; an_og_node: OG_ITEM): EV_TREE_ITEM is
			-- attach a node into the tree
		do
			create Result.make_with_text (utf8 (str))
			Result.set_data (an_og_node.content_item)
			Result.set_pixmap (pixmap)

			if in_technical_mode then
				Result.set_tooltip (utf8 (an_og_node.path.as_string))
			elseif archetype_directory.has_valid_selected_archetype then
				Result.set_tooltip (utf8 (ontology.physical_to_logical_path (an_og_node.path.as_string, current_language)))
			end

			if not archetype_tree_root_set then
				gui_tree.extend (Result)
				archetype_tree_root_set := True
			else
				tree_item_stack.item.extend(Result)
			end

			tree_item_stack.extend(Result)
		end

	ev_tree_item_expand(an_ev_tree_node: EV_TREE_NODE) is
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.expand
			end
		end

	ev_tree_item_shrink(an_ev_tree_node: EV_TREE_NODE) is
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.collapse
			end
		end

	ev_tree_item_shrink_to_level(a_type: STRING; an_ev_tree_node: EV_TREE_NODE) is
			--
		local
			node_data: ANY
			node_type: STRING
			an_obj_node: C_COMPLEX_OBJECT
		do
			node_data ?= an_ev_tree_node.data
			if node_data /= Void then
				node_type := node_data.generating_type
				if node_type.is_equal("C_ATTRIBUTE") and an_ev_tree_node.is_expandable then
					an_ev_tree_node.expand
				elseif an_ev_tree_node.is_expandable then
					an_obj_node ?= an_ev_tree_node
					if a_type.is_equal("addressable") then
						if an_obj_node /= Void and then an_obj_node.is_addressable then
							an_ev_tree_node.expand
						else
							an_ev_tree_node.collapse
						end
					elseif a_type.is_equal("anonymous") then
						if an_obj_node /= Void then
							an_ev_tree_node.expand
						else
							an_ev_tree_node.collapse
						end
					elseif a_type.is_equal("simple") then
						an_ev_tree_node.expand
					end
				end
			end
		end

	ev_tree_item_expand_one_level(an_ev_tree_node: EV_TREE_NODE) is
			--
		do
			if an_ev_tree_node.is_expanded then
				from
					an_ev_tree_node.start
				until
					an_ev_tree_node.off
				loop
					if an_ev_tree_node.item.is_expandable and then not an_ev_tree_node.item.is_expanded then
						node_list.extend(an_ev_tree_node.item)
					end
					an_ev_tree_node.forth
				end
			elseif an_ev_tree_node = gui_tree.item then
				node_list.extend(an_ev_tree_node)
			end
		end

	ev_tree_item_collapse_one_level(an_ev_tree_node: EV_TREE_NODE) is
			--
		do
			if an_ev_tree_node.is_expanded then
				from
					an_ev_tree_node.start
				until
					an_ev_tree_node.off or else (an_ev_tree_node.item.is_expandable and then an_ev_tree_node.item.is_expanded)
				loop
					an_ev_tree_node.forth
				end

				if an_ev_tree_node.off then -- didn't find any expanded children
					node_list.extend(an_ev_tree_node)
				end
			end
		end

	ev_tree_item_roll_up(an_ev_tree_node: EV_TREE_NODE) is
			-- close nodes that have rolled_up_specialisation_status = ss_inherited; open others
		local
			arch_cons: ARCHETYPE_CONSTRAINT
		do
			if an_ev_tree_node.is_expandable then
				arch_cons ?= an_ev_tree_node.data
				if arch_cons /= Void and arch_cons.rolled_up_specialisation_status.value = ss_inherited then
					an_ev_tree_node.collapse
				else
					an_ev_tree_node.expand
				end
			end
		end

	node_list: ARRAYED_LIST[EV_TREE_NODE]

	c_attribute_string(c_attr: C_ATTRIBUTE): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
		--	Result.append(" [" + c_attr.existence.as_occurrences_string + "] ")
		--	if c_attr.is_multiple then
		--	 	Result.append(" [" + c_attr.cardinality.as_string + "] ")
		--	end
		--	if c_attr.is_congruent then
		--		Result.append ("^ ")
		--	end

			Result.append(c_attr.rm_attribute_path)
			if c_attr.any_allowed then
				Result.append(" matches {*}")
			end
		end

	c_attribute_pixmap_string(c_attr: C_ATTRIBUTE): STRING is
			-- string name of pixmap for attribute c_attr
		do
			create Result.make(0)
			if c_attr.is_multiple then
				if c_attr.cardinality.interval.lower > 0 then
					Result.append("C_ATTRIBUTE.multiple")
				else
					Result.append("C_ATTRIBUTE.multiple.optional")
				end
			else
				if c_attr.existence.lower = 1 then
					Result.append("C_ATTRIBUTE")
				else
					Result.append("C_ATTRIBUTE.optional")
				end
			end
		end

	c_complex_object_string(a_node: C_COMPLEX_OBJECT): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			-- if not a_node.is_occurrences_default then
			-- 	Result.append(" [" + a_node.occurrences.as_occurrences_string + "] ")
			-- end

			-- if a_node.is_congruent then
			-- 	Result.append ("^ ")
			-- end

			if a_node.is_addressable then
				if a_node.sibling_order /= Void then
					Result.append (a_node.sibling_order.as_string + " ")
				end

				if in_technical_mode then
					Result.append (a_node.rm_type_name + "[" + a_node.node_id + "]")
				end

				if archetype_directory.has_valid_selected_archetype and ontology.has_term_code (a_node.node_id) then
					Result.append (" " + ontology.term_definition (current_language, a_node.node_id).item ("text"))
				end
			else -- put type even when not in technical mode
				Result.append (a_node.rm_type_name)
			end

			if a_node.any_allowed then
				Result.append (" = *")
			end
		end

	c_complex_object_pixmap_string(c_c_o: C_COMPLEX_OBJECT): STRING is
		do
			create Result.make_empty

			if c_c_o.occurrences.lower > 0 then
				if c_c_o.occurrences.upper = 1 then
					Result.append("C_COMPLEX_OBJECT")
				else
					Result.append("C_COMPLEX_OBJECT.multiple")
				end
			else
				if c_c_o.occurrences.upper = 1 then
					Result.append("C_COMPLEX_OBJECT.optional")
				else
					Result.append("C_COMPLEX_OBJECT.multiple.optional")
				end
			end
		end

	archetype_slot_string(a_node: ARCHETYPE_SLOT): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			-- if not a_node.is_occurrences_default then
				-- Result.append(" [" + a_node.occurrences.as_occurrences_string + "] ")
			-- end
			if a_node.sibling_order /= Void then
				Result.append (a_node.sibling_order.as_string + " ")
			end

			--if in_technical_mode then
				Result.append(a_node.rm_type_name)
			--end
			if in_technical_mode then
				if a_node.is_addressable then
					Result.append("[" + a_node.node_id + "]")
				end
			end

			if a_node.is_addressable then
				if archetype_directory.has_valid_selected_archetype and ontology.has_term_code (a_node.node_id) then
					Result.append (" " + ontology.term_definition (current_language, a_node.node_id).item ("text"))
				end
			end

			if a_node.any_allowed then
				Result.append (" = *")
			end
		end

	c_primitive_object_string(c_p_o: C_PRIMITIVE_OBJECT): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			if in_technical_mode then
				Result.append(c_p_o.rm_type_name)
			end
			if not (c_p_o.occurrences.lower = 1 and c_p_o.occurrences.upper = 1) then
				Result.append(" [" + c_p_o.occurrences.as_string + "]")
			end
			Result.append(" " + c_p_o.item.as_string)
		end

	archetype_internal_ref_string(a_node: ARCHETYPE_INTERNAL_REF): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty

			if not a_node.use_target_occurrences then
				Result.append (" [" + a_node.occurrences.as_string + "] ")
			end

			if in_technical_mode then
				Result.append ("use " + a_node.rm_type_name)
				if a_node.is_addressable then
					Result.append("[" + a_node.node_id + "]")
				end
				Result.append (" " + a_node.target_path)
			elseif archetype_directory.has_valid_selected_archetype then
				Result.append ("use " + ontology.physical_to_logical_path (a_node.target_path, current_language))
			end
		end

	object_term_item_string(code: STRING; assumed_flag, local_flag: BOOLEAN): STRING is
			-- generate string form of node or object for use in tree node;
			-- assumed_flag = True if this is an assumed value - will be marked visually
			-- local_flag = True if his term is an at- or ac- code from within archetype
		do
			create Result.make_empty

			if archetype_directory.has_valid_selected_archetype then
				if local_flag then
					if ontology.has_term_code (code) then
						Result.append (" " + ontology.term_definition (current_language, code).item ("text"))
					end
				else
					-- need a way to get it out of an external terminology; for the moment, just show code
					Result.append (" (rubric for " + code + ")")
				end
			end

			if in_technical_mode then
				Result.append (" -- " + code)
			end

			if assumed_flag then
				Result.append (" (Assumed)")
			end
		end

	constraint_ref_string(a_constraint_ref: CONSTRAINT_REF): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty

			if archetype_directory.has_valid_selected_archetype then
				Result.append (" " + ontology.constraint_definition (current_language, a_constraint_ref.target).item ("text"))
			end

			if in_technical_mode then
				Result.append (" -> " + a_constraint_ref.target)
			end
		end

	object_ordinal_item_string(an_ordinal: ORDINAL; assumed_flag: BOOLEAN): STRING is
			-- generate string form of node or object for use in tree node
		local
			code: STRING
		do
			create Result.make_empty
			code := an_ordinal.symbol.code_string
			Result.append (an_ordinal.value.out + an_ordinal.separator.out)

			if archetype_directory.has_valid_selected_archetype then
				if ontology.has_term_code (code) then
					Result.append (" " + ontology.term_definition (current_language, code).item ("text"))
				end
			end

			if in_technical_mode then
				Result.append (" -- " + code)
			end

			if assumed_flag then
				Result.append (" (Assumed)")
			end
		end

	object_quantity_string (a_q: QUANTITY; assumed_flag: BOOLEAN): STRING is
			-- String form of node or object for use in tree node.
		do
			Result := a_q.magnitude_as_string

			if assumed_flag then
				Result.append (" (Assumed)")
			end
		end

	object_c_quantity_item_string(a_object_c_quantity: C_QUANTITY_ITEM): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			if a_object_c_quantity.units /= Void then
				Result.append(a_object_c_quantity.units)
			end
			if a_object_c_quantity.magnitude /= Void then
				Result.append(": " + a_object_c_quantity.magnitude.as_string)
			end
		end

	object_invariant_string(an_inv: ASSERTION): STRING is
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string

			if archetype_directory.has_valid_selected_archetype then
				if not in_technical_mode then
					Result := ontology.substitute_codes (Result, current_language)
				end
			end
		end

	populate_invariants is
			-- populate invariants of archetype into bottom nodes of tree
		local
			a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			invariants: ARRAYED_LIST[ASSERTION]
			s: STRING
		do
			if archetype_directory.has_valid_selected_archetype then
				if target_archetype.has_invariants then
					invariants := target_archetype.invariants
					create a_ti_sub.make_with_text ("invariants:")
					a_ti_sub.set_pixmap(pixmaps.item ("CADL_INVARIANT"))
					gui_tree.extend (a_ti_sub)

					from
						invariants.start
					until
						invariants.off
					loop
						create s.make_empty

						if invariants.item.tag /= Void then
							s.append (invariants.item.tag + ": ")
						end

						s.append (object_invariant_string (invariants.item))
						create a_ti_sub2.make_with_text (utf8 (s))
						a_ti_sub2.set_pixmap (pixmaps.item ("CADL_INVARIANT_ITEM"))
						a_ti_sub2.set_data (invariants.item)
						a_ti_sub.extend (a_ti_sub2)
						invariants.forth
					end

					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end
			end
		end

invariant
	gui_attached: gui /= Void
	ontology_has_language: archetype_directory.has_valid_selected_archetype implies ontology.has_language (current_language)

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
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
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
