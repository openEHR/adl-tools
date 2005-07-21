indexing
	component:   "openEHR Archetype Project"
	description: "leaf OBJECT item in an dADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DT_OBJECT_ITEM

inherit
	DT_ITEM
		undefine
			is_equal
		redefine
			parent, representation
		end
		
	COMPARABLE

feature -- Definitions

	Anonymous_node_id: STRING is "unknown"

	Unknown_type_name: STRING is "UNKNOWN"

feature -- Access

	node_id: STRING is
			-- locally unique node id
		do
			Result := representation.node_id
		end

	parent: DT_ATTRIBUTE_NODE
			-- parent of all object types must be a REL_NODE

	rm_type_name: STRING
			-- reference model type name of object to instantiate - can only be determined by inference
			-- from inspecting oject model - not from parsing dADL text

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- compare based on node_id
		do
			Result := node_id < other.node_id
		end
		
feature -- Status Report

	is_typed: BOOLEAN is
			-- True if this node has a known type
		do
			Result := not rm_type_name.is_equal(Unknown_type_name)
		end		

	type_visible: BOOLEAN
			-- True if type names are to be shown in serialised forms
			
feature -- Modification

	set_node_id(a_node_id:STRING) is
			-- set node id
		require
			Node_id_valid: a_node_id /= Void and then not a_node_id.is_empty
		do
			representation.set_node_id(a_node_id)
		end

	set_type_name(a_type_name:STRING) is
			-- set type name
		require
			Type_name_valid: a_type_name /= Void and then not a_type_name.is_empty
		do
			rm_type_name := a_type_name
		end

	show_type is
			-- show type of this object in generated form like dADL
		do
			type_visible := True
		end
		
feature -- Conversion

	as_object(a_type_id: INTEGER): ANY is
			-- make an object whose classes and attributes correspond to the structure 
			-- of this DT_OBJECT
		require
			a_type_id >= 0
		deferred	
		end

feature -- Representation

	representation: OG_OBJECT
	
invariant
	Type_name_valid: rm_type_name /= Void and then not rm_type_name.is_empty
	Node_id_exists: node_id /= Void and then not node_id.is_empty
	
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
--| The Original Code is dadl_object_item.e.
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
