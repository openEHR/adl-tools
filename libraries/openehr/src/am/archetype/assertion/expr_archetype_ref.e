note
	component:   "openEHR ADL Tools"
	description: "[
					Expression tree leaf item to represent a path referring to a value in the archetype 
					(paths with a leading '/' are in the definition section; paths with no leading '/'
					are in the outer part of the archetype, e.g. 'archetype_id/value' refers to the String 
				    value of the archetype_id attribute of the enclosing archetype;
				 ]"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EXPR_ARCHETYPE_REF

inherit
    EXPR_LEAF
    	rename
    		item as path
    	redefine
    		path, enter_subtree, exit_subtree
    	end

create
	make, make_definition

feature -- Initialisation

	make (a_rel_path: STRING)
			-- node refers to a feature in the main part of an archetype
			-- (not the definition section)
		require
			ref_exists: not a_rel_path.is_empty
		do
			path := a_rel_path
			type := "String" -- FIXME: need access to ref model to know what type it really is
		ensure
			is_archetype_ref
		end

	make_definition (an_abs_path: STRING)
			-- node refers to a feature in the definition section of an archetype
			-- path must be asbolute
		require
			ref_exists: not an_abs_path.is_empty
		do
			path := an_abs_path
			type := "Any"
		ensure
			is_archetype_definition_ref
		end

feature -- Access

	path: STRING

feature -- Status Report

	is_archetype_ref: BOOLEAN
			-- True if this leaf node is a reference to a node in an archetype outer structure (i.e., not the definition part)
		do
			Result := path.item (1) /= {OG_PATH}.segment_separator
		end

	is_archetype_definition_ref: BOOLEAN
			-- True if this leaf node is a reference to a node in an archetype definition
		do
			Result := path.item (1) = {OG_PATH}.segment_separator
		end

feature -- Modification

	update_type (a_type: STRING)
			-- update type information if this is a reference object - type information
			-- is not available when object is built (using just a path); the path has
			-- to be followed into the reference model to determine the actual target type
		do
			type := a_type
		end

	set_path (a_path: STRING)
		require
			ref_exists: not a_path.is_empty
		do
			path := a_path
		end

feature -- Visitor

	enter_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_expr_archetype_ref (Current, depth)
		end

	exit_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_expr_archetype_ref (Current, depth)
		end

end


