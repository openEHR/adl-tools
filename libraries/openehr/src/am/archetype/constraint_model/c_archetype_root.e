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
			out, enter_subtree, exit_subtree
		end

create
	make, make_slot_filler

feature -- Initialisation

	make (a_rm_type_name, an_archetype_id: STRING)
			-- make as an archetype external reference
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Archetype_id_valid: valid_archetype_id (an_archetype_id)
		do
			rm_type_name := a_rm_type_name
			create representation_cache.make (an_archetype_id)
			representation_cache.set_content (Current)
		end

	make_slot_filler (a_rm_type_name, an_archetype_id, a_slot_node_id: STRING)
			-- make as an archetype external reference
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Archetype_id_valid: valid_archetype_id (an_archetype_id)
			Valid_slot_node_id: is_valid_id_code (a_slot_node_id)
		do
			make (a_rm_type_name, an_archetype_id)
			slot_node_id := a_slot_node_id
		end

feature -- Access

	slot_node_id: detachable STRING

	slot_path: detachable STRING
			-- generate the path to the slot this object fills, if applicable
		local
			og_path: OG_PATH
		do
			if attached slot_node_id as att_snid then
				create og_path.make_from_string (path)
				og_path.last.set_object_id (att_snid)
				Result := og_path.as_string
			end
		end

feature -- Output

	out: STRING
			-- stringify for GUI use
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + node_id + "] ")
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


