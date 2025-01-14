note
	component:   "openEHR ADL Tools"
	description: "Persistent form of EXPR_LITERAL."
	keywords:    "persistence, ADL"
	author:      "Thomas Beale <thomas.beale@openEHR.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2025 openEHR International"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class P_EXPR_LITERAL

inherit
	P_EXPR_LEAF

create
	make, default_create

feature -- Initialisation

	make (a_literal: EXPR_LITERAL)
			-- node is a boolean value
   		do
			item := a_literal.item
			type := a_literal.type
		end

feature -- Access

	item: ANY
		attribute
			Result := 0
		end

feature -- Factory

	create_expression: EXPR_LITERAL
		do
			if attached {BOOLEAN} item as bool then
				create Result.make_boolean (bool)

			elseif attached {REAL} item as r then
				create Result.make_real (r)

			elseif attached {INTEGER} item as i then
				create Result.make_integer (i)

			elseif attached {STRING} item as s then
				create Result.make_string (s)

			elseif attached {CHARACTER} item as c then
				create Result.make_character (c)
			else
				create Result.make_boolean (False)
			end
		end

end


