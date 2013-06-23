note
	component:   "openEHR ADL Tools"
	description: "Represents the order of this node with respect to sibling nodes of the same (ordered) parent"
	keywords:    "specialisation, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SIBLING_ORDER

create
	make_before, make_after

feature -- Initialisation

	make_before (a_sibling_node_id: STRING)
			-- make to indicate node is before another node
		require
			Sibling_node_id_valid: not a_sibling_node_id.is_empty
		do
			sibling_node_id := a_sibling_node_id
			is_before := True
		ensure
			Sibling_node_id_set: sibling_node_id = a_sibling_node_id
			Is_before: is_before
		end

	make_after (a_sibling_node_id: STRING)
			-- make to indicate node is after another node
		require
			Sibling_node_id_valid: not a_sibling_node_id.is_empty
		do
			sibling_node_id := a_sibling_node_id
		ensure
			Sibling_node_id_set: sibling_node_id = a_sibling_node_id
			Is_after: is_after
		end

feature -- Access

	sibling_node_id: STRING

feature -- Status Report

	is_before: BOOLEAN

	is_after: BOOLEAN
		do
			Result := not is_before
		end

feature -- Output

	as_string: STRING
			-- output as a string
		do
			create Result.make(0)
			if is_before then
				Result.append ("before ")
			else
				Result.append ("after ")
			end
			Result.append ("[" + sibling_node_id + "]")
		end

end


