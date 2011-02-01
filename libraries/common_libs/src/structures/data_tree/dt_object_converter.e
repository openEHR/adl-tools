note
	component:   "openEHR Archetype Project"
	description: "[
				 object birectional converter. Errors due to mismatching data and object 
				 model reported in last_op_fail and fail_reason.
				 ]"
	keywords:    "dADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_OBJECT_CONVERTER

inherit
	DT_FACTORY

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

	object_to_dt (an_obj: attached ANY): attached DT_COMPLEX_OBJECT_NODE
			-- generate a DT_OBJECT from an Eiffel object; called only on top-level object
		do
			create Result.make_anonymous
			populate_dt_from_object(an_obj, Result)
		end

	populate_dt_from_object (an_obj: attached ANY; a_dt_obj: attached DT_COMPLEX_OBJECT_NODE)
			-- make a data tree from an object; this routine is recursive
			-- TODO: this routine will not work properly for any structure that is not a proper tree; any cycles will cause
			-- creation of copied data. This could be fixed by tracking ojbect references while generating the tree
		local
			a_dt_attr: DT_ATTRIBUTE_NODE
			fld_dynamic_type, i: INTEGER
			eif_fld_name: STRING
			fld_lst: ARRAYED_LIST[STRING]
		do
			a_dt_obj.set_type_name(an_obj.generating_type)
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: populating from a " +
		an_obj.generating_type + "%N")
end

			-- it is a container object itself, have to deal with specially
			if attached {HASH_TABLE [ANY, HASHABLE]} an_obj as a_hash_table or attached {SEQUENCE[ANY]} an_obj as a_sequence then
				create a_dt_attr.make_multiple_generic
				create_dt_from_container_obj(a_dt_attr, an_obj)
				a_dt_obj.put_attribute(a_dt_attr)

			else -- it's not a container object
				if attached {DT_CONVERTIBLE} an_obj as dt_conv then
					fld_lst := dt_conv.persistent_attributes
				end
				from i := 1 until i > field_count(an_obj) loop
					eif_fld_name := field_name(i, an_obj)
-- enable following line when transient attirbutes working then	
--					if attached {ANY} field(i, an_obj) as eif_fld_val and not is_field_transient (i, an_obj) then
					if attached {ANY} field(i, an_obj) as eif_fld_val and (not attached fld_lst or else fld_lst.has(eif_fld_name)) then
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: field_name = " + eif_fld_name + "%N")
end
						fld_dynamic_type := dynamic_type(eif_fld_val)

						-- now set the value inside the DT_ATTRIBUTE by creating the correct sort of DT_PRIMITIVE subtype
						if is_dt_primitive_interval_type (fld_dynamic_type) then -- it is an INTERVAL[some primitive or leaf type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
							if attached {INTERVAL[PART_COMPARABLE]} eif_fld_val as eif_prim_ivl then
								create a_dt_attr.make_single(eif_fld_name)
								a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_anonymous(eif_prim_ivl))
								a_dt_obj.put_attribute(a_dt_attr)
							end

						elseif is_dt_primitive_sequence_conforming_type(fld_dynamic_type) then -- it is a SEQUENCE of some DT primitive type
							if attached {SEQUENCE[ANY]} eif_fld_val as eif_prim_seq then
								create a_dt_attr.make_single(eif_fld_name)
								a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT_LIST}.make_anonymous(eif_prim_seq))
								a_dt_obj.put_attribute(a_dt_attr)
							end

						elseif is_dt_primitive_atomic_type(fld_dynamic_type) then -- it is a DT primitive type then
							create a_dt_attr.make_single(eif_fld_name)
							a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT}.make_anonymous(eif_fld_val))
							a_dt_obj.put_attribute(a_dt_attr)

						else -- its a complex object, or else a SEQUENCE or HASH_TABLE of a complex object
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: (complex or container type)%N")
end
							if attached {HASH_TABLE [ANY, HASHABLE]} eif_fld_val as a_hash_table2 or attached {SEQUENCE[ANY]} eif_fld_val as a_sequence2 then
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: (container type)%N")
end
								create a_dt_attr.make_multiple(eif_fld_name)
								create_dt_from_container_obj(a_dt_attr, eif_fld_val)
								if not a_dt_attr.is_empty then
									a_dt_obj.put_attribute(a_dt_attr)
								end
							else
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.populate_dt_from_object: (normal complex type)%N")
end
								-- it's a normal complex object
								create a_dt_attr.make_single(eif_fld_name)
								populate_dt_from_object(eif_fld_val, create_complex_object_node(a_dt_attr, Void))
								a_dt_obj.put_attribute(a_dt_attr)
							end
						end
					end
					i := i + 1
				end
			end
		end

	dt_to_object_from_string(a_dt_obj: attached DT_COMPLEX_OBJECT_NODE; a_type_name: attached STRING; make_args: ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := dt_to_object (a_dt_obj, dynamic_type_from_string (a_type_name), make_args)
		end

	dt_to_object (a_dt_obj: attached DT_COMPLEX_OBJECT_NODE; a_type_id: INTEGER; make_args: ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; should be called only on top-level DT structure, but recursive calling
			-- from populate_object_from_dt calling set_container_object_data_from_dt also occurs
			-- The main job of this routine is to set up cross references.
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

				Result := populate_object_from_dt(a_dt_obj, a_type_id, make_args)

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

	populate_object_from_dt (a_dt_obj: attached DT_COMPLEX_OBJECT_NODE; a_type_id: INTEGER; make_args: ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; recursive. Be careful of the 3 'kinds' of type id in Eiffel:
			-- an 'abstract type' is defined in INTERNAL; all ref types have one abstract type
			-- a 'static type' is the statically declared type id of a field in an object
			-- a 'dynamic type' is the actual type of an object at runtime;
			-- static and dynamic type numbers come from the same series;
			-- abstract type numbers are completely separate
		local
			a_dt_attr: DT_ATTRIBUTE_NODE
			a_dt_complex_obj: DT_COMPLEX_OBJECT_NODE
			a_dt_obj_leaf: DT_OBJECT_LEAF
			fld_name: STRING
			abstract_fld_type_id, fld_type_id, dyn_dt_val_type_id, i: INTEGER
			a_gen_field, v: ANY
			exception_caught: BOOLEAN
		do
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.populate_object_from_dt: ENTER%N")
end
			if is_special_any_type (a_type_id) then
				-- FIXME: how to determine the length of the SPECIAL?
debug ("DT")
	io.put_string("%Tabout to call new_special_any_instance(" +
		type_name_of_type(a_type_id) + ")%N")
end
				Result := new_special_any_instance (a_type_id, 1)
debug ("DT")
	io.put_string("%T(return)%N")
end
			else
debug ("DT")
	io.put_string("%Tabout to call new_instance_of(" +
		type_name_of_type(a_type_id) + ")%N")
end
				Result := new_instance_of (a_type_id)
debug ("DT")
	io.put_string("%T(return)%N")
end

				-- FIXME: the following is a hacker's attempt to
				-- reliably call a reasonable make function? Should call at least 'default_create'
				-- Eiffel does not allow this at the moment.
				if attached {DT_CONVERTIBLE} Result as a_dt_conv then
					a_dt_conv.make_dt (make_args)
				end
			end

			if not exception_caught then
				if generic_count_of_type(a_type_id) > 0 then
					-- we are on a generic object, and the correspoding DT object must
					-- have a single attribute which is_generic and is_multiple
					-- we don't go through its fields, instead we just go to the next
					-- object level down in the DT tree
					if not a_dt_obj.is_empty then
						a_dt_attr := a_dt_obj.first
						if a_dt_attr.is_generic then
							set_container_object_data_from_dt (Result, a_dt_attr)
						else
							-- should never get here: it means that the DT data parsed as a
							-- nested generic, but that the corresponding object types are not
						end
					else -- even if it is empty, we still have to create the generic object properly
						-- note that the invariants of the containing business object might easily not be satisfied
						make_empty_container_object (Result)
					end
				else
					-- for each field in the object
					from i := 1 until i > field_count(Result) loop
						fld_name := field_name(i, Result)

						if a_dt_obj.has_attribute(fld_name) then
							a_dt_attr := a_dt_obj.attribute_node (fld_name)
							fld_type_id := field_static_type_of_type(i, a_type_id)

debug ("DT")
	io.put_string ("%TEiffel field " + fld_name + " (static type = " + fld_type_id.out + "; " + type_name_of_type (fld_type_id) + ")%N")
end

							-- Test if DT object is a multiple-valued attribute of a complex type (i.e. not a list or hash of primitive types; see below for that)
							if a_dt_attr.is_multiple and not a_dt_attr.is_empty then
								if is_eiffel_container_type(fld_type_id) then -- so is Eiffel object field; create container object
debug ("DT")
	io.put_string("%T%TDT type is multiple, and Eiffel field type is container; about to call (2) new_instance_of(" + type_name_of_type(fld_type_id) + ")%N")
end
									a_gen_field := new_instance_of(fld_type_id)
debug ("DT")
	io.put_string("%T%T(return)%N")
end
									set_reference_field(i, Result, a_gen_field)

									-- FIXME: can only deal with one generic parameter for the moment
									set_container_object_data_from_dt (a_gen_field, a_dt_attr)

								else -- type in parsed DT is container, but not in Eiffel class		
									post_error(Current, "populate_object_from_dt", "container_type_mismatch",
										<<type_name_of_type(fld_type_id), type_name_of_type(a_type_id)>>
									)
								end

							-- according to DT tree, it is a single-valued attribute (note in DT, this can be a HASH or ARRAYED_LIST of a supported
							-- primitive types, because these are atomic in dadl)
							else
								a_dt_attr.start
								a_dt_obj_leaf ?= a_dt_attr.item
								if a_dt_obj_leaf /= Void then

									-- In the DT tree, it is a REF; look up object that was created at target path of this reference in xref table
									if attached {DT_REFERENCE} a_dt_obj_leaf as a_dt_ref then
debug ("DT")
	io.put_string ("%TDT_REFERENCE " + a_dt_ref.as_string + "%N")
end
										a_dt_ref.set_source_object_details (Result, i)
										object_ref_list.extend(a_dt_ref)

									-- it is a proper value field of some kind
									else
										abstract_fld_type_id := field_type_of_type (i, a_type_id)

										-- Eiffel type of field must be an Eiffel primitive type; DT type should correspond
										-- This only deals with those types that Eiffel considers 'value' types, not the extended
										-- list that DT/dadl consider as 'primitive' types, see below for that
										if abstract_fld_type_id /= reference_type then
debug ("DT")
	io.put_string ("%T%TEiffel primitive field " + fld_name + " (abstract type = " + abstract_fld_type_id.out + ")%N")
end
											inspect abstract_fld_type_id
											when character_8_type then -- = Character_type
												if attached {CHARACTER} a_dt_obj_leaf.value as v_typed then
													set_character_field (i, Result, v_typed)
												end
											when character_32_type then -- = Wide_character_type
												if attached {CHARACTER_32} a_dt_obj_leaf.value as v_typed then
													set_character_32_field (i, Result, v_typed)
												end

											when boolean_type then
												if attached {BOOLEAN} a_dt_obj_leaf.value as v_typed then
													set_boolean_field (i, Result, v_typed)
												end

											when integer_8_type then
												if attached {INTEGER_8} a_dt_obj_leaf.value as v_typed then
													set_integer_8_field (i, Result, v_typed)
												end
											when integer_16_type then
												if attached {INTEGER_16} a_dt_obj_leaf.value as v_typed then
													set_integer_16_field (i, Result, v_typed)
												end
											when integer_32_type then -- = Integer_type
												if attached {INTEGER_32} a_dt_obj_leaf.value as v_typed then
													set_integer_32_field (i, Result, v_typed)
												end
											when integer_64_type then
												if attached {INTEGER_64} a_dt_obj_leaf.value as v_typed then
													set_integer_64_field (i, Result, v_typed)
												end

											when natural_8_type then
												if attached {NATURAL_8} a_dt_obj_leaf.value as v_typed then
													set_natural_8_field (i, Result, v_typed)
												end
											when natural_16_type then
												if attached {NATURAL_16} a_dt_obj_leaf.value as v_typed then
													set_natural_16_field (i, Result, v_typed)
												end
											when natural_32_type then
												if attached {NATURAL_32} a_dt_obj_leaf.value as v_typed then
													set_natural_32_field (i, Result, v_typed)
												end
											when natural_64_type then
												if attached {NATURAL_64} a_dt_obj_leaf.value as v_typed then
													set_natural_64_field (i, Result, v_typed)
												end

											when real_32_type then -- = Real_type
												if attached {REAL_32} a_dt_obj_leaf.value as v_typed then
													set_real_32_field (i, Result, v_typed)
												end
											when real_64_type then -- = Double_type
												if attached {REAL_64} a_dt_obj_leaf.value as v_typed then
													set_real_64_field (i, Result, v_typed)
												end
											else
												-- unsupported: Pointer_type (0), Expanded_type (7), Bit_type (8)
												-- should never get here, because dadl parser never generates these types
											end

										-- Eiffel object field is an Eiffel reference type
										else
											dyn_dt_val_type_id := dynamic_type (a_dt_obj_leaf.value)

											-- figure out if it is an ARRAYED_LIST or HASH_TABLE in the DT structure; this only
											-- occurs for supported primitive types, i.e. a container of any complex object on
											-- the Eiffel side does not result in a container on a DT_OBJECT_LEAF, but instead a
											-- DT_COMPLEX_OBJECT with children. Further, the only possible containers used on the
											-- DT side are SEQUENCE or a HASH_TABLE. For both cases, special processing is needed.

											if attached {DT_PRIMITIVE_OBJECT_LIST} a_dt_obj_leaf then
												if is_eiffel_container_type(fld_type_id) then -- Eiffel field type is compatible
													set_primitive_sequence_field (i, Result, fld_type_id, a_dt_obj_leaf.value)
												else -- type in parsed DT is container, but not in Eiffel class		
													post_error(Current, "populate_object_from_dt", "container_type_mismatch",
														<<type_name_of_type(fld_type_id), type_name_of_type(dyn_dt_val_type_id)>>
													)
												end

											-- it is an INTERVAL[primitive type]
											elseif attached {DT_PRIMITIVE_OBJECT_INTERVAL} a_dt_obj_leaf then
												if is_eiffel_interval_type(fld_type_id) then -- Eiffel field type is compatible
													set_primitive_interval_field (i, Result, fld_type_id, a_dt_obj_leaf.value)
												else -- type in parsed DT is INTERVAL, but not in Eiffel class		
													post_error(Current, "populate_object_from_dt", "interval_type_mismatch",
														<<type_name_of_type(fld_type_id), type_name_of_type(dyn_dt_val_type_id)>>
													)
												end

											-- must be an atomic reference type
											else
												if field_conforms_to (dyn_dt_val_type_id, fld_type_id) then
													set_reference_field (i, Result, a_dt_obj_leaf.value)

												else -- take care of any type conversions required to match 'convert' statements in basic types
													-- first check we do is if the DT object is an atom, but the Eiffel type is actually
													-- a SEQUENCE; this can happen if the DADL text does not follow the rules, and
													-- uses e.g. xxx = <val> for a list containing one value, instead of xxx = <val, ...>,
													-- which is the correct syntax; however, this is common, so we deal with it.

													-- FIXME: the code below deals with conversion of an atom to a list OR a ISO8601 date/tme
													-- type to an Eiffel type, but not both at once yet!!!

													if is_eiffel_container_type(fld_type_id) then
														set_primitive_sequence_field (i, Result, fld_type_id, a_dt_obj_leaf.value)
													else
														if attached {ISO8601_DATE} a_dt_obj_leaf.value as iso_date then
															v := iso_date.to_date
														elseif attached {ISO8601_TIME} a_dt_obj_leaf.value as iso_time then
															v := iso_time.to_time
														elseif attached {ISO8601_DATE_TIME} a_dt_obj_leaf.value as iso_date_time then
															v := iso_date_time.to_date_time
														elseif attached {ISO8601_DURATION} a_dt_obj_leaf.value as iso_duration then
															v := iso_duration.to_date_time_duration
														else
															post_error(Current, "populate_object_from_dt", "atomic_type_mismatch",
																<<type_name_of_type(fld_type_id), type_name_of_type(dyn_dt_val_type_id)>>
															)
														end
														set_reference_field (i, Result, v)
													end
												end
											end
										end
									end

								-- must be a reference type field of type DT_COMPLEX_OBJECT
								else
									-- this is where the recursive call is
									-- first, check if the static type is overridden by a type specified in the DT tree
									a_dt_complex_obj ?= a_dt_attr.item
									if a_dt_attr.item.type_visible then
										fld_type_id := dynamic_type_from_string (a_dt_attr.item.rm_type_name)
									end
									set_reference_field(i, Result, populate_object_from_dt(a_dt_complex_obj, fld_type_id, Void))
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
			if dyn_dt_val_type_id /= 0 then -- this must have been an argument type mismatch which killed the from_dt_proc.call[]
				post_error(Current, "populate_object_from_dt", "dt_proc_arg_type_mismatch",
					<<type_name_of_type(a_type_id), fld_name, type_name_of_type(fld_type_id), type_name(a_dt_obj_leaf.value)>>)
			end
			exception_caught := True
			retry
		end

feature {NONE} -- Conversion to object

	set_primitive_interval_field (i: INTEGER; object: ANY; fld_type:INTEGER; value: ANY)
			-- set a field of a specific Eiffel type like INTERVAL[INTEGER_8] from the parsed form, which is always (currently)
			-- INTERVAL[INTEGER_32] (larger numbers will have to be parsed as INTERVAL[INTEGER_64]; same for large reals => REAL_64).
			-- This is currently a total hack, awaiting ES to implement INTEGER_GENERAL, REAL_GENERAL etc from the ECMA spec.
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
		local
			v: ANY
		do
			v := new_instance_of (fld_type)

			if attached {INTERVAL[INTEGER]} value as src_ivl_int then
				if attached {INTERVAL[INTEGER_8]} v as targ_ivl_int_8 then
					targ_ivl_int_8.make_from_other (src_ivl_int.lower.as_integer_8, src_ivl_int.upper.as_integer_8, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[INTEGER_16]} v as targ_ivl_int_16 then
					targ_ivl_int_16.make_from_other (src_ivl_int.lower.as_integer_16, src_ivl_int.upper.as_integer_16, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[INTEGER_32]} v as targ_ivl_int_32 then
					targ_ivl_int_32.make_from_other (src_ivl_int.lower, src_ivl_int.upper, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[INTEGER_64]} v as targ_ivl_int_64 then
					targ_ivl_int_64.make_from_other (src_ivl_int.lower, src_ivl_int.upper, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_8]} v as targ_ivl_nat_8 then
					targ_ivl_nat_8.make_from_other (src_ivl_int.lower.as_natural_8, src_ivl_int.upper.as_natural_8, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_16]} v as targ_ivl_nat_16 then
					targ_ivl_nat_16.make_from_other (src_ivl_int.lower.as_natural_16, src_ivl_int.upper.as_natural_16, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_32]} v as targ_ivl_nat_32 then
					targ_ivl_nat_32.make_from_other (src_ivl_int.lower.as_natural_32, src_ivl_int.upper.as_natural_32, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_64]} v as targ_ivl_nat_64 then
					targ_ivl_nat_64.make_from_other (src_ivl_int.lower.as_natural_64, src_ivl_int.upper.as_natural_64, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				end

			elseif attached {INTERVAL[REAL]} value as src_ivl_real then
				if attached {INTERVAL[REAL_32]} v as targ_ivl_real_32 then
					targ_ivl_real_32.make_from_other (src_ivl_real.lower, src_ivl_real.upper, src_ivl_real.lower_unbounded, src_ivl_real.upper_unbounded, src_ivl_real.lower_included, src_ivl_real.upper_included)
				elseif attached {INTERVAL[REAL_64]} v as targ_ivl_int_64 then
					targ_ivl_int_64.make_from_other (src_ivl_real.lower, src_ivl_real.upper, src_ivl_real.lower_unbounded, src_ivl_real.upper_unbounded, src_ivl_real.lower_included, src_ivl_real.upper_included)
				end
			end

			set_reference_field (i, object, v)
		end

	set_primitive_sequence_field (i: INTEGER; object: ANY; fld_type:INTEGER; value: ANY)
			-- set i-th field of object which is some kind of sequence of a DT primitive type,
			-- from a value which is either an ARRAYED_LIST or a single object like an INTEGER,
			-- which we want to turn into the member of a new sequence
		require
			object_not_void: object /= Void
			fld_type_valid: fld_type > 0
			index_large_enough: i >= 1
		local
			val_type: INTEGER
		do
			val_type := dynamic_type(value)
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

				-- if it was an arrayed_list, call its make routine to get it into a decent state
				if attached {ARRAYED_LIST[ANY]} field(i, object) as al_field then
					al_field.make(0)
				else
					-- FIXME should do something about other types
				end

				-- now copy the values in
				if attached {SEQUENCE[ANY]} field(i, object) as seq then
					if attached {ARRAYED_LIST[ANY]} value as al_val then
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
		end

feature {NONE} -- Implementation

	object_ref_list: ARRAYED_LIST [DT_REFERENCE]
			-- list of DT_OBJECT_REFERENCE and DT_OBJECT_REFERENCE_LIST objects found in last top-level
			-- call to `dt_to_object'

	set_container_object_data_from_dt (a_gen_obj: ANY; a_dt_attr: DT_ATTRIBUTE_NODE)
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
			if attached {HASH_TABLE [ANY, HASHABLE]} a_gen_obj as a_hash_table then -- it is a HASH_TABLE
				a_hash_table.make(0)
				from a_dt_attr.start until a_dt_attr.off loop
					if attached {DT_REFERENCE} a_dt_attr.item as a_dt_ref then
						debug ("DT")
							io.put_string ("%TDT_REFERENCE (inside HASH_TABLE DT_ATTRIBUTE)" + a_dt_ref.as_string + "%N")
						end
						a_dt_ref.set_hash_table_source_object_details (a_hash_table, a_dt_attr.item.node_id)
						object_ref_list.extend(a_dt_ref)
					else -- the static type may be overridden by a type specified in the DT tree
						if a_dt_attr.item.type_visible then
							dynamic_object_type_id := dynamic_type_from_string (a_dt_attr.item.rm_type_name)
							if dynamic_object_type_id <= 0 then
								post_error(Current, "set_container_object_data_from_dt", "model_access_e3", <<a_dt_attr.item.rm_type_name>>)
							end
						else
							dynamic_object_type_id := static_object_type_id
						end
						if dynamic_object_type_id > 0 then
							a_hash_table.extend(a_dt_attr.item.as_object (dynamic_object_type_id, Void), a_dt_attr.item.node_id)
						end
					end
					a_dt_attr.forth
				end
			elseif attached {SEQUENCE[ANY]} a_gen_obj as a_sequence then  -- must be a linear SEQUENCE of some kind
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
								post_error(Current, "set_container_object_data_from_dt", "model_access_e3", <<a_dt_attr.item.rm_type_name>>)
							end
						else
							dynamic_object_type_id := static_object_type_id
						end
						if dynamic_object_type_id > 0 then
							a_sequence.extend(a_dt_attr.item.as_object (dynamic_object_type_id, Void))
						end
					end
					a_dt_attr.forth
				end
			else -- something else; should fail in some way here
				debug ("DT")
					io.put_string ("%Tset_container_object_data_from_dt reached forbidden 'else'%N")
				end
			end
		end

	make_empty_container_object (a_gen_obj: ANY)
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

	create_dt_from_container_obj (a_dt_attr: DT_ATTRIBUTE_NODE; an_obj: ANY)
			-- FIXME: only deal with the 1st generic param at the moment
		local
			generic_param_type: INTEGER
		do
			generic_param_type := generic_dynamic_type(an_obj, 1)
			if attached {HASH_TABLE [ANY, HASHABLE]} an_obj as a_hash_table then
				if is_dt_primitive_interval_type (generic_param_type) then -- it is an INTERVAL[some primitive or leaf type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
					from a_hash_table.start until a_hash_table.off loop
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj: from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
		a_dt_attr.rm_attr_name + "), " + a_hash_table.item_for_iteration.generating_type +
		", " + a_hash_table.key_for_iteration.out + ")%N")
end
						if attached {INTERVAL[PART_COMPARABLE]} a_hash_table.item_for_iteration as v_typed then
							a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_identified(v_typed, a_hash_table.key_for_iteration.out))
						end
						a_hash_table.forth
					end

				elseif is_dt_primitive_sequence_conforming_type(generic_param_type) then -- it is a SEQUENCE of some DT primitive type
					from a_hash_table.start until a_hash_table.off loop
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj: from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
		a_dt_attr.rm_attr_name + "), " + a_hash_table.item_for_iteration.generating_type +
		", " + a_hash_table.key_for_iteration.out + ")%N")
end
						if attached {SEQUENCE[ANY]} a_hash_table.item_for_iteration as v_typed then
							a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT_LIST}.make_identified(v_typed, a_hash_table.key_for_iteration.out))
						end
						a_hash_table.forth
					end

				elseif is_dt_primitive_atomic_type(generic_param_type) then -- it is a DT primitive type then
					from a_hash_table.start until a_hash_table.off loop
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj: from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
		a_dt_attr.rm_attr_name + "), " + a_hash_table.item_for_iteration.generating_type +
		", " + a_hash_table.key_for_iteration.out + ")%N")
end
						a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT}.make_identified(a_hash_table.item_for_iteration, a_hash_table.key_for_iteration.out))
						a_hash_table.forth
					end

				else
					from a_hash_table.start until a_hash_table.off loop
						populate_dt_from_object(a_hash_table.item_for_iteration,
							create_complex_object_node(a_dt_attr, a_hash_table.key_for_iteration.out))
						a_hash_table.forth
					end
				end
debug ("DT")
	io.put_string("%T(return)%N")
end

			elseif attached {SEQUENCE[ANY]} an_obj as a_sequence then
				if is_dt_primitive_interval_type (generic_param_type) then -- it is an INTERVAL[some primitive or leaf type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
					from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj(2): from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
		a_dt_attr.rm_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
						if attached {INTERVAL[PART_COMPARABLE]} a_sequence.item as v_typed then
							a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_identified(v_typed, a_sequence.index.out))
						end
						a_sequence.forth
					end

				elseif is_dt_primitive_sequence_conforming_type(generic_param_type) then -- it is a SEQUENCE of some DT primitive type
					from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj(2): from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
		a_dt_attr.rm_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
						if attached {SEQUENCE[ANY]} a_sequence.item as v_typed then
							a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT_LIST}.make_identified(v_typed, a_sequence.index.out))
						end
						a_sequence.forth
					end

				elseif is_dt_primitive_atomic_type(generic_param_type) then -- it is a DT primitive type then
					from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string("DT_OBJECT_CONVERTER.create_dt_from_generic_obj(2): from_obj_proc.call([DT_ATTRIBUTE_NODE(" +
		a_dt_attr.rm_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
						a_dt_attr.put_child(create {DT_PRIMITIVE_OBJECT}.make_identified(a_sequence.item, a_sequence.index.out))
						a_sequence.forth
					end

				else
					from a_sequence.start until a_sequence.off loop
						populate_dt_from_object(a_sequence.item, create_complex_object_node(a_dt_attr, a_sequence.index.out))
						a_sequence.forth
					end
				end
debug ("DT")
	io.put_string("%T(return)%N")
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
