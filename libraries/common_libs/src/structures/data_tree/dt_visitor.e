indexing
	component:   "openEHR Archetype Project"
	description: "Visitor template for Data Tree structures"
	keywords:    "visitor, Data Tree"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DT_VISITOR

feature -- Visitor

	start_complex_object_node(a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER) is
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		deferred
		end

	end_complex_object_node(a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER) is
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		deferred
		end

	start_attribute_node(a_node: DT_ATTRIBUTE_NODE; depth: INTEGER) is
			-- start serialising an DT_ATTRIBUTE_NODE
		deferred
		end

	end_attribute_node(a_node: DT_ATTRIBUTE_NODE; depth: INTEGER) is
			-- end serialising an DT_ATTRIBUTE_NODE
		deferred
		end

	start_primitive_object(a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- start serialising a DT_OBJECT_SIMPLE
		deferred
		end

	end_primitive_object(a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- end serialising a DT_OBJECT_SIMPLE
		deferred
		end

	start_primitive_object_list(a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER) is
			-- start serialising an DT_OBJECT_SIMPLE_LIST
		deferred
		end

	end_primitive_object_list(a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER) is
			-- end serialising an DT_OBJECT_SIMPLE_LIST
		deferred
		end

	start_primitive_object_interval(a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER) is
			-- start serialising a DT_OBJECT_SIMPLE
		deferred
		end

	end_primitive_object_interval(a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER) is
			-- end serialising a DT_OBJECT_SIMPLE
		deferred
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
--| The Original Code is dt_visitor.e.
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
