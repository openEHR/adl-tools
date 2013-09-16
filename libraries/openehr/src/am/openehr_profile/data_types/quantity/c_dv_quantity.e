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
			Result := attached list as l and then attached l.first.magnitude
		end

	has_precision_constraint: BOOLEAN
		do
			Result := attached list as l and then attached l.first.precision
		end

feature -- Conversion

	standard_equivalent: C_COMPLEX_OBJECT
			-- if there is no `list' or a list with only one member, create a normal structure for the type DV_QUANTITY
			-- if there are two or more `list' items, create a 2nd order structure
		local
			ca_property, ca_units, ca_magnitude, ca_precision: C_ATTRIBUTE
			cpo_units: C_STRING
			cpo_magnitude: C_REAL
			cpo_precision: C_INTEGER
			ccp_property: C_TERMINOLOGY_CODE
			ca_tuple: detachable C_ATTRIBUTE_TUPLE
		do
			-- DV_QUANTITY root
			create Result.make_anonymous (rm_type_name)

			-- CA: property
			if attached property as prop then
				create ca_property.make_single ("property", Void)
				create ccp_property.make_from_terminology_code (prop)
				ca_property.put_child (ccp_property)
				Result.put_attribute (ca_property)
			end

			if attached list as att_list then

				-- CA_TUPLE: units, magnitude, precision
				if att_list.count > 1 then
					create ca_tuple.make
					Result.put_attribute_tuple (ca_tuple)
				end

				-- CA: magnitude
				if has_magnitude_constraint then
					create ca_magnitude.make_single ("magnitude", Void)
					Result.put_attribute (ca_magnitude)
					across att_list as c_qty_items_csr loop
						if attached c_qty_items_csr.item.magnitude as mag then
							if c_qty_items_csr.is_first then
								create cpo_magnitude.make_interval (mag)
								ca_magnitude.put_child (cpo_magnitude)
							elseif attached {C_REAL} ca_magnitude.children.first as c_real then
								c_real.add_interval (mag)
							end
						end
					end
					if attached ca_tuple as ca_t then
						ca_t.put_member (ca_magnitude)
					end
				end

				-- CA: units
				create ca_units.make_single ("units", Void)
				Result.put_attribute (ca_units)
				across att_list as c_qty_items_csr loop
					if c_qty_items_csr.is_first then
						create cpo_units.make_simple (c_qty_items_csr.item.units)
						ca_units.put_child (cpo_units)
					elseif attached {C_STRING} ca_units.children.first as c_string then
						c_string.add_string (c_qty_items_csr.item.units)
					end
				end
				if attached ca_tuple as ca_t then
					ca_t.put_member (ca_units)
				end

				-- CA: precision
				if has_precision_constraint then
					create ca_precision.make_single ("precision", Void)
					Result.put_attribute (ca_precision)
					across att_list as c_qty_items_csr loop
						if attached c_qty_items_csr.item.precision as prec then
							if c_qty_items_csr.is_first then
								create cpo_precision.make_interval (prec)
								ca_precision.put_child (cpo_precision)
							elseif attached {C_INTEGER} ca_precision.children.first as c_integer then
								c_integer.add_interval (prec)
							end
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

