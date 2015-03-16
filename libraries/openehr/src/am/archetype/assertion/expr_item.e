note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "expression"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXPR_ITEM

inherit
	OG_VISITABLE

feature -- Access

	type: STRING
			-- Type name of this item in the mathematical sense. For leaf nodes,
			-- must be the name of a primitive type, or else a reference model type.
			-- The type for any relational or boolean operator will be "Boolean",
			-- while the type for any arithmetic operator, will be "Real" or "Integer".
        attribute
            create Result.make_empty
        end

	parent: detachable EXPR_ITEM
		note
			option: transient
		attribute
		end

feature -- Conversion

	as_string: STRING
			-- output expression as a string
		deferred
		end

feature -- Modification

	set_parent (an_expr_item: EXPR_ITEM)
		do
			parent := an_expr_item
		end

invariant
	Type_valid: not type.is_empty

end


