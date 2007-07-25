indexing
	component:   "openEHR Archetype Project"
	description: "Test case for archetype definition modification"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ARCHETYPE_ADD_NODES

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

	title: STRING is "Test Archetype Add definition nodes"

	prereqs: ARRAY[STRING] is
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute is
		local
			a_code: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
			cf: CONSTRAINT_MODEL_FACTORY
			an_attr_node, top_items_node: C_ATTRIBUTE
			an_obj_node, obj_node2, neonate_section_node, mother_section_node: C_COMPLEX_OBJECT
			a_simple_node: C_PRIMITIVE_OBJECT
			a_term_node: C_CODE_PHRASE
			an_assertion: ASSERTION
			id_expr_leaf, id_pattern_expr_leaf: EXPR_LEAF
			match_op: EXPR_BINARY_OPERATOR
			an_arch_slot: ARCHETYPE_SLOT
		do
			archetype := adl_interface.archetype
			cf := adl_interface.constraint_model_factory

			-- add name node
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "name")
			an_obj_node := cf.create_c_complex_object_anonymous (an_attr_node, "CODED_TEXT")
			an_attr_node := cf.create_c_attribute_single (an_obj_node, "code")
			a_term_node := cf.create_c_code_phrase_from_pattern (an_attr_node, "local::at0000")

			-- add items node
			top_items_node := cf.create_c_attribute_multiple (archetype.definition, "items", cf.create_cardinality_make_upper_unbounded (0))

			-- add neonate term
			a_code := ontology.new_non_specialised_term_code
			create a_term.make(a_code)
			a_term.add_item("text", "neonate")
			a_term.add_item("description", "newborn child")
			ontology.add_term_definition("en", a_term)

			-- add neonate subsection
			neonate_section_node := cf.create_c_complex_object_identified (top_items_node, "SECTION", a_code)
			an_attr_node := cf.create_c_attribute_single (neonate_section_node, "name")
			obj_node2 := cf.create_c_complex_object_anonymous (an_attr_node, "CODED_TEXT")
			an_attr_node := cf.create_c_attribute_single (obj_node2, "code")
			a_term_node := cf.create_c_code_phrase_from_pattern (an_attr_node, "local::" + a_code)

			an_attr_node := cf.create_c_attribute_multiple (neonate_section_node, "items", cf.create_cardinality_make_upper_unbounded (0))
			an_arch_slot := cf.create_archetype_slot_anonymous (an_attr_node, "OBSERVATION")
			an_arch_slot.set_occurrences(cf.create_integer_interval_make_upper_unbounded (0, True))

			-- make assertions for slot
			id_expr_leaf := cf.create_expr_leaf_archetype_ref ("id")
			id_pattern_expr_leaf := cf.create_expr_leaf_constraint (create {C_STRING}.make_from_regexp("openehr-ehr-observation\..*\..*", True))
			match_op := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_matches), id_expr_leaf, id_pattern_expr_leaf)
			an_assertion := cf.create_assertion (match_op, Void)
			an_arch_slot.add_include(an_assertion)

			-- add mother term
			a_code := ontology.new_non_specialised_term_code
			create a_term.make(a_code)
			a_term.add_item("text", "mother")
			a_term.add_item("description", "mother of newborn child")
			ontology.add_term_definition("en", a_term)

			-- add mother subsection
			mother_section_node := cf.create_c_complex_object_identified (top_items_node, "SECTION", a_code)
			an_attr_node := cf.create_c_attribute_single (mother_section_node, "name")
			obj_node2 := cf.create_c_complex_object_anonymous (an_attr_node, "CODED_TEXT")
			an_attr_node := cf.create_c_attribute_single (obj_node2, "code")
			a_term_node := cf.create_c_code_phrase_from_pattern (an_attr_node, "local::" + a_code)

			an_attr_node := cf.create_c_attribute_multiple (mother_section_node, "items", cf.create_cardinality_make_upper_unbounded (0))
			an_arch_slot := cf.create_archetype_slot_anonymous (an_attr_node, "OBSERVATION")
			an_arch_slot.set_occurrences(cf.create_integer_interval_make_upper_unbounded (0, True))

			-- add assertions for slot
			id_expr_leaf := cf.create_expr_leaf_archetype_ref ("id")
			id_pattern_expr_leaf := cf.create_expr_leaf_constraint (create {C_STRING}.make_from_regexp("openehr-ehr-observation\..*\..*", True))
			match_op := cf.create_expr_binary_operator_node (create {OPERATOR_KIND}.make(op_matches), id_expr_leaf, id_pattern_expr_leaf)
			an_assertion := cf.create_assertion (match_op, Void)
			an_arch_slot.add_include(an_assertion)

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
