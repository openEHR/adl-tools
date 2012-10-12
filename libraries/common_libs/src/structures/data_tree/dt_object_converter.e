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

feature -- Definitions

	No_type: INTEGER = -10
			-- a safe invalid type number to use to represent 'no static type specified' for routine
			-- `populate_dt_from_object'

feature -- Access

	errors: ERROR_ACCUMULATOR
		once
			create Result.make
		end

feature -- Conversion

	object_to_dt (an_obj: attached ANY): attached DT_COMPLEX_OBJECT_NODE
			-- generate a DT_OBJECT from an Eiffel object; called only on top-level object
		do
			create Result.make_anonymous
			errors.wipe_out
			populate_dt_from_object (an_obj, Result, No_type)
		end

	populate_dt_from_root_object (an_obj: attached ANY; a_dt_co: attached DT_COMPLEX_OBJECT_NODE)
		do
			errors.wipe_out
			populate_dt_from_object (an_obj, a_dt_co, No_type)
		end

	dt_to_object_from_string (a_dt_co: attached DT_COMPLEX_OBJECT_NODE; a_type_name: attached STRING; make_args: ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := dt_to_object (a_dt_co, dt_dynamic_type_from_string (a_type_name), make_args)
		end

	dt_to_object (a_dt_co: attached DT_COMPLEX_OBJECT_NODE; a_type_id: INTEGER; make_args: ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; should be called externally only on top-level DT structure;
			-- recursive calling from populate_object_from_dt calling
			-- set_container_object_data_from_dt also occurs.
			-- The main job of this routine is to set up cross references.
		local
			src_obj, targ_obj: ANY
			src_obj_fld: INTEGER
			path_list: SEQUENCE [OG_PATH]
		do
			errors.wipe_out
			if not errors.has_errors then
				-- wipe the reference list out if on a top-level object
				if a_dt_co.is_root then
					create object_ref_list.make (0)
				end

				-- make the object
				Result := populate_object_from_dt (a_dt_co, a_type_id, make_args)

				-- if there were object references in the DT structure, process them now
				if a_dt_co.is_root and not object_ref_list.is_empty then
					from object_ref_list.start until object_ref_list.off loop
						src_obj := object_ref_list.item.source_object_ref
						src_obj_fld := object_ref_list.item.source_object_field_index
						if attached {DT_OBJECT_REFERENCE} object_ref_list.item as a_dt_obj_ref then
							if a_dt_co.has_path (a_dt_obj_ref.value.as_string) then
								targ_obj := a_dt_co.node_at_path (a_dt_obj_ref.value.as_string).as_object_ref
								if a_dt_obj_ref.is_source_object_container then
									if attached {HASH_TABLE [ANY, HASHABLE]} src_obj as a_hash_table then
										a_hash_table.extend (targ_obj, a_dt_obj_ref.hash_key)
									elseif attached {SEQUENCE [ANY]} src_obj as a_sequence then
										a_sequence.extend (targ_obj)
									end
								else
									set_reference_field (src_obj_fld, src_obj, targ_obj)
								end
							else
								errors.add_error ("non_existent_path", <<a_dt_obj_ref.value.as_string>>, "dt_to_object")
							end
						elseif attached {DT_OBJECT_REFERENCE_LIST} object_ref_list.item as a_dt_obj_ref_list then
							-- make the generic container, it will be a SEQUENCE (some kind of list)
							if attached {SEQUENCE[ANY]} new_instance_of (field_static_type_of_type (src_obj_fld, dynamic_type (src_obj))) as a_sequence2 then
								-- do a reasonable make call on it
								if attached {ARRAYED_LIST[ANY]} a_sequence2 as an_arr_list then
									an_arr_list.make (0)
								end

								path_list := a_dt_obj_ref_list.value
								from path_list.start until path_list.off loop
									if a_dt_co.has_path (path_list.item.as_string) then
										a_sequence2.extend (a_dt_co.node_at_path (path_list.item.as_string).as_object_ref)
									else
										errors.add_error ("non_existent_path_in_list", <<path_list.item.as_string>>, "dt_to_object")
									end
									path_list.forth
								end

								-- now we detect if the whole thing is going inside another container, or a standard object
								if a_dt_obj_ref_list.is_source_object_container then
									if attached {HASH_TABLE [ANY, HASHABLE]} src_obj as a_hash_table2 then
										a_hash_table2.extend (a_sequence2, a_dt_obj_ref_list.hash_key)
									elseif attached {SEQUENCE [ANY]} src_obj as a_sequence3 then
										a_sequence3.extend (a_sequence2)
									end
								else
									set_reference_field (src_obj_fld, src_obj, a_sequence2)
								end
							end
						end

						object_ref_list.forth
					end
				end
			else
				Result := Void
			end
		rescue
			if assertion_violation then
				-- check that the original was set_reference_field () - this indicates a type mismatch
				errors.add_error ("dt_to_object_type_mismatch", <<original_recipient_name>>, "dt_to_object")
			else
				errors.add_error ("dt_unknown", <<exception.out, exception_trace>>, "dt_to_object")
			end
			retry
		end

feature {NONE} -- Implementation

	populate_dt_from_object (an_obj: attached ANY; a_dt_co: attached DT_COMPLEX_OBJECT_NODE; a_static_type: INTEGER)
			-- make a data tree from an object; this routine is recursive. Compare `a_static_type' to `an_obj' dynamic
			-- type; if different, set the `type_visible' flag on `a_dt_co'. During serialisation, the flag is used
			-- to decide to output the type information (unless full type marking is on). If `a_static_type' is No_type
			-- then assume that it is the same as dynamic_type(an_obj).
			-- TODO: this routine will not work properly for any structure that is not a proper tree; any cycles will cause
		local
			a_dt_attr: DT_ATTRIBUTE_NODE
			eif_fld_static_type, eif_fld_dynamic_type, i: INTEGER
			eif_fld_name: STRING
			fld_lst: ARRAYED_LIST[STRING]
		do
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: populating from a " +
		an_obj.generating_type)
	if a_static_type = No_type then
		io.put_string ("; static type not specified (ROOT OBJECT) ")
	else
		io.put_string ("; static type = " + type_name_of_type (a_static_type) + " (" + a_static_type.out + ")")
	end
end

			-- complex objects, including of container types, get their type names written in to the DT node here
			a_dt_co.set_type_name (an_obj.generating_type)

			-- if the static type is known, and different from the dynamic type of the object, set the visible flag
			if a_static_type /= No_type and a_static_type /= dynamic_type (an_obj) then
debug ("DT")
	io.put_string ("... setting TYPE VISIBLE flag")
end
				a_dt_co.set_type_visible
			end
debug ("DT")
	io.put_string ("%N")
end

			-- the first two cases here enable nested containers to be dealt with...
			-- object is a HASH_TABLE of non DT-primitive type, deal with by creating a DT_ATTRIBUTE representing the
			-- container, and DT_OBJECTs underneath
			if attached {HASH_TABLE [ANY, HASHABLE]} an_obj as eif_hash_obj then
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: an_obj is a HASH_TABLE%N")
end
				if not eif_hash_obj.is_empty  then
					create a_dt_attr.make_nested_container
					a_dt_attr.set_type_name (an_obj.generating_type)
					if a_static_type /= 0 and a_static_type /= dynamic_type (an_obj) then
						a_dt_attr.set_type_visible
					end
					populate_dt_attr_from_eif_hash (a_dt_attr, eif_hash_obj, a_static_type)
					a_dt_co.put_attribute (a_dt_attr)
				end

			-- object is a SEQUENCE of non DT-primitive type, deal with by creating a DT_ATTRIBUTE representing the
			-- container, and DT_OBJECTs underneath
			elseif attached {SEQUENCE[ANY]} an_obj as eif_seq_obj then
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: an_obj is a SEQUENCE%N")
end
				if not eif_seq_obj.is_empty then
					create a_dt_attr.make_nested_container
					a_dt_attr.set_type_name (an_obj.generating_type)
					if a_static_type /= 0 and a_static_type /= dynamic_type (an_obj) then
						a_dt_attr.set_type_visible
					end
					populate_dt_attr_from_eif_sequence (a_dt_attr, eif_seq_obj, a_static_type)
					a_dt_co.put_attribute (a_dt_attr)
				end

			else -- it's not a container
				if attached {DT_CONVERTIBLE} an_obj as dt_conv then
					fld_lst := dt_conv.persistent_attributes
				end
				from i := 1 until i > field_count (an_obj) loop
					eif_fld_name := field_name (i, an_obj)
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: field_name = " + eif_fld_name + " ")
	if is_field_transient (i, an_obj) then
		io.put_string (" [EIFFEL TRANSIENT FIELD] ")
	end
end
					-- TODO: get rid of the fld_lst at some point
					if attached field (i, an_obj) as eif_fld_val and not is_field_transient (i, an_obj) and (not attached fld_lst or else fld_lst.has (eif_fld_name)) then
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: field_name = " + eif_fld_name + "%N")
end
						eif_fld_dynamic_type := dynamic_type (eif_fld_val)
						eif_fld_static_type := field_static_type_of_type (i, dynamic_type (an_obj))

						-- now set the value inside the DT_ATTRIBUTE by creating the correct type of DT_PRIMITIVE subtype
						if is_dt_primitive_interval_type (eif_fld_dynamic_type) then -- it is an INTERVAL[some DT primitive atomic type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
							if attached {INTERVAL[PART_COMPARABLE]} eif_fld_val as eif_prim_ivl then
								create a_dt_attr.make_single (eif_fld_name)
								a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_anonymous (eif_prim_ivl))
								a_dt_co.put_attribute (a_dt_attr)
							end

						elseif is_dt_primitive_sequence_conforming_type (eif_fld_dynamic_type) then -- it is a SEQUENCE of some DT primitive type
							if attached {SEQUENCE[ANY]} eif_fld_val as eif_prim_seq and then not eif_prim_seq.is_empty then -- only include it if non-empty
								create a_dt_attr.make_single (eif_fld_name)
								a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_anonymous (eif_prim_seq))
								a_dt_co.put_attribute (a_dt_attr)
							end

						elseif is_dt_primitive_atomic_type (eif_fld_dynamic_type) then -- it is a DT primitive type then
							create a_dt_attr.make_single (eif_fld_name)
							a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_anonymous (eif_fld_val))
							a_dt_co.put_attribute (a_dt_attr)

						else -- its a complex object, or else a SEQUENCE or HASH_TABLE of a complex object
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: (complex or container type)%N")
end
							if attached {HASH_TABLE [ANY, HASHABLE]} eif_fld_val as eif_hash_fld_val then
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: (HASH_TABLE type)%N")
end
								if not eif_hash_fld_val.is_empty  then
									create a_dt_attr.make_container (eif_fld_name)
									a_dt_attr.set_type_name (eif_fld_val.generating_type)
									if eif_fld_static_type /= eif_fld_dynamic_type then
										a_dt_attr.set_type_visible
									end
									populate_dt_attr_from_eif_hash (a_dt_attr, eif_hash_fld_val, eif_fld_static_type)
									if not a_dt_attr.is_empty then
										a_dt_co.put_attribute (a_dt_attr)
									end
								end

							elseif attached {SEQUENCE[ANY]} eif_fld_val as eif_seq_fld_val then
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: (SEQUENCE type)%N")
end
								if not eif_seq_fld_val.is_empty then
									create a_dt_attr.make_container (eif_fld_name)
									a_dt_attr.set_type_name (eif_fld_val.generating_type)
									if eif_fld_static_type /= eif_fld_dynamic_type then
										a_dt_attr.set_type_visible
									end
									populate_dt_attr_from_eif_sequence (a_dt_attr, eif_seq_fld_val, eif_fld_static_type)
									if not a_dt_attr.is_empty then
										a_dt_co.put_attribute (a_dt_attr)
									end
								end
							else
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_dt_from_object: (normal complex type)%N")
end
								-- it's a normal complex object
								create a_dt_attr.make_single (eif_fld_name)
								populate_dt_from_object (eif_fld_val, create_complex_object_node (a_dt_attr, Void), eif_fld_static_type)
								a_dt_co.put_attribute (a_dt_attr)
							end
						end
					else
debug ("DT")
	io.put_string ("(NOT persistent or persistent but NOT attached) &&&&&&&&&&& %N")
end
					end
					i := i + 1
				end
			end
		end

	populate_object_from_dt (a_dt_co: attached DT_COMPLEX_OBJECT_NODE; a_type_id: INTEGER; make_args: ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; recursive. Be careful of the 3 'kinds' of type id in Eiffel:
			-- an 'abstract type' is defined in INTERNAL; all ref types have one abstract type
			-- a 'static type' is the statically declared type id of a field in an object
			-- a 'dynamic type' is the actual type of an object at runtime;
			-- static and dynamic type numbers come from the same series;
			-- abstract type numbers are completely separate
--		require
--			object_from_dt_types_conform (a_dt_co, a_type_id)
		local
			a_dt_attr: DT_ATTRIBUTE_NODE
			a_dt_obj_leaf: DT_OBJECT_LEAF
			fld_name: STRING
			eif_abstract_fld_type_id, fld_type_id, dyn_dt_val_type_id, i: INTEGER
			a_gen_field: ANY
		do
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.populate_object_from_dt: ENTER%N")
end
			if is_special_any_type (a_type_id) then
				-- FIXME: how to determine the length of the SPECIAL?
debug ("DT")
	io.put_string ("%Tabout to call new_special_any_instance (" +
		type_name_of_type (a_type_id) + ")%N")
end
				Result := new_special_any_instance (a_type_id, 1)
			else
debug ("DT")
	io.put_string ("%Tabout to call new_instance_of (" +
		type_name_of_type (a_type_id) + ")%N")
end
				Result := new_instance_of (a_type_id)

				-- FIXME: the following is a hacker's attempt to
				-- reliably call a reasonable make function? Should call at least 'default_create'
				-- Eiffel does not allow this at the moment.
				if attached {DT_CONVERTIBLE} Result as a_dt_conv then
					a_dt_conv.make_dt (make_args)
				end
			end

			if not errors.has_errors then
				if generic_count_of_type (a_type_id) > 0 then
					-- we are on a container object, and the correspoding DT object must have a single attribute
					-- which is_generic and is_multiple we don't go through its fields, instead we just go to the
					-- next object level down in the DT tree
					if not a_dt_co.is_empty then
						a_dt_attr := a_dt_co.first
						if a_dt_attr.is_nested then
							populate_eif_container_from_dt (Result, a_dt_attr)
						else
							-- should never get here: it means that the DT data parsed as a
							-- nested generic, but that the corresponding object types are not
							errors.add_error ("dt_nested_type_mismatch", <<Result.generating_type, a_dt_attr.im_attr_name>>, "populate_object_from_dt")
						end
					else -- even if it is empty, we still have to create the generic object properly
						-- note that the invariants of the containing business object might easily not be satisfied
						if attached {HASH_TABLE [ANY, HASHABLE]} Result as a_hash_table then
							a_hash_table.make (0)
						elseif attached {ARRAYED_LIST[ANY]} Result as an_arrayed_list then
							an_arrayed_list.make (0)
						end
					end
				else
					-- for each field in the Eiffel object
					from i := 1 until i > field_count (Result) loop
						fld_name := field_name (i, Result)

						if a_dt_co.has_attribute (fld_name) then
							a_dt_attr := a_dt_co.attribute_node (fld_name)
							fld_type_id := field_static_type_of_type (i, a_type_id)

debug ("DT")
	io.put_string ("%TEiffel field " + fld_name + " (static type = " + fld_type_id.out + "; " + type_name_of_type (fld_type_id) + ")%N")
end

							-- Test if DT object is a multiple-valued attribute of a complex type (i.e. not a list or hash of primitive types; see below for that)
							if a_dt_attr.is_container_type and not a_dt_attr.is_empty then
								if is_eiffel_container_type (fld_type_id) then -- so is Eiffel object field; create container object
									-- create a new container if there was not already one created by the make_dt call
									if not attached field (i, Result) then
debug ("DT")
	io.put_string ("%T%TDT type is multiple, and Eiffel field type is container; about to call (2) new_instance_of (" + type_name_of_type (fld_type_id) + ")%N")
end
										a_gen_field := new_instance_of (fld_type_id)
										set_reference_field (i, Result, a_gen_field)
debug ("DT")
	io.put_string ("%T%T(return)%N")
end
									else
										a_gen_field := field (i, Result)
									end

									-- FIXME: can only deal with one generic parameter for the moment
									populate_eif_container_from_dt (a_gen_field, a_dt_attr)

								else -- type in parsed DT is container, but not in Eiffel class		
									errors.add_error ("container_type_mismatch",
										<<type_name_of_type (fld_type_id), type_name_of_type (a_type_id)>>, "populate_object_from_dt")
								end

							-- according to DT tree, it is a single-valued attribute (note in DT, this can be a HASH or ARRAYED_LIST of a supported
							-- primitive types, because these are atomic in dadl)
							else
								if attached {DT_OBJECT_LEAF} a_dt_attr.first_child as dt_leaf then
									a_dt_obj_leaf := dt_leaf

									-- In the DT tree, it is a REF; look up object that was created at target path of this reference in xref table
									if attached {DT_REFERENCE} a_dt_obj_leaf as a_dt_ref then
debug ("DT")
	io.put_string ("%TDT_REFERENCE " + a_dt_ref.as_string + "%N")
end
										a_dt_ref.set_source_object_details (Result, i)
										object_ref_list.extend (a_dt_ref)

									-- it is a proper value field of some kind
									else
										eif_abstract_fld_type_id := field_type_of_type (i, a_type_id)

										-- Eiffel type of field must be an Eiffel primitive type; DT type should correspond
										-- This only deals with those types that Eiffel considers 'value' types, not the extended
										-- list that DT/dadl consider as 'primitive' types, see below for that
										if eif_abstract_fld_type_id /= reference_type then
debug ("DT")
	io.put_string ("%T%TEiffel primitive field " + fld_name + " (abstract type = " + eif_abstract_fld_type_id.out + ")%N")
end
											inspect eif_abstract_fld_type_id
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
												if is_eiffel_container_type (fld_type_id) then -- Eiffel field type is compatible
													set_primitive_sequence_field (i, Result, fld_type_id, a_dt_obj_leaf.value)
												else -- type in parsed DT is container, but not in Eiffel class		
													errors.add_error ("container_type_mismatch",
														<<type_name_of_type (fld_type_id), type_name_of_type (dyn_dt_val_type_id)>>, "populate_object_from_dt")
												end

											-- it is an INTERVAL[primitive type]
											elseif attached {DT_PRIMITIVE_OBJECT_INTERVAL} a_dt_obj_leaf then
												if is_eiffel_interval_type (fld_type_id) then -- Eiffel field type is compatible
													set_primitive_interval_field (i, Result, fld_type_id, a_dt_obj_leaf.value)
												else -- type in parsed DT is INTERVAL, but not in Eiffel class		
													errors.add_error ("interval_type_mismatch",
														<<type_name_of_type (fld_type_id), type_name_of_type (dyn_dt_val_type_id)>>, "populate_object_from_dt")
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

													if is_eiffel_container_type (fld_type_id) then
														set_primitive_sequence_field (i, Result, fld_type_id, a_dt_obj_leaf.value)
													elseif attached type_converted (a_dt_obj_leaf.value) as tc_val then
														set_reference_field (i, Result, tc_val)
													else
														errors.add_error ("atomic_type_mismatch",
															<<type_name_of_type (fld_type_id), type_name_of_type (dyn_dt_val_type_id)>>, "populate_object_from_dt")
													end
												end
											end
										end
									end

								-- must be a reference type field of type DT_COMPLEX_OBJECT
								elseif attached {DT_COMPLEX_OBJECT_NODE} a_dt_attr.first_child as a_dt_co_fld then
									-- this is where the recursive call is
									-- first, check if the static type is overridden by a type specified in the DT tree
									if a_dt_attr.first_child.type_visible then
										fld_type_id := dt_dynamic_type_from_string (a_dt_attr.first_child.im_type_name)
									end
									set_reference_field (i, Result, populate_object_from_dt (a_dt_co_fld, fld_type_id, Void))
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
				errors.add_error ("dt_proc_arg_type_mismatch",
					<<type_name_of_type (a_type_id), fld_name, type_name_of_type (fld_type_id), type_name (a_dt_obj_leaf.value)>>, "populate_object_from_dt")
			else
				errors.add_error ("dt_unknown", <<exception.out, exception_trace>>, "populate_object_from_dt")
			end
			retry
		end

feature {NONE} -- Conversion to object

	set_primitive_interval_field (i: INTEGER; object: attached ANY; fld_type:INTEGER; value: ANY)
			-- set a field of a specific Eiffel type like INTERVAL[INTEGER_8] from the parsed form, which is always (currently)
			-- INTERVAL[INTEGER_32] (larger numbers will have to be parsed as INTERVAL[INTEGER_64]; same for large reals => REAL_64).
			-- This is currently a total hack, awaiting ES to implement INTEGER_GENERAL, REAL_GENERAL etc from the ECMA spec.
		require
			index_large_enough: i >= 1
		local
			v: ANY
		do
			-- perform required type conversions for Integers and Reals
			if attached {INTERVAL[INTEGER]} value as src_ivl_int then
				v := new_instance_of (fld_type)
				if attached {INTERVAL[INTEGER_8]} v as targ_ivl_int_8 then
					targ_ivl_int_8.make (src_ivl_int.lower.as_integer_8, src_ivl_int.upper.as_integer_8, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[INTEGER_16]} v as targ_ivl_int_16 then
					targ_ivl_int_16.make (src_ivl_int.lower.as_integer_16, src_ivl_int.upper.as_integer_16, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[INTEGER_32]} v as targ_ivl_int_32 then
					targ_ivl_int_32.make (src_ivl_int.lower, src_ivl_int.upper, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[INTEGER_64]} v as targ_ivl_int_64 then
					targ_ivl_int_64.make (src_ivl_int.lower, src_ivl_int.upper, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_8]} v as targ_ivl_nat_8 then
					targ_ivl_nat_8.make (src_ivl_int.lower.as_natural_8, src_ivl_int.upper.as_natural_8, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_16]} v as targ_ivl_nat_16 then
					targ_ivl_nat_16.make (src_ivl_int.lower.as_natural_16, src_ivl_int.upper.as_natural_16, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_32]} v as targ_ivl_nat_32 then
					targ_ivl_nat_32.make (src_ivl_int.lower.as_natural_32, src_ivl_int.upper.as_natural_32, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				elseif attached {INTERVAL[NATURAL_64]} v as targ_ivl_nat_64 then
					targ_ivl_nat_64.make (src_ivl_int.lower.as_natural_64, src_ivl_int.upper.as_natural_64, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
				end

			elseif attached {INTERVAL[REAL]} value as src_ivl_real then
				v := new_instance_of (fld_type)
				if attached {INTERVAL[REAL_32]} v as targ_ivl_real_32 then
					targ_ivl_real_32.make (src_ivl_real.lower, src_ivl_real.upper, src_ivl_real.lower_unbounded, src_ivl_real.upper_unbounded, src_ivl_real.lower_included, src_ivl_real.upper_included)
				elseif attached {INTERVAL[REAL_64]} v as targ_ivl_int_64 then
					targ_ivl_int_64.make (src_ivl_real.lower, src_ivl_real.upper, src_ivl_real.lower_unbounded, src_ivl_real.upper_unbounded, src_ivl_real.lower_included, src_ivl_real.upper_included)
				end

			-- for all other types just use the value as is
			else
				v := value
			end

			set_reference_field (i, object, v)
		end

	set_primitive_sequence_field (i: INTEGER; object: attached ANY; eif_fld_type: INTEGER; dt_seq_value: ANY)
			-- set i-th field of an Eiffel object which is some kind of sequence of a DT primitive type,
			-- from a DT value which is either an ARRAYED_LIST or a single object like an INTEGER,
			-- which we want to turn into the member of a new sequence. The latter case caters for
			-- converting single values in DADL syntax to SEQUENCE objects in Eiffel, for lists with
			-- only one member.
		require
			eif_fld_type_valid: eif_fld_type > 0
			index_large_enough: i >= 1
		local
			converting_element_types: BOOLEAN
			dt_seq_content_type_id: INTEGER
		do
			-- if the DT object and the Eiffel object are of exactly the same types, then do a direct copy
			-- unless if there is already a container object there (set up due to a call to make_dt in an enclosing object)
			if not attached field (i, object) and dynamic_type (dt_seq_value) = eif_fld_type then
				set_reference_field (i, object, dt_seq_value)
			else
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.set_primitive_sequence_field: about to call new_instance_of (" +
		type_name_of_type (eif_fld_type) + ")%N")
end
				if not attached field (i, object) then
					set_reference_field (i, object, new_instance_of (eif_fld_type))

					-- if it was an arrayed_list, call its make routine to get it into a decent state
					if attached {ARRAYED_LIST[ANY]} field (i, object) as al_field then
						al_field.make (0)
					else
						-- FIXME should do something about other types
					end
				end
debug ("DT")
	io.put_string ("%T(return)%N")
end
				-- now copy the values in
				if attached {SEQUENCE[ANY]} field (i, object) as eif_seq then
					-- check if element type in DT list conforms to that in object list; if not turn on flag to convert types
					if generic_count (dt_seq_value) > 0 then
						dt_seq_content_type_id := generic_dynamic_type (dt_seq_value, 1)
					else
						dt_seq_content_type_id := dynamic_type (dt_seq_value)
					end
					if not type_conforms_to (dt_seq_content_type_id, generic_dynamic_type (eif_seq, 1))  then
						converting_element_types := True
					end
					if attached {ARRAYED_LIST[ANY]} dt_seq_value as eif_al then
						from eif_al.start until eif_al.off loop
							if converting_element_types then
								eif_seq.extend (type_converted (eif_al.item))
							else
								eif_seq.extend (eif_al.item)
							end
							eif_al.forth
						end
					else
						-- this means we have an object whose field type is a container, but
						-- where the dADL scanned as a single object - this happens with
						-- any list of one item. The dADL syntax is to use "<xx, ...>" to
						-- show it is a list, but this is often forgotten
						-- So...we do a conversion
						if converting_element_types then
							eif_seq.extend (type_converted (dt_seq_value))
						else
							eif_seq.extend (dt_seq_value)
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	object_ref_list: ARRAYED_LIST [DT_REFERENCE]
			-- list of DT_OBJECT_REFERENCE and DT_OBJECT_REFERENCE_LIST objects found in last top-level
			-- call to `dt_to_object'

	populate_eif_container_from_dt (a_gen_obj: attached ANY; a_dt_attr: attached DT_ATTRIBUTE_NODE)
			-- set generic values in a generic object, from a_dt_attr
			-- only deals with first generic parameter; generally safe for HASH_TABLE and LIST types
		require
			Dt_attr_node_multiple: a_dt_attr.is_container_type
		local
			static_eif_container_content_type_id, dynamic_object_type_id: INTEGER
			val: ANY
		do
			static_eif_container_content_type_id := generic_dynamic_type (a_gen_obj, 1)

			-- determine dynamic type of generic type
			if attached {HASH_TABLE [ANY, HASHABLE]} a_gen_obj as a_hash_table then -- it is a HASH_TABLE
				a_hash_table.make (0)
				across a_dt_attr as a_dt_attr_csr loop
					if attached {DT_REFERENCE} a_dt_attr_csr.item as a_dt_ref then
						debug ("DT")
							io.put_string ("%TDT_REFERENCE (inside HASH_TABLE DT_ATTRIBUTE)" + a_dt_ref.as_string + "%N")
						end
						a_dt_ref.set_hash_table_source_object_details (a_hash_table, a_dt_attr_csr.item.id)
						object_ref_list.extend (a_dt_ref)
					else -- the static type may be overridden by a type specified in the DT tree
						if a_dt_attr_csr.item.type_visible then
							dynamic_object_type_id := dt_dynamic_type_from_string (a_dt_attr_csr.item.im_type_name)
							if dynamic_object_type_id <= 0 then
								errors.add_error ("dt_unknown_type_in_source", <<a_dt_attr_csr.item.im_type_name>>, "populate_eif_container_from_dt")
							end
						else
							dynamic_object_type_id := static_eif_container_content_type_id
						end
						if dynamic_object_type_id > 0 then -- and then type_conforms_to (dynamic_object_type_id, static_eif_container_content_type_id) then
							val := a_dt_attr_csr.item.as_object (dynamic_object_type_id, Void)
							if type_conforms_to (dynamic_type (val), static_eif_container_content_type_id) then
								a_hash_table.extend (val, a_dt_attr_csr.item.id)
							else
								errors.add_error ("dt_container_gen_param_type_mismatch",
									<<(1).out, a_hash_table.generating_type, type_name_of_type (static_eif_container_content_type_id),
										val.generating_type>>, "populate_eif_container_from_dt")
							end
						end
					end
				end
			elseif attached {SEQUENCE[ANY]} a_gen_obj as a_sequence then  -- must be a linear SEQUENCE of some kind
				if attached {ARRAYED_LIST[ANY]} a_sequence as an_arrayed_list then
					an_arrayed_list.make (0)
				end
				across a_dt_attr as a_dt_attr_csr loop
					if attached {DT_REFERENCE} a_dt_attr_csr.item as a_dt_ref2 then
						debug ("DT")
							io.put_string ("%TDT_REFERENCE (inside SEQUENCE DT_ATTRIBUTE)" + a_dt_ref2.as_string + "%N")
						end
						a_dt_ref2.set_sequence_source_object_details (a_sequence)
						object_ref_list.extend (a_dt_ref2)
					else
						-- the static type may be overridden by a type specified in the DT tree
						if a_dt_attr_csr.item.type_visible then
							dynamic_object_type_id := dt_dynamic_type_from_string (a_dt_attr_csr.item.im_type_name)
							if dynamic_object_type_id <= 0 then
								errors.add_error ("dt_unknown_type_in_source", <<a_dt_attr_csr.item.im_type_name>>, "populate_eif_container_from_dt")
							end
						else
							dynamic_object_type_id := static_eif_container_content_type_id
						end
						if dynamic_object_type_id > 0 then
							val := a_dt_attr_csr.item.as_object (dynamic_object_type_id, Void)
							if type_conforms_to (dynamic_type (val), static_eif_container_content_type_id) then
								a_sequence.extend (val)
							else
								errors.add_error ("dt_container_gen_param_type_mismatch",
									<<(1).out, a_sequence.generating_type, type_name_of_type (static_eif_container_content_type_id),
										val.generating_type>>, "populate_eif_container_from_dt")
							end
						end
					end
				end
			else -- something else; should fail in some way here
				debug ("DT")
					io.put_string ("%Tset_container_object_data_from_dt reached forbidden 'else'%N")
				end
			end
		end

	populate_dt_attr_from_eif_hash (a_dt_attr: DT_ATTRIBUTE_NODE; a_hash_table: HASH_TABLE [ANY, HASHABLE]; a_static_type: INTEGER)
			-- populate DT_ATTRIBUTE with DT_OBJECT child nodes corresponding to members of `a_hash_table';
			-- if those members are themselves DT-primitive type (including INTERVAL or SEQUENCE), use DT_PRIMITIVE_* types;
			-- if those members are themselves normal complex objects, call `populate_dt_from_object'
		local
			dynamic_hash_item_type, static_hash_item_type: INTEGER
		do
			dynamic_hash_item_type := generic_dynamic_type (a_hash_table, 1)
			if is_dt_primitive_interval_type (dynamic_hash_item_type) then -- it is a Hash of INTERVALs[some primitive or leaf type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (Hash of INTERVAL[DT primitive type]): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type + ", " + ht_csr.key.out + ")%N")
end
					if attached {INTERVAL[PART_COMPARABLE]} ht_csr.item as eif_prim_ivl then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_identified (eif_prim_ivl, ht_csr.key.out))
					end
				end

			elseif is_dt_primitive_sequence_conforming_type (dynamic_hash_item_type) then -- it is a Hash of SEQUENCEs of some DT primitive type
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (Hash of SEQUENCE): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type + ", " + ht_csr.key.out + ")%N")
end
					if attached {SEQUENCE[ANY]} ht_csr.item as eif_prim_seq then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_identified (eif_prim_seq, ht_csr.key.out))
					end
				end

			elseif is_dt_primitive_atomic_type (dynamic_hash_item_type) then -- it is a Hash of a DT primitive type then
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (hash of DT primitive type): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type +
		", " + ht_csr.key.out + ")%N")
end
					a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_identified (ht_csr.item, ht_csr.key.out))
				end

			else -- it is a Hash of complex objects
				static_hash_item_type := generic_dynamic_type_of_type (a_static_type, 1)
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (Hash of complex objects): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type +
		", " + ht_csr.key.out + ")%N")
end
					populate_dt_from_object (ht_csr.item,
						create_complex_object_node (a_dt_attr, ht_csr.key.out), static_hash_item_type)
				end
			end
debug ("DT")
	io.put_string ("%T(return)%N")
end
		end

	populate_dt_attr_from_eif_sequence (a_dt_attr: DT_ATTRIBUTE_NODE; a_sequence: SEQUENCE[ANY]; a_static_type: INTEGER)
			-- FIXME: only deal with the 1st generic param at the moment
		local
			static_seq_item_type, dynamic_seq_item_type: INTEGER
		do
			dynamic_seq_item_type := generic_dynamic_type (a_sequence, 1)
			if is_dt_primitive_interval_type (dynamic_seq_item_type) then -- contained type is an INTERVAL[some primitive or leaf type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
				from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (SEQUENCE of INTERVAL [DT primitive]): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
					if attached {INTERVAL[PART_COMPARABLE]} a_sequence.item as v_typed then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_identified (v_typed, a_sequence.index.out))
					end
					a_sequence.forth
				end

			elseif is_dt_primitive_sequence_conforming_type (dynamic_seq_item_type) then -- contained type is a SEQUENCE of some DT primitive type
				from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (SEQUENCE of DT primitive): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
					if attached {SEQUENCE[ANY]} a_sequence.item as v_typed then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_identified (v_typed, a_sequence.index.out))
					end
					a_sequence.forth
				end

			elseif is_dt_primitive_atomic_type (dynamic_seq_item_type) then -- contained type is a DT primitive type then
				from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (SEQUENCE of DT primitive): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
					a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_identified (a_sequence.item, a_sequence.index.out))
					a_sequence.forth
				end

			else
				static_seq_item_type := generic_dynamic_type_of_type (a_static_type, 1)
				from a_sequence.start until a_sequence.off loop
debug ("DT")
	io.put_string ("DT_OBJECT_CONVERTER.create_dt_from_generic_obj (SEQUENCE of complex objects): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + a_sequence.item.generating_type + ", " + a_sequence.index.out + ")%N")
end
					populate_dt_from_object (a_sequence.item, create_complex_object_node (a_dt_attr, a_sequence.index.out), static_seq_item_type)
					a_sequence.forth
				end
			end
debug ("DT")
	io.put_string ("%T(return)%N")
end
		end

	type_converted (dt_val: ANY): ANY
			-- infer some other type that dt_val must be. For now, the mappings are 1:1, e.g.
			-- ISO8601_DATE => DATE, but in the future more field information may be needed to make
			-- the correct inference. If no type match can be made, Result is Void
		do
			if attached {ISO8601_DATE} dt_val as iso_date then
				Result := iso_date.to_date
			elseif attached {ISO8601_TIME} dt_val as iso_time then
				Result := iso_time.to_time
			elseif attached {ISO8601_DATE_TIME} dt_val as iso_date_time then
				Result := iso_date_time.to_date_time
			elseif attached {ISO8601_DURATION} dt_val as iso_duration then
				Result := iso_duration.to_date_time_duration
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
