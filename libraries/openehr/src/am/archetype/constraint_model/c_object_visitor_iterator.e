note
	component:   "openEHR Archetype Project"
	description: "[
				 Tree iterator for C_OBJECT structures. This iterator supplies the standard 'do_all'
				 function which performs an action on entry to each node, descends, and then performs
				 an action on exiting each node; there are two agent actions supplied: node_enter_action
				 and node_exit_action.
				 ]"
	keywords:    "c_object, recursive iterator"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_OBJECT_VISITOR_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: attached C_COMPLEX_OBJECT; a_visitor: C_VISITOR;
			differential_view_flag, visit_rm_nodes_flag: BOOLEAN; an_rm_schema: BMM_SCHEMA)
		do
			target := a_target
			visitor := a_visitor
			visit_rm_nodes := visit_rm_nodes_flag
			differential_view := differential_view_flag
			rm_schema := an_rm_schema
		end

feature -- Access

	target: C_COMPLEX_OBJECT

	visitor: C_VISITOR

	rm_schema: BMM_SCHEMA

feature -- Status Report

	visit_rm_nodes: BOOLEAN

	differential_view: BOOLEAN

feature -- Traversal

	do_all
			-- do enter_action and exit_action to all nodes in the structure
		do
			depth := 0
			do_all_nodes (target)
		end

feature {NONE} -- Implementation

	c_visitor_enter (a_node: ARCHETYPE_CONSTRAINT; indent_level: INTEGER)
		require
			Node_exists: a_node /= Void
		do
			a_node.enter_subtree (visitor, indent_level)
		end

	c_visitor_exit (a_node: ARCHETYPE_CONSTRAINT; indent_level: INTEGER)
		require
			Node_exists: a_node /= Void
		do
			a_node.exit_subtree (visitor, indent_level)
		end

	do_all_nodes (a_target: attached ARCHETYPE_CONSTRAINT)
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			last_cco: C_COMPLEX_OBJECT
		do
			depth := depth + 1

			-- node entry
			c_visitor_enter (a_target, depth)

			-- main recursion
			if attached {C_COMPLEX_OBJECT} a_target as cco then
				last_cco := cco
				from cco.attributes.start until cco.attributes.off loop
					do_all_nodes (cco.attributes.item)
					cco.attributes.forth
				end
			elseif attached {C_ATTRIBUTE} a_target as ca then
				from ca.children.start until ca.children.off loop
					do_all_nodes (ca.children.item)
					ca.children.forth
				end
			end

			-- deal with RM visitor functions
			if visit_rm_nodes and then attached {C_OBJECT} a_target as co then
				if rm_schema.has_class_definition (co.rm_type_name) then
					visitor.do_rm_class (rm_schema.class_definition (co.rm_type_name), co, depth)
					if differential_view then
						props := rm_schema.class_definition (co.rm_type_name).properties
					else
						props := rm_schema.class_definition (co.rm_type_name).flat_properties
					end
					from props.start until props.off loop
						visitor.do_rm_property (props.item_for_iteration, co, depth)
						props.forth
					end
				end
			end

			-- node exit
			c_visitor_exit (a_target, depth)
			depth := depth - 1
		end

	depth: INTEGER

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
--| The Original Code is og_iterator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2011
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
