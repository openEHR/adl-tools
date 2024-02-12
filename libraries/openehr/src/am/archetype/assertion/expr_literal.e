note
	component:   "openEHR ADL Tools"
	description: "[
					Expression tree leaf item representing a manifest constant of any primitive 
					type (Integer, Real, Boolean, String, Character, Date, Time, Date_time, 
					Duration), or (in future) of any complex reference model type, e.g. a DV_CODED_TEXT
				 ]"
	keywords:    "assertion, ADL"
	author:      "Thomas Beale <thomas.beale@GraphiteHealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024- Graphite Health <http://www.GrahiteHealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class EXPR_LITERAL

inherit
	EXPR_LEAF
    	redefine
    		enter_subtree, exit_subtree
    	end

create
	make_boolean, make_integer, make_real, make_string, make_character

feature -- Initialisation

	make_boolean (an_item: BOOLEAN)
			-- node is a boolean value
   		do
			item := an_item
			type := "Boolean"
		end

	make_real (an_item: REAL)
			-- node is a real value
   		do
			item := an_item
			type := "Real"
		end

	make_integer (an_item: INTEGER)
			-- node is an integer value
   		do
			item := an_item
			type := "Integer"
		end

	make_string (an_item: STRING)
			-- node is a string value
   		do
			item := an_item
			type := "String"
		end

	make_character (an_item: CHARACTER)
			-- node is a character value
   		do
			item := an_item
			type := "Character"
		end

feature -- Visitor

	enter_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_expr_literal (Current, depth)
		end

	exit_subtree (visitor: EXPR_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_expr_literal (Current, depth)
		end

end


