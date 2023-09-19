note
	component:   "openEHR ADL Tools"
	description: "[
			     Subtype of C_OBJECT representing an archetype %"slot%", i.e.
			     a specification of what archetypes can come at a chaining
			     point in the archetype. If the includes list is non-empty,
			     only archetypes matching the list items are allowed; if the
			     excludes list is non-empty, matching archetypes are not allowed.
			     If both lists are empty, any archetype of the rm_type is
			     allowed.
			 ]"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_SLOT

inherit
	C_OBJECT
		redefine
			out, representation_cache, overlay_differential
		end

create
	make

feature -- Initialisation

	make (a_rm_type_name, an_object_id: STRING)
			-- set type name, object_id
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Object_id_valid: not an_object_id.is_empty
		local
			rep: attached like representation_cache
		do
			rm_type_name := a_rm_type_name
			create rep.make (an_object_id)
			rep.set_content (Current)
			representation_cache := rep
		ensure
			Any_allowed: any_allowed
		end

feature -- Access

	includes: ARRAYED_LIST [ASSERTION]
			-- list of assertions on archetypes of type 'type_name' defining
			-- allowed archetypes
		attribute
			create Result.make (0)
		end

	excludes: ARRAYED_LIST [ASSERTION]
			-- list of assertions on archetypes of type 'type_name' defining
			-- excluded archetypes
		attribute
			create Result.make (0)
		end

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed i.e. no includes or excludes defined, and
			-- slot is not closed
		do
			Result := includes.is_empty and excludes.is_empty and not is_closed
		end

	has_any_includes: BOOLEAN
			-- true if there are any includes at all
		do
			Result := not includes.is_empty
		end

	has_any_excludes: BOOLEAN
			-- true if there are any excludes at all
		do
			Result := not excludes.is_empty
		end

	has_substantive_includes: BOOLEAN
			-- true if there are substantive includes, i.e. not just matching 'any'
		do
			Result := not includes.is_empty and then not includes.first.matches_any
		end

	has_substantive_excludes: BOOLEAN
			-- true if there are substantive excludes, i.e. not just matching 'any'
		do
			Result := not excludes.is_empty and then not excludes.first.matches_any
		end

	has_open_includes: BOOLEAN
			-- true if there are substantive includes, i.e. not just matching 'any'
		do
			Result := not includes.is_empty and then includes.first.matches_any
		end

	has_open_excludes: BOOLEAN
			-- true if there are substantive excludes, i.e. not just matching 'any'
		do
			Result := not excludes.is_empty and then excludes.first.matches_any
		end

	status_required: BOOLEAN
			-- True if there are substantive includes or excludes which are required
		do
			Result := (not includes.is_empty and excludes.is_empty) or (not excludes.is_empty and includes.is_empty)
		end

	is_closed: BOOLEAN
			-- True if this slot specification in this template exhaustively mentions all fillers,
			-- in which case, the slot will not be available for further filling in either
			-- specialised archetypes or at runtime.
			-- Default value False, i.e. unless explicitly set, slots remain open.

feature -- Comparison

	is_subset_of (other: like Current): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other'
			-- Returns False if they are the same, or if they do not correspond
		do
			if other.any_allowed then
				Result := True
			elseif not any_allowed then
				-- FIXME - tobe implemented
			end
		end

feature -- Modification

	add_include (assn: ASSERTION)
			-- add includes constraint
		do
			includes.extend (assn)
		ensure
			includes.has(assn)
		end

	add_exclude (assn: ASSERTION)
			-- add excludes constraint
		do
			excludes.extend (assn)
		ensure
			excludes.has(assn)
		end

	set_includes (assn_list: ARRAYED_LIST[ASSERTION])
			-- set includes constraints
		do
			includes := assn_list
		end

	set_excludes (assn_list: ARRAYED_LIST[ASSERTION])
			-- set excludes constraints
		do
			excludes := assn_list
		end

	set_closed
			-- set `is_closed'
		do
			is_closed := True
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

			if other.is_closed then
				set_closed
				set_specialisation_status_redefined
			end
		end

feature -- Output

	out: STRING
			--
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + representation.node_id + "] ")
			if attached occurrences as att_occ then
				Result.append (att_occ.as_string)
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_archetype_slot (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_archetype_slot (Current, depth)
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT_LEAF
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make_anonymous
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
			Result.extend ("is_closed")
			Result.extend ("includes")
			Result.extend ("excludes")
		end

end


