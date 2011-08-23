note
	component:   "openEHR Archetype Project"
	description: "Class map control - Visualise a reference model class as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_CLASS_TOOL_INHERITANCE_VIEW

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

--	BMM_DEFINITIONS
--		export
--			{NONE} all
--		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

--	CONSTANTS
--		export
--			{NONE} all
--		end

create
	make

feature -- Definitions

	Default_closure_depth: INTEGER = 2
			-- default depth to explore supplier closure

feature -- Initialisation

	make
		do
			-- create widgets
			create ev_root_container

			-- connect widgets

			-- visual characteristics

			-- set events
		end

feature -- Access

	ev_root_container: EV_TREE

feature -- Events

feature -- Commands

	clear
		do
 			ev_root_container.wipe_out
		end

	populate (a_class_def: attached BMM_CLASS_DEFINITION)
			-- populate the ADL tree control by creating it from scratch
		do
			clear
			class_def := a_class_def

 			-- populate the tree

		end

feature {NONE} -- Implementation

	ev_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	class_def: BMM_CLASS_DEFINITION

   	populate_gui_tree_node_enter (a_prop_def: attached BMM_PROPERTY_DEFINITION; depth: INTEGER)
   			-- Add a node representing `a_prop_def' to `gui_file_tree'.
   			-- If depth = 0, but this property is not a terminal node, it means that computation on
   			-- this branch of the closure won't go further due the closure_depth limit; therefore,
   			-- display this node with a special icon that invite the user to manually further expand
   			-- this node
   		local
			a_ti: EV_TREE_ITEM
			prop_str, type_str: STRING
			is_terminal: BOOLEAN
			has_type_subs: BOOLEAN
		do
		end

   	populate_gui_tree_node_exit (a_prop_def: attached BMM_PROPERTY_DEFINITION)
   		do
			ev_tree_item_stack.remove
			if not attached {BMM_CLASS_DEFINITION} a_prop_def.type_def as bmm_class_def or else not bmm_class_def.bmm_model.primitive_types.has (bmm_class_def.name) then
				ev_tree_item_stack.remove
			end
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
--| The Original Code is adl_node_map_control.e.
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
