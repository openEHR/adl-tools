note
	component:   "openEHR Archetype Project"
	description: "Node map control - Visualise an archetype structure as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_NODE_MAP_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
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

	SHARED_KNOWLEDGE_REPOSITORY

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_main_window: attached MAIN_WINDOW)
		do
			gui := a_main_window
			gui_tree := gui.node_map_tree

			in_technical_mode := show_technical_view
			in_reference_model_mode := show_reference_model_view
			if in_reference_model_mode then
				gui.node_map_reference_model_radio_button.enable_select
			elseif in_technical_mode then
				gui.node_map_technical_radio_button.enable_select
			else
				gui.node_map_domain_radio_button.enable_select
			end
		ensure
			gui_set: gui = a_main_window
		end

feature -- Status Report

	in_technical_mode: BOOLEAN
			-- If True, show more technical detail on each node

	in_reference_model_mode: BOOLEAN
			-- True if reference model should be visible in tree

	in_reference_model_mode_changed: BOOLEAN
			-- True if last call to set/unset in_reference_model_mode changed the flag's value

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

feature -- Commands

	set_domain_mode
			-- View only domain names; Set `in_technical_mode' off.
		do
			in_technical_mode := False
			set_show_technical_view (False)

			in_reference_model_mode_changed := in_reference_model_mode
			in_reference_model_mode := False
			set_show_reference_model_view (False)

			repopulate
		end

	set_technical_mode
			-- View domain names + RM classes; Set `in_technical_mode' on.
		do
			in_technical_mode := True
			set_show_technical_view (True)

			in_reference_model_mode_changed := in_reference_model_mode
			in_reference_model_mode := False
			set_show_reference_model_view (False)

			repopulate
		end

	set_reference_model_mode
			-- View domain names + RM classes + other RM attributes; Set `in_technical_mode' on, `in_reference_model_mode' on.
		do
			in_technical_mode := True
			set_show_technical_view (True)

			in_reference_model_mode_changed := not in_reference_model_mode
			in_reference_model_mode := True
			set_show_reference_model_view (True)

			repopulate
		end

	clear
		do
			gui_tree.wipe_out
		end

	populate
			-- populate the ADL tree control by creating it from scratch
		require
			has_current_profile
		local
			tree_iterator: OG_ITERATOR
		do
			clear
			archetype_tree_root_set := False
			create tree_item_stack.make (0)

			if current_arch_dir.has_validated_selected_archetype then
				if differential_view then
					target_archetype := current_arch_dir.selected_archetype.differential_archetype
				else
					target_archetype := current_arch_dir.selected_archetype.flat_archetype
				end
				create ontologies.make(0)
				ontologies.extend(target_archetype.ontology)

				create tree_iterator.make (target_archetype.definition.representation)
				tree_iterator.do_all (agent node_build_enter_action (?, ?), agent node_build_exit_action (?, ?))

				if in_reference_model_mode then
					gui_tree.recursive_do_all (agent node_add_rm_attributes (?))
				end

				populate_invariants
				is_expanded := not expand_node_tree
				toggle_expand_tree

				if not differential_view then
					roll_up_to_specialisation_level
				end
			end
		end

	repopulate
			-- update the ADL tree control by traversing the tree and modifying it
		do
			ev_tree_do_all (agent node_rebuild_enter_action (?), agent node_rebuild_exit_action (?))
			if in_reference_model_mode_changed then
				if in_reference_model_mode then
					gui_tree.recursive_do_all (agent node_add_rm_attributes (?))
				else
					gui_tree.recursive_do_all (agent node_remove_rm_attributes (?))
				end
				in_reference_model_mode_changed := False
			end
		end

	item_select
			-- Do something when an item is selected.
		do
			if attached {C_COMPLEX_OBJECT} gui_tree.selected_item.data as c_c_o then
				if c_c_o.is_addressable then
					gui.ontology_controls.select_term(c_c_o.node_id)
				end

			elseif attached {CONSTRAINT_REF} gui_tree.selected_item.data as c_r then
				gui.ontology_controls.select_constraint(c_r.target)

			elseif attached {ORDINAL} gui_tree.selected_item.data as ord then
				if ord.symbol.terminology_id.is_local then
					gui.ontology_controls.select_term(ord.symbol.code_string)
				end

			elseif attached {STRING} gui_tree.selected_item.data as str and then is_valid_code (str) then
				if current_arch_dir.has_validated_selected_archetype then
					if ontology.has_term_code (str) then
						gui.ontology_controls.select_term (str)
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

	shrink_to_level (a_type: STRING)
			-- Shrink the tree control up to items of type `a_type'.
		do
			gui_tree.recursive_do_all (agent ev_tree_item_shrink_to_level (a_type, ?))
		end

	expand_one_level
			-- Expand the tree control one level further.
		do
			create node_list.make (0)
			gui_tree.recursive_do_all (agent ev_tree_item_expand_one_level)

			from node_list.start until node_list.off loop
				node_list.item.expand
				node_list.forth
			end
		end

	shrink_one_level
			-- Shrink the tree control one level further.
		do
			create node_list.make (0)
			gui_tree.recursive_do_all (agent ev_tree_item_collapse_one_level)

			from node_list.start until node_list.off loop
				node_list.item.collapse
				node_list.forth
			end
		end

	roll_up_to_specialisation_level
			-- roll the tree up so that nodes whose rolled_up_specialisation_status is
			-- ss_inherited are closed, but nodes with
		require
			archetype_selected: current_arch_dir.has_validated_selected_archetype
		do
			if target_archetype.is_specialised and not target_archetype.is_template then
				create node_list.make(0)
				gui_tree.recursive_do_all(agent ev_tree_item_roll_up(?))

				from node_list.start until node_list.off loop
					node_list.item.collapse
					node_list.forth
				end
			end
		end

feature {NONE} -- Implementation

	rm_schema: SCHEMA_ACCESS
		do
			Result := current_arch_dir.selected_archetype.rm_schema
		end

	target_archetype: attached ARCHETYPE
			-- Differential or flat version of archetype, depending on setting of `differential_view'.

	ontologies: ARRAYED_STACK [ARCHETYPE_ONTOLOGY]
			-- we use a stack here to handle ontologies inside operational templates

	ontology: attached ARCHETYPE_ONTOLOGY
			-- The ontology for `target_archetype'.
		require
			ontologies_attached: attached ontologies
			ontologies_has_item: not ontologies.off
		do
			Result := ontologies.item
		ensure
			has_language: current_arch_dir.has_validated_selected_archetype implies Result.has_language (current_language)
		end

	gui: MAIN_WINDOW
			-- main window of system

	gui_tree: EV_TREE

	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	archetype_tree_root_set: BOOLEAN

	node_build_enter_action (an_og_node: OG_ITEM; indent_level: INTEGER)
		require
			Node_exists: an_og_node /= Void
		local
			a_ti, a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			a_type, s: STRING
			pixmap: EV_PIXMAP
			assumed_flag: BOOLEAN
			pixmap_ext: STRING
			spec_sts: INTEGER
		do
			create s.make (0)
			a_type := an_og_node.content_item.generating_type

			-- determine source status of node in archetype text, i.e. inherited, redefined, added etc
			-- and use it to set the kind of pixmap to use
			create pixmap_ext.make (0)

			-- Always colourise inherited & overidden nodes. If we want a switch for this, implement a new flag.
			if current_arch_dir.has_validated_selected_archetype and attached {ARCHETYPE_CONSTRAINT} an_og_node.content_item as arch_const then
				spec_sts := arch_const.specialisation_status (target_archetype.specialisation_depth).value

				if spec_sts = ss_inherited or spec_sts = ss_redefined then
					pixmap_ext.append (".")
					pixmap_ext.append (specialisation_status_names.item (spec_sts))
				end
			end

			if attached {C_ATTRIBUTE} an_og_node.content_item as c_attr then
				a_ti := attach_node(c_attribute_string(c_attr), pixmaps.item(c_attribute_pixmap_string(c_attr) + pixmap_ext), an_og_node)

			elseif attached {CONSTRAINT_REF} an_og_node.content_item as a_constraint_ref then
				a_ti := attach_node(constraint_ref_string(a_constraint_ref), pixmaps.item("CONSTRAINT_REF" + pixmap_ext), an_og_node)

			elseif attached {C_CODE_PHRASE} an_og_node.content_item as ccp then
				if not ccp.any_allowed then
					s.append (ccp.terminology_id.value)
				end

				a_ti := attach_node(s, pixmaps.item(ccp.generating_type + pixmap_ext), an_og_node)

				if ccp.code_count > 0 then
					from
						ccp.code_list.start
					until
						ccp.code_list.off
					loop
						assumed_flag := ccp.assumed_value /= Void and then ccp.assumed_value.code_string.is_equal(ccp.code_list.item)
						create a_ti_sub.make_with_text (utf8 (object_term_item_string (ccp.code_list.item, assumed_flag, ccp.is_local)))
						a_ti_sub.set_data (ccp.code_list.item) -- type STRING
						a_ti_sub.set_pixmap(pixmaps.item("TERM" + pixmap_ext))
						a_ti.extend (a_ti_sub)
						ccp.code_list.forth
					end
				end

			elseif attached {C_DV_ORDINAL} an_og_node.content_item as c_dv_ordinal then
				s.append (c_dv_ordinal.rm_type_name)
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
						a_ti_sub.set_data (c_dv_ordinal.items.item) -- of type ORDINAL
						a_ti_sub.set_pixmap(pixmaps.item("ORDINAL" + pixmap_ext))
						a_ti.extend (a_ti_sub)
						c_dv_ordinal.items.forth
					end
				end

			elseif attached {C_DV_QUANTITY} an_og_node.content_item as c_q then
				if in_technical_mode then
					s.append (c_q.rm_type_name)
				end
				if c_q.property /= Void then
					s.append (" (" + c_q.property.as_string + ")")
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

			elseif attached {C_PRIMITIVE_OBJECT} an_og_node.content_item as c_p_o then
				a_ti := attach_node(c_primitive_object_string(c_p_o), pixmaps.item(c_p_o.generating_type + pixmap_ext), an_og_node)

			elseif attached {C_ARCHETYPE_ROOT} an_og_node.content_item as car then
				a_ti := attach_node(c_archetype_root_string(car), pixmaps.item(car.generating_type + occurrences_pixmap_string(car) + pixmap_ext), an_og_node)
				ontologies.extend (current_arch_dir.archetype_index.item (car.archetype_id).flat_archetype.ontology)

			elseif attached {C_COMPLEX_OBJECT} an_og_node.content_item as c_c_o then
				a_ti := attach_node(c_complex_object_string(c_c_o), pixmaps.item(c_c_o.generating_type + occurrences_pixmap_string(c_c_o) + pixmap_ext), an_og_node)

			elseif attached {ARCHETYPE_SLOT} an_og_node.content_item as a_slot then
				if a_slot.occurrences /= Void and then a_slot.occurrences.lower = 1 then
					pixmap := pixmaps.item(a_slot.generating_type + pixmap_ext)
				else
					pixmap := pixmaps.item(a_slot.generating_type + ".optional" + pixmap_ext)
				end

				a_ti := attach_node(archetype_slot_string(a_slot), pixmap, an_og_node)

				if a_slot.has_includes then
					from a_slot.includes.start until a_slot.includes.off loop
						create a_ti_sub2.make_with_text (utf8 (object_invariant_string (a_slot.includes.item)))
						a_ti_sub2.set_pixmap (pixmaps.item ("CADL_INCLUDE"))
						a_ti_sub2.set_data (a_slot.includes.item)
						a_ti.extend (a_ti_sub2)
						a_slot.includes.forth
					end

					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end

				if a_slot.has_excludes then
					from a_slot.excludes.start until a_slot.excludes.off loop
						create a_ti_sub2.make_with_text (utf8 (object_invariant_string (a_slot.excludes.item)))
						a_ti_sub2.set_pixmap (pixmaps.item ("CADL_EXCLUDE"))
						a_ti_sub2.set_data (a_slot.excludes.item)
						a_ti.extend (a_ti_sub2)
						a_slot.excludes.forth
					end

					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end

			elseif attached {ARCHETYPE_INTERNAL_REF} an_og_node.content_item as a_node_ref then
				a_ti := attach_node(archetype_internal_ref_string(a_node_ref), pixmaps.item(a_node_ref.generating_type + pixmap_ext), an_og_node)
			end
		end

	node_build_exit_action(an_og_node: attached OG_ITEM; indent_level: INTEGER)
		do
			tree_item_stack.remove
			if attached {C_ARCHETYPE_ROOT} an_og_node.content_item as ex_ref then
				ontologies.remove
			end
		end

	node_rebuild_enter_action(a_tree_node: attached EV_TREE_NODE)
		local
			a_type, s: STRING
			assumed_flag: BOOLEAN
			pixmap_ext: STRING
			spec_sts: INTEGER
			tooltip_str: STRING
		do
			create s.make (0)
			if attached {EV_TREE_ITEM} a_tree_node as a_ti then

				-- tooltip: path + annotations if they exist
				if attached {C_OBJECT} a_ti.data as c_o then
					if in_technical_mode then
						tooltip_str := utf8 (c_o.representation.path.as_string)
					elseif current_arch_dir.has_validated_selected_archetype then
						tooltip_str := utf8 (ontology.physical_to_logical_path (c_o.representation.path.as_string, current_language))
					end

					if target_archetype.has_annotation_at_path (current_language, c_o.path) then
						tooltip_str.append ("%NAnnotations:%N")
						tooltip_str.append (utf8 (target_archetype.annotation_at_path (current_language, c_o.path).as_string))
					end
					a_ti.set_tooltip (tooltip_str)
				end

				-- icon
				create pixmap_ext.make(0)

				-- Always colourise inherited & overidden nodes. If we want a switch for this, implement a new flag.
				if attached {ARCHETYPE_CONSTRAINT} a_ti.data as arch_const then
					if current_arch_dir.has_validated_selected_archetype then
						spec_sts := arch_const.specialisation_status (target_archetype.specialisation_depth).value

						if spec_sts = ss_inherited or spec_sts = ss_redefined then
							pixmap_ext.append (".")
							pixmap_ext.append (specialisation_status_names.item (spec_sts))
						end
					end
				end

				a_type := a_ti.data.generating_type

				if attached {C_ATTRIBUTE} a_ti.data as c_attr then
					a_ti.set_text (utf8 (c_attribute_string (c_attr)))
					a_ti.set_pixmap(pixmaps.item(c_attribute_pixmap_string(c_attr) + pixmap_ext))

				elseif a_type.substring_index ("STRING", 1) = 1 then
					s ?= a_ti.data
					if attached {EV_TREE_NODE} a_ti.parent as parent_ti1 then
						if attached {C_CODE_PHRASE} parent_ti1.data as c_c_p then
							assumed_flag := c_c_p.assumed_value /= Void and then c_c_p.assumed_value.code_string.is_equal(s)
							a_ti.set_text (utf8 (object_term_item_string (s, assumed_flag, c_c_p.is_local)))
							create pixmap_ext.make (0)

							if differential_view then
								if current_arch_dir.has_validated_selected_archetype then
									spec_sts := c_c_p.specialisation_status (target_archetype.specialisation_depth).value
									if spec_sts = ss_inherited or spec_sts = ss_redefined then
										pixmap_ext.append ("." + specialisation_status_names.item (spec_sts))
									end
								end
							end

							a_ti.set_pixmap(pixmaps.item("TERM" + pixmap_ext))
						end
					end

				elseif attached {CONSTRAINT_REF} a_ti.data as a_constraint_ref then
					a_ti.set_text (utf8 (constraint_ref_string (a_constraint_ref)))
					a_ti.set_pixmap(pixmaps.item(a_constraint_ref.generating_type + pixmap_ext))

				elseif attached {C_CODE_PHRASE} a_ti.data as ccp then
					a_ti.set_pixmap(pixmaps.item(ccp.generating_type + pixmap_ext))

				elseif attached {C_DV_ORDINAL} a_ti.data as c_d_o then
					a_ti.set_pixmap(pixmaps.item(c_d_o.generating_type + pixmap_ext))

				elseif attached {ORDINAL} a_ti.data as an_ordinal then
					if attached {EV_TREE_NODE} a_ti.parent and then attached {C_DV_ORDINAL} a_ti.parent.data as c_dv_ordinal then
						assumed_flag := attached c_dv_ordinal.assumed_value and then c_dv_ordinal.assumed_value.value = an_ordinal.value
						a_ti.set_text (utf8 (object_ordinal_item_string (an_ordinal, assumed_flag)))
						create pixmap_ext.make(0)

						if differential_view then
							if current_arch_dir.has_validated_selected_archetype then
								spec_sts := c_dv_ordinal.specialisation_status (target_archetype.specialisation_depth).value
								if spec_sts = ss_inherited or spec_sts = ss_redefined then
									pixmap_ext.append (".")
									pixmap_ext.append (specialisation_status_names.item (spec_sts))
								end
							end
						end
						a_ti.set_pixmap(pixmaps.item("ORDINAL" + pixmap_ext))
					end

				elseif attached {C_DV_QUANTITY} a_ti.data as c_q then
					create s.make_empty
					if in_technical_mode then
						s.append (c_q.rm_type_name)
					end
					if attached c_q.property then
						s.append (" (" + c_q.property.as_string + ")")
					end
					a_ti.set_text (utf8 (s))
					a_ti.set_pixmap(pixmaps.item("C_DV_QUANTITY" + pixmap_ext))

				elseif attached {C_QUANTITY_ITEM} a_ti.data as c_q_i then
					if attached {EV_TREE_NODE} a_ti.parent as parent_ti then
						if attached {C_DV_QUANTITY} parent_ti.data as c_q2 then
							create pixmap_ext.make(0)
							if differential_view and current_arch_dir.has_validated_selected_archetype then
								spec_sts := c_q2.specialisation_status (target_archetype.specialisation_depth).value
								if spec_sts = ss_inherited or spec_sts = ss_redefined then
									pixmap_ext.append ("." + specialisation_status_names.item(spec_sts))
								end
							end
						end
					end
					a_ti.set_pixmap(pixmaps.item(c_q_i.generating_type + pixmap_ext))

				elseif attached {C_PRIMITIVE_OBJECT} a_ti.data as c_p_o then
					a_ti.set_text (utf8 (c_primitive_object_string (c_p_o)))
					a_ti.set_pixmap(pixmaps.item(c_p_o.generating_type + pixmap_ext))

				elseif attached {C_ARCHETYPE_ROOT} a_ti.data as car then
					a_ti.set_text (utf8 (c_archetype_root_string (car)))
					a_ti.set_pixmap(pixmaps.item(car.generating_type + occurrences_pixmap_string(car) + pixmap_ext))
					ontologies.extend (current_arch_dir.archetype_index.item (car.archetype_id).flat_archetype.ontology)

				elseif attached {C_COMPLEX_OBJECT} a_ti.data as c_c_o then
					a_ti.set_text (utf8 (c_complex_object_string (c_c_o)))
					a_ti.set_pixmap(pixmaps.item(c_c_o.generating_type + occurrences_pixmap_string(c_c_o) + pixmap_ext))

				elseif attached {ARCHETYPE_INTERNAL_REF} a_ti.data as a_node_ref then
					a_ti.set_text (utf8 (archetype_internal_ref_string (a_node_ref)))
					a_ti.set_pixmap(pixmaps.item(a_node_ref.generating_type + pixmap_ext))

				elseif attached {ARCHETYPE_SLOT} a_ti.data as a_slot then
					a_ti.set_text (utf8 (archetype_slot_string (a_slot)))
					a_ti.set_pixmap(pixmaps.item(a_slot.generating_type + pixmap_ext))

				elseif attached {ASSERTION} a_ti.data as an_inv then
					a_ti.set_text (utf8 (object_invariant_string (an_inv)))
				end
			else
				-- must be an invariant node: FIXME
			end
		end

	node_rebuild_exit_action(a_tree_node: attached EV_TREE_NODE)
		do
			if attached {C_ARCHETYPE_ROOT} a_tree_node.data as ex_ref then
				ontologies.remove
			end
		end

	node_add_rm_attributes(a_tree_node: attached EV_TREE_NODE)
		local
			a_node: ANY -- because includes STRING as well as ARCHETYPE_CONSTRAINT
			pixmap: EV_PIXMAP
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			attr_ti: EV_TREE_ITEM
		do
			if attached {EV_TREE_ITEM} a_tree_node as a_ti then
				a_node := a_ti.data
				if a_node /= Void and attached {C_COMPLEX_OBJECT} a_node as c_c_o then
					if rm_schema.has_class_definition (c_c_o.rm_type_name) then
						if differential_view then
							props := rm_schema.properties_of(c_c_o.rm_type_name)
						else
							props := rm_schema.flat_properties_of(c_c_o.rm_type_name)
						end
						from props.start until props.off loop
							if not c_c_o.has_attribute(props.key_for_iteration) then
								pixmap := pixmaps.item(rm_attribute_pixmap_string(props.item_for_iteration))
								create attr_ti.make_with_text (utf8 (props.key_for_iteration + ": " + props.item_for_iteration.type_def.as_type_string))
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

	node_remove_rm_attributes(a_tree_node: attached EV_TREE_NODE)
		do
			if attached {C_COMPLEX_OBJECT} a_tree_node.data as c_c_o then
				from a_tree_node.start until a_tree_node.off loop
					if attached {BMM_PROPERTY_DEFINITION} a_tree_node.item.data as a_bmm_prop then
						a_tree_node.remove
					else
						a_tree_node.forth
					end
				end
			end
		end

	attach_node(str: attached STRING; pixmap: attached EV_PIXMAP; an_og_node: attached OG_ITEM): attached EV_TREE_ITEM
			-- attach a node into the tree
		local
			tooltip_str: STRING
		do
			create Result.make_with_text (utf8 (str))
			Result.set_data (an_og_node.content_item)
			Result.set_pixmap (pixmap)

			-- build tooltip string
			if in_technical_mode then
				tooltip_str := utf8 (an_og_node.path.as_string)
			elseif current_arch_dir.has_validated_selected_archetype then
				tooltip_str := utf8 (ontology.physical_to_logical_path (an_og_node.path.as_string, current_language))
			end

			if target_archetype.has_annotation_at_path (current_language, an_og_node.path.as_string) then
				tooltip_str.append ("%N%NAnnotations:%N")
				tooltip_str.append (utf8 (target_archetype.annotation_at_path (current_language, an_og_node.path.as_string).as_string))
			end
			Result.set_tooltip (tooltip_str)

			-- attach into GUI tree
			if not archetype_tree_root_set then
				gui_tree.extend (Result)
				archetype_tree_root_set := True
			else
				tree_item_stack.item.extend (Result)
			end

			tree_item_stack.extend (Result)
		end

	ev_tree_item_expand (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.expand
			end
		end

	ev_tree_item_shrink(an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.collapse
			end
		end

	ev_tree_item_shrink_to_level(a_type: attached STRING; an_ev_tree_node: attached EV_TREE_NODE)
			--
		local
			node_type: STRING
			an_obj_node: C_COMPLEX_OBJECT
		do
			if attached an_ev_tree_node.data as node_data then
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

	ev_tree_item_expand_one_level(an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off loop
					if an_ev_tree_node.item.is_expandable and then not an_ev_tree_node.item.is_expanded then
						node_list.extend (an_ev_tree_node.item)
					end
					an_ev_tree_node.forth
				end
			elseif an_ev_tree_node = gui_tree.item then
				node_list.extend (an_ev_tree_node)
			end
		end

	ev_tree_item_collapse_one_level(an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off or else (an_ev_tree_node.item.is_expandable and then an_ev_tree_node.item.is_expanded) loop
					an_ev_tree_node.forth
				end

				if an_ev_tree_node.off then -- didn't find any expanded children
					node_list.extend (an_ev_tree_node)
				end
			end
		end

	ev_tree_item_roll_up(an_ev_tree_node: attached EV_TREE_NODE)
			-- close nodes that have rolled_up_specialisation_status = ss_inherited; open others
		do
			if an_ev_tree_node.is_expandable then
				if attached {ARCHETYPE_CONSTRAINT} an_ev_tree_node.data as ac then
					if ac.rolled_up_specialisation_status.value = ss_inherited then
						an_ev_tree_node.collapse
					else
						an_ev_tree_node.expand
					end
				end
			end
		end

	node_list: ARRAYED_LIST[EV_TREE_NODE]

	c_attribute_string(c_attr: attached C_ATTRIBUTE): attached STRING
			-- generate string form of node or object for use in tree node
		local
			s: STRING
		do
			create Result.make_empty
			if in_technical_mode then
				create s.make_empty
				if attached c_attr.existence then
					s.append (c_attr.existence.as_string)
				end
				if c_attr.is_multiple and attached c_attr.cardinality then
				 	s.append ("; " + c_attr.cardinality.as_string)
				end
				if not s.is_empty then
					Result.append ("{" + s + "} ")
				end
			elseif c_attr.is_prohibited then
				Result.append (" (REMOVED) ")
			end

			Result.append (c_attr.rm_attribute_path)
			if c_attr.any_allowed then
				Result.append (" matches {*}")
			end
		end

	c_attribute_pixmap_string(c_attr: attached C_ATTRIBUTE): attached STRING
			-- string name of pixmap for attribute c_attr
		do
			create Result.make_empty
			Result.append ("C_ATTRIBUTE")
			if c_attr.is_multiple then
				Result.append (".multiple")
			end

			if c_attr.existence = Void or else c_attr.existence.lower = 0 then
				Result.append (".optional")
			end
		end

	rm_attribute_pixmap_string(rm_attr: attached BMM_PROPERTY_DEFINITION): attached STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make_empty
			Result.append ("C_ATTRIBUTE")
			if rm_attr.is_container then
				Result.append (".multiple")
			end
			if not rm_attr.is_mandatory then
				Result.append (".optional")
			end
			Result.append (".reference_model")
		end

	c_complex_object_string(c_c_o: attached C_COMPLEX_OBJECT): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if attached c_c_o.occurrences then
				if in_technical_mode then
					Result.append (" {" + c_c_o.occurrences_as_string + "} ")
				elseif c_c_o.occurrences.is_prohibited then
					Result.append (" (REMOVED) ")
				end
			end

			if c_c_o.is_addressable then
				if attached c_c_o.sibling_order then
					Result.append (c_c_o.sibling_order.as_string + " ")
				end

				if current_arch_dir.has_validated_selected_archetype and ontology.has_term_code (c_c_o.node_id) then
					Result.append (" " + ontology.term_definition (current_language, c_c_o.node_id).item ("text"))
				end

				if in_technical_mode then
					Result.append (": " + c_c_o.rm_type_name + "[" + c_c_o.node_id + "]")
				end
			else -- put type even when not in technical mode
				Result.append (c_c_o.rm_type_name)
			end

			if c_c_o.any_allowed then
				Result.append (" = *")
			end
		end

	occurrences_pixmap_string(c_o: attached C_OBJECT): attached STRING
		do
			create Result.make_empty

			if c_o.occurrences = Void then
				Result.append (".optional")
			elseif c_o.occurrences.lower > 0 then
				if c_o.occurrences.upper > 1 then
					Result.append (".multiple")
				end
			else
				if c_o.occurrences.upper = 1 then
					Result.append (".optional")
				else
					Result.append (".multiple.optional")
				end
			end
		end

	archetype_slot_string(a_node: attached ARCHETYPE_SLOT): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if in_technical_mode and attached a_node.occurrences then
				Result.append (" {" + a_node.occurrences_as_string + "} ")
			end

			if a_node.is_addressable then
				if a_node.sibling_order /= Void then
					Result.append (a_node.sibling_order.as_string + " ")
				end

				if current_arch_dir.has_validated_selected_archetype and ontology.has_term_code (a_node.node_id) then
					Result.append (" " + ontology.term_definition (current_language, a_node.node_id).item ("text"))
				end
				if in_technical_mode then
					Result.append (": " + a_node.rm_type_name + "[" + a_node.node_id + "]")
				end
			else
				Result.append (a_node.rm_type_name)
			end

			if a_node.any_allowed then
				Result.append (" = *")
			end
		end

	c_primitive_object_string(c_p_o: attached C_PRIMITIVE_OBJECT): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			if attached c_p_o.occurrences then
				if in_technical_mode then
					Result.append (" {" + c_p_o.occurrences_as_string + "}")
				elseif c_p_o.occurrences.is_prohibited then
					Result.append (" (REMOVED) ")
				end
			end
			if in_technical_mode then
				Result.append (c_p_o.rm_type_name)
			end
			Result.append (" " + c_p_o.item.as_string)
		end

	archetype_internal_ref_string(a_node: attached ARCHETYPE_INTERNAL_REF): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty

			if in_technical_mode then
				if not a_node.use_target_occurrences and attached a_node.occurrences then
					Result.append (" {" + a_node.occurrences_as_string + "} ")
				end
				Result.append ("use " + a_node.rm_type_name)
				if a_node.is_addressable then
					Result.append ("[" + a_node.node_id + "]")
				end
				Result.append (" " + a_node.target_path)
			elseif current_arch_dir.has_validated_selected_archetype then
				Result.append ("use " + ontology.physical_to_logical_path (a_node.target_path, current_language))
			end
		end

	c_archetype_root_string(a_node: attached C_ARCHETYPE_ROOT): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if in_technical_mode then
				if attached a_node.occurrences then
					Result.append (" {" + a_node.occurrences_as_string + "} ")
				end
			end
			if current_arch_dir.has_validated_selected_archetype and attached a_node.slot_node_id then
				if ontology.has_term_code (a_node.slot_node_id) then
					Result.append (ontology.term_definition (current_language, a_node.slot_node_id).item ("text"))
				else
					Result.append ("(unknown)")
				end
				if in_technical_mode then
					Result.append (": ")
				end
			end
			if in_technical_mode then
				Result.append (a_node.rm_type_name)
			end
			Result.append (" [" + a_node.node_id + "]")
		end

	object_term_item_string(code: attached STRING; assumed_flag, local_flag: BOOLEAN): attached STRING
			-- generate string form of node or object for use in tree node;
			-- assumed_flag = True if this is an assumed value - will be marked visually
			-- local_flag = True if his term is an at- or ac- code from within archetype
		do
			create Result.make_empty

			if current_arch_dir.has_validated_selected_archetype then
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

	constraint_ref_string(a_constraint_ref: attached CONSTRAINT_REF): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty

			if current_arch_dir.has_validated_selected_archetype then
				Result.append (" " + ontology.constraint_definition (current_language, a_constraint_ref.target).item ("text"))
			end

			if in_technical_mode then
				Result.append (" -> " + a_constraint_ref.target)
			end
		end

	object_ordinal_item_string(an_ordinal: attached ORDINAL; assumed_flag: BOOLEAN): attached STRING
			-- generate string form of node or object for use in tree node
		local
			code: STRING
		do
			create Result.make_empty
			code := an_ordinal.symbol.code_string
			Result.append (an_ordinal.value.out + an_ordinal.separator.out)

			if current_arch_dir.has_validated_selected_archetype then
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

	object_quantity_string (a_q: attached QUANTITY; assumed_flag: BOOLEAN): attached STRING
			-- String form of node or object for use in tree node.
		do
			Result := a_q.magnitude_as_string

			if assumed_flag then
				Result.append (" (Assumed)")
			end
		end

	object_c_quantity_item_string(a_object_c_quantity: attached C_QUANTITY_ITEM): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if a_object_c_quantity.units /= Void then
				Result.append (a_object_c_quantity.units)
			end
			if a_object_c_quantity.magnitude /= Void then
				Result.append (": " + a_object_c_quantity.magnitude.as_string)
			end
		end

	object_invariant_string(an_inv: attached ASSERTION): attached STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string

			if current_arch_dir.has_validated_selected_archetype then
				if not in_technical_mode then
					Result := ontology.substitute_codes (Result, current_language)
				end
			end
		end

	populate_invariants
			-- populate invariants of archetype into bottom nodes of tree
		local
			a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			invariants: ARRAYED_LIST[ASSERTION]
			s: STRING
		do
			if current_arch_dir.has_validated_selected_archetype then
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

	ev_tree_do_all(node_enter_action, node_exit_action: PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
			-- do enter_action and exit_action to all nodes in the structure
		require
			Enter_action_valid: node_enter_action /= Void
			Exit_action_valid: node_exit_action /= Void
		do
			from gui_tree.start until gui_tree.off loop
				ev_tree_do_all_nodes(gui_tree.item, node_enter_action, node_exit_action)
				gui_tree.forth
			end
		end

	ev_tree_do_all_nodes(a_target: EV_TREE_NODE; node_enter_action, node_exit_action: PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
		require
			Target_exists: a_target /= Void
		do
			node_enter_action.call([a_target])
			from
				a_target.start
			until
				a_target.off
			loop
				ev_tree_do_all_nodes(a_target.item, node_enter_action, node_exit_action)
				a_target.forth
			end
			node_exit_action.call([a_target])
		end

invariant
	Three_value_logic: in_reference_model_mode implies in_technical_mode

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
