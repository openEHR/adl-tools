note
	description: "Summary description for {BOSPHORUS_PB_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOSPHORUS_PB_VISITOR
inherit
	C_VISITOR
	redefine
		start_c_complex_object, end_c_complex_object,
	start_c_attribute, end_c_attribute,
	start_archetype_slot, end_archetype_slot,
	start_archetype_internal_ref, end_archetype_internal_ref,
	start_c_archetype_root, end_c_archetype_root,
	start_c_code_phrase, end_c_code_phrase,
	start_c_ordinal, end_c_ordinal,
	start_c_quantity, end_c_quantity,
	start_c_primitive_object, end_c_primitive_object,
	start_c_leaf_object, end_c_leaf_object,
	start_c_reference_object, end_c_reference_object,
	start_constraint_ref, end_constraint_ref,
	start_c_domain_type, end_c_domain_type
	end
	ARCHETYPE_WRAPPER_GENERATOR
	rename
	archetype as archetype_to_wrap,
	make as archetype_wrapper_make
	end



create
	make, make_with_root_ccomplexobj_wrapper

feature
	wrapper_stack:ARRAYED_STACK[ANY]

	root:CCOMPLEXOBJECT_WRAPPER_GEN

	repo_manager:REPOSITORY_MANAGER

feature
	make(p_repo_manager:REPOSITORY_MANAGER)
	require
		manager_not_null : p_repo_manager /= void
	do
		create wrapper_stack.make(0)
		repo_manager := p_repo_manager
	end

	make_with_root_ccomplexobj_wrapper(p_repo_manager:REPOSITORY_MANAGER; p_ccomplex_obj_wrapper: CCOMPLEXOBJECT_WRAPPER_GEN)
	require
		p_not_null: p_repo_manager /= void and p_ccomplex_obj_wrapper /= void
	do
		root := p_ccomplex_obj_wrapper
		make(p_repo_manager)
	end



feature

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		local
			wrapper:CCOMPLEXOBJECT_WRAPPER_GEN
			schema:SCHEMA_DESCRIPTOR
			class_def:BMM_CLASS_DEFINITION
		do
			if root = void then --IF THE VISITOR DOES NOT HAVE A PRE SET CCOMPLEXOBJECT_WRAPPER FOR ROOT, IT WILL CREATE ONE
				--root ccomplexobj must be initialized
				create wrapper.make
				--ccomplexobj should end up in an archetype, so don't declare it root for the garbage collector
				--wrapper.set_is_root_object (true)
				wrapper.init_pb_obj
				root := wrapper
			end

			if not attached a_node.parent and attached root then --first ever ccomplexobject visit, this must be the root
				wrapper := root
			end

			if attached a_node.parent then
			--there must be a wrapper for the parent attribute in the stack
				if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then
					wrapper := multiple_atr.add_children.get_ccomplexobjectfield
				elseif attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
					wrapper := single_atr.add_children.get_ccomplexobjectfield
				end
			end

			--rmtypename
			wrapper.set_rmtypename (a_node.rm_type_name)
			--nodeid
			wrapper.set_nodeid (a_node.node_id)
			--occurrences --TODO: talk to Thomas Beale: this should come from RM automatically.
			if attached a_node.occurrences then
				copy_multiplicity_interval (wrapper.get_occurrences, a_node.occurrences)
			else
				get_default_interval_of_int (wrapper.get_occurrences)
			end
			--attributes: handled by its own start/end methods

--			--place in the stack
			wrapper_stack.put (wrapper)
		end




	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT
		do
			wrapper_stack.remove
		end


	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			slot: ARCHETYPESLOT_WRAPPER_GEN
			assertion_wrapper:ASSERTION_WRAPPER_GEN
		do
			if attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_attribute then
				slot := single_attribute.add_children.get_archetypeslotfield
			elseif attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multi_attribute then
				slot := multi_attribute.add_children.get_archetypeslotfield
			else
				io.put_string ("Error: unexpected state in Boshporus visitor: start_archetype_slot")
			end

			if attached slot  then
				--rmtypename
				slot.set_rmtypename (a_node.rm_type_name)
				--nodeid
				slot.set_nodeid (a_node.node_id)
				--occurences: todo: must be handled by the parser automatically
				if attached a_node.occurrences then
					copy_multiplicity_interval (slot.get_occurrences, a_node.occurrences)
				else
					get_default_interval_of_int(slot.get_occurrences)
				end
				--includes
				if attached a_node.includes then
					from
						a_node.includes.start
					until
						a_node.includes.after
					loop
						assertion_wrapper := slot.add_includes
						copy_assertion(assertion_wrapper, a_node.includes.item)
						a_node.includes.forth
					end
				end

				--excludes
				if attached a_node.excludes then
					from
					a_node.excludes.start
					until
						a_node.excludes.after
					loop
						assertion_wrapper := slot.add_excludes
						copy_assertion(assertion_wrapper, a_node.excludes.item)
						a_node.excludes.forth
					end
				end
			end
			--has no children, no need to put into stack
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			c_single_atr:CSINGLEATTRIBUTE_WRAPPER_GEN
			c_multi_atr:CMULTIPLEATTRIBUTE_WRAPPER_GEN
			interval_of_int_cardinality: INTERVALOFINTEGER_WRAPPER_GEN
			interval_of_int_existence: INTERVALOFINTEGER_WRAPPER_GEN
			cardinality:CARDINALITY_WRAPPER_GEN
			single_atr_existence:INTERVALOFINTEGER_WRAPPER_GEN
		do
			if attached {CCOMPLEXOBJECT_WRAPPER_GEN} wrapper_stack.linear_representation.first as complex_wrapper then
				if a_node.is_multiple then
					c_multi_atr := complex_wrapper.add_attributes.get_cmultipleattributefield
					--cardinality
					cardinality := c_multi_atr.get_cardinality
					--cardinality.interval
					interval_of_int_cardinality := cardinality.get_interval
					copy_multiplicity_interval (interval_of_int_cardinality,a_node.cardinality.interval)
					--cardinality.isordered
					cardinality.set_isordered (a_node.cardinality.is_ordered)
					--cardinality.isunique
					cardinality.set_isunique (a_node.cardinality.is_unique)

					--rmattributename
					c_multi_atr.set_rmattributename (a_node.rm_attribute_name)
					--existence
					interval_of_int_existence := c_multi_atr.get_existence
					if attached a_node.existence then
						copy_multiplicity_interval (interval_of_int_existence, a_node.existence)
					else
						get_default_interval_of_int (interval_of_int_existence)
					end

					--children: will be handled by its own visit method in this visitor

					wrapper_stack.put (c_multi_atr)
				else
					c_single_atr := complex_wrapper.add_attributes.get_csingleattributefield
					--rmattributename
					c_single_atr.set_rmattributename (a_node.rm_attribute_name)
					--existence
					single_atr_existence := c_single_atr.get_existence
					if attached a_node.existence then
						copy_multiplicity_interval (single_atr_existence, a_node.existence)
					else
						get_default_interval_of_int (single_atr_existence)
					end

					--children :will be handled by the visit method in this visitor

					wrapper_stack.put (c_single_atr)
				end
			end
		end

--	copy_interval_of_int(p_interval_of_int_wrapper:INTERVALOFINTEGER_WRAPPER_GEN; p_interval_of_int:MULTIPLICITY_INTERVAL)
--	local
--		interval:INTERVAL_WRAPPER_GEN
--	do
--		p_interval_of_int_wrapper.set_lower (p_interval_of_int.lower)
--		p_interval_of_int_wrapper.set_upper (p_interval_of_int.upper)

--		interval := p_interval_of_int_wrapper.get_intervalinheritedfields
--		interval.set_lowerincluded (p_interval_of_int.lower_included)
--		interval.set_upperincluded (p_interval_of_int.upper_included)
--		interval.set_lowerunbounded (p_interval_of_int.lower_unbounded)
--		interval.set_upperunbounded (p_interval_of_int.upper_unbounded)
--	end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			wrapper_stack.remove
		end

	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	end_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- exit a C_LEAF_OBJECT
		do
		end


	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- enter a C_REFERENCE_OBJECT
		do
		end

	end_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER)
			-- exit a C_REFERENCE_OBJECT
		do
		end

	start_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		do
		end

	end_c_archetype_root(a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
		end


	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
		local
			wrapper:ARCHETYPEINTERNALREF_WRAPPER_GEN
		do
			--create wrapper using parent. since this is a cobject, it must be under an attribute
			if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then
				wrapper := multiple_atr.add_children.get_archetypeinternalreffield
			end
			if attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
				wrapper := single_atr.add_children.get_archetypeinternalreffield
			end

			--nodeid
			if attached a_node.node_id as nodeId then
				wrapper.set_nodeid (nodeId)
			end
			--occurences todo: must be handled by the parser automatically
			if attached a_node.occurrences as occ then
				copy_multiplicity_interval (wrapper.get_occurrences, occ)
			else
				get_default_interval_of_int (wrapper.get_occurrences)
			end
			--rmtypename
			if attached a_node.rm_type_name as rmt then
				wrapper.set_rmtypename (rmt)
			end
			--targetpath
			if attached a_node.target_path as tp then
				wrapper.set_targetpath (tp)
			end

			--has no children that may need access to their parents, so no need to place it into stack.
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end


	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
		local
			wrapper:CONSTRAINTREF_WRAPPER_GEN
		do
			--create wrapper via parent
			if attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_attribute then
				wrapper := single_attribute.add_children.get_constraintreffield
			elseif attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multi_attribute then
				wrapper := multi_attribute.add_children.get_constraintreffield
			else
				io.put_string ("Error: unexpected state in Boshporus visitor: start_constraint_ref")
			end
			--nodeid
			if attached a_node.node_id as nid then
				wrapper.set_nodeid (nid)
			end
			--occurences
			if attached a_node.occurrences as occ then--TODO: SHOULD BE HANDLED AUTOMATICALLY VIA PARSE
				copy_multiplicity_interval (wrapper.get_occurrences, occ)
			else
				get_default_interval_of_int (wrapper.get_occurrences)
			end
			--reference
			if attached a_node.target as ref then
				wrapper.set_reference (ref) --TODO DVPARSABLE REFERENCE EXPRESSED AS STRING; ASK THOMAS BEALE: WHICH ATTR SHOULD I USE?
			else
				io.put_string ("reference null, parent.parent.parent node id: " + a_node.parent.parent.parent.parent.node_id)
			end

			--rmtypename
			if attached a_node.rm_type_name as rtn then
				wrapper.set_rmtypename (rtn)
			end

		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- exit a CONSTRAINT_REF
		do
		end


	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		local
			wrapper: CPRIMITIVEOBJECT_WRAPPER_GEN
			primitive_regex:STRING
			occurrences:INTERVALOFINTEGER_WRAPPER_GEN
		do
--			if attached {C_STRING} a_node.item  as c_prim then
--				if c_prim.regexp /= void then
--					primitive_regex := c_prim.as_string
--				else
--					primitive_regex := "c_prim.as_string is null"
--				end
--			else --TODO: HANDLE OTHER NODE ITEMS FOR CPRIMITIVE
--				primitive_regex := "TODO: NON-STRING PRIMITIVE NODE ITEM"
--			end
			--since primitive object can not be the root, we will assume there is a parent in the stack
			--there must be a wrapper for the parent attribute in the stack
			if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then
				wrapper := multiple_atr.add_children.get_cprimitiveobjectfield
			end
			if attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
				wrapper := single_atr.add_children.get_cprimitiveobjectfield
			end

			--nodeid
			if attached a_node.node_id as nid then
				wrapper.set_nodeid (a_node.node_id)
			end

			--occurrences: todo: must be handled via parser automatically
			occurrences := wrapper.get_occurrences
			if attached a_node.occurrences then
				copy_multiplicity_interval (occurrences, a_node.occurrences)
			else
				get_default_interval_of_int (occurrences)
			end

			--rmtypename
			if attached a_node.rm_type_name as rmt then
				wrapper.set_rmtypename (rmt)
			end

			--item
			if attached a_node.item as nitem then
				copy_c_primitive(wrapper.get_item, nitem)
			end

			--don't put primitive into stack, since no child atr will read it			
		end




	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
		end

--MOVE THESE TO THE END----------------------------------------------

copy_c_code_phrase(p_ccodephrase_wrapper: CCODEPHRASE_WRAPPER_GEN; p_ccodephrase:C_CODE_PHRASE)
do
	--nodeid
	if attached p_ccodephrase.node_id as nodeid then
		p_ccodephrase_wrapper.set_nodeid (nodeid)
	end
	--occurences
	if attached p_ccodephrase.occurrences as occ then
		copy_multiplicity_interval (p_ccodephrase_wrapper.get_occurrences, occ )
	end
	--rmtypename
	if attached p_ccodephrase.rm_type_name as name then
		p_ccodephrase_wrapper.set_rmtypename (name)
	end
	--assumed_value
	if attached p_ccodephrase.assumed_value as aval then
		copy_code_phrase (p_ccodephrase_wrapper.get_assumedvalue, aval)
	end
	--terminology_id
	if attached p_ccodephrase.terminology_id as termid then
		copy_terminology_id (p_ccodephrase_wrapper.get_terminologyid, termid)
	end
	--code_list
	if attached p_ccodephrase.code_list as codelist then
		from
			codelist.start
		until
			codelist.after
		loop
			p_ccodephrase_wrapper.add_codelist (codelist.item_for_iteration)
			codelist.forth
		end
	end
end

copy_c_dv_ordinal(p_cdvordinal_wrapper: CDVORDINAL_WRAPPER_GEN; p_cdv_ordinal:C_DV_ORDINAL)
do
	--nodeid
	if attached p_cdv_ordinal.node_id as nid then
		p_cdvordinal_wrapper.set_nodeid (nid)
	end
	--occurences
	if attached p_cdv_ordinal.occurrences as occ then
		copy_multiplicity_interval (p_cdvordinal_wrapper.get_occurrences, occ)
	end
	--rmtypename
	if attached p_cdv_ordinal.rm_type_name as name then
		p_cdvordinal_wrapper.set_rmtypename (name)
	end
	--assumed_value
	if attached p_cdv_ordinal.assumed_value as av then
		--TODO: TALK TO THOMAS BEALE: ASSUMED VALUE IS ORDINAL, SHOULD BE DV_ORDINAL
	end
	--list --TODO: TALK TO THOMAS BEALE: LIST IS PROVIDED VIA ITEMS IN THE P_CDV_ORDINAL, AND ITS TYPE IS ORDINAL, WHERE IT SHOULD BE DV_ORDINAL
--	if attahced p_cdv_ordinal. then
--		
--	end

end

copy_c_dv_quantity(p_cdvquantity_wrapper:CDVQUANTITY_WRAPPER_GEN; p_cdv_quantity:C_DV_QUANTITY)
do
	--nodeid
	if attached p_cdv_quantity.node_id as nid then
		p_cdvquantity_wrapper.set_nodeid (nid)
	end
	--occurences
	if attached p_cdv_quantity.occurrences as occ then
		copy_multiplicity_interval (p_cdvquantity_wrapper.get_occurrences, occ)
	end
	--rmtypename
	if attached p_cdv_quantity.rm_type_name as name then
		p_cdvquantity_wrapper.set_rmtypename (name)
	end
	--assumedvalue
	if attached p_cdv_quantity.assumed_value then --TALK TO THOMAS BEALE: THE TYPE OF ASSUMED VALUE IS QUANTITY, IT SHOULD BE DV_QUANTITY

	end

	--property
	if attached p_cdv_quantity.property as prop then
		copy_code_phrase (p_cdvquantity_wrapper.get_property, prop)
	end
	--list
	if attached p_cdv_quantity.list as q_list then --C_QUANTITY_ITEM
		from
			q_list.start
		until
			q_list.after
		loop
			copy_c_quantity_item(p_cdvquantity_wrapper.add_list,q_list.item_for_iteration)
			q_list.forth
		end
	end
end

copy_c_quantity_item(p_c_quantity_item_wrapper: CQUANTITYITEM_WRAPPER_GEN; p_cquantity_item: C_QUANTITY_ITEM)
do
	--magnitude
	if attached p_cquantity_item.magnitude as magnit then
		copy_interval_of_real (p_c_quantity_item_wrapper.get_magnitude, magnit)
	end
	--precision
	if attached p_cquantity_item.precision as precis then
		copy_interval_of_integer(p_c_quantity_item_wrapper.get_precision, precis)
	end
	--units
	if attached p_cquantity_item.units as units then
		p_c_quantity_item_wrapper.set_units (units)
	end

end
---------------------------------------------------------------------

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
		do
			--there must be a wrapper for the parent attribute in the stack
				if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then

					--check a_node to see which c_domain_type subtype
					if attached {C_CODE_PHRASE} a_node as ccodephrase then
						copy_c_code_phrase(multiple_atr.add_children.get_ccodephrasefield, ccodephrase)
					elseif attached {C_DV_ORDINAL} a_node as cdvordinal then
						copy_c_dv_ordinal(multiple_atr.add_children.get_cdvordinalfield, cdvordinal)
					elseif attached {C_DV_QUANTITY} a_node as cdvquantity then --TODO: TALK TO THOMAS BEALE: C_DV_STATE SHOULD INHERIT FROM C_DOMAIN_TYPE
						copy_c_dv_quantity(multiple_atr.add_children.get_cdvquantityfield, cdvquantity)
					end

				elseif attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
					--REPEAT THE C_DOMAIN SUBTYPE CHECK. UGLY, BUT THERE IS NO SUPPORT FOR INHERITANCE IN PB, HENCE, NO SUPPORT IN EIFFEL

					--check a_node to see which c_domain_type subtype
					if attached {C_CODE_PHRASE} a_node as ccodephrase then
						copy_c_code_phrase(single_atr.add_children.get_ccodephrasefield, ccodephrase)
					elseif attached {C_DV_ORDINAL} a_node as cdvordinal then
						copy_c_dv_ordinal(single_atr.add_children.get_cdvordinalfield, cdvordinal)
					elseif attached {C_DV_QUANTITY} a_node as cdvquantity then --TODO: TALK TO THOMAS BEALE: C_DV_STATE SHOULD INHERIT FROM C_DOMAIN_TYPE
						copy_c_dv_quantity(single_atr.add_children.get_cdvquantityfield, cdvquantity)
					end
				end

				--no children, don't put anything into stack
		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- exit an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- enter an C_CODE_PHRASE
		do
		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER)
			-- exit an C_CODE_PHRASE
		do
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- enter an C_DV_ORDINAL
		do
--			io.put_string ("start_c_ordinal")
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
		end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
--			io.put_string ("start_c_quantity")
		end

	end_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- exit a C_DV_QUANTITY
		do
		end

	get_default_interval_of_int(p_wrapper:INTERVALOFINTEGER_WRAPPER_GEN)
	do
		p_wrapper.set_lower (0)
	end

	copy_multiplicity_interval(p_pb_interval:INTERVALOFINTEGER_WRAPPER_GEN; p_aom_interval:MULTIPLICITY_INTERVAL)
	require
		inteval_not_null : p_aom_interval /= void
	do
		if p_aom_interval /= void then
			p_pb_interval.set_lower (p_aom_interval.lower)
			p_pb_interval.set_upper (p_aom_interval.upper)
			p_pb_interval.set_lowerincluded (p_aom_interval.lower_included)
			p_pb_interval.set_upperincluded (p_aom_interval.upper_included)
			p_pb_interval.set_lowerunbounded (p_aom_interval.lower_unbounded)
			p_pb_interval.set_upperunbounded (p_aom_interval.upper_unbounded)
		end
	end

	--MOVED TO ARCHETYPE_WRAPPER_GENERATOR
--	copy_assertion(p_wrapper: ASSERTION_WRAPPER_GEN; p_assertion:ASSERTION)
--	do
--		copy_expr_item (p_wrapper.get_expression, p_assertion.expression)
--		if attached p_assertion.as_string then
--			p_wrapper.set_stringexpression (p_assertion.as_string)
--		end
--		if attached p_assertion.tag then
--			p_wrapper.set_tag (p_assertion.tag)
--		end

--	end

	--MOVED TO ARCHETYPE_WRAPPER_GENERATOR
--	copy_expr_item(p_wrapper:EXPRITEMALTERNATIVES_WRAPPER_GEN; p_operand: EXPR_ITEM  )
--	--this is an EXPR_ITEM known to be a either an  EXPR_UNARY_OPERATOR OR EXPR_BINARY_OPERATOR so configure accordingly
--	do
--		if attached {EXPR_UNARY_OPERATOR} p_operand as unary_op then
--			p_wrapper.get_exprunaryoperatorfield.set_type (unary_op.type)
--			p_wrapper.get_exprunaryoperatorfield.set_precedenceoverridden (unary_op.precedence_overridden)
--			--operator of unary operator
--			p_wrapper.get_exprunaryoperatorfield.set_operator_ (unary_op.operator.out)--TODO: BIG INT MUST BE HANDLED IN EIFFEL CODE GENERATOR (int to str conversion at the moment)
--			--operand of unary operator may be unary, binary  or leaf. Recursion would handle it
--			copy_expr_item(p_wrapper.get_exprunaryoperatorfield.get_operand, unary_op.operand)
--		elseif attached {EXPR_BINARY_OPERATOR} p_operand as binary_op then
--			p_wrapper.get_exprbinaryoperatorfield.set_type (binary_op.type)
--			p_wrapper.get_exprbinaryoperatorfield.set_precedenceoverridden (binary_op.precedence_overridden)
--			--operator of binary operator
--			p_wrapper.get_exprbinaryoperatorfield.set_operator_ (binary_op.operator.out)--TODO: BIG INT MUST BE HANDLED IN EIFFEL CODE GENERATOR (int to str conversion at the moment)
--			--left operand of binary operator
--			copy_expr_item(p_wrapper.get_exprbinaryoperatorfield.get_leftoperand,binary_op.left_operand)
--			--right operand of binary operator
--			copy_expr_item(p_wrapper.get_exprbinaryoperatorfield.get_rightoperand,binary_op.right_operand)
--		elseif attached {EXPR_LEAF} p_operand as leaf then
--			if attached {STRING} leaf.item as string_item then
--				p_wrapper.get_exprleaffield.set_item (string_item)
--			elseif attached{C_STRING} leaf.item as c_string_item and leaf.item /= void then
--				p_wrapper.get_exprleaffield.set_item (c_string_item.as_string)
--			else
--				p_wrapper.get_exprleaffield.set_item ("NOT IMPLEMENTED TYPE: ITEM IN EXPR_LEAF")--TODO: TALK TO THOMAS BEALE ABOUT ITEM IN EXPR_LEAF
--			end
--			p_wrapper.get_exprleaffield.set_referencetype (leaf.reference_type)
--			p_wrapper.get_exprleaffield.set_type (leaf.type)
--		end
--	end

	
end

