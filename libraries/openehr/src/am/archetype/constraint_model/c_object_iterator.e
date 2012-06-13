note
	component:   "openEHR Archetype Project"
	description: "[
				 Tree iterator for C_OBJECT structures. This iterator currently supplies the standard 'do_all'
				 function which performs an action on entry to each node, descends, and then performs
				 an action on exiting each node; there are two agent actions supplied: node_enter_action
				 and node_exit_action. This allows signficantly more power than just a single action per 
				 node type.
				 
				 It also supports a more esoteric iteration function called do_at_surface, which iterates
				 from the top until a 'surface' of nodes is hit (which test true according to the supplied
				 'is_at_surface' agent); performs a single action to each such node, and does not continue
				 past these nodes.
				 ]"
	keywords:    "c_object, recursive iterator"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_OBJECT_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: attached C_COMPLEX_OBJECT)
		do
			target := a_target
		end

feature -- Access

	target: C_COMPLEX_OBJECT

feature -- Traversal

	do_all (node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			depth := 0
			do_all_nodes (target, node_enter_action, node_exit_action)
		end

	do_at_surface (node_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT]];
				node_is_at_surface: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN])
			-- Do action only to nodes at surface, where membership is defined by `node_is_at_surface'.
		do
			do_at_surface_nodes (target, node_action, node_is_at_surface)
		end

	do_until_surface (node_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT]];
				node_is_at_surface: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN])
			-- Do action only to nodes from top until surface (inclusive), where membership is defined by `node_is_at_surface'.
		do
			do_until_surface_nodes (target, node_action, node_is_at_surface)
		end

feature {NONE} -- Implementation

	do_all_nodes (a_target: attached ARCHETYPE_CONSTRAINT; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT]])
		local
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
		do
			depth := depth + 1

			-- node entry
			node_enter_action.call ([a_target, depth])

			-- main recursion
			if attached {C_COMPLEX_OBJECT} a_target as cco then
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

			-- node exit
			node_exit_action.call ([a_target, depth])
			depth := depth - 1
		end

	do_at_surface_nodes (a_target: attached ARCHETYPE_CONSTRAINT; 
				node_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT]];
				node_is_at_surface: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN])
			-- Do action only to nodes at surface, where membership is defined by `node_is_at_surface'.
		do
			if node_is_at_surface.item ([a_target]) then
				node_action.call ([a_target])
			else -- haven't hit the surface yet, descend...
				if attached {C_COMPLEX_OBJECT} a_target as cco then
					from cco.attributes.start until cco.attributes.off loop
						do_at_surface_nodes (cco.attributes.item, node_action, node_is_at_surface)
						cco.attributes.forth
					end
				elseif attached {C_ATTRIBUTE} a_target as ca then
					from ca.children.start until ca.children.off loop
						do_at_surface_nodes (ca.children.item, node_action, node_is_at_surface)
						ca.children.forth
					end
				end
			end
		end

	do_until_surface_nodes (a_target: attached ARCHETYPE_CONSTRAINT;
				node_action: PROCEDURE [ANY, TUPLE [ARCHETYPE_CONSTRAINT]];
				node_is_at_surface: FUNCTION [ANY, TUPLE [ARCHETYPE_CONSTRAINT], BOOLEAN])
			-- Do action only to nodes from top down to surface, where membership is defined by `node_is_at_surface'.
		do
			if node_is_at_surface.item ([a_target]) then
				node_action.call ([a_target])
				if attached {C_COMPLEX_OBJECT} a_target as cco then
					from cco.attributes.start until cco.attributes.off loop
						do_until_surface_nodes (cco.attributes.item, node_action, node_is_at_surface)
						cco.attributes.forth
					end
				elseif attached {C_ATTRIBUTE} a_target as ca then
					from ca.children.start until ca.children.off loop
						do_until_surface_nodes (ca.children.item, node_action, node_is_at_surface)
						ca.children.forth
					end
				end
			end
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
