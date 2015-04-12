note
	component:   "openEHR ADL Tools"
	description: "Abstract parent of all rule entities"
	keywords:    "expression"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class RULE_ELEMENT

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

	parent: detachable RULE_ELEMENT
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

	set_parent (an_expr_item: like parent)
		do
			parent := an_expr_item
		end

invariant
	Type_valid: not type.is_empty

end


