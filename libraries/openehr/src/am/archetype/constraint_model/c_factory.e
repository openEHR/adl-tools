note
	component:   "openEHR ADL Tools"
	description: "Factory class for archetype constraint definition"
	keywords:    "archetype constraint definition"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_FACTORY

inherit
	C_PRIMITIVE_FACTORY

	ASSERTION_FACTORY

	OG_PATH_TOOLS
		export
			{NONE} all
			{ANY} valid_path_string, path_parse_error
		end

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Factory

	create_c_complex_object (a_parent: C_ATTRIBUTE; a_type_name, a_node_id: STRING): C_COMPLEX_OBJECT
			-- create a new object node
		require
			type_name_valid: not a_type_name.is_empty
			node_id_valid: not a_parent.has_child_with_id (a_node_id)
		do
			create Result.make (a_type_name, a_node_id)
			a_parent.put_child (Result)
		end

	create_archetype_slot (a_parent: C_ATTRIBUTE; a_type_name, a_node_id: STRING): ARCHETYPE_SLOT
			-- create a new archetype slot
		require
			type_name_valid: not a_type_name.is_empty
		do
			create Result.make (a_type_name, a_node_id)
			a_parent.put_child (Result)
		end

	create_c_attribute_single (a_parent: C_COMPLEX_OBJECT; an_attr_name: STRING): C_ATTRIBUTE
			-- create a single-valued C_ATTRIBUTE node
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			create Result.make_single(an_attr_name, Void)
			a_parent.put_attribute(Result)
		end

	create_c_attribute_multiple (a_parent: C_COMPLEX_OBJECT; an_attr_name: STRING): C_ATTRIBUTE
			-- create a container C_ATTRIBUTE node
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			create Result.make_multiple(an_attr_name, Void, Void)
			a_parent.put_attribute(Result)
		end

	create_c_complex_object_proxy (a_parent: C_ATTRIBUTE; a_type_name, a_node_id, a_path: STRING): C_COMPLEX_OBJECT_PROXY
			-- create a "use" node
		require
			a_type_name_valid: not a_type_name.is_empty
		do
			create Result.make (a_type_name, a_node_id, a_path)
			a_parent.put_child (Result)
		end

	create_cardinality_make_bounded (a_lower, an_upper: INTEGER): CARDINALITY
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make(create {MULTIPLICITY_INTERVAL}.make_bounded (a_lower, an_upper))
		end

	create_cardinality_make_upper_unbounded (a_lower: INTEGER): CARDINALITY
			-- create Result from `a_lower' to +infinity
		do
			create Result.make(create {MULTIPLICITY_INTERVAL}.make_upper_unbounded (a_lower))
		end

	create_cardinality_make_unbounded: CARDINALITY
			-- create Result as interval of 0 to +infinity
		do
			create Result.make(create {MULTIPLICITY_INTERVAL}.make_upper_unbounded (0))
		end

end


