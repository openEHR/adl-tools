note
	component:   "openEHR ADL Tools"
	description: "Item representing a 'use' reference in an ADL parse tree. The referenced node must be an object node."
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT_PROXY

inherit
	C_OBJECT
		redefine
			representation_cache, occurrences_conforms_to
		end

create
	make

feature -- Initialisation

	make (a_rm_type_name, an_object_id, a_path: STRING)
			-- make with id
		require
			rm_type_name_valid: not a_rm_type_name.is_empty
			object_id_valid: not an_object_id.is_empty
			path_valid: not a_path.is_empty
		local
			rep: attached like representation_cache
		do
			rm_type_name := a_rm_type_name
			set_target_path (a_path)
			create rep.make (an_object_id, a_path)
			rep.set_content (Current)
			representation_cache := rep
		ensure
			Use_target_occurrences: use_target_occurrences
		end

feature -- Access

	has_sibling_target: BOOLEAN
		do
			Result := representation.has_sibling_target
		end

	target_path: STRING
			-- path to the referenced node

feature -- Status Report

	use_target_occurrences: BOOLEAN
			-- True if target occurrences are to be used as the value of occurrences in this object;
			-- by the time of runtime use, the target occurrences value has to be set into this object
		do
			Result := not attached occurrences
		end

feature -- Comparison

	occurrences_conforms_to (other: C_OBJECT): BOOLEAN
			-- if `other' is a C_COMPLEX_OBJECT, then always True, since if occurrences defined on proxy node,
			-- it is an override of  the occurrences on the target, and it doesn't have to conform to anything
			-- except the containing attribute's cardinality
			-- However, if `other' is also a C_COMPLEX_OBJECT then the override is of another use_node, and normal
			-- occurrences apply
		do
			if other.same_type (Current) then
				Result := precursor (other)
			else
				Result := True
			end
		end

feature -- Modification

	set_target_path (a_path: STRING)
			-- set reference path with a valid ADL path string
		do
			target_path := a_path
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_complex_object_proxy (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_complex_object_proxy (Current, depth)
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT_PROXY
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make ("id1", "/")
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("rm_type_name")
			Result.extend ("node_id")
			Result.extend ("sibling_order")
			Result.extend ("occurrences")
			Result.extend ("is_deprecated")
			Result.extend ("target_path")
		end

end


