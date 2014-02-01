note
	component:   "openEHR ADL Tools"
	description: "Object node type representing constraint on QUANTITY"
	keywords:    "quantity, archetype, clinical type, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DV_QUANTITY

inherit
	DT_CONVERTIBLE

	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{ANY} has_property
		undefine
			default_create
		end

create
	default_create

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		do
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate
		attribute
			create Result.make_from_string (generator.substring (3, generator.count))
		end

	property: detachable TERMINOLOGY_CODE
			-- property

	list: detachable ARRAYED_LIST [C_QUANTITY_ITEM]
			-- list of items constraining magnitude/units pairs

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed
			-- i.e. no property or list
		do
			Result := list = Void and property = Void
		end

	has_magnitude_constraint: BOOLEAN
		do
			Result := attached list as cq_item_list and then
				across cq_item_list as list_csr some attached list_csr.item.magnitude end
		end

	has_precision_constraint: BOOLEAN
		do
			Result := attached list as cq_item_list and then
				across cq_item_list as list_csr some attached list_csr.item.precision end
		end

feature -- Modification

	set_property (a_property: TERMINOLOGY_CODE)
		do
			property := a_property
		end

feature -- Conversion

	standard_equivalent (a_node_id: STRING): C_COMPLEX_OBJECT
			-- if there is no `list' or a list with only one member, create a normal structure
			-- for the type DV_QUANTITY
			-- if there are two or more `list' items, create a 2nd order structure
		local
			ca_property, ca_units, ca_magnitude, ca_precision: C_ATTRIBUTE
			cpo_units: C_STRING
			cpo_magnitude: detachable C_REAL
			cpo_precision: detachable C_INTEGER
			ccp_property: C_TERMINOLOGY_CODE
			ca_tuple: detachable C_ATTRIBUTE_TUPLE
			new_mag: INTERVAL[REAL]
			new_prec: INTERVAL[INTEGER]
		do
			-- DV_QUANTITY root
			create Result.make (rm_type_name, a_node_id)

			-- CA: property
			if attached property as prop then
				create ca_property.make_single ("property", Void)
				create ccp_property.make (prop.code_string)
				ca_property.put_child (ccp_property)
				Result.put_attribute (ca_property)
			end

			if attached list as cq_item_list then

				-- CA_TUPLE: units, magnitude, precision
				if cq_item_list.count > 1 and (has_magnitude_constraint or has_precision_constraint) then
					create ca_tuple.make
					Result.put_attribute_tuple (ca_tuple)
				end

				-- CA: magnitude
				-- it might be that not every tuple branch constraint has a magnitude constraint,
				-- so we have to deal with 'any' constraints in there as well
				if has_magnitude_constraint then
					create ca_magnitude.make_single ("magnitude", Void)
					Result.put_attribute (ca_magnitude)
					across cq_item_list as cq_items_csr loop
						if cq_items_csr.is_first then
							if attached cq_items_csr.item.magnitude as mag then
								new_mag := mag
							else
								create {PROPER_INTERVAL[REAL]} new_mag.make_upper_unbounded (0, True)
							end
							create cpo_magnitude.make_interval (new_mag)
							ca_magnitude.put_child (cpo_magnitude)
						elseif attached cpo_magnitude as c_real then
							if attached cq_items_csr.item.magnitude as mag then
								new_mag := mag
							else
								create {PROPER_INTERVAL[REAL]} new_mag.make_upper_unbounded (0, True)
							end
							c_real.add_interval (new_mag)
						end
					end
					if attached ca_tuple as ca_t then
						ca_t.put_member (ca_magnitude)
					end
				end

				-- CA: units
				create ca_units.make_single ("units", Void)
				Result.put_attribute (ca_units)
				across cq_item_list as cq_items_csr loop
					if cq_items_csr.is_first then
						create cpo_units.make_simple (cq_items_csr.item.units)
						ca_units.put_child (cpo_units)
					elseif attached {C_STRING} ca_units.children.first as c_string then
						c_string.add_string (cq_items_csr.item.units)
					end
				end
				if attached ca_tuple as ca_t then
					ca_t.put_member (ca_units)
				end

				-- CA: precision
				-- it might be that not every tuple branch constraint has a precision constraint,
				-- so we have to deal with 'any' constraints in there as well
				if has_precision_constraint then
					create ca_precision.make_single ("precision", Void)
					Result.put_attribute (ca_precision)
					across cq_item_list as cq_items_csr loop
						if cq_items_csr.is_first then
							if attached cq_items_csr.item.precision as prec then
								new_prec := prec
							else
								create {PROPER_INTERVAL[INTEGER]} new_prec.make_upper_unbounded (0, True)
							end
							create cpo_precision.make_interval (new_prec)
							ca_precision.put_child (cpo_precision)
						elseif attached cpo_precision as c_real then
							if attached cq_items_csr.item.precision as prec then
								new_prec := prec
							else
								create {PROPER_INTERVAL[INTEGER]} new_prec.make_upper_unbounded (0, True)
							end
							c_real.add_interval (new_prec)
						end
					end
					if attached ca_tuple as ca_t then
						ca_t.put_member (ca_precision)
					end
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("property")
			Result.extend ("list")
		end

invariant
	Items_valid: list /= Void implies not list.is_empty
--	Property_valid: property /= Void implies terminology(Terminology_id_openehr).has_code_for_group_id (Group_id_measurable_properties, property)
	Overall_validity: (list /= Void or property /= Void) xor any_allowed

end

