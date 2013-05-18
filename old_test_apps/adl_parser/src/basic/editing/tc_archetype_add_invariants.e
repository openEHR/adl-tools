note
	component:   "openEHR ADL Tools"
	description: "Test case for archetype definition modification"
	keywords:    "test, ADL, invariant, archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ARCHETYPE_ADD_INVARIANTS

inherit
	TEST_CASE
		export
			{NONE} all
		redefine
			prereqs
		end

	SHARED_TEST_ENV
		export
			{NONE} all
		end

	OPERATOR_TYPES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

   title: STRING = "Test Archetype add invariants"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute
		local
			archetype: ARCHETYPE
			cf: C_FACTORY
			an_assertion: ASSERTION
			id_expr_leaf1, id_expr_leaf2: EXPR_LEAF
			expr1, expr2, expr3: EXPR_BINARY_OPERATOR
		do
			archetype := archetype_compiler.archetype
			cf := archetype_compiler.constraint_model_factory

			-- expr 1: ordinal = 1
			id_expr_leaf1 := cf.create_expr_leaf_archetype_definition_ref ("/an_ordinal")
			id_expr_leaf2 := cf.create_expr_leaf_ordinal (create {ORDINAL}.make(1, create{CODE_PHRASE}.make_from_string("local::at0220")))
			expr1 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)

			-- expr 2: term = [openehr::253]
			id_expr_leaf1 := cf.create_expr_leaf_archetype_definition_ref ("/a_term")
			id_expr_leaf2 := cf.create_expr_leaf_coded_term (create{CODE_PHRASE}.make_from_string("openehr::253"))
			expr2 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)

			-- expr 1 implies expr 2
			expr3 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_implies), expr1, expr2)
			an_assertion := cf.create_assertion (expr3, "xx_validity")
			archetype.add_invariant(an_assertion)

			-- expr 1: ordinal = 2
			id_expr_leaf1 := cf.create_expr_leaf_archetype_definition_ref ("/an_ordinal")
			id_expr_leaf2 := cf.create_expr_leaf_ordinal (create {ORDINAL}.make(2, create{CODE_PHRASE}.make_from_string("local::at0221")))
			expr1 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)

			-- expr 2: term = [openehr::271]
			id_expr_leaf1 := cf.create_expr_leaf_archetype_definition_ref ("/a_term")
			id_expr_leaf2 := cf.create_expr_leaf_coded_term (create{CODE_PHRASE}.make_from_string("openehr::271"))
			expr2 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)

			-- expr 1 xor expr 2
			expr3 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_xor), expr1, expr2)
			an_assertion := cf.create_assertion (expr3, Void)
			archetype.add_invariant(an_assertion)


			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io.put_string (archetype.errors)
			end

		end

end

