note
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


class C_ARCHETYPE_NODE_POPULATOR

inherit
	SHARED_ADL_OBJECTS
		export
			{NONE} all
		end

	C_ITERATOR
		rename
			make as make_iterator
		redefine
			node_enter_action,
			node_exit_action
		end

create
	make

feature -- Initialisation

	make(a_target: C_COMPLEX_OBJECT)
			-- create a new manager targetted to the parse tree `a_target'
		require
			Target_exists: a_target /= Void
		do
			make_iterator (a_target)
			-- FIXME: A visitor is needed for the second argument, and node_enter_action below should be reconsidered.
		end

feature -- Access

	root_handle: INTEGER
			-- handle of root node

feature {NONE} -- Implementation

	node_enter_action(a_node: OG_ITEM; indent_level: INTEGER)
		local
			l_c_object: C_OBJECT
			l_c_complex_object: C_COMPLEX_OBJECT
			l_handle: INTEGER
			l_c_attribute: C_ATTRIBUTE
		do
			l_c_object ?= a_node.content_item
			if l_c_object /= Void then
				l_handle := adl_objects.new_handle
			--	put_c_object(l_c_object, l_handle)
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
			end
		end

	node_exit_action(a_node: OG_ITEM; indent_level: INTEGER)
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
