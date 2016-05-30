note
	component:   "openEHR ADL Tools"
	description: "[
			     Object node representing a root point of an archetype included within another archetype, either as a 
				 direct reference or as a slot filler. The possible configurations of this object are:
				 	- ARCHETYPE_SLOT specialisation: archetype_id, node_id of slot object ==> node_id is from an ancestor level
				 	- ARCHETYPE_SLOT specialisation: archetype_id, no node_id (slot object with no node_id); path can be found in flat parent
				 	- New object in any level of archetype: archetype_id, node_id (if required by usual rules) ==> node_id is from current level
				 	- New object in any level of archetype: archetype_id, no node_id (if not required); path cannot be found in flat parent
			     ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT

inherit
	C_COMPLEX_OBJECT
		rename
			make as cco_make
		redefine
			c_congruent_to, out, enter_subtree, exit_subtree, overlay_differential
		end

create
	make

feature -- Initialisation

	make (a_rm_type_name, an_object_id, an_archetype_ref: STRING)
			-- make as an archetype external reference
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Valid_node_id: is_valid_id_code (an_object_id)
			Archetype_id_valid: valid_archetype_id (an_archetype_ref)
		do
			cco_make (a_rm_type_name, an_object_id)
			archetype_ref := an_archetype_ref
		end

feature -- Access

	archetype_ref: STRING
			-- an archetype reference, which could occasionally be a full archetype ID, but is normally
			-- only a reference down to the major version.

	flat_path: STRING
			-- generate the flattened path to the filling node, using an_archetype_ref
		local
			an_og_path: OG_PATH
		do
			an_og_path := og_path
			an_og_path.last.set_object_id (archetype_ref)
			Result := an_og_path.as_string
		end

feature -- Comparison

	c_congruent_to (other: like Current): BOOLEAN
			-- <precursor>
			-- plus added difference:
			--	archetype_ref differs
		do
			Result := precursor (other) and archetype_ref.is_equal (other.archetype_ref)
		end

feature -- Modification

	convert_to_flat (a_matched_archetype_id: ARCHETYPE_HRID)
			-- write `a_matched_archetype_id' (that is known to match `archetype_ref') into node_id
			-- and also write the RM class name from `a_matched_archetype_id' into `rm_type_name',
			-- since it might be different.
		do
			set_node_id (a_matched_archetype_id.physical_id)
			set_rm_type_name (a_matched_archetype_id.rm_class)
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
			precursor (other)
			create archetype_ref.make_from_string (other.archetype_ref)
		end

feature -- Output

	out: STRING
			-- stringify for GUI use
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + node_id + ", " + archetype_ref + "] ")
			if attached occurrences as occ then
				Result.append (occ.as_string)
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_archetype_root (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_archetype_root (Current, depth)
		end

end


