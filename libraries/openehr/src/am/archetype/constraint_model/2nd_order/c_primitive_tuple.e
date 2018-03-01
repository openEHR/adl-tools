note
	component:   "openEHR ADL Tools"
	description: "[
				 Second order constraint representing a tuple of C_PRIMITIVE_OBJECT constraints,
				 under a C_ATTRIBUTE_TUPLE.
				 ]"
	keywords:    "tuple, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_PRIMITIVE_TUPLE

inherit
	C_2ND_ORDER
		redefine
			member_type
		end

create
	make

feature -- Access

	member_type: detachable C_PRIMITIVE_OBJECT

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			if count = other.count then
				Result := across members as cpo_csr all
					cpo_csr.item.same_type (other.members.i_th (cpo_csr.cursor_index)) and then
						cpo_csr.item.c_conforms_to (other.members.i_th (cpo_csr.cursor_index), rm_type_conformance_checker)
				end
			end
		end

	c_congruent_to (other: like Current): BOOLEAN
			-- True if Current and `other' are semantically the same
			-- Used for diffing flat archetypes, e.g. after editing
		do
			if count = other.count then
				Result := across members as cpo_csr all
					cpo_csr.item.same_type (other.members.i_th (cpo_csr.cursor_index)) and then
						cpo_csr.item.c_congruent_to (other.members.i_th (cpo_csr.cursor_index))
				end
			end
		end

end


