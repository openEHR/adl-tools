note
	component:   "openEHR Archetype Project"
	description: "Tree iterator for OG structures that deploys a visitor on the OG node content property."
	keywords:    "archetype, constraint, definition"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005-2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safe:	 "yes, dirty"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OG_CONTENT_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: OG_OBJECT_NODE; a_visitor: ANY)
			-- create a new manager targetted to the parse tree `a_target'
		require
			Target_exists: a_target /= Void
			Visitor_exists: a_visitor /= Void
		do
			create tree_iterator.make (a_target)
			visitor := a_visitor
		end

feature -- Command

	do_all
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			tree_iterator.do_all (agent node_enter_action (?,?), agent node_exit_action (?,?))
		end

feature {NONE} -- Implementation

	tree_iterator: OG_ITERATOR

	visitor: ANY

	node_enter_action (a_node: OG_ITEM; indent_level: INTEGER)
		require
			Node_exists: a_node /= Void
		do
			a_node.enter_subtree (visitor, indent_level)
		end

	node_exit_action (a_node: OG_ITEM; indent_level: INTEGER)
		require
			Node_exists: a_node /= Void
		do
			a_node.exit_subtree (visitor, indent_level)
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
