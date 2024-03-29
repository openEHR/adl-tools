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
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class EXPR_LEAF

inherit
	EXPRESSION
		redefine
			out
		end

feature -- Access

	item: ANY

feature -- Conversion

	out: STRING
		do
			create Result.make(0)
			Result.append (item.out)
		end

	as_string: STRING
		do
			Result := item.out
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


