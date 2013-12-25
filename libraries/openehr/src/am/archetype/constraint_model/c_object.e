note
	component:   "openEHR ADL Tools"
	description: "[
				 Any OBJECT node in ADL parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_OBJECT

inherit
	ARCHETYPE_CONSTRAINT
		redefine
			parent, representation_cache
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} specialisation_depth_from_code, is_valid_code;
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate
		attribute
			create Result.make_from_string (Any_type)
		end

	node_id: STRING
			--
		do
			Result := representation.node_id
		end

	occurrences: detachable MULTIPLICITY_INTERVAL

	occurrences_key_string: STRING
			-- generate a string of the form "_multiple", "_multiple_optional" or "_optional" or ""
			-- representing the occurrences, useful as a key to variant pixmaps, files etc.
		do
			create Result.make_empty
			if attached occurrences as occ then
				if occ.upper > 1 or occ.upper_unbounded then
					Result.append ("_multiple")
				end
				if occ.is_optional then
					Result.append ("_optional")
				end
			end
		end

	parent: detachable C_ATTRIBUTE
		note
			option: transient
		attribute
		end

	sibling_order: detachable SIBLING_ORDER
			-- set if this node should be ordered with respect to an inherited sibling; only settable
			-- on specialised nodes

feature -- Status report

	is_addressable: BOOLEAN
			-- True if this node has a non-anonymous node_id
		do
			Result := representation.is_addressable
		end

	is_prohibited: BOOLEAN
			-- True if occurrences set to {0} i.e. prohibited
		do
			Result := attached occurrences as occ and then occ.is_prohibited
		end

feature -- Comparison

	c_equal (other: like Current): BOOLEAN
			-- True if Current and `other' are identical locally (child objects may differ)
			-- Used when diff'ing two flat archetypes, to determine if a node is just a copy
			-- (i.e. no redefinitions) of the other.
		do
			Result := occurrences ~ other.occurrences and
				node_id.is_equal (other.node_id) and
				rm_type_name.is_case_insensitive_equal (other.rm_type_name)
		end

	c_congruent_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses no constraints in addition to `other', other than
			-- possible redefinition of the node id, which doesn't matter, since this won't get lost in a compressed path.
			-- `other' is assumed to be in a flat archetype
			-- Used to determine if path segments can be compressed;
			-- Returns False if any of the following is different:
			--	rm_type_name
			--	occurrences
			-- 	sibling order
		do
			Result := rm_type_name.is_equal (other.rm_type_name) and not attached occurrences and
				node_id_conforms_to (other) and not attached sibling_order
		end

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- `other' is assumed to be in a flat archetype.
			-- Returns True only when the following is True:
			--	rm_type_name is the same or a subtype of RM type of flat parent node;
			--	occurrences is same (= Void) or a sub-interval
			--	node_id is the same, or redefined to a legal code at the level of the owning archetype
		do
			Result := node_id_conforms_to (other) and occurrences_conforms_to (other) and
				(rm_type_name.is_case_insensitive_equal (other.rm_type_name) or else
				rm_type_conformance_checker.item ([rm_type_name, other.rm_type_name]))
		end

	occurrences_conforms_to (other: C_OBJECT): BOOLEAN
			-- True if this node occurrences conforms to other.occurrences; `other' is assumed to be in a flat archetype
		do
			if attached occurrences as occ and attached other.occurrences as other_occ then
				Result := other_occ.contains (occ)
			else
				Result := True
			end
		end

	node_id_conforms_to (other: like Current): BOOLEAN
			-- True if this node id conforms to other.node_id, which includes the ids being identical
			-- `other' is assumed to be in a flat archetype
		do
			Result := codes_conformant (node_id, other.node_id)
		end

	valid_occurrences (occ: MULTIPLICITY_INTERVAL): BOOLEAN
			-- check if `occ' is valid to be set as occurrences on this object
		do
			Result := attached parent as p and then p.is_single implies occ.upper <= 1
		end

feature -- Modification

	set_rm_type_name (a_name: STRING)
		do
			rm_type_name := a_name
		end

	set_occurrences (occ: MULTIPLICITY_INTERVAL)
			--
		require
			Occurrences_valid: valid_occurrences (occ)
		do
			occurrences := occ
		ensure
			occurrences = occ
		end

	remove_occurrences
		do
			occurrences := Void
		ensure
			occurrences = Void
		end

	set_sibling_order (a_sibling_order: SIBLING_ORDER)
			-- set sibling order
--		require
--			specialisation_depth > 0
		do
			sibling_order := a_sibling_order
		ensure
			sibling_order_set: sibling_order = a_sibling_order
		end

	set_sibling_order_before (a_node_id: STRING)
			-- set sibling order of this node to be before the inherited sibling node with id a_node_id
		require
			not a_node_id.is_empty
		do
			create sibling_order.make_before (a_node_id)
		ensure
			sibling_order_set: attached sibling_order as sib_ord and then (sib_ord.is_before and sib_ord.sibling_node_id.is_equal (a_node_id))
		end

	set_sibling_order_after (a_node_id: STRING)
			-- set sibling order of this node to be after the inherited sibling node with id a_node_id
--		require
--			specialisation_depth_from_code (a_node_id) < specialisation_depth
		do
			create sibling_order.make_after (a_node_id)
		ensure
			sibling_order_set: attached sibling_order as sib_ord and then (sib_ord.is_after and sib_ord.sibling_node_id.is_equal (a_node_id))
		end

--	clear_sibling_order
--			-- remove sibling order
--		do
--			sibling_order := Void
--		ensure
--			not attached sibling_order
--		end

	set_node_id (an_object_id: STRING)
		require
			Object_id_valid: not an_object_id.is_empty
		do
			representation.set_node_id (an_object_id)
		end

	overlay_differential (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN])
			-- apply any differences from `other' to this object node including:
			-- 	node_id
			-- 	overridden rm_type_name
			-- 	occurrences
			-- Current is assumed to be in a flat archetype
		require
			Other_valid: other.c_conforms_to (Current, rm_type_conformance_checker)
		do
			if not other.node_id.is_equal (node_id) then
				set_node_id (other.node_id.twin)
				set_specialisation_status_redefined
			end
			if not other.rm_type_name.is_case_insensitive_equal (rm_type_name) then
				rm_type_name := other.rm_type_name.twin
				set_specialisation_status_redefined
			end
			if attached other.occurrences as other_occ then
				set_occurrences (other_occ.deep_twin)
				set_specialisation_status_redefined
			end
		end

feature -- Output

	occurrences_as_string: STRING
			-- output string representing `occurrences', even if occurrences is Void
		do
			if attached occurrences as occ then
				Result := occ.as_string
			else
				Result := "(unchanged)"
			end
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT
		note
			option: transient
		attribute
		end

invariant
	rm_type_name_valid: not rm_type_name.is_empty
	Occurrences_validity: attached occurrences as occ implies valid_occurrences (occ)

end


