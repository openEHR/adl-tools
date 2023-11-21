note
	component:   "openEHR ADL Tools"
	description: "Generic visitor class for C_xxx class objects"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_INSTANCE_GENERATOR

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			end_c_complex_object, end_archetype_slot, end_c_archetype_root, end_c_complex_object_proxy, end_c_attribute,
			start_c_terminology_code, end_c_terminology_code
		end

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		undefine
			is_equal
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		undefine
			is_equal
		end

feature -- Initialisation

	initialise (an_archetype: ARCHETYPE; a_lang: STRING)
		do
			initialise_visitor(an_archetype)
			check attached archetype then
				archetype_id := archetype.archetype_id
			end

			language := a_lang

			dt_object_nodes.wipe_out
			dt_attribute_nodes.wipe_out
			c_attribute_completed.wipe_out
			c_object_ignore.wipe_out

			aom_profile := Void
			archetype_parent_class := {BMM_DEFINITIONS}.any_type_name
			archetype_data_value_parent_class := {BMM_DEFINITIONS}.any_type_name

			if aom_profiles_access.has_profile_for_rm_schema (ref_model.model_id) then
				aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.model_id)
				if attached aom_profile.archetype_parent_class as aop_loc then
					archetype_parent_class := aop_loc
				end
				if attached aom_profile.archetype_data_value_parent_class as aop_dt then
					archetype_data_value_parent_class := aop_dt
				end
			end
		end

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT
		local
			prototype_value: DT_COMPLEX_OBJECT
			node_id: STRING
		do
			if a_node.is_root or else not c_attribute_completed.item then
				create prototype_value.make_anonymous
				prototype_value.set_im_type_name (a_node.rm_type_name)

				if a_node.is_root then
					node_id := archetype_id.as_string
					last_result := prototype_value
				else
					node_id := a_node.node_id
					dt_attribute_nodes.item.put_child (prototype_value)
				end
				add_locatable_attrs (prototype_value, node_id)

				dt_object_nodes.extend (prototype_value)
			else
				c_object_ignore.extend (True)
			end
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit an C_COMPLEX_OBJECT
		do
			if a_node.is_root or else not c_attribute_completed.item then
				add_non_constrained_attrs (a_node, depth)

				dt_object_nodes.remove

				-- for single valued node, mark completed after one object node
				if attached a_node.parent as ca_parent and then ca_parent.is_single then
					c_attribute_completed.replace (True)
				end
			else
				c_object_ignore.remove
			end
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			prototype_value: DT_COMPLEX_OBJECT
		do
			if not c_attribute_completed.item then
				create prototype_value.make_anonymous
				prototype_value.set_im_type_name (a_node.rm_type_name)
				add_locatable_attrs (prototype_value, a_node.node_id)

				dt_object_nodes.extend (prototype_value)
				dt_attribute_nodes.item.put_child (prototype_value)
			end
		end

	end_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- exit an ARCHETYPE_SLOT
		do
			if not c_attribute_completed.item then
				dt_object_nodes.remove

				-- for single valued node, marke completed after one object node
				if attached a_node.parent as ca_parent and then ca_parent.is_single then
					c_attribute_completed.replace (True)
				end
			end
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		local
			prototype_value: DT_COMPLEX_OBJECT
		do
			if not c_attribute_completed.item then
				-- have to obtain the terminology from the main archetype directory because the archetype being serialised
				-- here might be in differential form, and have no component_ontologies aet up
				if attached {OPERATIONAL_TEMPLATE} archetype as opt and a_node.has_attributes then
					terminologies.extend (opt.component_terminology (a_node.node_id))
				end

				create prototype_value.make_anonymous
				prototype_value.set_im_type_name (a_node.rm_type_name)
				add_locatable_attrs (prototype_value, a_node.node_id)

				dt_object_nodes.extend (prototype_value)
				dt_attribute_nodes.item.put_child (prototype_value)
			end
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			if not c_attribute_completed.item then
				add_non_constrained_attrs (a_node, depth)

				dt_object_nodes.remove

				-- for single valued node, marke completed after one object node
				if attached a_node.parent as ca_parent and then ca_parent.is_single then
					c_attribute_completed.replace (True)
				end

				-- pop terminology of current OPT off stack
				if attached {OPERATIONAL_TEMPLATE} archetype as opt and a_node.has_attributes then
					terminologies.remove
				end
			end
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- enter an C_COMPLEX_OBJECT_PROXY
		local
			prototype_value: DT_COMPLEX_OBJECT
		do
			if not c_attribute_completed.item then
				create prototype_value.make_anonymous
				prototype_value.set_im_type_name (a_node.rm_type_name)
				add_locatable_attrs (prototype_value, a_node.node_id)

				dt_object_nodes.extend (prototype_value)
				dt_attribute_nodes.item.put_child (prototype_value)
			end
		end

	end_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- exit a C_COMPLEX_OBJECT_PROXY
		do
			if not c_attribute_completed.item then
				dt_object_nodes.remove

				-- for single valued node, marke completed after one object node
				if attached a_node.parent as ca_parent and then ca_parent.is_single then
					c_attribute_completed.replace (True)
				end
			end
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			prototype_value: DT_ATTRIBUTE
		do
			if (c_object_ignore.is_empty or else not c_object_ignore.item) and not c_attribute_excluded (a_node)
					and not is_ignored_c_attribute (a_node)
			then
				if a_node.is_multiple then
					create prototype_value.make_container (a_node.rm_attribute_name)
				else
					create prototype_value.make_single (a_node.rm_attribute_name)
				end
				dt_object_nodes.item.put_attribute (prototype_value)

				dt_attribute_nodes.extend (prototype_value)
				c_attribute_completed.extend (False)
			end
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			if (c_object_ignore.is_empty or else not c_object_ignore.item) and not c_attribute_excluded (a_node)
					and not is_ignored_c_attribute (a_node)
			then
				dt_attribute_nodes.remove
				c_attribute_completed.remove
			end
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
			-- enter an C_PRIMITIVE_OBJECT
		do
			if not c_attribute_completed.item then
				dt_attribute_nodes.item.put_child (create {DT_PRIMITIVE_OBJECT}.make_anonymous (a_node.prototype_value))
			end
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECTT
		do
		end

	start_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
			-- enter a C_TERMINOLOGY_CODE
		local
			dt_obj: DT_COMPLEX_OBJECT
		do
			if not c_attribute_completed.item then
				dt_obj := dt_object_converter.object_to_dt (a_node.prototype_value)
				dt_obj.set_im_type_name (case_corrected (dt_obj.im_type_name))
				dt_attribute_nodes.item.put_child (dt_obj)
			end
		end

	end_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
			-- exit a C_TERMINOLOGY_CODE
		do
		end

feature {CADL_2_ENGINE} -- Access

	last_result: DT_COMPLEX_OBJECT
		attribute
			create Result.make_anonymous
		end

feature {NONE} -- Implementation

	dt_object_nodes: ARRAYED_STACK [DT_COMPLEX_OBJECT]
		attribute
			create Result.make(0)
		end

	dt_attribute_nodes: ARRAYED_STACK [DT_ATTRIBUTE]
		attribute
			create Result.make(0)
		end

	c_attribute_completed: ARRAYED_STACK [BOOLEAN]
			-- flag for current attribute to indicate if its children have been
			-- processed. Set False when a new C_ATTRIBUTE is entered.
			-- For single-valued C_ATTRIBUTEs with multiple alternative C_OBJECT children,
			--
		attribute
			create Result.make(0)
		end

	c_object_ignore: ARRAYED_STACK [BOOLEAN]
			-- flag to ignore this object, to prevent ongoing processing
			-- during descent passed a completed C_ATTRIBUTE
		attribute
			create Result.make(0)
		end

	ref_model: BMM_MODEL
			-- set if this archetype has a valid package-class_name
		do
			Result := model_for_archetype_id (archetype_id)
		end

	aom_profile: detachable AOM_PROFILE

	language: STRING
		attribute
			create Result.make_empty
		end

	archetype_parent_class: STRING
		attribute
			create Result.make_empty
		end

	archetype_data_value_parent_class: STRING
		attribute
			create Result.make_empty
		end

	archetype_id: ARCHETYPE_HRID
		attribute
			create Result
		end

	add_locatable_attrs (a_dt_object: DT_COMPLEX_OBJECT; a_node_id: STRING)
		do
			-- if LOCATABLE then add some attributes
			if ref_model.is_descendant_of (a_dt_object.im_type_name, archetype_parent_class) then

				-- add an attribute for LOCATABLE.code
				add_primitive_dt_attribute (a_dt_object, {OPENEHR_DEFINITIONS}.Locatable_node_attribute, a_node_id)

				if terminology.has_id_code (a_node_id) then --  then
					-- add an attribute for LOCATABLE.name
					add_primitive_dt_attribute (a_dt_object, {OPENEHR_DEFINITIONS}.Locatable_name_attribute, terminology.term_definition (language, a_node_id).text)
				end
			end
		end

	add_primitive_dt_attribute (a_dt_object: DT_COMPLEX_OBJECT; attr_name: STRING; attr_val: ANY)
		local
			dt_attr: DT_ATTRIBUTE
			dt_object: DT_PRIMITIVE_OBJECT
		do
			create dt_attr.make_single (attr_name)
			create dt_object.make_anonymous (attr_val)
			-- convert type name to mixed snake case
			dt_object.set_im_type_name (dt_object.im_type_name.item (1).out + dt_object.im_type_name.substring (2, dt_object.im_type_name.count).as_lower)
			dt_attr.put_child (dt_object)
			a_dt_object.put_attribute (dt_attr)
		end

	add_complex_dt_attribute (a_dt_object: DT_COMPLEX_OBJECT; attr_name: STRING; attr_val: ANY)
		local
			dt_attr: DT_ATTRIBUTE
			dt_object: DT_COMPLEX_OBJECT
		do
			create dt_attr.make_single (attr_name)
			dt_object := dt_object_converter.object_to_dt (attr_val)
			dt_attr.put_child (dt_object)
			-- convert type name to mixed snake case
			dt_object.set_im_type_name (dt_object.im_type_name.item (1).out + dt_object.im_type_name.substring (2, dt_object.im_type_name.count).as_lower)
			a_dt_object.put_attribute (dt_attr)
		end

	add_non_constrained_attrs (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- find all the non-archetyped RM attributes, and for the primitive ones, synthesise values
		local
			instantiated_attrs: ARRAYED_LIST[STRING]
			bmm_class: BMM_CLASS
			prop_type, indent, prop_name: STRING
			val: ANY
			iso_dt: ISO8601_DATE_TIME
			iso_t: ISO8601_TIME
		do
			create indent.make_filled ('%T', depth)
			create instantiated_attrs.make (0)
			instantiated_attrs.compare_objects

			across dt_object_nodes.item.attributes as dt_attr_csr loop
				instantiated_attrs.extend (dt_attr_csr.item.im_attr_name)
			end

			bmm_class := ref_model.class_definition (a_node.rm_type_name)
			across bmm_class.flat_properties as bmm_prop_csr loop
				prop_name := bmm_prop_csr.item.name
				if not instantiated_attrs.has (prop_name)
					and (not is_ignored (a_node.rm_type_name, prop_name)
					or is_required (a_node.rm_type_name, prop_name))
				then
					prop_type := bmm_prop_csr.item.bmm_type.type_name

					if prop_type.is_case_insensitive_equal ("Terminology_code") then
						val := create {TERMINOLOGY_CODE}.make_from_string ("snomed::11111111")
						add_complex_dt_attribute (dt_object_nodes.item, prop_name, val)
						
					elseif prop_type.is_case_insensitive_equal ("Terminology_term") then
						val := create {TERMINOLOGY_TERM}.make_from_string ("loinc::22222|serum sodium|")
						add_complex_dt_attribute (dt_object_nodes.item, prop_name, val)

					elseif prop_type.is_case_insensitive_equal ("Uuid") then
						create {UUID} val
						add_complex_dt_attribute (dt_object_nodes.item, prop_name, val)

					elseif prop_type.is_case_insensitive_equal ("Iso_oid") then
						create {ISO_OID} val
						add_complex_dt_attribute (dt_object_nodes.item, prop_name, val)

					elseif prop_type.is_case_insensitive_equal ("Internet_id") then
						create {INTERNET_ID} val
						add_complex_dt_attribute (dt_object_nodes.item, prop_name, val)

					-- deal with enumerations
					elseif attached {BMM_ENUMERATION} bmm_prop_csr.item.bmm_type as bmm_enum then
						val := bmm_enum.item_values.first
						add_primitive_dt_attribute (dt_object_nodes.item, prop_name, val)

					-- deal with true primitive types
					elseif bmm_prop_csr.item.bmm_type.is_primitive then
						-- date/times
						if prop_type.is_case_insensitive_equal ("Date") or a_node.rm_type_name.is_case_insensitive_equal ("Date_value") then
							val := create {ISO8601_DATE}.make_date (create {DATE}.make_now)
						elseif prop_type.is_case_insensitive_equal ("Date_time") or a_node.rm_type_name.is_case_insensitive_equal ("Date_time_value") then
							create iso_dt
							iso_dt.clear_fractional_second
							val := iso_dt
						elseif prop_type.is_case_insensitive_equal ("Time") or a_node.rm_type_name.is_case_insensitive_equal ("Time_value")  then
							create iso_t
							iso_t.clear_fractional_second
							val := iso_t

						elseif prop_type.is_case_insensitive_equal ("Duration") or a_node.rm_type_name.is_case_insensitive_equal ("Duration_value")  then
							val := create {ISO8601_DURATION}.make_from_string ("PT2H")

						-- Strings
						elseif prop_type.is_case_insensitive_equal ("String") then
							val := "some string"

						-- numerics
						elseif prop_type.as_lower.starts_with ("integer") then
							val := 4
						elseif prop_type.is_case_insensitive_equal ("Real") or prop_type.is_case_insensitive_equal ("Double") then
							val := 8.0
						else
							val := "(other primitive value)"
						end
						add_primitive_dt_attribute (dt_object_nodes.item, prop_name, val)
					end
				end
			end
		end

	c_attribute_excluded (a_node: C_ATTRIBUTE): BOOLEAN
		do
			Result := not a_node.has_children or attached a_node.existence as ex and then ex.is_prohibited
		end

	is_ignored (rm_type, attr_name: STRING): BOOLEAN
		do
			if ignored_attributes.has (rm_type) then
				Result := ignored_attributes.item (rm_type).has(attr_name)
			end
		end

	is_ignored_c_attribute (a_node: C_ATTRIBUTE): BOOLEAN
		do
			if attached a_node.parent as c_obj then
				Result := is_ignored (c_obj.rm_type_name, a_node.rm_attribute_name)
			end
		end

	is_required (rm_type, attr_name: STRING): BOOLEAN
		do
			if required_attributes.has (rm_type) then
				Result := required_attributes.item (rm_type).has(attr_name)
			end
		end

	ignored_attributes: STRING_TABLE [ARRAYED_LIST[STRING]]
			-- list of attributes to ignore for each class
		local
			attrs_list: ARRAYED_LIST[STRING]
		once
			create Result.make(0)

			create attrs_list.make(0)
			attrs_list.compare_objects
			attrs_list.extend ("encoding")
			attrs_list.extend ("language")
			Result.put (attrs_list, "Coded_text")
			Result.put (attrs_list, "Text")
			Result.put (attrs_list, "Plain_text")

			create attrs_list.make(0)
			attrs_list.compare_objects
			attrs_list.extend ("null_flavour")
			attrs_list.extend ("uid")
			Result.put (attrs_list, "Element")

			create attrs_list.make(0)
			attrs_list.compare_objects
			attrs_list.extend ("uid")
			Result.put (attrs_list, "Cluster")
			Result.put (attrs_list, "Event_context")
			Result.put (attrs_list, "Folder")
			Result.put (attrs_list, "Section")
			Result.put (attrs_list, "Activity")
			Result.put (attrs_list, "State_transition")
			Result.put (attrs_list, "Point_event")
			Result.put (attrs_list, "Interval_event")

		end

	required_attributes: STRING_TABLE [ARRAYED_LIST[STRING]]
			-- list of attributes required in data, even if optional in archetype / RM
		local
			attrs_list: ARRAYED_LIST[STRING]
		once
			create Result.make(0)

			create attrs_list.make(0)
			attrs_list.compare_objects
			attrs_list.extend ("code")
			Result.put (attrs_list, "Element")
		end

	case_corrected (a_class_name: STRING): STRING
			-- convert class name case to correct form for BMM model
			-- TODO: build in class name style to BMM schemas
		do
			Result := a_class_name.item (1).out + a_class_name.substring (2, a_class_name.count).as_lower
		end

end


