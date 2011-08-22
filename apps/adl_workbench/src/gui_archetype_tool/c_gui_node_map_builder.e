note
	component:   "openEHR Archetype Project"
	description: "Visitor to generate GUI tree from C_XX structure"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_GUI_NODE_MAP_BUILDER

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			end_c_archetype_root,
			end_c_complex_object,
			end_c_attribute,
			end_archetype_slot,
			end_archetype_internal_ref,
			end_constraint_ref,
			end_c_code_phrase, end_c_ordinal, end_c_quantity,
			end_c_primitive_object
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

feature -- Initialisation

	initialise (an_archetype: attached ARCHETYPE; a_lang: attached STRING; a_gui_tree: EV_TREE;
				technical_mode_flag, update_flag: BOOLEAN;
				a_gui_node_map: HASH_TABLE [EV_TREE_ITEM, ARCHETYPE_CONSTRAINT])
			-- set ontology required for serialising cADL, and perform basic initialisation
		do
			initialise_visitor (an_archetype)
			create ontologies.make(0)
			ontologies.extend (archetype.ontology)
			gui_tree := a_gui_tree
			gui_node_map := a_gui_node_map
			in_technical_mode := technical_mode_flag
			updating := update_flag
			language := a_lang
			rm_publisher := an_archetype.archetype_id.rm_originator.as_lower
			create gui_nodes.make (0)
		end

feature -- Visitor

	start_c_complex_object (a_node: attached C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter n C_COMPLEX_OBJECT
		local
			gui_node_text: STRING
			pixmap: EV_PIXMAP
		do
			-- node text
			gui_node_text := c_object_string (a_node)
			if a_node.any_allowed then
				gui_node_text.append (" = *")
			end

			-- pixmap
			if use_rm_pixmaps and then rm_pixmaps.has (rm_publisher) and then rm_pixmaps.item (rm_publisher).has (a_node.rm_type_name) then
				pixmap := rm_pixmaps.item (rm_publisher).item (a_node.rm_type_name)
			else
				pixmap := pixmaps.item(a_node.generating_type + occurrences_pixmap_string (a_node) + create_pixmap_ext (a_node))
			end

			if updating then
				gui_node_map.item (a_node).set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
				gui_node_map.item (a_node).set_pixmap (pixmap)
			else
				create_node (gui_node_text, pixmap, a_node)

				-- attach into GUI tree
				if a_node.is_root then
					gui_tree.extend (last_gui_node)
					gui_nodes.extend (last_gui_node)
				end
			end
		end

	end_c_complex_object (a_node: attached C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit a C_COMPLEX_OBJECT
		do
			if not a_node.is_root and not updating then
				gui_nodes.remove
			end
		end

	start_archetype_slot (a_node: attached ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			pixmap_name: STRING
			gui_node_text: STRING
			gui_node, gui_sub_node: EV_TREE_ITEM
			pixmap: EV_PIXMAP
		do
			-- node text
			gui_node_text := c_object_string (a_node)
			if a_node.any_allowed then
				gui_node_text.append (" = *")
			end

			-- pixmap
			if use_rm_pixmaps and then rm_pixmaps.has (rm_publisher) and then rm_pixmaps.item (rm_publisher).has (a_node.rm_type_name) then
				pixmap := rm_pixmaps.item (rm_publisher).item (a_node.rm_type_name)
			else
				pixmap_name := a_node.generating_type
				if not attached a_node.occurrences or else a_node.occurrences.lower = 0 then
					pixmap_name.append (".optional")
				end
				pixmap_name.append (create_pixmap_ext (a_node))
				pixmap := pixmaps.item (pixmap_name)
			end

			if updating then
				-- update the text
				gui_node := gui_node_map.item (a_node)
				gui_node.set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
				gui_node_map.item (a_node).set_pixmap (pixmap)

				-- update the children
				if a_node.has_includes or a_node.has_excludes then
					from gui_node.start until gui_node.off loop
						if attached {ASSERTION} gui_node.item.data as assn then
							gui_node.item.set_text (utf8 (object_invariant_string (assn)))
						end
						gui_node.forth
					end
				end
			else
				create_node (gui_node_text, pixmap, a_node)

				-- create child nodes for includes & excludes
				if a_node.has_includes then
					from a_node.includes.start until a_node.includes.off loop
						create gui_sub_node.make_with_text (utf8 (object_invariant_string (a_node.includes.item)))
						gui_sub_node.set_pixmap (pixmaps.item ("CADL_INCLUDE"))
						gui_sub_node.set_data (a_node.includes.item)
						last_gui_node.extend (gui_sub_node)
						a_node.includes.forth
					end
				end

				if a_node.has_excludes then
					from a_node.excludes.start until a_node.excludes.off loop
						create gui_sub_node.make_with_text (utf8 (object_invariant_string (a_node.excludes.item)))
						gui_sub_node.set_pixmap (pixmaps.item ("CADL_EXCLUDE"))
						gui_sub_node.set_data (a_node.excludes.item)
						last_gui_node.extend (gui_sub_node)
						a_node.excludes.forth
					end
				end
			end
		end

	end_archetype_slot (a_node: attached ARCHETYPE_SLOT; depth: INTEGER)
			-- exit a ARCHETYPE_SLOT
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_c_attribute (a_node: attached C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			pixmap_name: STRING
			gui_node_text, s: STRING
			pixmap: EV_PIXMAP
		do
			-- node text
			create gui_node_text.make_empty
			if in_technical_mode then
				create s.make_empty
				if attached a_node.existence then
					s.append ("Ex: " + a_node.existence.as_string)
				end
				if a_node.is_multiple and attached a_node.cardinality then
					if attached a_node.existence then
					 	s.append ("; ")
					end
				 	s.append ("Card: " + a_node.cardinality.as_string)
				end
				if not s.is_empty then
					gui_node_text.append ("{" + s + "} ")
				end
			elseif a_node.is_prohibited then
				gui_node_text.append (" (REMOVED) ")
			end
			gui_node_text.append (a_node.rm_attribute_path)
			if a_node.any_allowed then
				gui_node_text.append (" matches {*}")
			end

			if updating then
				-- update the text
				gui_node_map.item (a_node).set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
			else
				-- pixmap name
				pixmap_name := "c_attribute"
				if a_node.is_multiple then
					pixmap_name.append (".multiple")
				end
				if a_node.existence = Void or else a_node.existence.lower = 0 then
					pixmap_name.append (".optional")
				end
				pixmap := pixmaps.item(pixmap_name)

				create_node (gui_node_text, pixmap, a_node)
			end
		end

	end_c_attribute (a_node: attached C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_c_leaf_object (a_node: attached C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_reference_object (a_node: attached C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	start_c_archetype_root (a_node: attached C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		local
			gui_node_text: STRING
			pixmap: EV_PIXMAP
		do
			-- have to obtain the ontology from the main archetype directory because the archetype being serialised
			-- here might be in differential form, and have no component_ontologies aet up
			ontologies.extend (current_arch_cat.archetype_index.item (a_node.archetype_id).flat_archetype.ontology)

			-- node text
			gui_node_text := c_archetype_root_string (a_node)

			-- pixmap
			if use_rm_pixmaps and then rm_pixmaps.has (rm_publisher) and then rm_pixmaps.item (rm_publisher).has (a_node.rm_type_name) then
				pixmap := rm_pixmaps.item (rm_publisher).item (a_node.rm_type_name)
			else
				pixmap := pixmaps.item(a_node.generating_type + occurrences_pixmap_string (a_node) + create_pixmap_ext (a_node))
			end

			if updating then
				-- update the text
				gui_node_map.item (a_node).set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
				gui_node_map.item (a_node).set_pixmap (pixmap)
			else
				-- in flat mode; treat like normal C_COMPLEX_OBJECT with children
				if a_node.has_attributes then
					start_c_complex_object (a_node, depth)
				else -- it is in source mode, there are no children, only slot fillers
					create_node (gui_node_text, pixmap, a_node)
				end
			end
		end

	end_c_archetype_root (a_node: attached C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			ontologies.remove
			if not updating then
				gui_nodes.remove
			end
		end

	start_archetype_internal_ref (a_node: attached ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		local
			gui_node_text: STRING
		do
			-- node text
			create gui_node_text.make_empty
			if in_technical_mode then
				if not a_node.use_target_occurrences and attached a_node.occurrences then
					gui_node_text.append (" {" + a_node.occurrences_as_string + "} ")
				end
				gui_node_text.append ("use " + a_node.rm_type_name)
				if a_node.is_addressable then
					gui_node_text.append ("[" + a_node.node_id + "]")
				end
				gui_node_text.append (" " + a_node.target_path)
			elseif current_arch_cat.has_validated_selected_archetype then
				gui_node_text.append ("use " + ontology.physical_to_logical_path (a_node.target_path, language))
			end

			-- do the work
			if updating then
				gui_node_map.item (a_node).set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
			else
				create_node (gui_node_text, pixmaps.item(a_node.generating_type + create_pixmap_ext (a_node)), a_node)
			end
		end

	end_archetype_internal_ref (a_node: attached ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_constraint_ref (a_node: attached CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		local
			gui_node_text: STRING
		do
			-- node text
			gui_node_text := " " + ontology.constraint_definition (language, a_node.target).text
			if in_technical_mode then
				gui_node_text.append (" -> " + a_node.target)
			end

			if updating then
				gui_node_map.item (a_node).set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
			else
				create_node (gui_node_text, pixmaps.item(a_node.generating_type + create_pixmap_ext (a_node)), a_node)
			end
		end

	end_constraint_ref (a_node: attached CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_c_primitive_object (a_node: attached C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		local
			gui_node_text: STRING
		do
			-- node text
			create gui_node_text.make_empty
			if attached a_node.occurrences then
				if in_technical_mode then
					gui_node_text.append (" {" + a_node.occurrences_as_string + "}")
				elseif a_node.occurrences.is_prohibited then
					gui_node_text.append (" (REMOVED) ")
				end
			end
			if in_technical_mode then
				gui_node_text.append (a_node.rm_type_name)
			end
			gui_node_text.append (" " + a_node.item.as_string)

			-- do the work
			if updating then
				gui_node_map.item (a_node).set_text (utf8 (gui_node_text))
				gui_node_map.item (a_node).set_tooltip (node_tooltip_str (a_node))
			else
				create_node (gui_node_text, pixmaps.item(a_node.generating_type + create_pixmap_ext (a_node)), a_node)
			end
		end

	end_c_primitive_object (a_node: attached C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_c_domain_type (a_node: attached C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase (a_node: attached C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		local
			pixmap_ext: STRING
			gui_node_text: STRING
			gui_node, gui_sub_node: EV_TREE_ITEM
			assumed_flag: BOOLEAN
		do
			if updating then
				-- update the text
				gui_node := gui_node_map.item (a_node)
				gui_node.set_tooltip (node_tooltip_str (a_node))

				-- update the children
				if a_node.code_count > 0 then
					from
						a_node.code_list.start
						gui_node.start
					until
						a_node.code_list.off
					loop
						assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.code_string.is_equal (gui_node.item.text)
						gui_node.item.set_text (utf8 (object_term_item_string (a_node.code_list.item, assumed_flag, a_node.is_local)))
						a_node.code_list.forth
						gui_node.forth
					end
				end
			else
				-- pixmap name extension
				pixmap_ext := create_pixmap_ext (a_node)

				-- node text
				create gui_node_text.make_empty
				if not a_node.any_allowed then
					gui_node_text.append (a_node.terminology_id.value)
				end

				create_node (gui_node_text, pixmaps.item(a_node.generating_type + pixmap_ext), a_node)

				-- child nodes for each code
				if a_node.code_count > 0 then
					from a_node.code_list.start until a_node.code_list.off loop
						assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.code_string.is_equal (a_node.code_list.item)
						create gui_sub_node.make_with_text (utf8 (object_term_item_string (a_node.code_list.item, assumed_flag, a_node.is_local)))
						gui_sub_node.set_data (a_node.code_list.item) -- type STRING
						gui_sub_node.set_pixmap (pixmaps.item ("TERM" + pixmap_ext))
						last_gui_node.extend (gui_sub_node)
						a_node.code_list.forth
					end
				end
			end
		end

	end_c_code_phrase (a_node: attached C_CODE_PHRASE; depth: INTEGER)
			-- exit an C_CODE_PHRASE
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_c_ordinal (a_node: attached C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		local
			pixmap_ext: STRING
			gui_node, gui_sub_node: EV_TREE_ITEM
			assumed_flag: BOOLEAN
		do
			if updating then
				gui_node := gui_node_map.item (a_node)
				gui_node.set_tooltip (node_tooltip_str (a_node))
				-- update the children
				if not a_node.any_allowed then
					from
						a_node.items.start
						gui_node.start
					until
						a_node.items.off
					loop
						assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.value = a_node.items.item.value
						gui_node.item.set_text (utf8 (object_ordinal_item_string (a_node.items.item, assumed_flag)))
						a_node.items.forth
						gui_node.forth
					end
				end
			else
				-- pixmap name extension
				pixmap_ext := create_pixmap_ext (a_node)
				create_node (a_node.rm_type_name, pixmaps.item(a_node.generating_type + pixmap_ext), a_node)
				if not a_node.any_allowed then
					from a_node.items.start until a_node.items.off loop
						assumed_flag := a_node.has_assumed_value and then a_node.assumed_value.value = a_node.items.item.value
						create gui_sub_node.make_with_text (utf8 (object_ordinal_item_string (a_node.items.item, assumed_flag)))
						gui_sub_node.set_data (a_node.items.item) -- of type ORDINAL
						gui_sub_node.set_pixmap (pixmaps.item ("ORDINAL" + pixmap_ext))
						last_gui_node.extend (gui_sub_node)
						a_node.items.forth
					end
				end
			end
		end

	end_c_ordinal (a_node: attached C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
			if not updating then
				gui_nodes.remove
			end
		end

	start_c_quantity (a_node: attached C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		local
			gui_node_text: STRING
			pixmap_ext: STRING
			gui_node, gui_sub_node: EV_TREE_ITEM
		do
			-- node text
			create gui_node_text.make_empty
			if in_technical_mode then
				gui_node_text.append (a_node.rm_type_name)
			end
			if attached a_node.property then
				gui_node_text.append (" (" + a_node.property.as_string + ")")
			end

			if updating then
				-- update the text
				gui_node := gui_node_map.item (a_node)
				gui_node.set_text (gui_node_text)
				gui_node.set_tooltip (node_tooltip_str (a_node))

				-- update the child nodes
				if attached a_node.list then
					from
						a_node.list.start
						gui_node.start
					until
						a_node.list.off
					loop
						gui_node.item.set_text (utf8 (c_quantity_item_string (a_node.list.item)))
						a_node.list.forth
						gui_node.forth
					end
				end

				-- update assumed value child node; note that if there is an assumed value, the child
				-- GUI node list will be one longer than the a_node.list in the loop above
				if a_node.has_assumed_value then
					gui_node.item.set_text (utf8 (a_node.assumed_value.magnitude_as_string + " (Assumed)"))
				end
			else
				-- pixmap name extension
				pixmap_ext := create_pixmap_ext (a_node)
				create_node (gui_node_text, pixmaps.item(a_node.generating_type + pixmap_ext), a_node)

				-- child nodes
				if attached a_node.list then
					from a_node.list.start until a_node.list.off loop
						create gui_sub_node.make_with_text (utf8 (c_quantity_item_string (a_node.list.item)))
						gui_sub_node.set_data (a_node.list.item)
						gui_sub_node.set_pixmap (pixmaps.item ("C_QUANTITY_ITEM" + pixmap_ext))
						last_gui_node.extend (gui_sub_node)
						a_node.list.forth
					end
				end

				-- assumed value child node
				if a_node.has_assumed_value then
					create gui_sub_node.make_with_text (utf8 (a_node.assumed_value.magnitude_as_string + " (Assumed)"))
					gui_sub_node.set_data (a_node.assumed_value)
					gui_sub_node.set_pixmap (pixmaps.item ("C_QUANTITY_ITEM" + pixmap_ext))
					last_gui_node.extend (gui_sub_node)
				end
			end
		end

	end_c_quantity (a_node: attached C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
			if not updating then
				gui_nodes.remove
			end
		end

feature {NONE} -- Implementation

	create_pixmap_ext (a_node: attached ARCHETYPE_CONSTRAINT): attached STRING
			-- determine source status of node in archetype text, i.e. inherited, redefined, added etc
			-- and use it to set the kind of pixmap to use
			-- Always colourise inherited & overidden nodes. If we want a switch for this, implement a new flag.
		local
			spec_sts: INTEGER
		do
			create Result.make_empty
			spec_sts := a_node.specialisation_status (archetype.specialisation_depth).value
			if spec_sts = ss_inherited or spec_sts = ss_redefined then
				Result.append (".")
				Result.append (specialisation_status_names.item (spec_sts))
			end
		end

	create_node (a_text: STRING; a_pixmap: attached EV_PIXMAP; a_node: attached ARCHETYPE_CONSTRAINT)
			-- attach a node into the tree
		do
			-- create and set the text
			create last_gui_node.make_with_text (utf8 (a_text))

			-- set the data
			last_gui_node.set_data (a_node)

			-- set the pixmap
			last_gui_node.set_pixmap (a_pixmap)

			-- set the tooltip
			last_gui_node.set_tooltip (node_tooltip_str (a_node))

			-- attach into GUI tree
			if not gui_nodes.is_empty then
				gui_nodes.item.extend (last_gui_node)
				gui_nodes.extend (last_gui_node)
			end

			-- record in GUI node map
			gui_node_map.put (last_gui_node, a_node)
		end

	node_tooltip_str (a_node: attached ARCHETYPE_CONSTRAINT): STRING
			-- generate a tooltip for this node
		do
			if in_technical_mode then
				Result := utf8 (a_node.path)
			else
				Result := utf8 (ontology.physical_to_logical_path (a_node.path, language))
			end
			if archetype.has_annotation_at_path (language, a_node.path) then
				Result.append ("%N%NAnnotations:%N")
				Result.append (utf8 (archetype.annotations.annotation_at_path (language, a_node.path).as_string))
			end
		end

	last_gui_node: EV_TREE_ITEM
			-- node just created by `create_node'

	gui_nodes: ARRAYED_STACK[EV_TREE_ITEM]

	gui_tree: EV_TREE

	gui_node_map: HASH_TABLE [EV_TREE_ITEM, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI nodes (note that some C_X
			-- nodes have child GUI nodes; the visitor takes care of the details)
			-- reference copied from GUI_NODE_MAP_CONTROL

	in_technical_mode: BOOLEAN

	rm_publisher: STRING
			-- name of reference model of this archetype, for the purpose of finding pixmaps for RM-specific visualisation

	updating: BOOLEAN
			-- True indicates that the visitor is just updating the text value of the nodes

	language: attached STRING
			-- IETF RFC 5646 language tag; wll be an exact text match
			-- for one of the 'languages' in the archetype

	c_object_string (a_node: attached C_OBJECT): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if attached a_node.occurrences then
				if in_technical_mode then
					Result.append (" {" + a_node.occurrences_as_string + "} ")
				elseif a_node.occurrences.is_prohibited then
					Result.append (" (REMOVED) ")
				end
			end

			if a_node.is_addressable then
				if attached a_node.sibling_order then
					Result.append (a_node.sibling_order.as_string + " ")
				end

				if is_valid_code (a_node.node_id) and then ontology.has_term_code (a_node.node_id) then
					Result.append (" " + ontology.term_definition (language, a_node.node_id).text)
				end

				if in_technical_mode then
					Result.append (": " + a_node.rm_type_name + "[" + a_node.node_id + "]")
				end
				
			elseif not use_rm_pixmaps then
				 -- put type even when not in technical mode
				Result.append (a_node.rm_type_name)
			end
		end

	c_archetype_root_string (a_node: attached C_ARCHETYPE_ROOT): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if attached a_node.occurrences then
				if in_technical_mode then
					Result.append (" {" + a_node.occurrences_as_string + "} ")
				elseif a_node.occurrences.is_prohibited then
					Result.append (" (REMOVED) ")
				end
			end
			if attached a_node.slot_node_id then
				if attached a_node.sibling_order then
					Result.append (a_node.sibling_order.as_string + " ")
				end

				if ontology.has_term_code (a_node.slot_node_id) then
					Result.append (ontology.term_definition (language, a_node.slot_node_id).text)
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

	object_ordinal_item_string (an_ordinal: attached ORDINAL; assumed_flag: BOOLEAN): attached STRING
			-- generate string form of node or object for use in tree node
		local
			code: STRING
		do
			create Result.make_empty
			code := an_ordinal.symbol.code_string
			Result.append (an_ordinal.value.out + an_ordinal.separator.out)

			if current_arch_cat.has_validated_selected_archetype then
				if ontology.has_term_code (code) then
					Result.append (" " + ontology.term_definition (language, code).text)
				end
			end

			if in_technical_mode then
				Result.append (" -- " + code)
			end

			if assumed_flag then
				Result.append (" (Assumed)")
			end
		end

	object_term_item_string (code: attached STRING; assumed_flag, local_flag: BOOLEAN): attached STRING
			-- generate string form of node or object for use in tree node;
			-- assumed_flag = True if this is an assumed value - will be marked visually
			-- local_flag = True if his term is an at- or ac- code from within archetype
		do
			create Result.make_empty

			if current_arch_cat.has_validated_selected_archetype then
				if local_flag then
					if ontology.has_term_code (code) then
						Result.append (" " + ontology.term_definition (language, code).text)
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

	c_quantity_item_string (a_node: attached C_QUANTITY_ITEM): attached STRING
			-- generate string form of node or object for use in tree node
		do
			create Result.make_empty
			if a_node.units /= Void then
				Result.append (a_node.units)
			end
			if a_node.magnitude /= Void then
				Result.append (": " + a_node.magnitude.as_string)
			end
		end

	occurrences_pixmap_string (a_node: attached C_OBJECT): attached STRING
		do
			create Result.make_empty

			if not attached a_node.occurrences then
				Result.append (".optional")
			elseif a_node.occurrences.lower > 0 then
				if a_node.occurrences.upper > 1 then
					Result.append (".multiple")
				end
			else
				if a_node.occurrences.upper = 1 then
					Result.append (".optional")
				else
					Result.append (".multiple.optional")
				end
			end
		end

	object_invariant_string (an_inv: attached ASSERTION): attached STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string
			if current_arch_cat.has_validated_selected_archetype then
				if not in_technical_mode then
					Result := ontology.substitute_codes (Result, language)
				end
			end
		end

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
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
