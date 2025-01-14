note
	component:   "openEHR ADL Tools"
	description: "Persistent form of ASSERTION."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_ASSERTION

inherit
	P_DEFINITIONS
		export {NONE}
			all
		end

create
	make

feature -- Initialisation

	make (an_ass: ASSERTION)
		do
			tag := an_ass.tag
			expression := expression_to_p_expression (an_ass.expression)
			type := {OPERATOR_TYPES}.op_type_boolean
		end

feature -- Access

	tag: detachable STRING
			-- tag name of assertion

	expression: P_EXPRESSION
		attribute
			create {P_EXPR_LITERAL} Result
		end

	type: STRING
        attribute
            create Result.make_empty
        end

feature -- Factory

	create_assertion: ASSERTION
		do
			if attached tag as att_tag then
				create Result.make_with_tag (expression.create_expression, att_tag)
			else
				create Result.make (expression.create_expression)
			end
		end

end


