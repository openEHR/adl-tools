indexing
	component:   "openEHR Archetype Project"
	description: "[
		`	 Archetype node populator: when an archetype is read in,
			 its nodes need to be included in the Java interface Hash
			 map, keyed by integer handle ids.
			 ]"
	keywords:    "archetype, constraint, definition"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ARCHETYPE_NODE_POPULATOR
   
inherit
	SHARED_ADL_OBJECTS
		export
			{NONE} all
		end
	
	CONSTRAINT_MODEL_TREE_ITERATOR

create
	make

feature -- Initialisation

	make(a_target: C_COMPLEX_OBJECT) is 
			-- create a new manager targetted to the parse tree `a_target'
		require
			Target_exists: a_target /= Void
		do
			set_target(a_target)
		end

feature -- Access

	root_handle: INTEGER
			-- handle of root node
			
feature {NONE} -- Implementation
	
	node_enter_action(a_node: OG_ITEM; indent_level: INTEGER) is
		local
			l_c_object: C_OBJECT
			l_c_complex_object: C_COMPLEX_OBJECT
			l_handle: INTEGER
			--l_c_attribute: C_ATTRIBUTE
			l_c_primitive_object: C_PRIMITIVE_OBJECT
			l_c_quantity: C_QUANTITY
			l_c_coded_term: C_CODED_TERM
		do
			-- What needs to be done here will be some flow control, to determine what type the incoming object is
			-- and to add it to the appropriate hash table, at the moment C_COMPLEX_OBJECT and to a nominal extent
			-- C_PRIMITIVE_OBJECT are incorporated, others are placed as C_OBJECTS
			l_c_object ?= a_node.content_item
			
			if l_c_object /= Void then
				l_handle := adl_objects.new_handle
				if l_c_object.generating_type.is_equal ("C_COMPLEX_OBJECT") then
					l_c_complex_object ?= l_c_object
					if l_c_complex_object /= Void then
						if root_handle = 0 then
							root_handle := l_handle
						end
						put_c_complex_object(l_c_complex_object, l_handle)
						from 
							l_c_complex_object.attributes.start
						until
							l_c_complex_object.attributes.off
						loop
							put_c_attribute(l_c_complex_object.attributes.item, adl_objects.new_handle)
							l_c_complex_object.attributes.forth
						end
					end
				elseif l_c_object.generating_type.is_equal ("C_PRIMITIVE_OBJECT") then
					l_c_primitive_object ?= l_c_object
					if l_c_primitive_object /= Void then
						put_c_primitive_object(l_c_primitive_object, l_handle)
						put_c_primitive(l_c_primitive_object.item, adl_objects.new_handle)
						-- Simply adding primitive may not be enough, need to determine the sort of primitive too
						-- as for the C_INTEGER, a handle for its INTEGER_INTERVAL will also be required, for
						-- example, but this could handled in the factory
					end
				elseif l_c_object.generating_type.is_equal ("C_QUANTITY") then
					l_c_quantity ?= l_c_object
					if l_c_quantity /= Void then
						put_c_quantity(l_c_quantity, l_handle)
						-- TODO: Add code to add all the C_QUANTITY_ITEM in its list, requires new hash table
						from
							l_c_quantity.list.start
						until
							l_c_quantity.list.exhausted
						loop
							put_c_quantity_item(l_c_quantity.list.item, adl_objects.new_handle)
							l_c_quantity.list.forth
						end
					end
				elseif l_c_object.generating_type.is_equal ("C_CODED_TERM") then
					l_c_coded_term ?= l_c_object
					if l_c_coded_term /= Void then
						put_c_coded_term(l_c_coded_term, l_handle)
					end					
				else
					-- if it is not a c_complex_object, could still be something else, certainly
					-- a c_object, possibly extend it here to handle all potential types, at the moment
					-- just adding as c_object
					put_c_object(l_c_object, l_handle)
				end
				
			end
		end

	node_exit_action(a_node: OG_ITEM; indent_level: INTEGER) is
		do
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
--| The Original Code is cadl_serialiser_mgr.e.
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
