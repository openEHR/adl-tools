indexing	
	component:   "openEHR Archetype Project"
	description: "Node map control"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_NODE_MAP_CONTROL

inherit
	SHARED_ADL_INTERFACE
		export
			{NONE} all
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_main_window: MAIN_WINDOW; an_adl_context: ADL_ENGINE; parsed_archetype_tree: EV_TREE) is
		require
			a_main_window /= Void
			an_adl_context /= Void
			parsed_archetype_tree /= Void
		do
			gui := a_main_window
			adl_engine := an_adl_context
			gui_tree := parsed_archetype_tree
		end

feature -- Access

	in_technical_mode: BOOLEAN
	
feature -- Commands

	toggle_technical_mode is
			-- toggle technical mode setting
		do
			in_technical_mode := not in_technical_mode
			repopulate
		end
		
	set_technical_node is
			-- set technical mode on
		do
			in_technical_mode := True
			repopulate
		end
		
	set_domain_mode is
			-- set technical mode off
		do
			in_technical_mode := False
			repopulate
		end
		
	clear is
		do
			gui_tree.wipe_out
		end

	populate is
			-- populate the ADL tree control by creating it from scratch
		do
			clear
			archetype_tree_root_set := False
			create tree_item_stack.make(0)
			create tree_iterator.make(adl_engine.archetype.definition.representation)
			tree_iterator.do_all(agent node_build_enter_action(?,?), agent node_build_exit_action(?,?))
			populate_invariants
			is_expanded := False
			expand_or_shrink
		end

	repopulate is
			-- populate the ADL tree control by traversing the tree and modifying it
		do
			gui_tree.recursive_do_all(agent node_rebuild_enter_action(?))
		end

	item_select is
			-- do something when an item is selected
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
						if s /= Void then -- must be a term constraint item
							if ontology.has_term_code(s) then
								gui.ontology_controls.select_term(s)
							end
						end
					end
				end
			end
		end
		
	expand_or_shrink is
			-- expand or shrink the tree control
		do
			is_expanded := not is_expanded
			if is_expanded then
				gui_tree.recursive_do_all(agent ev_tree_item_expand(?))
			else
				gui_tree.recursive_do_all(agent ev_tree_item_shrink(?))
			end
		end

	shrink_to_level(a_type: STRING) is
			-- shrink the tree control up to items of type `a_type'
		do
			gui_tree.recursive_do_all(agent ev_tree_item_shrink_to_level(a_type, ?))
		end

	expand_one_level is
			-- expand the tree control one level further
		do
			create node_list.make(0)
			gui_tree.recursive_do_all(agent ev_tree_item_expand_one_level(?))
			from
				node_list.start
			until
				node_list.off
			loop
				node_list.item.expand
				node_list.forth
			end
		end

	shrink_one_level is
			-- shrink the tree control one level further
		do
			create node_list.make(0)
			gui_tree.recursive_do_all(agent ev_tree_item_collapse_one_level(?))
			from
				node_list.start
			until
				node_list.off
			loop
				node_list.item.collapse
				node_list.forth
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	gui_tree: EV_TREE

	adl_engine: ADL_ENGINE

	tree_iterator: OG_ITERATOR
	
	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]
	
	archetype_tree_root_set: BOOLEAN

	node_build_enter_action(an_og_node: OG_ITEM; indent_level: INTEGER) is
		require
			Node_exists: an_og_node /= Void
		local
			a_ti, a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			an_attr_node: C_ATTRIBUTE
			an_obj_node: C_COMPLEX_OBJECT
			a_simple_node: C_PRIMITIVE_OBJECT
			a_object_term: C_CODED_TERM
			a_constraint_ref: CONSTRAINT_REF
			a_node_ref: ARCHETYPE_INTERNAL_REF
			a_slot: ARCHETYPE_SLOT
			a_object_ordinal: C_ORDINAL
			a_object_quantity: C_QUANTITY
			a_type, s: STRING
			pixmap: EV_PIXMAP
			assumed_flag: BOOLEAN
		do
			create s.make(0)
			a_type := an_og_node.content_item.generating_type
			
			if a_type.is_equal("C_ATTRIBUTE") then
				an_attr_node ?= an_og_node.content_item
				if an_attr_node.is_multiple then
					a_ti := attach_node(c_attribute_string(an_attr_node), pixmaps.item("C_ATTRIBUTE.multiple"), an_og_node)
				else	
					a_ti := attach_node(c_attribute_string(an_attr_node), pixmaps.item("C_ATTRIBUTE"), an_og_node)				
				end
				
			elseif a_type.is_equal("CONSTRAINT_REF") then
				a_constraint_ref ?= an_og_node.content_item
				a_ti := attach_node(constraint_ref_string(a_constraint_ref), pixmaps.item("CONSTRAINT_REF"), an_og_node)				

			elseif a_type.is_equal("C_CODED_TERM") then
				a_object_term ?= an_og_node.content_item
				s.append(a_object_term.terminology_id.value)
				a_ti := attach_node(s, pixmaps.item("C_CODED_TERM"), an_og_node)			
				from
					a_object_term.code_list.start
				until
					a_object_term.code_list.off						
				loop
					assumed_flag := a_object_term.assumed_value /= Void and then 
						a_object_term.assumed_value.is_equal(a_object_term.code_list.item)
					create a_ti_sub.make_with_text(object_term_item_string(a_object_term.code_list.item, assumed_flag))
					a_ti_sub.set_data(a_object_term.code_list.item) -- type STRING
					a_ti_sub.set_pixmap(pixmaps.item("TERM"))
					a_ti.extend(a_ti_sub)
					a_object_term.code_list.forth						
				end
				
			elseif a_type.is_equal("C_ORDINAL") then
				a_object_ordinal ?= an_og_node.content_item
				s.append(a_object_ordinal.rm_type_name)
				a_ti := attach_node(s, pixmaps.item("C_ORDINAL"), an_og_node)			
				from
					a_object_ordinal.items.start
				until
					a_object_ordinal.items.off						
				loop
					assumed_flag := a_object_ordinal.assumed_value /= Void and then 
						a_object_ordinal.assumed_value.value = a_object_ordinal.items.item.value
					create a_ti_sub.make_with_text(object_ordinal_item_string(a_object_ordinal.items.item, assumed_flag))
					a_ti_sub.set_data(a_object_ordinal.items.item) -- of type ORDINAL
					a_ti_sub.set_pixmap(pixmaps.item("ORDINAL"))
					a_ti.extend(a_ti_sub)
					a_object_ordinal.items.forth						
				end				
				
			elseif a_type.is_equal("C_QUANTITY") then
				a_object_quantity ?= an_og_node.content_item
				if in_technical_mode then
					s.append(a_object_quantity.rm_type_name)		
				end
				if a_object_quantity.property /= Void then
					s.append(" (" + a_object_quantity.property + ")")
				end
				a_ti := attach_node(s, pixmaps.item("C_QUANTITY"), an_og_node)			
				from
					a_object_quantity.list.start
				until
					a_object_quantity.list.off						
				loop
					create a_ti_sub.make_with_text(object_c_quantity_item_string(a_object_quantity.list.item))
					a_ti_sub.set_data(a_object_quantity.list.item)
					a_ti_sub.set_pixmap(pixmaps.item("C_QUANTITY_ITEM"))
					a_ti.extend(a_ti_sub)
					a_object_quantity.list.forth						
				end
				
				if a_object_quantity.assumed_value /= Void then
					create a_ti_sub.make_with_text(object_quantity_string(a_object_quantity.assumed_value, True))
					a_ti_sub.set_data(a_object_quantity.assumed_value)
					a_ti_sub.set_pixmap(pixmaps.item("C_QUANTITY_ITEM"))
					a_ti.extend(a_ti_sub)					
				end
				
			elseif a_type.is_equal("C_PRIMITIVE_OBJECT") then
				a_simple_node ?= an_og_node.content_item
				a_ti := attach_node(c_primitive_object_string(a_simple_node), pixmaps.item("C_PRIMITIVE_OBJECT"), an_og_node)				
				
			elseif a_type.is_equal("C_COMPLEX_OBJECT") then
				an_obj_node ?= an_og_node.content_item				
				if an_obj_node.is_addressable then
					pixmap := pixmaps.item("C_COMPLEX_OBJECT")
				else
					pixmap := pixmaps.item("C_COMPLEX_OBJECT.unknown")
				end
				a_ti := attach_node(c_complex_object_string(an_obj_node), pixmap, an_og_node)
				
			elseif a_type.is_equal("ARCHETYPE_SLOT") then
				a_slot ?= an_og_node.content_item				
				pixmap := pixmaps.item("ARCHETYPE_SLOT")
				a_ti := attach_node(archetype_slot_string(a_slot), pixmap, an_og_node)
				
				if a_slot.has_includes then
					create a_ti_sub.make_with_text("includes:")
					a_ti_sub.set_pixmap(pixmaps.item("CADL_INCLUDE"))
					a_ti.extend(a_ti_sub)
					
					from
						a_slot.includes.start
					until
						a_slot.includes.off
					loop
						create a_ti_sub2.make_with_text(object_invariant_string(a_slot.includes.item))
						a_ti_sub2.set_pixmap(pixmaps.item("CADL_INVARIANT_ITEM"))
						a_ti_sub2.set_data(a_slot.includes.item)
						a_ti_sub.extend(a_ti_sub2)
						a_slot.includes.forth
					end
					
					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end

				if a_slot.has_excludes then
					create a_ti_sub.make_with_text("excludes:")
					a_ti_sub.set_pixmap(pixmaps.item("CADL_EXCLUDE"))
					a_ti.extend(a_ti_sub)
					
					from
						a_slot.excludes.start
					until
						a_slot.excludes.off
					loop
						create a_ti_sub2.make_with_text(object_invariant_string(a_slot.excludes.item))
						a_ti_sub2.set_pixmap(pixmaps.item("CADL_INVARIANT_ITEM"))
						a_ti_sub2.set_data(a_slot.excludes.item)
						a_ti_sub.extend(a_ti_sub2)
						a_slot.excludes.forth
					end
					
					-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
				end

			elseif a_type.is_equal("ARCHETYPE_INTERNAL_REF") then
				a_node_ref ?= an_og_node.content_item
				a_ti := attach_node(archetype_internal_ref_string(a_node_ref), pixmaps.item("ARCHETYPE_INTERNAL_REF"), an_og_node)				
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
			an_attr_node: C_ATTRIBUTE
			an_obj_node: C_COMPLEX_OBJECT
			a_simple_node: C_PRIMITIVE_OBJECT
			a_object_quantity: C_QUANTITY
			a_constraint_ref: CONSTRAINT_REF
			a_node_ref: ARCHETYPE_INTERNAL_REF
			a_slot: ARCHETYPE_SLOT
			a_type, s: STRING
			a_object_term: C_CODED_TERM
			a_object_ordinal: C_ORDINAL
			an_ordinal: ORDINAL
			a_node: ANY -- because includes STRING as well as ARCHETYPE_CONSTRAINT
			parent: EV_TREE_NODE
			an_inv: ASSERTION
			assumed_flag: BOOLEAN
		do
			create s.make(0)
			a_ti ?= a_tree_node
			if a_ti /= Void then
				a_node := a_ti.data
				
				if a_node /= Void then
					a_type := a_node.generating_type
			
					if a_type.is_equal("C_ATTRIBUTE") then
						an_attr_node ?= a_node
						a_ti.set_text(c_attribute_string(an_attr_node))
				
					elseif a_type.is_equal("STRING") then
						s ?= a_node
						parent ?= a_ti.parent
						if parent /= Void then
							a_object_term ?= parent.data
							if a_object_term /= Void then
								assumed_flag := a_object_term.assumed_value /= Void and then 
									a_object_term.assumed_value.is_equal(s)
								a_ti.set_text(object_term_item_string(s, assumed_flag))						
							end
						end
				
					elseif a_type.is_equal("CONSTRAINT_REF") then
						a_constraint_ref ?= a_node
						a_ti.set_text(constraint_ref_string(a_constraint_ref))
				
					elseif a_type.is_equal("C_CODED_TERM") then
						-- nothing needed
						
					elseif a_type.is_equal("C_ORDINAL") then
						-- nothing needed
				
					elseif a_type.is_equal("C_QUANTITY") then
						a_object_quantity ?= a_node
						create s.make(0)
						if in_technical_mode then
							s.append(a_object_quantity.rm_type_name)		
						end
						if a_object_quantity.property /= Void then
							s.append(" (" + a_object_quantity.property + ")")
						end
						a_ti.set_text(s)				
				
					elseif a_type.is_equal("ORDINAL") then
						an_ordinal ?= a_node
						parent ?= a_ti.parent
						a_object_ordinal ?= parent.data
						assumed_flag := a_object_ordinal.assumed_value /= Void and then 
							a_object_ordinal.assumed_value.value = an_ordinal.value

						a_ti.set_text(object_ordinal_item_string(an_ordinal, assumed_flag))
						
					elseif a_type.is_equal("C_PRIMITIVE_OBJECT") then
						a_simple_node ?= a_node
						a_ti.set_text(c_primitive_object_string(a_simple_node))				
				
					elseif a_type.is_equal("C_COMPLEX_OBJECT") then
						an_obj_node ?= a_node				
						a_ti.set_text(c_complex_object_string(an_obj_node))
				
					elseif a_type.is_equal("ARCHETYPE_INTERNAL_REF") then
						a_node_ref ?= a_node
						a_ti.set_text(archetype_internal_ref_string(a_node_ref))	
						
					elseif a_type.is_equal("ARCHETYPE_SLOT") then
						a_slot ?= a_node
						a_ti.set_text(archetype_slot_string(a_slot))	
						
					elseif a_type.is_equal("ASSERTION") then
						an_inv ?= a_node
						a_ti.set_text(object_invariant_string(an_inv))				
					end				
				end		
			else
				-- must be an invariant node: FIXME
			end
		end

	attach_node(str: STRING; pixmap: EV_PIXMAP; an_og_node: OG_ITEM): EV_TREE_ITEM is
			-- attach a node into the tree
		do
			create Result.make_with_text(str)
			Result.set_data(an_og_node.content_item)
			Result.set_pixmap(pixmap)
			if not archetype_tree_root_set then
				gui_tree.extend(Result)
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

	node_list: ARRAYED_LIST[EV_TREE_NODE]
	
	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

	c_attribute_string(an_attr_node: C_ATTRIBUTE): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			Result.append(" [" + an_attr_node.existence.as_occurrences_string + "] ")
			if an_attr_node.is_multiple then
				Result.append(" [" + an_attr_node.cardinality.as_string + "] ")			
			end
			Result.append(an_attr_node.rm_attribute_name)
			if an_attr_node.any_allowed then
				Result.append(" matches {*}")
			end		
		end
	
	c_complex_object_string(an_obj_node: C_COMPLEX_OBJECT): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			Result.append(" [" + an_obj_node.occurrences.as_occurrences_string + "] ")
			if an_obj_node.is_addressable then
				if in_technical_mode then
					Result.append(an_obj_node.rm_type_name + "[" + an_obj_node.node_id + "]")
				end
				Result.append(" -- " + ontology.term_definition(language, an_obj_node.node_id).item("text"))
			else -- put type even when not in technical mode
				Result.append(an_obj_node.rm_type_name)
			end
			if an_obj_node.any_allowed then
				Result.append(" = *")
			end
		end

	archetype_slot_string(an_obj_node: ARCHETYPE_SLOT): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			Result.append(" [" + an_obj_node.occurrences.as_occurrences_string + "] ")
			if in_technical_mode then
				Result.append(an_obj_node.rm_type_name)
			end
			if an_obj_node.is_addressable then
				if in_technical_mode then
					Result.append("[" + an_obj_node.node_id + "]")
				end
				Result.append(" -- " + ontology.term_definition(language, an_obj_node.node_id).item("text"))
			end
			if an_obj_node.any_allowed then
				Result.append(" = *")
			end
		end

	c_primitive_object_string(a_simple_node: C_PRIMITIVE_OBJECT): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			if not (a_simple_node.occurrences.lower = 1 and a_simple_node.occurrences.upper = 1) then
				Result.append(" [" + a_simple_node.occurrences.as_occurrences_string + "] ")
			end
			Result.append(a_simple_node.item.as_string)
			if in_technical_mode then		
				Result.append(" (" + a_simple_node.rm_type_name + ")")
			end
		end

	archetype_internal_ref_string(a_node_ref: ARCHETYPE_INTERNAL_REF): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			if in_technical_mode then		
				Result.append("use " + a_node_ref.target_path)
			else
				Result.append("use " + ontology.logical_path_for_physical_path(a_node_ref.target_path, language))
			end
		end

	object_term_item_string(code: STRING; assumed_flag: BOOLEAN): STRING is
			-- generate string form of node or object for use in tree node
		do		
			create Result.make(0)
			if ontology.term_codes.has(code) then
				Result.append(" " + ontology.term_definition(language, code).item("text"))
			end
			Result.append(" -- " + code)
			if assumed_flag then
				Result.append(" (Assumed)")
			end
		end
	
	constraint_ref_string(a_constraint_ref: CONSTRAINT_REF): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			Result.append(" " + ontology.constraint_definition(language, a_constraint_ref.target).item("text"))	
			if in_technical_mode then
				Result.append(" -> " + a_constraint_ref.target)			
			end
		end
		
	object_ordinal_item_string(a_object_ordinal: ORDINAL; assumed_flag: BOOLEAN): STRING is
			-- generate string form of node or object for use in tree node
		local
			code: STRING
		do
			create Result.make(0)
			code := a_object_ordinal.symbol.code_string
			Result.append(a_object_ordinal.value.out + a_object_ordinal.separator.out)
			if ontology.term_codes.has(code) then
				Result.append(" " + ontology.term_definition(language, code).item("text"))
			end
			if in_technical_mode then
				Result.append(" -- " + code)
			end
			if assumed_flag then
				Result.append(" (Assumed)")
			end
		end
		
	object_quantity_string(a_object_quantity: QUANTITY; assumed_flag: BOOLEAN): STRING is
			-- generate string form of node or object for use in tree node
		do
			create Result.make(0)
			Result.append(a_object_quantity.magnitude.out)
			Result.append(" " + a_object_quantity.units)
			if assumed_flag then
				Result.append(" (Assumed)")
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
			create Result.make(0)
			Result := an_inv.as_string
			if not in_technical_mode then
				Result := ontology.substitute_codes(Result, language)
			end
		end

	populate_invariants is
			-- populate invariants of archetype into bottom nodes of tree
		local
			a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			invariants: ARRAYED_LIST[ASSERTION]
		do
			if adl_engine.archetype.has_invariants then
				invariants := adl_engine.archetype.invariants
				create a_ti_sub.make_with_text("invariants:")
				a_ti_sub.set_pixmap(pixmaps.item("CADL_INVARIANT"))
				gui_tree.extend(a_ti_sub)
					
				from
					invariants.start
				until
					invariants.off
				loop
					create a_ti_sub2.make_with_text(invariants.item.tag + ": " + 
						object_invariant_string(invariants.item))
					a_ti_sub2.set_pixmap(pixmaps.item("CADL_INVARIANT_ITEM"))
					a_ti_sub2.set_data(invariants.item)
					a_ti_sub.extend(a_ti_sub2)
					invariants.forth
				end
					
				-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
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
