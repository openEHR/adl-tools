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

create
	make

feature
	wrapper_stack:ARRAYED_STACK[ANY]

	root:CCOMPLEXOBJECT_WRAPPER_GEN

	repo_manager:REPOSITORY_MANAGER

feature
	make(p_repo_manager:REPOSITORY_MANAGER)
	require
		manager_not_null : p_repo_manager /= void
		manager_initialized:
	do
		create wrapper_stack.make(0)
		repo_manager := p_repo_manager
	end


feature

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		local
			wrapper:CCOMPLEXOBJECT_WRAPPER_GEN
			schema:SCHEMA_ACCESS
			class_def:BMM_CLASS_DEFINITION
		do
--			io.put_string ("start c_complex: " + a_node.rm_type_name + ":" + a_node.node_id + "%N")
			if a_node.parent = void then
				--root ccomplexobj must be initialized
				create wrapper.make
				--ccomplexobj should end up in an archetype, so don't declare it root for the garbage collector
				--wrapper.set_is_root_object (true)
				wrapper.init_pb_obj
				root := wrapper
			else
				--there must be a wrapper for the parent attribute in the stack
				if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then
					wrapper := multiple_atr.add_children.get_ccomplexobjectfield
				end
				if attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
					wrapper := single_atr.add_children.get_ccomplexobjectfield
				end
			end
--			--fill fields in the wrapper			
			wrapper.set_rmtypename (a_node.rm_type_name)
			wrapper.set_nodeid (a_node.node_id)

			if attached a_node.occurrences then
				copy_multiplicity_interval (wrapper.get_occurrences, a_node.occurrences)
			else
				get_default_interval_of_int (wrapper.get_occurrences)
			end
				--query RM for occurences info IF the object is in a container
--			if not attached a_node.occurrences and not attached a_node.parent then
--				schema := repo_manager.app_root.rm_schemas_access.schemas.at ("openehr_rm")
--				class_def := schema.class_definition (a_node.rm_type_name)

--			end

--			--place in the stack
			wrapper_stack.put (wrapper)
--			io.put_string ("placed complex obj wrapper in stack: " + wrapper.get_path + "%N")
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

			if slot /= void then
				slot.set_rmtypename (a_node.rm_type_name)
				slot.set_nodeid (a_node.node_id)
				--occurences, if not null
				if attached a_node.occurrences then
					copy_multiplicity_interval (slot.get_occurrences, a_node.occurrences)
				else
					get_default_interval_of_int(slot.get_occurrences)
				end
				--includes
				from
					a_node.includes.start
				until
					a_node.includes.exhausted
				loop
					assertion_wrapper := slot.add_includes
					copy_assertion(assertion_wrapper, a_node.includes.item)
					a_node.includes.forth
				end
				--excludes
				from
					a_node.excludes.start
				until
					a_node.excludes.exhausted
				loop
					assertion_wrapper := slot.add_excludes
					copy_assertion(assertion_wrapper, a_node.includes.item)
					a_node.includes.forth
				end

			end
		end

	copy_assertion(p_wrapper: ASSERTION_WRAPPER_GEN; p_assertion:ASSERTION)
	do
		copy_expr_item (p_wrapper.get_expression, p_assertion.expression)
		if attached p_assertion.as_string then
			p_wrapper.set_stringexpression (p_assertion.as_string)
		end
		if attached p_assertion.tag then
			p_wrapper.set_tag (p_assertion.tag)
		end

	end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
		end

	copy_expr_item(p_wrapper:EXPRITEMALTERNATIVES_WRAPPER_GEN; p_operand: EXPR_ITEM  )
	--this is an EXPR_ITEM known to be a either an  EXPR_UNARY_OPERATOR OR EXPR_BINARY_OPERATOR so configure accordingly
	do
		if attached {EXPR_UNARY_OPERATOR} p_operand as unary_op then
			p_wrapper.get_exprunaryoperatorfield.set_type (unary_op.type)
			p_wrapper.get_exprunaryoperatorfield.set_precedenceoverridden (unary_op.precedence_overridden)
			--operator of unary operator
			p_wrapper.get_exprunaryoperatorfield.set_operator_ (unary_op.operator.out)--TODO: BIG INT MUST BE HANDLED IN EIFFEL CODE GENERATOR (int to str conversion at the moment)
			--operand of unary operator may be unary, binary  or leaf. Recursion would handle it
			copy_expr_item(p_wrapper.get_exprunaryoperatorfield.get_operand, unary_op.operand)
		elseif attached {EXPR_BINARY_OPERATOR} p_operand as binary_op then
			p_wrapper.get_exprbinaryoperatorfield.set_type (binary_op.type)
			p_wrapper.get_exprbinaryoperatorfield.set_precedenceoverridden (binary_op.precedence_overridden)
			--operator of binary operator
			p_wrapper.get_exprbinaryoperatorfield.set_operator_ (binary_op.operator.out)--TODO: BIG INT MUST BE HANDLED IN EIFFEL CODE GENERATOR (int to str conversion at the moment)
			--left operand of binary operator
			copy_expr_item(p_wrapper.get_exprbinaryoperatorfield.get_leftoperand,binary_op.left_operand)
			--right operand of binary operator
			copy_expr_item(p_wrapper.get_exprbinaryoperatorfield.get_rightoperand,binary_op.right_operand)
		elseif attached {EXPR_LEAF} p_operand as leaf then
			p_wrapper.get_exprleaffield.set_item ("NOT IMPLEMENTED YET: ITEM IN EXPR_LEAF; SHOULD BE SERIALIZED BYTE ARR WITH TYPE INFO")
			p_wrapper.get_exprleaffield.set_referencetype (leaf.reference_type)
			p_wrapper.get_exprleaffield.set_type (leaf.type)
		end
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
					--interval of cardinality
					interval_of_int_cardinality := cardinality.get_interval
					--copy_interval_of_int(interval_of_int_cardinality,a_node.cardinality.interval)
					copy_multiplicity_interval (interval_of_int_cardinality,a_node.cardinality.interval)
					--back to cardinality
					cardinality.set_isordered (a_node.cardinality.is_ordered)
					cardinality.set_isunique (a_node.cardinality.is_unique)

					--back to cmultipleattr
					c_multi_atr.set_rmattributename (a_node.rm_attribute_name)
					--existence
					interval_of_int_existence := c_multi_atr.get_existence
--					copy_interval_of_int (interval_of_int_existence, a_node.existence)
					if attached a_node.existence then
						copy_multiplicity_interval (interval_of_int_existence, a_node.existence)
					else
						get_default_interval_of_int (interval_of_int_existence)
					end

					--cmultipleattribute.children will be handled by its own visit method in this visitor

					wrapper_stack.put (c_multi_atr)
--					io.put_string ("placed multi atr in stack: " + c_multi_atr.get_rmattributename + "%N")
				else
					c_single_atr := complex_wrapper.add_attributes.get_csingleattributefield
					c_single_atr.set_rmattributename (a_node.rm_attribute_name)
					single_atr_existence := c_single_atr.get_existence
					if attached a_node.existence then
						copy_multiplicity_interval (single_atr_existence, a_node.existence)
					else
						get_default_interval_of_int (single_atr_existence)
					end

					--children of this csingleatr will be handled by the visit method in this visitor

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
			-- enter an ARCHETYPE_INTERNAL_REF
		do
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER)
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end


	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER)
			-- enter a CONSTRAINT_REF
		do
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
			if attached {C_STRING} a_node.item  as c_prim then
				if c_prim.regexp /= void then
					primitive_regex := c_prim.as_string
				else
					primitive_regex := "c_prim.as_string is null"
				end
			else --TODO: HANDLE OTHER NODE ITEMS FOR CPRIMITIVE
				primitive_regex := "TODO: NON-STRING PRIMITIVE NODE ITEM"
			end
			--since primitive object can not be the root, we will assume there is a parent in the stack
			--there must be a wrapper for the parent attribute in the stack
			if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then
				wrapper := multiple_atr.add_children.get_cprimitiveobjectfield
			end
			if attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
				wrapper := single_atr.add_children.get_cprimitiveobjectfield
			end

			wrapper.set_nodeid (a_node.node_id)
			occurrences := wrapper.get_occurrences
			if attached a_node.occurrences then
				copy_multiplicity_interval (occurrences, a_node.occurrences)
			else
				get_default_interval_of_int (occurrences)
			end

			wrapper.set_rmtypename (a_node.rm_type_name)

			wrapper.get_item.get_cstringfield.set_pattern (primitive_regex)

			--don't put primitive into stack, since no child atr will read it			
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- exit an C_PRIMITIVE_OBJECT
		do
		end


	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
			-- enter an C_DOMAIN_TYPE
		do
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
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER)
			-- exit an C_DV_ORDINAL
		do
		end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- enter a C_DV_QUANTITY
		do
		end

	end_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER)
			-- exit a C_DV_QUANTITY
		do
		end
end

