indexing
	component:   "openEHR Archetype Project"
	description: "Test case for archetype definition modification"
	keywords:    "test, ADL, invariant, archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

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

	make(arg:ANY) is
	    do
	    end

feature -- Access

   title: STRING is "Test Archetype add invariants"

	prereqs: ARRAY[STRING] is 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute is
		local
			archetype: ARCHETYPE
			cf: CONSTRAINT_MODEL_FACTORY
			an_assertion: ASSERTION
			id_expr_leaf1, id_expr_leaf2: EXPR_LEAF
			expr1, expr2, expr3: EXPR_BINARY_OPERATOR
		do
			archetype := adl_interface.archetype
			cf := adl_interface.constraint_model_factory
			
			-- expr 1: ordinal = 1
			id_expr_leaf1 := cf.create_expr_leaf_object_ref ("/an_ordinal")
			id_expr_leaf2 := cf.create_expr_leaf_ordinal (create {ORDINAL}.make(1, create{CODE_PHRASE}.make_from_string("local::at0220")))
			expr1 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)

			-- expr 2: term = [openehr::253]
			id_expr_leaf1 := cf.create_expr_leaf_object_ref ("/a_term")
			id_expr_leaf2 := cf.create_expr_leaf_coded_term (create{CODE_PHRASE}.make_from_string("openehr::253"))
			expr2 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)
			
			-- expr 1 implies expr 2
			expr3 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_implies), expr1, expr2)
			an_assertion := cf.create_assertion (expr3, "xx_validity")
			archetype.add_invariant(an_assertion)

			-- expr 1: ordinal = 2
			id_expr_leaf1 := cf.create_expr_leaf_object_ref ("/an_ordinal")
			id_expr_leaf2 := cf.create_expr_leaf_ordinal (create {ORDINAL}.make(2, create{CODE_PHRASE}.make_from_string("local::at0221")))
			expr1 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)

			-- expr 2: term = [openehr::271]
			id_expr_leaf1 := cf.create_expr_leaf_object_ref ("/a_term")
			id_expr_leaf2 := cf.create_expr_leaf_coded_term (create{CODE_PHRASE}.make_from_string("openehr::271"))
			expr2 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_eq), id_expr_leaf1, id_expr_leaf2)
			
			-- expr 1 xor expr 2
			expr3 := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_xor), expr1, expr2)
			an_assertion := cf.create_assertion (expr3, Void)
			archetype.add_invariant(an_assertion)
			
			
			if archetype.is_valid then
				adl_interface.adl_engine.serialise (serialise_format)	
				io.put_string(adl_interface.adl_engine.serialised_archetype)	
			else
				io.put_string(archetype.errors)	
			end

		end
	
end

--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is tc_archetype_add_nodes.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
