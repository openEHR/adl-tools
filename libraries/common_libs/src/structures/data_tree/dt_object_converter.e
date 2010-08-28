note
	component:   "openEHR Archetype Project"
	description: "[
				 object birectional converter. Errors due to mismatching data and object 
				 model reported in last_op_fail and fail_reason.
				 ]"
	keywords:    "dADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_OBJECT_CONVERTER

inherit
	DT_FACTORY

	TYPE_UTILITIES
		export
			{NONE} all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	EXCEPTIONS
		rename
			class_name as exc_class_name
		export
			{NONE} all
		end

feature -- Conversion

	object_to_dt(an_obj: ANY): DT_COMPLEX_OBJECT_NODE
			-- generate a DT_OBJECT from an Eiffel object; called only on top-level object
		do
			create Result.make_anonymous
			populate_dt_from_object(an_obj, Result)
		end

	populate_dt_from_object (an_obj: ANY; a_dt_obj: DT_COMPLEX_OBJECT_NODE)
			-- make a data tree from an object;
			-- This routine is recursive
		local
			a_dt_attr: DT_ATTRIBUTE_NODE
			fld_dynamic_type: INTEGER
			fld_val: ANY
			equiv_prim_type_id, i: INTEGER
			fld_name: STRING
			a_sequence: SEQUENCE[ANY]
			a_hash_table: HASH_TABLE [ANY, HASHABLE]
			dt_conv: DT_CONVERTIBLE
			fld_lst: ARRAYED_LIST[STRING]
		do
			a_dt_obj.set_type_name(an_obj.generating_type)
			debug ("DT")
				io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: populating from a " +
					an_obj.generating_type + "%N")
			end

			-- it is a generic object itself, have to deal with specially
			a_hash_table ?= an_obj
			a_sequence ?= an_obj
			if a_hash_table /= Void or a_sequence /= Void then
				create a_dt_attr.make_multiple_generic
				create_dt_from_generic_obj(a_dt_attr, an_obj)
				a_dt_obj.put_attribute(a_dt_attr)
			else -- its not a container object
				dt_conv ?= an_obj
				if dt_conv /= Void then
					fld_lst := dt_conv.persistent_attributes
				end
				from i := 1 until i > field_count(an_obj) loop
					fld_val := field(i, an_obj)
					if fld_val /= Void then
						fld_name := field_name(i, an_obj)
						if fld_lst = Void or else fld_lst.has(fld_name) then
							debug ("DT")
								io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: field_name = " + fld_name + "%N")
							end
							fld_dynamic_type := dynamic_type(fld_val)
							equiv_prim_type_id := any_primitive_conforming_type(fld_dynamic_type)
							if equiv_prim_type_id /= 0 then
								create a_dt_attr.make_single(fld_name)
								cvt_tbl.item(equiv_prim_type_id).from_obj_proc.call([a_dt_attr, fld_val, Void])
								a_dt_obj.put_attribute(a_dt_attr)
							else -- its a complex object, or else a SEQUENCE or HASH_TABLE of a complex object
								debug ("DT")
									io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: (complex or container type)%N")
								end
								a_hash_table ?= fld_val
								a_sequence ?= fld_val
								if a_hash_table /= Void or a_sequence /= Void then
									debug ("DT")
										io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: (container type)%N")
									end
									create a_dt_attr.make_multiple(fld_name)
									create_dt_from_generic_obj(a_dt_attr, fld_val)
									if not a_dt_attr.is_empty then
										a_dt_obj.put_attribute(a_dt_attr)
									end
								else
									debug ("DT")
										io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: (normal complex type)%N")
									end
									-- it's a normal complex object
									create a_dt_attr.make_single(fld_name)
									populate_dt_from_object(fld_val, create_complex_object_node(a_dt_attr, Void))
									a_dt_obj.put_attribute(a_dt_attr)
								end
							end
						end
					end
					i := i + 1
				end
			end
		end

	dt_to_object_from_string(a_dt_obj: DT_COMPLEX_OBJECT_NODE; a_type_name: STRING): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := dt_to_object(a_dt_obj, dynamic_type_from_string (a_type_name))
		end

	dt_to_object(a_dt_obj: DT_COMPLEX_OBJECT_NODE; a_type_id: INTEGER): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; should be called only on top-level DT structure, but recursive calling
			-- from populate_object_from_dt calling set_generic_object_data_from_dt also occurs
		require
			Data_tree_valid: a_dt_obj /= Void
		local
			src_obj, targ_obj: ANY
			src_obj_fld: INTEGER
			path_list: SEQUENCE [OG_PATH]
			exception_caught: BOOLEAN
		do
			if not exception_caught then
				-- wipe the reference list out if on a top-level object
				if a_dt_obj.is_root then
					create object_ref_list.make(0)
				end

				Result := populate_object_from_dt(a_dt_obj, a_type_id)

				-- if there were object references in the DT structure, process them now
				if a_dt_obj.is_root and not object_ref_list.is_empty then
					from object_ref_list.start until object_ref_list.off loop
						src_obj := object_ref_list.item.source_object_ref
						src_obj_fld := object_ref_list.item.source_object_field_index
						if attached {DT_OBJECT_REFERENCE} object_ref_list.item as a_dt_obj_ref then
							if a_dt_obj.has_path (a_dt_obj_ref.value.as_string) then
								targ_obj := a_dt_obj.node_at_path (a_dt_obj_ref.value.as_string).as_object_ref
								if a_dt_obj_ref.is_source_object_container then
									if attached {HASH_TABLE [ANY, HASHABLE]} src_obj as a_hash_table then
										a_hash_table.extend(targ_obj, a_dt_obj_ref.hash_key)
									elseif attached {SEQUENCE [ANY]} src_obj as a_sequence then
										a_sequence.extend(targ_obj)
									end
								else
									set_reference_field(src_obj_fld, src_obj, targ_obj)
								end
							else
								post_error(Current, "dt_to_object", "non_existent_path", <<a_dt_obj_ref.value.as_string>>)
							end
						elseif attached {DT_OBJECT_REFERENCE_LIST} object_ref_list.item as a_dt_obj_ref_list then
							-- make the generic container, it will be a SEQUENCE (some kind of list)
							if attached {SEQUENCE[ANY]} new_instance_of(field_static_type_of_type (src_obj_fld, dynamic_type (src_obj))) as a_sequence2 then
								if attached {ARRAYED_LIST[ANY]} a_sequence2 as an_arr_list then
									an_arr_list.make(0)
								end

								path_list := a_dt_obj_ref_list.value
								from path_list.start until path_list.off loop
									if a_dt_obj.has_path (path_list.item.as_string) then
										a_sequence2.extend(a_dt_obj.node_at_path (path_list.item.as_string).as_object_ref)
									else
										post_error(Current, "dt_to_object", "non_existent_path_in_list", <<path_list.item.as_string>>)
									end
									path_list.forth
								end

								-- now we detect if the whole thing is going inside another container, or a standard object
								if a_dt_obj_ref_list.is_source_object_container then
									if attached {HASH_TABLE [ANY, HASHABLE]} src_obj as a_hash_table2 then
										a_hash_table2.extend(a_sequence2, a_dt_obj_ref_list.hash_key)
									elseif attached {SEQUENCE [ANY]} src_obj as a_sequence3 then
										a_sequence3.extend(a_sequence2)
									end
								else
									set_reference_field(src_obj_fld, src_obj, a_sequence2)
								end
							end
						else
							-- should never arrive here
						end

						object_ref_list.forth
					end
				end
			else
				Result := Void
			end
		rescue
			if assertion_violation then
				-- check that the original was set_reference_field() - this indicates a type mismatch
				post_error(Current, "dt_to_object", "dt_to_object_type_mismatch", <<original_recipient_name>>)
			end
			exception_caught := True
			retry
		end

	populate_object_from_dt(a_dt_obj: DT_COMPLEX_OBJECT_NODE; a_type_id: INTEGER): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; recursive
		local
			a_dt_attr: DT_ATTRIBUTE_NODE
			a_dt_complex_obj: DT_COMPLEX_OBJECT_NODE
			a_dt_obj_leaf: DT_OBJECT_LEAF
			a_dt_ref: DT_REFERENCE
			fld_name: STRING
			fld_type_id, equiv_prim_type_id, i: INTEGER
			a_gen_field: ANY
			exception_caught: BOOLEAN
		do
			if is_special_any_type(a_type_id) then
				-- FIXME: how to determine the length of the SPECIAL?
				debug ("DT")
					io.put_string("DT_OBJECT_CONVERTER.populate_object_from_dt: about to call new_special_any_instance(" +
						type_name_of_type(a_type_id) + ")%N")
				end
				Result := new_special_any_instance(a_type_id, 1)
				debug ("DT")
					io.put_string("%T(return)%N")
				end
			else
				debug ("DT")
					io.put_string("DT_OBJECT_CONVERTER.populate_object_from_dt: about to call new_instance_of(" +
						type_name_of_type(a_type_id) + ")%N")
				end
				Result := new_instance_of(a_type_id)
				debug ("DT")
					io.put_string("%T(return)%N")
				end

				-- FIXME: the following is a hacker's attempt to
				-- reliably call a reasonable make function? Should call at least 'default_create'
				-- Eiffel does not allow this at the moment.
				if attached {DT_CONVERTIBLE} Result as a_dt_conv then
					a_dt_conv.make_dt
				end
			end

			if not exception_caught then
				if generic_count_of_type(a_type_id) > 0 then
					-- we are on a generic object, and the correspoding DT object must
					-- have a single attribute which is_generic and is_multiple
					-- we don't go through its fields, instead we just go to the next
					-- object level down in the DT tree
					if not a_dt_obj.is_empty then
						a_dt_obj.start -- get first attribute
						a_dt_attr := a_dt_obj.item
						if a_dt_attr.is_generic then
							set_generic_object_data_from_dt (Result, a_dt_attr)
						else
							-- should never get here: it means that the DT data parsed as a
							-- nested generic, but that the corresponding object types are not
						end
					else -- even if it is empty, we still have to create the generic object properly
						-- note that the invariants of the containing business object might easily not be satisfied
						make_empty_generic_object (Result)
					end
				else
					-- for each field in the object
					from i := 1 until i > field_count(Result) loop
						fld_name := field_name(i, Result)

						if a_dt_obj.has_attribute(fld_name) then
							a_dt_attr := a_dt_obj.attribute_node (fld_name)

							fld_type_id := field_static_type_of_type(i, a_type_id)
							if a_dt_attr.is_multiple and not a_dt_attr.is_empty then
								if is_container_type(fld_type_id) then
									-- create container object
									debug ("DT")
										io.put_string("DT_OBJECT_CONVERTER.populate_object_from_dt: about to call (2) new_instance_of(" +
											type_name_of_type(fld_type_id) + ")%N")
									end
									a_gen_field := new_instance_of(fld_type_id)
									debug ("DT")
										io.put_string("%T(return)%N")
									end
									set_reference_field(i, Result, a_gen_field)

									-- FIXME: can only deal with one generic parameter for the moment
									set_generic_object_data_from_dt (a_gen_field, a_dt_attr)

								else -- type in parsed data is container, but is not in Eiffel class		
									post_error(Current, "populate_object_from_dt", "container_type_mismatch",
										<<type_name_of_type(fld_type_id), type_name_of_type(a_type_id)>>
									)
								end
							else
								a_dt_attr.start
								a_dt_obj_leaf ?= a_dt_attr.item
								if a_dt_obj_leaf /= Void then
									a_dt_ref ?= a_dt_obj_leaf
									if a_dt_ref /= Void then
										-- find object that was created at target path of this reference, in table of such objects
										debug ("DT")
											io.put_string ("%TDT_REFERENCE " + a_dt_ref.as_string + "%N")
										end
										a_dt_ref.set_source_object_details (Result, i)
										object_ref_list.extend(a_dt_ref)
									else
										equiv_prim_type_id := any_primitive_conforming_type(fld_type_id)
										if equiv_prim_type_id /= 0 then
											debug ("DT")
												io.put_string("DT_OBJECT_CONVERTER.populate_object_from_dt: from_dt_proc.call([" +
													i.out + ", " + Result.generating_type + " (field static type = " + fld_type_id.out + "), " +
													a_dt_obj_leaf.value.generating_type + " (dyn type = " + dynamic_type (a_dt_obj_leaf.value).out + "))%N")
											end
											cvt_tbl.item(equiv_prim_type_id).from_dt_proc.call([i, Result, a_dt_obj_leaf.value])
											debug ("DT")
												io.put_string("%T(return)%N")
											end
										else -- type implied in data is primitive, but it is not a primitive type in Eiffel class
											post_error(Current, "populate_object_from_dt", "primitive_type_mismatch",
												<<type_name_of_type(fld_type_id), type_name_of_type(a_type_id)>>
											)
										end
									end
								else -- must be a reference type field of type DT_COMPLEX_OBJECT
									-- this is where the recursive call is
									-- first, check if the static type is overridden by a type specified in the DT tree
									a_dt_complex_obj ?= a_dt_attr.item
									if a_dt_attr.item.type_visible then
										fld_type_id := dynamic_type_from_string (a_dt_attr.item.rm_type_name)
									end
									set_reference_field(i, Result, populate_object_from_dt(a_dt_complex_obj, fld_type_id))
								end
							end
						end
						i := i + 1
					end
				end
				if attached {DT_CONVERTIBLE} Result as a_dt_conv then
					a_dt_conv.finalise_dt
				end
			end
		rescue
			if equiv_prim_type_id /= 0 then -- this must have been an argument type mismatch which killed the from_dt_proc.call[]
				post_error(Current, "populate_object_from_dt", "dt_proc_arg_type_mismatch",
					<<type_name_of_type(a_type_id), fld_name, type_name_of_type(fld_type_id), type_name(a_dt_obj_leaf.value)>>)
			end
			exception_caught := True
			retry
		end

	prim_object_to_dt(a_parent: DT_ATTRIBUTE_NODE; an_obj: ANY; a_node_id: STRING)
		require
			Type_valid: has_primitive_type(an_obj)
			Obj_exists: an_obj /= Void
			Node_id_valid: a_node_id /= Void implies not a_node_id.is_empty
		do
			debug ("DT")
				io.put_string("DT_OBJECT_CONVERTER.prim_object_to_dt: from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
					a_parent.rm_attr_name + "), " + an_obj.generating_type + ", [a_node_id])%N")
			end
			cvt_tbl.item(any_primitive_conforming_type(dynamic_type(an_obj))).from_obj_proc.call([a_parent, an_obj, a_node_id])
			debug ("DT")
				io.put_string("%T(return)%N")
			end
		end

feature {NONE} -- Conversion to object

--	set_primitive_integer_field (i: INTEGER; object: ANY; value: INTEGER)
--		do
--			set_integer_field (i, object, value)
--		end

--	set_primitive_real_field (i: INTEGER; object: ANY; value: REAL)
--		do
--			set_real_field (i, object, value)
--		end

--	set_primitive_double_field (i: INTEGER; object: ANY; value: DOUBLE)
--		do
--			set_double_field (i, object, value)
--		end

--	set_primitive_boolean_field (i: INTEGER; object: ANY; value: BOOLEAN)
--		do
--			set_boolean_field (i, object, value)
--		end

--	set_primitive_character_field (i: INTEGER; object: ANY; value: CHARACTER)
--		do
--			set_character_field (i, object, value)
--		end

	set_primitive_sequence_field (i: INTEGER; object: ANY; value: ANY)
			-- set i-th field of object which is some kind of sequence of a primitive type,
			-- from a value which is either an ARRAYED_LIST or a single object like an INTEGER,
			-- which we want to turn into the member of a new sequence
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
		local
			al_val, al_field: ARRAYED_LIST[ANY]
			seq: SEQUENCE[ANY]
			val_type, fld_type: INTEGER
		do
			val_type := dynamic_type(value)
			fld_type := field_static_type_of_type(i, dynamic_type(object))
			if val_type = fld_type then
				set_reference_field (i, object, value)
			else
				debug ("DT")
					io.put_string("DT_OBJECT_CONVERTER.set_primitive_sequence_field: about to call new_instance_of(" +
						type_name_of_type(fld_type) + ")%N")
				end
				set_reference_field (i, object, new_instance_of(fld_type))
				debug ("DT")
					io.put_string("%T(return)%N")
				end
				al_field ?= field(i, object)
				if al_field /= Void then
					al_field.make(0)
				end
				seq ?= field(i, object)
				al_val ?= value
				if al_val /= Void then
					from al_val.start until al_val.off loop
						seq.extend(al_val.item)
						al_val.forth
					end
				else
					-- this means we have an object whose field type is a container, but
					-- where the dADL scanned as a single object - this happens with
					-- any list of one item. The dADL syntax is to use "<xx, ...>" to
					-- show it is a list, but this is often forgotten
					-- So...we do a conversion
					seq.extend(value)
				end
			end
		end

	set_interval_integer_field (i: INTEGER; object: ANY; value: INTERVAL[INTEGER_REF])
			-- set INTERVAL[INTEGER] field in an object from a value of type INTERVAL[INTEGER_REF]
			-- FIXME: This routine only exists because of the difference between expanded and reference
		local
			fld_type: INTEGER
		do
			fld_type := field_static_type_of_type(i, dynamic_type(object))
			if dynamic_type(value) = fld_type then
				set_reference_field (i, object, value)
			else
				debug ("DT")
					io.put_string("DT_OBJECT_CONVERTER.set_interval_integer_field - CALLING interval_integer_ref_to_interval_integer on field " + i.out + " of " + object.generating_type + "%N")
				end
				set_reference_field (i, object, interval_integer_ref_to_interval_integer(value))
			end
		end

	set_interval_real_field (i: INTEGER; object: ANY; value: INTERVAL[REAL_REF])
			-- set INTERVAL[REAL] field in an object from a value of type INTERVAL[REAL_REF]
			-- FIXME: This routine only exists because of the difference between expanded and reference
		local
			fld_type: INTEGER
		do
			fld_type := field_static_type_of_type(i, dynamic_type(object))
			if dynamic_type(value) = fld_type then
				set_reference_field (i, object, value)
			else
				debug ("DT")
					io.put_string("DT_OBJECT_CONVERTER.set_interval_real_field - CALLING interval_real_ref_to_interval_real on field " + i.out + " of " + object.generating_type + "%N")
				end
				set_reference_field (i, object, interval_real_ref_to_interval_real(value))
			end
		end

	set_interval_double_field (i: INTEGER; object: ANY; value: INTERVAL[DOUBLE_REF])
			-- set INTERVAL[DOUBLE] field in an object from a value of type INTERVAL[DOUBLE_REF]
			-- FIXME: This routine only exists because of the difference between expanded and reference
		local
			fld_type: INTEGER
		do
			fld_type := field_static_type_of_type(i, dynamic_type(object))
			if dynamic_type(value) = fld_type then
				set_reference_field (i, object, value)
			else
				debug ("DT")
					io.put_string("DT_OBJECT_CONVERTER.set_interval_double_field - CALLING interval_double_ref_to_interval_double on field " + i.out + " of " + object.generating_type + "%N")
				end
				set_reference_field (i, object, interval_double_ref_to_interval_double(value))
			end
		end

feature -- Conversion from object

	from_obj_primitive_type(a_parent: DT_ATTRIBUTE_NODE; an_obj: ANY; a_node_id: STRING)
		local
			a_dt_obj: DT_PRIMITIVE_OBJECT
		do
			debug("DT")
				io.put_string("--->ENTER from_obj_primitive_type(DT_ATTIBUTE_NODE, " +
							an_obj.generating_type + ", [a_node_id])%N")
			end
			a_dt_obj := create_dt_primitive_object(a_parent, an_obj, a_node_id)
			debug("DT")
				io.put_string("<---EXIT from_obj_primitive_type%N")
			end
		end

	from_obj_sequence_primitive_type(a_parent: DT_ATTRIBUTE_NODE; an_obj: SEQUENCE[ANY]; a_node_id: STRING)
		local
			a_dt_obj: DT_PRIMITIVE_OBJECT_LIST
		do
			debug("DT")
				io.put_string("--->ENTER from_obj_sequence_primitive_type(DT_ATTIBUTE_NODE, " +
							an_obj.generating_type + ", [node_id])%N")
			end
			if a_node_id /= Void then
				create a_dt_obj.make_identified(an_obj, a_node_id)
			else
				create a_dt_obj.make_anonymous(an_obj)
			end
			a_parent.put_child(a_dt_obj)
			debug("DT")
				io.put_string("<---EXIT from_obj_sequence_primitive_type%N")
			end
		end

	from_obj_interval_primitive_type(a_parent: DT_ATTRIBUTE_NODE; an_obj: INTERVAL[PART_COMPARABLE]; a_node_id: STRING)
		local
			a_dt_obj: DT_PRIMITIVE_OBJECT_INTERVAL
		do
			debug("DT")
				io.put_string("--->ENTER from_obj_interval_primitive_type(DT_ATTIBUTE_NODE, " +
							an_obj.generating_type + ", [a_node_id])%N")
			end
			if a_node_id /= Void then
				create a_dt_obj.make_identified(an_obj, a_node_id)
			else
				create a_dt_obj.make_anonymous(an_obj)
			end
			a_parent.put_child(a_dt_obj)
			debug("DT")
				io.put_string("<---EXIT from_obj_interval_primitive_type%N")
			end
		end

feature {NONE} -- Implementation

	object_ref_list: ARRAYED_LIST [DT_REFERENCE]
			-- list of DT_OBJECT_REFERENCE and DT_OBJECT_REFERENCE_LIST objects found in last top-level
			-- call to `dt_to_object'

	set_generic_object_data_from_dt (a_gen_obj: ANY; a_dt_attr: DT_ATTRIBUTE_NODE)
			-- set generic values in a generic object, from a_dt_attr
			-- only deals with first generic parameter; generally safe for HASH_TABLE and LIST types
		require
			Obj_exists: a_gen_obj /= Void
			Dt_attr_node_valid: a_dt_attr /= Void and then a_dt_attr.is_multiple
		local
			static_object_type_id, dynamic_object_type_id: INTEGER
		do
			static_object_type_id := generic_dynamic_type(a_gen_obj, 1)

			-- determine dynamic type of generic type
			if attached {HASH_TABLE [ANY, HASHABLE]} a_gen_obj as a_hash_table then
				a_hash_table.make(0)
				from a_dt_attr.start until a_dt_attr.off loop
					if attached {DT_REFERENCE} a_dt_attr.item as a_dt_ref then
						debug ("DT")
							io.put_string ("%TDT_REFERENCE (inside HASH_TABLE DT_ATTRIBUTE)" + a_dt_ref.as_string + "%N")
						end
						a_dt_ref.set_hash_table_source_object_details (a_hash_table, a_dt_attr.item.node_id)
						object_ref_list.extend(a_dt_ref)
					else
						-- the static type may be overridden by a type specified in the DT tree
						if a_dt_attr.item.type_visible then
							dynamic_object_type_id := dynamic_type_from_string (a_dt_attr.item.rm_type_name)
							if dynamic_object_type_id <= 0 then
								post_error(Current, "set_generic_object_data_from_dt", "model_access_e3", <<a_dt_attr.item.rm_type_name>>)
							end
						else
							dynamic_object_type_id := static_object_type_id
						end
						if dynamic_object_type_id > 0 then
							a_hash_table.extend(a_dt_attr.item.as_object (dynamic_object_type_id), a_dt_attr.item.node_id)
						end
					end
					a_dt_attr.forth
				end
			else
				if attached {SEQUENCE[ANY]} a_gen_obj as a_sequence then
					if attached {ARRAYED_LIST[ANY]} a_sequence as an_arrayed_list then
						an_arrayed_list.make(0)
					end
					from a_dt_attr.start until a_dt_attr.off loop
						if attached {DT_REFERENCE} a_dt_attr.item as a_dt_ref2 then
							debug ("DT")
								io.put_string ("%TDT_REFERENCE (inside SEQUENCE DT_ATTRIBUTE)" + a_dt_ref2.as_string + "%N")
							end
							a_dt_ref2.set_sequence_source_object_details (a_sequence)
							object_ref_list.extend(a_dt_ref2)
						else
							-- the static type may be overridden by a type specified in the DT tree
							if a_dt_attr.item.type_visible then
								dynamic_object_type_id := dynamic_type_from_string (a_dt_attr.item.rm_type_name)
								if dynamic_object_type_id <= 0 then
									post_error(Current, "set_generic_object_data_from_dt", "model_access_e3", <<a_dt_attr.item.rm_type_name>>)
								end
							else
								dynamic_object_type_id := static_object_type_id
							end
							if dynamic_object_type_id > 0 then
								a_sequence.extend(a_dt_attr.item.as_object (dynamic_object_type_id))
							end
						end
						a_dt_attr.forth
					end
				end
			end
		end

	make_empty_generic_object (a_gen_obj: ANY)
			-- just make sure make() is called so the object is in some sort of safe shape
			-- only deals with first generic parameter; generally safe for HASH_TABLE and LIST types
		require
			Obj_exists: a_gen_obj /= Void
		local
			a_sequence: SEQUENCE[ANY]
			an_arrayed_list: ARRAYED_LIST[ANY]
			a_hash_table: HASH_TABLE [ANY, HASHABLE]
		do
			-- determine dynamic type of generic type
			a_hash_table ?= a_gen_obj
			if a_hash_table /= Void then
				a_hash_table.make(0)
			else
				a_sequence ?= a_gen_obj
				if a_sequence /= Void then
					an_arrayed_list ?= a_sequence
					if an_arrayed_list /= Void then
						an_arrayed_list.make(0)
					end
				end
			end
		end

	create_dt_from_generic_obj (a_dt_attr: DT_ATTRIBUTE_NODE; an_obj: ANY)
			--
		local
			generic_param_type: INTEGER
		do
			generic_param_type := generic_dynamic_type(an_obj, 1)
			-- FIXME: only deal with the 1st generic param at the moment
			if attached {HASH_TABLE [ANY, HASHABLE]} an_obj as a_hash_table then
				from a_hash_table.start until a_hash_table.off loop
					if is_any_primitive_conforming_type(generic_param_type) then
						debug ("DT")
							io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj: from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
								a_dt_attr.rm_attr_name + "), " + a_hash_table.item_for_iteration.generating_type +
								", " + a_hash_table.key_for_iteration.out + ")%N")
						end
						cvt_tbl.item(any_primitive_conforming_type(generic_param_type)).from_obj_proc.call([a_dt_attr,
								a_hash_table.item_for_iteration, a_hash_table.key_for_iteration.out])
						debug ("DT")
							io.put_string("%T(return)%N")
						end
					else
						populate_dt_from_object(a_hash_table.item_for_iteration,
							create_complex_object_node(a_dt_attr, a_hash_table.key_for_iteration.out))
					end
					a_hash_table.forth
				end
			elseif attached {SEQUENCE[ANY]} an_obj as a_sequence then
				from a_sequence.start until a_sequence.off loop
					if is_any_primitive_conforming_type(generic_param_type) then
						debug ("DT")
							io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj(2): from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
								a_dt_attr.rm_attr_name + "), " + a_sequence.item.generating_type +
								", " + a_sequence.index.out + ")%N")
						end
						cvt_tbl.item(any_primitive_conforming_type(generic_param_type)).from_obj_proc.call([a_dt_attr,
								a_sequence.item, a_sequence.index.out])
						debug ("DT")
							io.put_string("%T(return)%N")
						end
					else
						populate_dt_from_object(a_sequence.item,
							create_complex_object_node(a_dt_attr, a_sequence.index.out))
					end
					a_sequence.forth
				end
			end
		end

	set_primitive_boolean_field (i: INTEGER; object: ANY; value: BOOLEAN_REF)
		do
			set_boolean_field (i, object, value)
		end

	cvt_tbl: HASH_TABLE [DT_CONV_DESC, INTEGER]
		local
			a_dt_conv: DT_CONV_DESC
		once
			create Result.make (0)

			-- primitive types
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_natural_32_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {NATURAL}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_natural_8_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {NATURAL_8}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_natural_16_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {NATURAL_16}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_natural_32_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {NATURAL_32}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_natural_64_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {NATURAL_64}))

			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_integer_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {INTEGER}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_integer_8_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {INTEGER_8}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_integer_16_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {INTEGER_16}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_integer_32_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {INTEGER_32}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_integer_64_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {INTEGER_64}))

			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_boolean_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {BOOLEAN}))

			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_real_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {REAL}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_real_32_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {REAL_32}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_real_64_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {REAL_64}))

			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_double_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {DOUBLE}))

			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_character_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {CHARACTER}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_character_8_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {CHARACTER_8}))
			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_character_32_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {CHARACTER_32}))

			create a_dt_conv.make (agent from_obj_primitive_type (?, ?, ?), agent set_reference_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {STRING}.make_empty))
			Result.put (a_dt_conv, dynamic_type (create {STRING_8}.make_empty))
			Result.put (a_dt_conv, dynamic_type (create {STRING_32}.make_empty))
			Result.put (a_dt_conv, dynamic_type (create {DATE}.make_now))
			Result.put (a_dt_conv, dynamic_type (create {DATE_TIME}.make_now))
			Result.put (a_dt_conv, dynamic_type (create {TIME}.make_now))
			Result.put (a_dt_conv, dynamic_type (create {DATE_TIME_DURATION}.make_definite (1, 0, 0, 0)))
			Result.put (a_dt_conv, dynamic_type (create {URI}.make_from_string ("http://no.way.home")))
			Result.put (a_dt_conv, dynamic_type (create {CODE_PHRASE}))

			-- primitive sequence types
			from
				primitive_sequence_types.start
			until
				primitive_sequence_types.off
			loop
				create a_dt_conv.make (agent from_obj_sequence_primitive_type (?, ?, ?), agent set_primitive_sequence_field (?, ?, ?))
				Result.put (a_dt_conv, primitive_sequence_types.item)
				primitive_sequence_types.forth
			end

			-- primitive interval types
			create a_dt_conv.make (agent from_obj_interval_primitive_type (?, ?, ?), agent set_reference_field (?, ?, ?))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [INTEGER]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [INTEGER_8]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [INTEGER_16]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [INTEGER_32]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [INTEGER_64]}))

			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [NATURAL]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [NATURAL_8]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [NATURAL_16]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [NATURAL_32]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [NATURAL_64]}))

			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [REAL]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [REAL_32]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [REAL_64]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [DOUBLE]}))

			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [DATE]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [DATE_TIME]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [TIME]}))
			Result.put (a_dt_conv, dynamic_type (create {INTERVAL [DATE_TIME_DURATION]}))

--			from
--				primitive_interval_types.start
--			until
--				primitive_interval_types.off
--			loop
--				create a_dt_conv.make (agent from_obj_interval_primitive_type (?, ?, ?), agent set_primitive_interval_field (?, ?, ?))
--				Result.put (a_dt_conv, primitive_interval_types.item)
--				primitive_interval_types.forth
--			end
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
--| The Original Code is dt_object_converter.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2005
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
