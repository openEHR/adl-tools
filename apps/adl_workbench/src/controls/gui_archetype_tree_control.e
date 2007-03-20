indexing
	component:   "openEHR Archetype Project"
	description: "Populate ontology controls in ADL editor"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_VIEW_ARCHETYPE_TREE_CONTROL

inherit
	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES

create
	make

feature -- Initialisation

	make(a_main_window: MAIN_WINDOW) is
			-- create tree control repersenting archetype files found in repository_path
		require
			a_main_window /= Void
		do
			gui := a_main_window
   			gui_file_tree := gui.archetype_file_tree
   			gui_file_tree.set_minimum_width(gui.max_arch_explorer_width)
		end

feature -- Access

	selected_file_path: STRING
			-- full path of file selected from tree control

	has_selected_file: BOOLEAN
			-- True if a file was selected

feature -- Commands

	clear is
			-- wipe out content from controls
		do
			gui_file_tree.wipe_out
			has_selected_file := False
		end

	repopulate is
			-- repopulate after changes on file system
		local
			show_node: EV_TREE_NODE
		do
			populate
			if selected_file_path /= Void then
				show_node := gui_file_tree.retrieve_item_recursively_by_data (selected_file_path, True)
				if show_node /= Void then
					gui_file_tree.ensure_item_visible (show_node)
				end
			end
		end

	populate is
			-- populate the ADL tree control by creating it from scratch
		do
			clear
 			create gui_tree_item_stack.make(0)
 			archetype_directory.do_all(agent populate_gui_tree_node_enter, agent populate_gui_tree_node_exit)
		end

	item_select is
			-- do something when an item is selected
		local
			arch_item: ARCHETYPE_DIRECTORY_ARCHETYPE
		do
			arch_item ?= gui_file_tree.selected_item.data
			if arch_item /= Void then
				has_selected_file := True
				selected_file_path := arch_item.full_path
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	gui_file_tree: EV_TREE
			-- reference to MAIN_WINDOW.archetype_file_tree

	gui_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]
			--

   	populate_gui_tree_node_enter(an_item: ARCHETYPE_DIRECTORY_ITEM) is
   			--
		require
			an_item /= Void
   		local
			a_ti: EV_TREE_ITEM
   			ada: ARCHETYPE_DIRECTORY_ARCHETYPE
   			adf: ARCHETYPE_DIRECTORY_FOLDER
   		do
   			adf ?= an_item
   			if adf /= Void then
 				create a_ti.make_with_text (utf8 (adf.base_name))
				a_ti.set_pixmap(pixmaps.item("file_folder_" + adf.group_id.out))
				a_ti.set_data(adf)
			else
				ada ?= an_item
				create a_ti.make_with_text (utf8 (ada.id.domain_concept + "(" + ada.id.version_id + ")"))
				a_ti.set_data(ada)
				if ada.id.is_specialised then
					a_ti.set_pixmap(pixmaps.item("archetype_specialised_" + ada.group_id.out))
				else
					a_ti.set_pixmap(pixmaps.item("archetype_" + ada.group_id.out))
				end
   			end
			if gui_tree_item_stack.is_empty then
				gui_file_tree.extend(a_ti)
			else
				gui_tree_item_stack.item.extend(a_ti)
			end
			gui_tree_item_stack.extend(a_ti)
		end

   	populate_gui_tree_node_exit(an_item: ARCHETYPE_DIRECTORY_ITEM) is
   		do
			gui_tree_item_stack.remove
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
--| The Original Code is adl_node_control.e.
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
