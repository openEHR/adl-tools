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
			make_anonymous as cco_make_anonymous,
			make_identified as cco_make_identified
		redefine
			out, enter_subtree, exit_subtree
		end

create
	make_external_ref, make_slot_filler

feature -- Initialisation

	make_external_ref (a_rm_type_name, an_archetype_id: STRING)
			-- make as an archetype external reference
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Archetype_id_valid: valid_archetype_id (an_archetype_id)
		do
			cco_make_identified (a_rm_type_name, an_archetype_id)
		end

	make_slot_filler (a_rm_type_name, an_archetype_id, a_slot_node_id: STRING)
			-- make as a slot filler, specialising a slot
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Archetype_id_valid: valid_archetype_id (an_archetype_id)
			Slot_id_valid: not a_slot_node_id.is_empty
		do
			cco_make_identified (a_rm_type_name, an_archetype_id)
			slot_node_id := a_slot_node_id
		end

feature -- Access

	slot_node_id: detachable STRING
			-- record node id of slot in parent archetype that this object fills, in the case a slot exists;
			-- only set in flat form of archetype

	archetype_ref: STRING
			-- id of filler archetype
		do
			Result := node_id
		end

	slot_path: STRING
			-- generate path of slot that this node would replace, by using slot_node_id
		local
			og_path: OG_PATH
		do
			if attached slot_node_id as snid then
				og_path := representation.path
				og_path.last.set_object_id (snid)
				Result := og_path.as_string
			else
				Result := path
			end
		end

feature -- Output

	out: STRING
			-- stringify for GUI use
		do
			create Result.make(0)
			Result.append (rm_type_name + "[")
			if attached slot_node_id as snid then
				Result.append (snid + ", ")
			end
			if is_addressable then
				Result.append (archetype_ref + ", ")
			end
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

invariant
	is_addressable: is_addressable

end


