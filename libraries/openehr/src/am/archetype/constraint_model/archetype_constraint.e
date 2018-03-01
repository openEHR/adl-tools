note
	component:   "openEHR ADL Tools"
	description: "Abstract model of any archetype constraint"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_CONSTRAINT

inherit
	OG_VISITABLE

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_id_code, is_valid_value_code, is_valid_value_set_code, valid_specialisation_status
		end

	HASHABLE

feature -- Access

	parent: detachable ARCHETYPE_CONSTRAINT

	og_path: OG_PATH
			-- path to this object in the tree with respect to root, in structured form
		do
			Result := representation.path
		end

	path: STRING
			-- path to this object in the tree with respect to root
		do
			Result := representation.path.as_string
		end

	path_to_node (a_node: C_OBJECT): STRING
			-- path from this node to `a_node'
		do
			Result := representation.path_to_node (a_node.representation).as_string
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := path.hash_code
		end

	soc_parent: detachable C_2ND_ORDER
		note
			option: transient
		attribute
		end

feature -- Status report

	is_path_compressible: BOOLEAN
			-- flag to indicate this node is in a specialised archetype and makes no structural changes
			-- to the corresponding node in the flat parent, and therefore, this node can be compressed.
			-- Note that congruent node_id definition is allowed, since node ids are not lost in paths.

	is_leaf: BOOLEAN
			-- True if this node is a terminal node
		do
			Result := representation.is_leaf
		end

	is_root: BOOLEAN
			-- True if this node is a top node
		do
			Result := representation.is_root
		end

	is_prohibited: BOOLEAN
			-- True if node is prohibited, i.e. excluded
		deferred
		end

	is_second_order_constrained: BOOLEAN
		do
			Result := attached soc_parent or else (attached parent as att_parent and then att_parent.is_second_order_constrained)
		end

	valid_archetype_id (an_id: STRING): BOOLEAN
		do
			Result := archetype_id_parser.valid_id (an_id)
		end

feature -- Comparison

	c_congruent_to (other: like Current): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same constraints as `other'.
		deferred
		end

	c_conforms_to (other: like Current; rm_type_conformance_checker: FUNCTION [ANY, TUPLE [STRING, STRING], BOOLEAN]): BOOLEAN
			-- True if this node on its own (ignoring any subparts) expresses the same or narrower constraints as `other'.
		deferred
		end

feature -- Modification

	set_is_path_compressible
			-- set `is_path_compressible'
		do
			is_path_compressible := True
		end

feature {ARCHETYPE_CONSTRAINT} -- Modification

	set_parent (a_node: like parent)
			-- set `parent'
		do
			parent := a_node
		end

feature {C_2ND_ORDER} -- Modification

	set_soc_parent (a_node: like soc_parent)
			-- set `soc_parent'
		do
			soc_parent := a_node
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		deferred
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		deferred
		end

feature -- Representation

	representation: attached like representation_cache
		do
			if attached representation_cache as rc then
				Result := rc
			else
				Result := create_default_representation
				Result.set_content (Current)
				representation_cache := Result
			end
		end

feature -- Duplication

	safe_deep_twin: like Current
			-- safe version of deep_twin that Voids `parent' first so as not to clone backwards up tree
		local
			p: like parent
			soc_p: like soc_parent
			og_p: like representation.parent
		do
			p := parent
			parent := Void
			soc_p := soc_parent

			og_p := representation.parent
			representation.set_root

			Result := deep_twin

			parent := p
			representation.set_parent (og_p)
			soc_parent := soc_p
		ensure
			Result.parent = Void
		end

feature -- Source Control

	specialisation_status: INTEGER
			-- status of this node in the source text of this archetype with respect to the
			-- specialisation hierarchy. Determined from initial parse, and subsequent editing on structure
		note
			option: transient
		attribute
		end

	set_specialisation_status_added
		do
			specialisation_status := ss_added
		end

	set_specialisation_status_redefined
		do
			specialisation_status := ss_redefined
		end

	set_specialisation_status_inherited
		do
			specialisation_status := ss_inherited
		end

	set_specialisation_status (a_spec_status: INTEGER)
		require
			valid_specialisation_status (a_spec_status)
		do
			specialisation_status := a_spec_status
		end

	set_subtree_specialisation_status (a_spec_status: INTEGER)
			-- mark every node from here down as having the specialisation status `a_spec_status'
		do
			specialisation_status := a_spec_status
		end

	deep_set_specialisation_status_added
			-- deep version of `set_specialisation_status_added'
		do
			set_subtree_specialisation_status (ss_added)
		end

	rolled_up_specialisation_status: INTEGER
			-- status of this node taking into consideration effective_specialisation_status of
			-- all sub-nodes. Used to roll up nodes on visualisation, and also to decide which
			-- subtree to remove to convert an archetype to differential form
		note
			option: transient
		attribute
		end

	set_rolled_up_specialisation_status (a_status: INTEGER)
		require
			valid_specialisation_status: valid_specialisation_status (a_status)
		do
			rolled_up_specialisation_status := a_status
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_ITEM
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		deferred
		end

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

invariant
	Specialisation_status_validity: valid_specialisation_status (specialisation_status)

end


