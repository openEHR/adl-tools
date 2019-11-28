note
	component:   "openEHR ADL Tools"
	description: "[
				 Any OBJECT node in ADL parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "constraint, ADL"
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

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate
		attribute
			create Result.make_from_string (Any_type_name)
		end

	node_id: STRING
			--
		do
			Result := representation.node_id
		end

	occurrences: detachable MULTIPLICITY_INTERVAL
			-- Occurrences of this object node in the data, under the owning attribute. Upper limit
			-- can only be greater than 1 if owning attribute has a cardinality of more than 1.
			-- Only set if it overrides the parent archetype in the case of specialised archetypes,
			-- or else the occurrences inferred from the underlying reference model existence and/or
			-- cardinality of the containing attribute.

	effective_occurrences (rm_prop_mult: FUNCTION [ANY, TUPLE[STRING, STRING], MULTIPLICITY_INTERVAL]): MULTIPLICITY_INTERVAL
			-- evaluate effective occurrences, using the RM when no occurrences constraint exists.
			-- In this case, the upper limit of the RM's owning attribute is used to provide a value.
			-- `rm_attr_prop_mult' is a function that knows how to compute effective object multiplicity
			-- by looking at the owning RM property.
			-- If local `occurrences` not set, always assume 0 as the lower bound.
		do
			if attached occurrences as att_occ then
				Result := att_occ
			elseif attached parent as att_ca then
				if attached att_ca.cardinality as att_card then
					if att_card.interval.upper_unbounded then
						create Result.make_open
					else
						create Result.make_bounded (0, att_card.interval.upper)
					end
				elseif attached att_ca.parent as att_co then
					Result := rm_prop_mult (att_co.rm_type_name, att_ca.rm_attribute_path)
					Result.set_lower (0)
				else
					create Result.make_open
				end
			else
				create Result.make_open
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

	is_prohibited: BOOLEAN
			-- True if occurrences set to {0} i.e. prohibited
		do
			Result := attached occurrences as occ and then occ.is_prohibited
		end

	is_deprecated: BOOLEAN
			-- True if this node is deprecated within its model

feature -- Comparison

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
			-- `other' is typically from the flat parent archetype.
			-- Returns True only when the following is True:
			--	rm_type_name is the same or a subtype of rm_type_name of other;
			--	occurrences is same (= Void) or a sub-interval
			--	node_id is the same, or redefined to a legal code at the level of the owning archetype
		do
			Result := node_id_conforms_to (other) and occurrences_conforms_to (other) and
				(rm_type_name.is_case_insensitive_equal (other.rm_type_name) or else
				rm_type_conformance_checker(rm_type_name, other.rm_type_name))
		end

	c_congruent_to (other: like Current): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses no constraints in addition to `other', other than
			-- possible redefinition of the node id, which doesn't matter, since this won't get lost in a compressed path.
			-- Current and `other' are typically from flat archetypes being compared to generate a diff.
			-- Used to determine if path segments can be compressed;
			-- Returns True if:
			--	rm_type_name is identical
			--	occurrences is Void or else identical to other.occurrences
			-- 	sibling_order is Void or else identical to other.sibling_order
			--	node_id is identical or else is the only child that overlays the parent node
		do
			Result := rm_type_name.is_case_insensitive_equal (other.rm_type_name) and
				(not attached occurrences or else occurrences ~ other.occurrences) and
				(not attached sibling_order or else sibling_order ~ other.sibling_order) and
				node_reuse_congruent (other)
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

	node_reuse_congruent (other: like Current): BOOLEAN
			-- True if this node is the sole re-using node of the corresponding node in the flat
		do
			Result := node_id_conforms_to (other) and
				(is_root or else
				attached parent as p and then p.child_reuse_count (other.node_id) = 1)
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
		do
			create sibling_order.make_after (a_node_id)
		ensure
			sibling_order_set: attached sibling_order as sib_ord and then (sib_ord.is_after and sib_ord.sibling_node_id.is_equal (a_node_id))
		end

	set_is_deprecated (a_val: BOOLEAN)
			-- set `is_deprecated'
		do
			is_deprecated := a_val
		end

	set_node_id (an_object_id: STRING)
		require
			Object_id_valid: is_valid_id_code (an_object_id)
		do
			representation.set_node_id (an_object_id)
		end

feature -- Modification

	set_root_node_id (an_object_id: STRING)
		require
			Is_root: is_root
			Object_id_valid: not an_object_id.is_empty
		do
			representation.set_node_id (an_object_id)
		end

feature {C_ATTRIBUTE} -- Modification

	overlay_differential (other: like Current)
			-- apply any differences from `other' to this object node including:
			-- 	node_id
			-- 	overridden rm_type_name
			-- 	occurrences
			-- Current is assumed to be in a flat archetype
			-- Should always be called from C_ATTRIBUTE.overlay_differential() since the
			-- if the node_id changes, the keyed list in the parent needs to be updated
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

feature {ARCHETYPE_FLATTENER} -- Modification

	overlay_differential_root (other: like Current)
			-- apply any differences from `other' to this object node including:
			-- 	node_id
			-- 	overridden rm_type_name
			-- 	occurrences
			-- Current is assumed to be in a flat archetype
			-- Should always be called from C_ATTRIBUTE.overlay_differential() since the
			-- if the node_id changes, the keyed list in the parent needs to be updated
		require
			Current.is_root and other.is_root
		do
			if not other.node_id.is_equal (node_id) then
				set_node_id (other.node_id.twin)
				set_specialisation_status_redefined
			end
			if not other.rm_type_name.is_case_insensitive_equal (rm_type_name) then
				rm_type_name := other.rm_type_name.twin
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


