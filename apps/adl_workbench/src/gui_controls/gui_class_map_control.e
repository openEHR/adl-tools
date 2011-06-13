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

class GUI_CLASS_MAP_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_main_window: attached MAIN_WINDOW)
		do
			gui := a_main_window
			gui_tree := gui.archetype_tool.node_map_control.gui_tree
		ensure
			gui_set: gui = a_main_window
		end

feature -- Commands

	populate
			-- populate the ADL tree control by creating it from scratch
		local
			class_def: attached BMM_CLASS_DEFINITION
		do
			gui_tree.wipe_out
 			create gui_tree_item_stack.make (0)
			populate_root_node
			class_def := current_arch_cat.selected_class.class_definition
			class_def.do_supplier_closure(not differential_view, agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
			gui_tree.recursive_do_all (agent ev_tree_expand)
			gui.go_to_node_in_archetype_tree_view
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	gui_tree: EV_TREE

	gui_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

   	populate_root_node
			-- Add root node representing class to `gui_file_tree'.
   		local
			a_ti: EV_TREE_ITEM
		do
			create a_ti
			a_ti.set_text (current_arch_cat.selected_class.display_name)
			a_ti.set_pixmap (pixmaps [current_arch_cat.selected_class.group_name])
			gui_tree.extend (a_ti)
			gui_tree_item_stack.extend (a_ti)
		end

   	populate_gui_tree_node_enter (a_prop_def: BMM_PROPERTY_DEFINITION)
   			-- Add a node representing `a_prop_def' to `gui_file_tree'.
		require
			item_attached: a_prop_def /= Void
   		local
			a_ti: EV_TREE_ITEM
			pixmap: EV_PIXMAP
			str: STRING
		do
			create a_ti
			a_ti.set_data (a_prop_def)
			str := a_prop_def.name + ": " + a_prop_def.type_def.as_type_string
			if a_prop_def.is_mandatory then
				str.append (" [1]")
			else
				str.append (" [0..1]")
			end
			a_ti.set_text (utf8 (str))

			pixmap := pixmaps.item(rm_attribute_pixmap_string(a_prop_def))
			a_ti.set_pixmap (pixmap)
			gui_tree_item_stack.item.extend (a_ti)
			gui_tree_item_stack.extend (a_ti)
		end

   	populate_gui_tree_node_exit (a_prop_def: BMM_PROPERTY_DEFINITION)
   		do
			gui_tree_item_stack.remove
		end

	rm_attribute_pixmap_string(rm_attr: BMM_PROPERTY_DEFINITION): STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make(0)
			Result.append ("C_ATTRIBUTE")
			if rm_attr.is_container then
				Result.append (".multiple")
			end
			if not rm_attr.is_mandatory then
				Result.append (".optional")
			end
			Result.append (".reference_model")
		end

	ev_tree_expand(node: EV_TREE_NODE)
			--
		do
 			if node.is_expandable then
				node.expand
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
