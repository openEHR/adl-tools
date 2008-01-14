indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype cross-reference table validator. The ARCHEYPE class has a number of
				 xref tables it uses to keep track of the codes in the ontology and where they
				 are used in the archetype definition; these tables are used to test validity,
				 e.g. if a code is mentioned in the definition but not defined in the ontology
				 etc. This object is used in a traversal to populate the xref tables.
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_XREF_BUILDER

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			start_c_complex_object, start_archetype_slot, start_archetype_internal_ref,
			start_constraint_ref, start_c_code_phrase, start_c_ordinal
		end

feature -- Initialisation

	initialise(an_archetype: ARCHETYPE) is
			-- set ontology required for interpreting meaning of object nodes
			-- archetype is required as well since it contains the xref tables that are
			-- populated by this visitor
		require
			Archetype_valid: an_archetype /= Void
		do
			archetype := an_archetype
			initialise_visitor(archetype.ontology)
		end

feature -- Visitor

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- enter an C_COMPLEX_OBJECT
		do
			if a_node.is_addressable then
				if not archetype.id_at_codes_xref_table.has(a_node.node_id) then
					archetype.id_at_codes_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_node.node_id)
				end
				archetype.id_at_codes_xref_table.item(a_node.node_id).extend(a_node)
			end
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- enter an ARCHETYPE_SLOT
		do
			if a_node.is_addressable then
				if not archetype.id_at_codes_xref_table.has(a_node.node_id) then
					archetype.id_at_codes_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_node.node_id)
				end
				archetype.id_at_codes_xref_table.item(a_node.node_id).extend(a_node)
			end
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- enter an ARCHETYPE_INTERNAL_REF
		do
			if not archetype.use_node_path_xref_table.has(a_node.target_path) then
				archetype.use_node_path_xref_table.put(create {ARRAYED_LIST[ARCHETYPE_INTERNAL_REF]}.make(0), a_node.target_path)
			end
			archetype.use_node_path_xref_table.item(a_node.target_path).extend(a_node)
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- enter a CONSTRAINT_REF
		do
			if not archetype.ac_codes_xref_table.has(a_node.target) then
				archetype.ac_codes_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_node.target)
			end
			archetype.ac_codes_xref_table.item(a_node.target).extend(a_node)
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- enter an C_CODE_PHRASE
		do
			if not a_node.any_allowed and then (a_node.is_local and a_node.code_count > 0) then
				from
					a_node.code_list.start
				until
					a_node.code_list.off
				loop
					if not archetype.data_at_codes_xref_table.has(a_node.code_list.item) then
						archetype.data_at_codes_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_node.code_list.item)
					end
					archetype.data_at_codes_xref_table.item(a_node.code_list.item).extend(a_node)
					a_node.code_list.forth
				end
			end
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- enter an C_DV_ORDINAL
		do
			if not a_node.any_allowed and then a_node.is_local then
				from
					a_node.items.start
				until
					a_node.items.off
				loop
					if not archetype.data_at_codes_xref_table.has(a_node.items.item.symbol.code_string) then
						archetype.data_at_codes_xref_table.put(create {ARRAYED_LIST[C_OBJECT]}.make(0), a_node.items.item.symbol.code_string)
					end
					archetype.data_at_codes_xref_table.item(a_node.items.item.symbol.code_string).extend(a_node)
					a_node.items.forth
				end
			end
		end

feature {NONE} -- Implementation

	archetype: ARCHETYPE

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
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
