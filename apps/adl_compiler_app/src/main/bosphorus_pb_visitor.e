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
			schema:SCHEMA_ACCESS
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
						copy_assertion(assertion_wrapper, a_node.includes.item)
						a_node.includes.forth
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
			if attached a_node.external_reference as exref then
				wrapper.set_reference (exref.as_canonical_string) --TODO DVPARSABLE REFERENCE EXPRESSED AS STRING; ASK THOMAS BEALE: WHICH ATTR SHOULD I USE?
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


	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER)
		local
			wrapper:CDOMAINTYPE_WRAPPER_GEN
		do
			--there must be a wrapper for the parent attribute in the stack
				if attached {CMULTIPLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as multiple_atr then
					wrapper := multiple_atr.add_children.get_cdomaintypefield
				elseif attached {CSINGLEATTRIBUTE_WRAPPER_GEN} wrapper_stack.linear_representation.first as single_atr then
					wrapper := single_atr.add_children.get_cdomaintypefield
				end
				--nodeid
				if attached a_node.node_id as nid then
					wrapper.set_nodeid (nid)
				end
				--occurrences: todo: must be handled by the parser automatically
				if attached a_node.occurrences as occ then
					copy_multiplicity_interval (wrapper.get_occurrences, occ)
				else
					get_default_interval_of_int (wrapper.get_occurrences)
				end
				--rmtypename
				if attached a_node.rm_type_name as rmtypename then
					wrapper.set_rmtypename (rmtypename)
				end
				--no children, don't put into stack
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
			if attached {STRING} leaf.item as string_item then
				p_wrapper.get_exprleaffield.set_item (string_item)
			elseif attached{C_STRING} leaf.item as c_string_item and leaf.item /= void then
				p_wrapper.get_exprleaffield.set_item (c_string_item.as_string)
			else
				p_wrapper.get_exprleaffield.set_item ("NOT IMPLEMENTED TYPE: ITEM IN EXPR_LEAF")--TODO: TALK TO THOMAS BEALE ABOUT ITEM IN EXPR_LEAF
			end
			p_wrapper.get_exprleaffield.set_referencetype (leaf.reference_type)
			p_wrapper.get_exprleaffield.set_type (leaf.type)
		end
	end

	copy_c_primitive(p_wrapper:CPRIMITIVEALTERNATIVES_WRAPPER_GEN; p_c_primitive:C_PRIMITIVE)
	require
		p_not_null: attached p_wrapper and attached p_c_primitive
	do
		if attached {C_BOOLEAN} p_c_primitive as cboolean then
			copy_c_boolean(p_wrapper.get_cbooleanfield, cboolean)
		elseif attached {C_DATE} p_c_primitive as cdate then
			copy_c_date(p_wrapper.get_cdatefield, cdate)
		elseif attached {C_DATE_TIME} p_c_primitive as cdatetime then
			copy_c_date_time(p_wrapper.get_cdatetimefield, cdatetime)
		elseif attached {C_DURATION} p_c_primitive as cduration then
			copy_c_duration(p_wrapper.get_cdurationfield, cduration)
		elseif attached {C_INTEGER} p_c_primitive as cinteger then
			copy_c_integer(p_wrapper.get_cintegerfield, cinteger)
		elseif attached {C_REAL} p_c_primitive as creal then
			copy_c_real(p_wrapper.get_crealfield, creal)
		elseif attached {C_STRING} p_c_primitive as cstring then
			copy_c_string(p_wrapper.get_cstringfield, cstring)
		elseif attached {C_TIME} p_c_primitive as ctime then
			copy_c_time(p_wrapper.get_ctimefield, ctime)
		end
	end

	copy_c_time(p_wrapper:CTIME_WRAPPER_GEN; p_ctime:C_TIME)
	require
		p_not_null: attached p_wrapper and attached p_ctime
	do
		--assumedvalue
		if attached p_ctime.assumed_value as aval then
			p_wrapper.set_assumedvalue (aval.as_string) --TODO: TIME REPRESENTED AS STRING
		end
		--pattern
		if attached p_ctime.pattern as pat then
			p_wrapper.set_pattern(pat)
		end
		--range
		if attached p_ctime.range as range then
			copy_interval_of_time(p_wrapper.get_range, range)
		end
		--timezonevalidity --TODO: WHERE IS THIS VALUE IN EIFFEL IMPLEMENTATION?

	end

	copy_interval_of_time(p_wrapper:INTERVALOFTIME_WRAPPER_GEN; p_range:INTERVAL[ISO8601_TIME])
	require
		p_not_null: attached p_wrapper and attached p_range
	do
		--lower
		if attached p_range.lower as low then
			p_wrapper.set_lower (low.as_string) --TODO: TIME EXPRESSED AS STRING
		end
		--lowerincluded
		if attached p_range.lower_included as li then
			p_wrapper.set_lowerincluded (li)
		end
		--lowerunbounded
		if attached p_range.lower_unbounded as lu then
			p_wrapper.set_lowerunbounded (lu)
		end
		--upper
		if attached p_range.upper as up then
			p_wrapper.set_upper (up.as_string) --TODO: TIME EXPRESSED AS STRING
		end
		--upperincluded
		if attached p_range.upper_included as ui then
			p_wrapper.set_upperincluded (ui)
		end
		--upperunbounded
		if attached p_range.upper_unbounded as uu then
			p_wrapper.set_upperunbounded (uu)
		end

	end

	copy_c_string(p_wrapper:CSTRING_WRAPPER_GEN; p_cstring:C_STRING)
	require
		p_not_null: attached p_wrapper and attached p_cstring
	do
		--assumedvalue
		if attached p_cstring.assumed_value as aval then
			p_wrapper.set_assumedvalue (aval)
		end
		--list
		if attached p_cstring.strings as list then
			from
				list.start
			until
				list.after
			loop
				p_wrapper.add_list (list.item_for_iteration)
				list.forth
			end
		end
		--listopen
		if attached p_cstring.is_open as lio then--TODO: IS IS_OPEN THE FIELD FOR LIST_OPEN?? Ask T. BEALE
			p_wrapper.set_listopen (lio)
		end
		--pattern
		if attached p_cstring.regexp as pat then --TODO: IS REGEXP THE FIELD FOR PATTERN?
			p_wrapper.set_pattern (pat)
		end
	end


	copy_c_real(p_wrapper:CREAL_WRAPPER_GEN;p_creal:C_REAL)
	require
		p_not_null: attached p_wrapper and attached p_creal
	do
		--assumedvalue
		if attached p_creal.assumed_value as aval then
			p_wrapper.set_assumedvalue (aval.out)--TODO: REAL REPRESENTED AS STRING
		end
		--list
		if attached p_creal.list as li then
			from
				li.start
			until
				li.after
			loop
				p_wrapper.add_list (li.item_for_iteration.out) --TODO: REAL REPRESENTED AS STRING
				li.forth
			end
		end
		--range
		if attached p_creal.range as range then
			copy_interval_of_real(p_wrapper.get_range, range)
		end
	end

	copy_interval_of_real(p_wrapper:INTERVALOFREAL_WRAPPER_GEN;p_range:INTERVAL[REAL_32])
	require
		p_not_null: attached p_wrapper and attached p_range
	do
		--lower
		if attached p_range.lower as low then
			p_wrapper.set_lower (low.out) --TODO: REAL REPRESENTED AS STRING
		end
		--lowerincluded
		if attached p_range.lower_included as li then
			p_wrapper.set_lowerincluded (li)
		end
		--lowerunbounded
		if attached p_range.lower_unbounded as lunb then
			p_wrapper.set_lowerunbounded (lunb)
		end
		--upper
		if attached p_range.upper as up then
			p_wrapper.set_upper (up.out)--TODO: REAL REPRESENTED AS STRING
		end
		--upperincluded
		if attached p_range.upper_included as ui then
			p_wrapper.set_upperincluded (ui)
		end
		--upperunbounded
		if attached p_range.upper_unbounded as uu then
			p_wrapper.set_upperunbounded (uu)
		end
	end

	copy_c_integer(p_wrapper:CINTEGER_WRAPPER_GEN; p_cinteger:C_INTEGER)
	require
		p_not_null: attached p_wrapper and attached p_cinteger
	do
		--assumedvalue
		if attached p_cinteger.assumed_value as aval then
			p_wrapper.set_assumedvalue (aval.item)
		end
		--list
		if attached p_cinteger.list as li then
			from
				li.start
			until
				li.after
			loop
				p_wrapper.add_list (li.item_for_iteration.item)
				li.forth
			end
		end
		--range
		if attached p_cinteger.range as range then
			copy_interval_of_integer(p_wrapper.get_range, range)
		end
	end

	copy_interval_of_integer(p_wrapper:INTERVALOFINTEGER_WRAPPER_GEN;p_range:INTERVAL[INTEGER_32])
	require
		p_not_null: attached p_wrapper and attached p_range
	do
		--lower
		if attached p_range.lower as low then
			p_wrapper.set_lower (low.item)
		end
		--lowerincluded
		if attached p_range.lower_included as li then
			p_wrapper.set_lowerincluded (li)
		end
		--lowerunbounded
		if attached p_range.lower_unbounded as lu then
			p_wrapper.set_lowerunbounded (lu)
		end
		--upper
		if attached p_range.upper as upp then
			p_wrapper.set_upper (upp.item)
		end
		--upperincluded
		if attached p_range.upper_included as ui then
			p_wrapper.set_upperincluded (ui)
		end
		--upperunbounded
		if attached p_range.upper_unbounded as uu then
			p_wrapper.set_upperunbounded (uu)
		end
	end

	copy_c_duration(p_wrapper:CDURATION_WRAPPER_GEN; cduration:C_DURATION)
	require
		p_not_null: attached p_wrapper and attached cduration
	do
		--assumed value
		if attached cduration.assumed_value as aval then
			p_wrapper.set_assumedvalue (aval.as_string)--TODO: DURATION REPRESENTED AS STRING
		end
		--pattern
		if attached cduration.pattern as pat then
			p_wrapper.set_pattern (pat)
		end
		--range
		if attached cduration.range as range then
			copy_interval_of_duration(p_wrapper.get_range, range)
		end
	end

	copy_interval_of_duration(p_wrapper:INTERVALOFDURATION_WRAPPER_GEN; p_range:INTERVAL[ISO8601_DURATION])
	require
		p_not_null: attached p_wrapper and attached p_range
	do
		--lower
		if attached p_range.lower as low then
			p_wrapper.set_lower (low.as_string) --TODO: DURATION EXPRESSED AS STRING
		end
		--lowerincluded
		if attached p_range.lower_included as li then
			p_wrapper.set_lowerincluded (li)
		end
		--lowerunbounded
		if attached p_range.lower_unbounded as lu then
			p_wrapper.set_lowerunbounded (lu)
		end
		--upper
		if attached p_range.upper as up then
			p_wrapper.set_upper (up.as_string) --TODO: DURATION EXPRESSED AS STRING
		end
		--upperincluded
		if attached p_range.upper_included as uinc then
			p_wrapper.set_upperincluded (uinc)
		end
		--upperunbounded
		if attached p_range.upper_unbounded as uu then
			p_wrapper.set_upperunbounded (uu)
		end
	end

	copy_c_date_time(p_wrapper:CDATETIME_WRAPPER_GEN; p_cdatetime:C_DATE_TIME)
	require
		p_not_null: attached p_wrapper and attached p_cdatetime
	do
		--assumedvalue
		if attached p_cdatetime.assumed_value as aval then
			p_wrapper.set_assumedvalue (aval.as_string)--TODO: DATETIME REPRESENTED AS STRING
		end
		--pattern
		if attached p_cdatetime.pattern as pat then
			p_wrapper.set_pattern (pat)
		end
		--range
		if attached p_cdatetime.range as range then
			copy_c_date_time_interval(p_wrapper.get_range, range)
		end
		--timezonevalidity --TODO: WHERE IS THIS VALUE IN EIFFEL CODE??
	end

	copy_c_date_time_interval(p_wrapper:INTERVALOFDATETIME_WRAPPER_GEN; range:INTERVAL[ISO8601_DATE_TIME])
	require
		p_not_null: attached p_wrapper and attached range
	do
		--lower
		if attached range.lower as low then
			p_wrapper.set_lower (low.as_string) --TODO: DATETIME REPRESENTED AS STRING
		end
		--lowerincluded
		if attached range.lower_included as li then
			p_wrapper.set_lowerincluded (li)
		end
		--lowerunbounded
		if attached range.lower_unbounded as lu then
			p_wrapper.set_lowerunbounded (lu)
		end
		--upper
		if attached range.upper as up then
			p_wrapper.set_upper (up.as_string) --TODO: DATETIME REPRESENTED AS STRING
		end
		--upperincluded
		if attached range.upper_included as ui then
			p_wrapper.set_upperincluded (ui)
		end
		--upperunbounded
		if attached range.upper_unbounded as uu then
			p_wrapper.set_upperunbounded (uu)
		end
	end

	copy_c_boolean(p_wrapper:CBOOLEAN_WRAPPER_GEN; p_cboolean:C_BOOLEAN)
	require
		p_not_null: attached p_wrapper and attached p_cboolean
	do
			--assumedvalue
			if attached p_cboolean.assumed_value as aval then
				p_wrapper.set_assumedvalue (aval.item)
			end
			--falsevalid
			if attached p_cboolean.false_valid as fv then
				p_wrapper.set_falsevalid (fv)
			end
			--truevalid
			if attached p_cboolean.true_valid as tv then
				p_wrapper.set_truevalid (tv)
			end
	end

	copy_c_date(p_wrapper:CDATE_WRAPPER_GEN; p_cdate:C_DATE)
	require
		p_not_null: attached p_wrapper and attached p_cdate
	do
		--assumedvalue
		if attached p_cdate.assumed_value as aval then
			p_wrapper.set_assumedvalue ("value:" + aval.value + ";year:" + aval.year.out + ";month:" + aval.month.out + ";day:" + aval.day.out)
		end
		--pattern
		if attached p_cdate.pattern as pat then
			p_wrapper.set_pattern (pat)
		end
		--range
		if attached p_cdate.range as range then
			copy_interval_of_date(p_wrapper.get_range, range)
		end
		--timezonevalidity --TODO: TALK TO THOMAS BEALE: WHERE IS THIS VALUE IN THE EIFFEL IMPLEMENTATION?


	end

	copy_interval_of_date(p_wrapper:INTERVALOFDATE_WRAPPER_GEN; range:INTERVAL[ISO8601_DATE])
	do
		--lower
		if attached range.lower as lower then
			p_wrapper.set_lower (lower.as_string)--TODO: DATE REPRESENTED AS STRING
		end
		--lowerincluded
		if attached range.lower_included as li then
			p_wrapper.set_lowerincluded (li)
		end
		--lowerunbounded
		if attached range.lower_unbounded as lu then
			p_wrapper.set_lowerunbounded (lu)
		end
		--upper
		if attached range.upper as up then
			p_wrapper.set_upper (up.as_string)--TODO: DATE REPRESENTED AS STRING
		end
		--upperincluded
		if attached range.upper_included as ui then
			p_wrapper.set_upperincluded (ui)
		end
		--upperunbounded
		if attached range.upper_unbounded as uu then
			p_wrapper.set_upperunbounded (uu)
		end
	end
end

