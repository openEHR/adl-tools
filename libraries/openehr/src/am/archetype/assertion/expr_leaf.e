note
	component:   "openEHR ADL Tools"
	description: "[
					Expression tree leaf item. This can represent one of:
						* a manifest constant of any primitive type (Integer, Real, Boolean, 
						  String, Character, Date, Time, Date_time, Duration), or (in future) 
						  of any complex reference model type, e.g. a DV_CODED_TEXT;
						* a path referring to a value in the archetype (paths with a leading '/' 
						  are in the definition section; paths with no leading '/'are in the outer 
						  part of the archetype, e.g. 'archetype_id/value' refers to the String 
						  value of the archetype_id attribute of the enclosing archetype;
						* a constraint, expressed in the form of concrete subtype of C_OBJECT; 
						  most often this will be a C_PRIMITIVE_OBJECT.
				 ]"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EXPR_LEAF

inherit
	EXPR_ITEM
		redefine
			out
		end

create
	make_boolean, make_integer, make_real, make_string, make_character,
	make_archetype_definition_ref, make_archetype_ref,
	make_ordinal, make_coded_term,
	make_constraint

feature -- Definitions

	Ref_type_attribute: STRING = "attribute"
	Ref_type_constant: STRING = "constant"
	Ref_type_constraint: STRING = "constraint"

feature -- Initialisation

	make_archetype_ref (a_ref: STRING)
			-- node refers to a feature in the main part of an archetype
			-- (not the definition section)
		require
			ref_exists: not a_ref.is_empty
		do
			item := a_ref
			type := "String" -- FIXME: need access to ref model to know what type it really is
			reference_type := Ref_type_attribute
		ensure
			is_archetype_ref
		end

	make_archetype_definition_ref (a_ref: STRING)
			-- node refers to a feature in the archetype definition
		require
			ref_exists: not a_ref.is_empty
		do
			item := a_ref
			type := "Any" -- FIXME: need access to ref model to know what type it really is
			reference_type := Ref_type_attribute
		ensure
			is_archetype_definition_ref
		end

	make_boolean (an_item: BOOLEAN)
			-- node is a boolean value
   		do
			item := an_item
			type := "Boolean"
			reference_type := Ref_type_constant
		end

	make_real (an_item: REAL)
			-- node is a real value
   		do
			item := an_item
			type := "Real"
			reference_type := Ref_type_constant
		end

	make_integer (an_item: INTEGER)
			-- node is an integer value
   		do
			item := an_item
			type := "Integer"
			reference_type := Ref_type_constant
		end

	make_string (an_item: STRING)
			-- node is a string value
   		do
			item := an_item
			type := "String"
			reference_type := Ref_type_constant
		end

	make_character (an_item: CHARACTER)
			-- node is a character value
   		do
			item := an_item
			type := "Character"
			reference_type := Ref_type_constant
		end

	make_ordinal (an_item: ORDINAL)
			-- node is a ordinal value
   		do
			item := an_item
			type := an_item.generator
			reference_type := Ref_type_constant
		end

	make_coded_term (an_item: C_CODE_PHRASE)
			-- node is a term value
   		do
			item := an_item
			type := an_item.generator
			reference_type := Ref_type_constraint
		end

	make_constraint (an_item: C_PRIMITIVE)
			-- node is a constraint on a primitive type; can only be used with "matches" function
   		do
			item := an_item
			type := an_item.generator
			reference_type := Ref_type_constraint
		end

feature -- Access

	reference_type: STRING
			-- Type of reference: "constant", "attribute", "function", "constraint". The first three are
			-- used to indicate the referencing mechanism for an operand. The last is used to indicate
			-- a constraint operand, as happens in the case of the right-hand operand of the ‘matches’ operator.

	item: ANY

feature -- Status Report

	is_archetype_ref: BOOLEAN
			-- True if this leaf node is a reference to a node in an archetype outer structure (i.e., not the definition part)
		do
			if reference_type.is_equal (Ref_type_attribute) and then attached {STRING} item as a_path then
				Result := a_path.item (1) /= {OG_PATH}.segment_separator
			end
		end

	is_archetype_definition_ref: BOOLEAN
			-- True if this leaf node is a reference to a node in an archetype definition
		do
			if reference_type.is_equal (Ref_type_attribute) and then attached {STRING} item as a_path then
				Result := a_path.item (1) = {OG_PATH}.segment_separator
			end
		end

	is_constraint: BOOLEAN
			-- True if this leaf node is a constraint value
		do
			Result := reference_type.is_equal (Ref_type_constraint)
		end

feature -- Conversion

	out: STRING
		do
			create Result.make(0)
			Result.append (item.out)
		end

	as_string: STRING
		do
			create Result.make(0)
			if reference_type.is_equal ("constraint") then
				Result.append ("{")
			end
			Result.append (item.out)
			if reference_type.is_equal ("constraint") then
				Result.append ("}")
			end
		end

feature -- Modification

	update_type (a_type: STRING)
			-- update type information if this is a reference object - type information
			-- is not available when object is built (using just a path); the path has
			-- to be followed into the reference model to determine the actual target type
		require
			is_archetype_ref or is_archetype_definition_ref
		do
			type := a_type
		end

feature -- Visitor

	enter_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_expr_leaf (Current, depth)
		end

	exit_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_expr_leaf (Current, depth)
		end

end


