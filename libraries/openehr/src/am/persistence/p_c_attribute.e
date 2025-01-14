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
		local
			p_c_objs: ARRAYED_LIST [P_C_OBJECT]
		do
			rm_attribute_name := a_ca.rm_attribute_name
			differential_path := a_ca.differential_path
			is_multiple := a_ca.is_multiple
			if attached a_ca.existence as att_ex then
				existence := att_ex.as_string
			end
			cardinality := a_ca.cardinality
		end

feature -- Access

	rm_attribute_name: STRING

	differential_path: detachable STRING

	children: detachable ARRAYED_LIST [P_C_OBJECT]

	existence: detachable STRING

	cardinality: detachable CARDINALITY

feature -- Modification

	add_child (a_p_c_obj: P_C_OBJECT)
		local
			pcobjs: ARRAYED_LIST [P_C_OBJECT]
		do
			if attached children as att_children then
				pcobjs := att_children
			else
				create pcobjs.make (0)
				children := pcobjs
			end
			pcobjs.extend (a_p_c_obj)
		end

feature -- Status Report

	is_multiple: BOOLEAN

feature -- Factory

	create_c_attribute: C_ATTRIBUTE
			-- recreate original C_ATTRIBUTE
		local
			ex: detachable MULTIPLICITY_INTERVAL
		do
			if attached existence as att_ex then
				create ex.make_from_string (att_ex)
			end
			if is_multiple then
				create Result.make_multiple (rm_attribute_name, ex, cardinality)
			else
				create Result.make_single (rm_attribute_name, ex)
			end

			if attached differential_path as dp then
				Result.set_differential_path (dp)
			end

			if attached children as att_children then
				across att_children as p_c_objs_csr loop
					if attached {P_C_ARCHETYPE_ROOT} p_c_objs_csr.item as p_c_ar then
						Result.put_child (p_c_ar.create_c_archetype_root)
					elseif attached {P_C_COMPLEX_OBJECT} p_c_objs_csr.item as p_c_co then
						Result.put_child (p_c_co.create_c_complex_object)
					elseif attached {P_ARCHETYPE_SLOT} p_c_objs_csr.item as p_a_s then
						Result.put_child (p_a_s.create_archetype_slot)
					elseif attached {P_C_COMPLEX_OBJECT_PROXY} p_c_objs_csr.item as p_a_ir then
						Result.put_child (p_a_ir.create_c_complex_object_proxy)
					elseif attached {P_C_PRIMITIVE_OBJECT} p_c_objs_csr.item as p_c_po then
						Result.put_child (p_c_po.create_c_primitive_object)
					end
				end
			end
		end

end


