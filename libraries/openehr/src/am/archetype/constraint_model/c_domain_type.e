note
	component:   "openEHR Archetype Project"
	description: "[
			 Abstract parent type of domain specific constraint types. This
			 type guarantees that any descendant can be converted to a standard
			 ADL object form, consisting of a network of C_COMPLEX_OBJECT and 
			 C_ATTRIBUTE instances.
			 ]"
	keywords:    "test, ADL"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class C_DOMAIN_TYPE

inherit
	C_LEAF_OBJECT
		rename
			safe_deep_twin as c_safe_deep_twin
		redefine
			enter_subtree, exit_subtree, node_id, rm_type_name
		end

	DT_CONVERTIBLE
		redefine
			synchronise_to_tree, finalise_dt, safe_deep_twin
		end

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make used by DT_OBJECT_CONVERTER
		do
		end

feature -- Finalisation

	finalise_dt
			-- used by DT_OBJECT_CONVERTER
		do
			if attached node_id as nid and then not nid.is_empty then
				create representation_cache.make (nid)
			else
				create representation_cache.make_anonymous
			end
			representation.set_content (Current)
		end

feature -- Access

	rm_type_name: STRING
			-- type name from reference model, of object to instantiate
		attribute
			create Result.make_from_string (generator.substring (3, generator.count))
		end

	node_id: STRING
		attribute
			create Result.make_empty
		end

feature -- Statistics

	constrained_rm_attributes: ARRAYED_SET [STRING]
			-- report which attributes of the equivalent RM type are being constrained here
		deferred
		end

feature -- Conversion

	standard_equivalent: C_COMPLEX_OBJECT
			-- standard equivalent constraint form for this subtype
		deferred
		end

feature -- Duplication

	safe_deep_twin: like Current
		local
			dt_c_obj: detachable DT_COMPLEX_OBJECT_NODE
		do
			if attached dt_representation as dt_co then
				dt_c_obj := dt_co
				dt_representation := Void
			end
			Result := c_safe_deep_twin
			if attached dt_c_obj as dt_co then
				dt_representation := dt_co
			end
		end

feature -- Synchronisation

	synchronise_to_tree
			-- synchronise to parse tree representation
		do
			precursor
			if attached dt_representation as dt_rep then
				dt_rep.set_type_visible
				if not attached node_id or else attached node_id as nid and then nid.is_empty then
					if dt_rep.has_attribute ("node_id") then
						dt_rep.remove_attribute ("node_id")
					end
				end
			end
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			synchronise_to_tree
			precursor (visitor, depth)
			visitor.start_c_domain_type (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_c_domain_type (Current, depth)
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
