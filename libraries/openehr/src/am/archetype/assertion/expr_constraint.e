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


class EXPR_CONSTRAINT

inherit
    EXPR_LEAF
    	redefine
    		item, as_string, enter_subtree, exit_subtree
    	end

create
	make, make_coded_term

feature -- Initialisation

	make (an_item: C_PRIMITIVE_OBJECT)
			-- node is a constraint on a primitive type; can only be used with "matches" function
   		do
			item := an_item
			type := an_item.generator
		end

	make_coded_term (an_item: C_TERMINOLOGY_CODE)
			-- node is a term value
   		do
			item := an_item
			type := an_item.generator
		end

feature -- Access

	item: C_PRIMITIVE_OBJECT

feature -- Conversion

	as_string: STRING
		do
			create Result.make(0)
			Result.append ("{")
			Result.append (item.out)
			Result.append ("}")
		end

feature -- Visitor

	enter_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_expr_constraint (Current, depth)
		end

	exit_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_expr_constraint (Current, depth)
		end

end


