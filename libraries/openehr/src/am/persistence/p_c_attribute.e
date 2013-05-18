note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_ATTRIBUTE

inherit
	P_ARCHETYPE_CONSTRAINT

create
	make

feature -- Initialisation

	make (a_ca: C_ATTRIBUTE)
			-- make from C_ATTRIBUTE
		do
			rm_attribute_name := a_ca.rm_attribute_name
			differential_path := a_ca.differential_path
			is_multiple := a_ca.is_multiple
			if attached a_ca.existence then
				existence := a_ca.existence.as_string
			end
			if attached a_ca.cardinality then
				cardinality := a_ca.cardinality.as_string
			end
			if a_ca.has_children then
				create children.make (0)
				from a_ca.children.start until a_ca.children.off loop
					if attached {C_ARCHETYPE_ROOT} a_ca.children.item as c_ar then
						children.extend (create {P_C_ARCHETYPE_ROOT}.make(c_ar))
					elseif attached {C_COMPLEX_OBJECT} a_ca.children.item as c_co then
						children.extend (create {P_C_COMPLEX_OBJECT}.make(c_co))
					elseif attached {ARCHETYPE_SLOT} a_ca.children.item as a_s then
						children.extend (create {P_ARCHETYPE_SLOT}.make(a_s))
					elseif attached {ARCHETYPE_INTERNAL_REF} a_ca.children.item as a_ir then
						children.extend (create {P_ARCHETYPE_INTERNAL_REF}.make(a_ir))
					elseif attached {CONSTRAINT_REF} a_ca.children.item as cr then
						children.extend (create {P_CONSTRAINT_REF}.make(cr))
					elseif attached {C_CODE_PHRASE} a_ca.children.item as c_cp then
						children.extend (create {P_C_CODE_PHRASE}.make(c_cp))
					elseif attached {C_DV_ORDINAL} a_ca.children.item as c_dvo then
						children.extend (create {P_C_DV_ORDINAL}.make(c_dvo))
					elseif attached {C_DV_QUANTITY} a_ca.children.item as c_dvq then
						children.extend (create {P_C_DV_QUANTITY}.make(c_dvq))
					elseif attached {C_PRIMITIVE_OBJECT} a_ca.children.item as c_po then
						children.extend (create {P_C_PRIMITIVE_OBJECT}.make(c_po))
					end
					a_ca.children.forth
				end
			end
		end

feature -- Access

	rm_attribute_name: STRING

	differential_path: detachable STRING

	children: detachable ARRAYED_LIST [P_C_OBJECT]

	existence: detachable STRING

	cardinality: detachable STRING

feature -- Status Report

	is_multiple: BOOLEAN

feature -- Factory

	create_c_attribute: C_ATTRIBUTE
			-- recreate original C_ATTRIBUTE
		local
			ex: detachable MULTIPLICITY_INTERVAL
			card: detachable CARDINALITY
		do
			if attached existence as e then
				create ex.make_from_string (e)
			end
			if is_multiple then
				if attached cardinality as c then
					create card.make_from_string (c)
				end
				create Result.make_multiple (rm_attribute_name, ex, card)
			else
				create Result.make_single (rm_attribute_name, ex)
			end

			if attached differential_path as dp then
				Result.set_differential_path (dp)
			end

			if attached children then
				across children as children_csr loop
					if attached {P_C_ARCHETYPE_ROOT} children_csr.item as p_c_ar then
						Result.put_child (p_c_ar.create_c_archetype_root)
					elseif attached {P_C_COMPLEX_OBJECT} children_csr.item as p_c_co then
						Result.put_child (p_c_co.create_c_complex_object)
					elseif attached {P_ARCHETYPE_SLOT} children_csr.item as p_a_s then
						Result.put_child (p_a_s.create_archetype_slot)
					elseif attached {P_ARCHETYPE_INTERNAL_REF} children_csr.item as p_a_ir then
						Result.put_child (p_a_ir.create_archetype_internal_ref)
					elseif attached {P_CONSTRAINT_REF} children_csr.item as p_cr then
						Result.put_child (p_cr.create_constraint_ref)
					elseif attached {P_C_CODE_PHRASE} children_csr.item as p_c_cp then
						Result.put_child (p_c_cp.create_c_code_phrase)
					elseif attached {P_C_DV_ORDINAL} children_csr.item as p_c_dvo then
						Result.put_child (p_c_dvo.create_c_dv_ordinal)
					elseif attached {P_C_DV_QUANTITY} children_csr.item as p_c_dvq then
						Result.put_child (p_c_dvq.create_c_dv_quantity)
					elseif attached {P_C_PRIMITIVE_OBJECT} children_csr.item as p_c_po then
						Result.put_child (p_c_po.create_c_primitive_object)
					end
				end
			end
		end

end


