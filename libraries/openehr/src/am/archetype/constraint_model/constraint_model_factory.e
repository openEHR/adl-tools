indexing
	component:   "openEHR Archetype Project"
	description: "Factory class for archetype constraint definition"
	keywords:    "archetype constraint definition"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CONSTRAINT_MODEL_FACTORY

inherit
	C_PRIMITIVE_FACTORY

	ASSERTION_FACTORY

	OG_PATH_TOOLS
		export
			{NONE} all
			{ANY} valid_path_string, path_parse_error
		end
	
creation
	make

feature -- Initialisation
	
	make is
		do
		end

feature -- Factory

	create_c_complex_object_identified(a_parent:C_ATTRIBUTE; a_type_name, a_node_id:STRING): C_COMPLEX_OBJECT is
			-- create a new identified object node
		require
			parent_valid: a_parent /= Void
			type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
			node_id_valid: a_node_id /= Void and then not a_parent.has_child_node(a_node_id)
		do
			create Result.make_identified(a_type_name, a_node_id)
			a_parent.put_child(Result)
		end
			
	create_c_complex_object_anonymous(a_parent: C_ATTRIBUTE; a_type_name:STRING): C_COMPLEX_OBJECT is
			-- create a new non-identified object node
		require
			parent_valid: a_parent /= Void
			type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			create Result.make_anonymous(a_type_name)
			a_parent.put_child(Result)
		end
			
	create_archetype_slot_anonymous(a_parent: C_ATTRIBUTE; a_type_name:STRING): ARCHETYPE_SLOT is
			-- create a new non-identified archetype slot
		require
			parent_valid: a_parent /= Void
			type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			create Result.make_anonymous(a_type_name)
			a_parent.put_child(Result)
		end
			
	create_archetype_slot_identified(a_parent: C_ATTRIBUTE; a_type_name, a_node_id:STRING): ARCHETYPE_SLOT is
			-- create a new non-identified archetype slot
		require
			parent_valid: a_parent /= Void
			type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			create Result.make_identified(a_type_name, a_node_id)
			a_parent.put_child(Result)
		end
			
	create_c_attribute_single(a_parent: C_COMPLEX_OBJECT; an_attr_name: STRING): C_ATTRIBUTE is
			-- create a C_ATTRIBUTE node with a simple name like "text" or "description"
		require
			parent_valid: a_parent /= Void
			an_attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
		do
			create Result.make_single(an_attr_name)
			a_parent.put_attribute(Result)
		end

	create_c_attribute_multiple(a_parent: C_COMPLEX_OBJECT; an_attr_name: STRING; a_cardinality: CARDINALITY): C_ATTRIBUTE is
			-- create a C_ATTRIBUTE with a simple name like "text" or "description"
		require
			parent_valid: a_parent /= Void
			an_attr_name_valid: an_attr_name /= Void and then not an_attr_name.is_empty
			Cardinality_valid: a_cardinality /= Void
		do
			create Result.make_multiple(an_attr_name, a_cardinality)
			a_parent.put_attribute(Result)
		end

	create_c_primitive_object(a_parent: C_ATTRIBUTE; an_item: C_PRIMITIVE): C_PRIMITIVE_OBJECT is
			-- an_item is C_STRING, C_INTEGER, C_REAL, C_DOUBLE, C_BOOLEAN 
		require
			parent_valid: a_parent /= Void
			an_item_valid: an_item /= Void
		do
			create Result.make(an_item)
			a_parent.put_child(Result)
		end

	create_archetype_internal_ref(a_parent: C_ATTRIBUTE; a_type_name:STRING; a_path: STRING): ARCHETYPE_INTERNAL_REF is
			-- create a "use" node
		require
			parent_valid: a_parent /= Void
			a_type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
			a_path_valid: a_path /= Void
		do
			create Result.make(a_type_name, a_path)
			a_parent.put_child(Result)
		end
		
	create_c_code_phrase_from_pattern(a_parent: C_ATTRIBUTE; a_term_constraint: STRING): C_CODE_PHRASE is
			-- create a "term" node from term in string form "terminology(version)::code_phrase, code_phrase, ..."
		require
			parent_valid: a_parent /= Void
			term_constraint_valid: a_term_constraint /= Void and then not a_term_constraint.is_empty
		do
			create Result.make_from_pattern(a_term_constraint)
			a_parent.put_child(Result)
		end
		
	create_constraint_ref(a_parent: C_ATTRIBUTE; a_code: STRING): CONSTRAINT_REF is
			-- create a "term" node from term in string form "ac0039"
		require
			parent_valid: a_parent /= Void
			code_valid: a_code /= Void and then not a_code.is_empty
		do
			create Result.make(a_code)
			a_parent.put_child(Result)
		end
		
	create_c_dv_ordinal(a_parent: C_ATTRIBUTE): C_DV_ORDINAL is
			-- create an empty "ordinal" node.
			-- Populate it using create_ordinal in this factory, then
			-- C_DV_ORDINAL.add_item(an_ordinal)
		require
			parent_valid: a_parent /= Void
		do
			create Result.make
			a_parent.put_child(Result)
		end

	create_ordinal(a_value: INTEGER; a_symbol_code_phrase: STRING): ORDINAL is
			-- create an ORDINAL from an integer value, and a symbol defined as a term
			-- string of the usual form, i.e. "terminology::code_string"
		require
			A_symbol_valid: a_symbol_code_phrase /= Void and then not a_symbol_code_phrase.is_empty
		do
			create Result.make(a_value, create {CODE_PHRASE}.make_from_string(a_symbol_code_phrase))
		end
		
	create_c_dv_quantity(a_parent: C_ATTRIBUTE): C_DV_QUANTITY is
			-- create an empty C_DV_QUANTITY node.
		require
			parent_valid: a_parent /= Void
		do
			create Result.make
			a_parent.put_child(Result)
		end

	create_cardinality_make_bounded (a_lower, an_upper: INTEGER): CARDINALITY is
			-- create Result with both limits set
		require
			valid_order: a_lower <= an_upper
		do
			create Result.make(create {OE_INTERVAL[INTEGER]}.make_bounded(a_lower, an_upper, True, True))
		end

	create_cardinality_make_upper_unbounded (a_lower: INTEGER): CARDINALITY is
			-- create Result from `a_lower' to +infinity
		do
			create Result.make(create {OE_INTERVAL[INTEGER]}.make_upper_unbounded(a_lower, True))
		end

	create_cardinality_make_unbounded: CARDINALITY is
			-- create Result as interval of 0 to +infinity
		do
			create Result.make(create {OE_INTERVAL[INTEGER]}.make_upper_unbounded(0, True))
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
