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
			end_c_complex_object, end_archetype_slot, end_c_archetype_root, end_c_complex_object_proxy, end_c_attribute
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
				add_non_constrained_attrs (a_node)

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
					terminologies.extend (opt.component_terminology (a_node.archetype_ref))
				end

				create prototype_value.make_anonymous
				prototype_value.set_im_type_name (a_node.rm_type_name)
				add_locatable_attrs (prototype_value, a_node.archetype_ref)

				dt_object_nodes.extend (prototype_value)
				dt_attribute_nodes.item.put_child (prototype_value)
			end
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			if not c_attribute_completed.item then
				add_non_constrained_attrs (a_node)

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
			if (c_object_ignore.is_empty or else not c_object_ignore.item) and not c_attribute_excluded (a_node) then
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
			if (c_object_ignore.is_empty or else not c_object_ignore.item) and not c_attribute_excluded (a_node) then
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
			-- enter a C_LEAF_OBJECT
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
				add_dt_attribute (a_dt_object, {OPENEHR_DEFINITIONS}.Locatable_node_attribute, a_node_id)

				if terminology.has_id_code (a_node_id) then --  then
					-- add an attribute for LOCATABLE.name
					add_dt_attribute (a_dt_object, {OPENEHR_DEFINITIONS}.Locatable_name_attribute, terminology.term_definition (language, a_node_id).text)
				end
			end
		end

	add_dt_attribute (a_dt_object: DT_COMPLEX_OBJECT; attr_name: STRING; attr_val: ANY)
		local
			dt_attr: DT_ATTRIBUTE
		do
			create dt_attr.make_single (attr_name)
			dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_anonymous (attr_val))
			a_dt_object.put_attribute (dt_attr)
		end

	add_non_constrained_attrs (a_node: C_COMPLEX_OBJECT)
			-- find all the non-archetyped RM attributes, and for the mandatory ones, synthesise values
		local
			instantiated_attrs: ARRAYED_LIST[STRING]
			bmm_class: BMM_CLASS
			bmm_type_name: STRING
			val: ANY
			iso_dt: ISO8601_DATE_TIME
			iso_t: ISO8601_TIME
		do
			create instantiated_attrs.make (0)
			instantiated_attrs.compare_objects

			across dt_object_nodes.item.attributes as dt_attr_csr loop
				instantiated_attrs.extend (dt_attr_csr.item.im_attr_name)
			end

			bmm_class := ref_model.class_definition (a_node.rm_type_name)
			across bmm_class.flat_properties as bmm_prop_csr loop
				if not instantiated_attrs.has (bmm_prop_csr.item.name) and bmm_prop_csr.item.bmm_type.is_primitive then
					bmm_type_name := bmm_prop_csr.item.bmm_type.type_name
					if bmm_type_name.is_case_insensitive_equal ("String") then
						val := "some string"

					elseif bmm_type_name.is_case_insensitive_equal ("Terminology_code") then
						val := create {TERMINOLOGY_CODE}.make_from_string ("graphite::unknown-code")

					elseif bmm_type_name.is_case_insensitive_equal ("Date") then
						val := create {ISO8601_DATE}.make_date (create {DATE}.make_now)
					elseif bmm_type_name.is_case_insensitive_equal ("Date_time") then
						create iso_dt
						iso_dt.clear_fractional_second
						val := iso_dt
					elseif bmm_type_name.is_case_insensitive_equal ("Time") then
						create iso_t
						iso_t.clear_fractional_second
						val := iso_t

					elseif bmm_type_name.is_case_insensitive_equal ("Duration") then
						val := create {ISO8601_DURATION}.make_from_string ("PT2H")

					elseif bmm_type_name.is_case_insensitive_equal ("Integer") then
						val := 4
					elseif bmm_type_name.is_case_insensitive_equal ("Real") then
						val := 8.0
					else
						val := "(other primitive value)"
					end
					add_dt_attribute (dt_object_nodes.item, bmm_prop_csr.item.name, val)
				end
			end
		end

	c_attribute_excluded (a_node: C_ATTRIBUTE): BOOLEAN
		do
			Result := not a_node.has_children or attached a_node.existence as ex and then ex.is_prohibited
		end

end


