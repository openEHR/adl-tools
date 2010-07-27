note
	component:   "openEHR Archetype Project"
	description: "[
			 Abstract parent type of domain specific constraint types. This
			 type guarantees that any descendant can be converted to a standard
			 ADL object form, consisting of a network of C_COMPLEX_OBJECT and 
			 C_ATTRIBUTE instances.
			 ]"
	keywords:    "test, ADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_DOMAIN_TYPE

inherit
	C_LEAF_OBJECT
		redefine
			default_create, representation, enter_subtree, exit_subtree, node_id
		end

	DT_CONVERTIBLE
		undefine
			default_create
		redefine
			synchronise_to_tree, finalise_dt
		end

feature -- Initialisation

	default_create
			-- set `rm_type_name' from typename of this object
		do
			rm_type_name := generator.substring (3, generator.count)
			create representation.make_anonymous(Current)
			create node_id.make_empty
		end

feature -- Initialisation

	make
		do
			default_create
		ensure
			Any_allowed: any_allowed
		end

	make_dt
			-- make used by DT_OBJECT_CONVERTER
		do
			make
		ensure then
			Any_allowed: any_allowed
		end

feature -- Finalisation

	finalise_dt
			-- used by DT_OBJECT_CONVERTER
		do
			if node_id /= Void and not node_id.is_empty then
				create representation.make(node_id, Current)
			else
				create representation.make_anonymous (Current)
			end
		end

feature -- Access

	node_id: STRING

feature -- Conversion

	standard_equivalent: C_COMPLEX_OBJECT
			-- standard equivalent constraint form for this subtype
		deferred
		end

feature -- Representation

	representation: attached OG_OBJECT_LEAF

feature -- Synchronisation

	synchronise_to_tree
			-- synchronise to parse tree representation
		do
			precursor
			dt_representation.set_type_visible
			if node_id = Void or node_id.is_empty then
				dt_representation.remove_attribute ("node_id")
			end
		end

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			synchronise_to_tree
			precursor(visitor, depth)
			visitor.start_c_domain_type(Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor(visitor, depth)
			visitor.end_c_domain_type(Current, depth)
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
--| The Original Code is cadl_object_term.e.
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
