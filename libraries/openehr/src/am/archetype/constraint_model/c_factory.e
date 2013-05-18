note
	component:   "openEHR Archetype Project"
	description: "Factory class for archetype constraint definition"
	keywords:    "archetype constraint definition"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"


class C_FACTORY

inherit
	C_PRIMITIVE_FACTORY

	ASSERTION_FACTORY

	OG_PATH_TOOLS
		export
			{NONE} all
			{ANY} valid_path_string, path_parse_error
		end

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Factory

	create_c_complex_object_identified (a_parent: C_ATTRIBUTE; a_type_name, a_node_id: STRING): C_COMPLEX_OBJECT
			-- create a new identified object node
		require
			type_name_valid: not a_type_name.is_empty
			node_id_valid: not a_parent.has_child_with_id (a_node_id)
		do
			create Result.make_identified (a_type_name, a_node_id)
			a_parent.put_child (Result)
		end

	create_c_complex_object_anonymous (a_parent: C_ATTRIBUTE; a_type_name: STRING): C_COMPLEX_OBJECT
			-- create a new non-identified object node
		require
			type_name_valid: not a_type_name.is_empty
		do
			create Result.make_anonymous(a_type_name)
			a_parent.put_child (Result)
		end

	create_archetype_slot_anonymous (a_parent: C_ATTRIBUTE; a_type_name: STRING): ARCHETYPE_SLOT
			-- create a new non-identified archetype slot
		require
			type_name_valid: not a_type_name.is_empty
		do
			create Result.make_anonymous(a_type_name)
			a_parent.put_child (Result)
		end

	create_archetype_slot_identified (a_parent: C_ATTRIBUTE; a_type_name, a_node_id: STRING): ARCHETYPE_SLOT
			-- create a new non-identified archetype slot
		require
			type_name_valid: not a_type_name.is_empty
		do
			create Result.make_identified (a_type_name, a_node_id)
			a_parent.put_child (Result)
		end

	create_c_attribute_single (a_parent: C_COMPLEX_OBJECT; an_attr_name: STRING): C_ATTRIBUTE
			-- create a single-valued C_ATTRIBUTE node
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			create Result.make_single(an_attr_name, Void)
			a_parent.put_attribute(Result)
		end

	create_c_attribute_multiple (a_parent: C_COMPLEX_OBJECT; an_attr_name: STRING): C_ATTRIBUTE
			-- create a container C_ATTRIBUTE node
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			create Result.make_multiple(an_attr_name, Void, Void)
			a_parent.put_attribute(Result)
		end

	create_c_primitive_object (a_parent: C_ATTRIBUTE; an_item: C_PRIMITIVE): C_PRIMITIVE_OBJECT
			-- an_item is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN
		do
			create Result.make(an_item)
			a_parent.put_child (Result)
		end

	create_archetype_internal_ref (a_parent: C_ATTRIBUTE; a_type_name:STRING; a_path: STRING): ARCHETYPE_INTERNAL_REF
			-- create a "use" node
		require
			a_type_name_valid: not a_type_name.is_empty
		do
			create Result.make(a_type_name, a_path)
			a_parent.put_child (Result)
		end

	create_c_code_phrase_from_pattern (a_parent: C_ATTRIBUTE; a_term_constraint: STRING): C_CODE_PHRASE
			-- create a "term" node from term in string form "terminology(version)::code_phrase, code_phrase, ..."
		require
			term_constraint_valid: not a_term_constraint.is_empty
		do
			create Result.make_from_pattern(a_term_constraint)
			a_parent.put_child (Result)
		end

	create_constraint_ref (a_parent: C_ATTRIBUTE; a_code: STRING): CONSTRAINT_REF
			-- create a "term" node from term in string form "ac0039"
		require
			code_valid: not a_code.is_empty
		do
			create Result.make (a_code)
			a_parent.put_child (Result)
		end

	create_c_dv_ordinal (a_parent: C_ATTRIBUTE): C_DV_ORDINAL
			-- create an empty "ordinal" node.
			-- Populate it using create_ordinal in this factory, then
			-- C_DV_ORDINAL.add_item(an_ordinal)
		do
			create Result.default_create
			a_parent.put_child (Result)
		end

	create_ordinal (a_value: INTEGER; a_symbol_code_phrase: STRING): ORDINAL
			-- create an ORDINAL from an integer value, and a symbol defined as a term
			-- string of the usual form, i.e. "terminology::code_string"
		require
			A_symbol_valid: not a_symbol_code_phrase.is_empty
		do
			create Result.make (a_value, create {CODE_PHRASE}.make_from_string(a_symbol_code_phrase))
		end

	create_c_dv_quantity (a_parent: C_ATTRIBUTE): C_DV_QUANTITY
			-- create an empty C_DV_QUANTITY node.
		require
			parent_valid: a_parent /= Void
		do
			create Result.default_create
			a_parent.put_child (Result)
		end

	create_cardinality_make_bounded (a_lower, an_upper: INTEGER): CARDINALITY
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make(create {MULTIPLICITY_INTERVAL}.make_bounded (a_lower, an_upper))
		end

	create_cardinality_make_upper_unbounded (a_lower: INTEGER): CARDINALITY
			-- create Result from `a_lower' to +infinity
		do
			create Result.make(create {MULTIPLICITY_INTERVAL}.make_upper_unbounded (a_lower))
		end

	create_cardinality_make_unbounded: CARDINALITY
			-- create Result as interval of 0 to +infinity
		do
			create Result.make(create {MULTIPLICITY_INTERVAL}.make_upper_unbounded (0))
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
--| The Original Code is cadl_factory.e.
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
