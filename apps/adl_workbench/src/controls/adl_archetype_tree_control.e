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


class ADL_ARCHETYPE_TREE_CONTROL

inherit
	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		undefine
			copy, default_create
		end

	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end
	
	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(a_main_window: MAIN_WINDOW) is
			-- create tree control repersenting archetype files found in repository_path
		require
			a_main_window /= Void
		do
			gui := a_main_window
   			gui.archetype_file_tree.set_minimum_width(gui.max_arch_explorer_width)
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
			gui.archetype_file_tree.wipe_out
			has_selected_file := False
		end

	repopulate is
			-- repopulate after changes on file system
		local
			show_node: EV_TREE_NODE
		do
			populate
			if selected_file_path /= Void then
				show_node := gui.archetype_file_tree.retrieve_item_recursively_by_data (selected_file_path, True)		
				if show_node /= Void then
					gui.archetype_file_tree.ensure_item_visible (show_node)
				end
			end
		end
		
	populate is
			-- populate the ADL tree control by creating it from scratch
		do
			create archetype_directory_index.make(0)		
			archetype_directory := populate_archetype_directory(repository_path)
			
			clear

 			create gui_tree_item_stack.make(0)
 			populate_gui_tree(archetype_directory)
		end
		
	item_select is
			-- do something when an item is selected
		local
			arch_item: ARCHETYPE_DIRECTORY_ARCHETYPE
		do
			arch_item ?= gui.archetype_file_tree.selected_item.data
			if arch_item /= Void then
				has_selected_file := True
				selected_file_path := arch_item.full_path
			end
		end
		
feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system
	
	gui_tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]
			-- 
	
	archetype_directory: TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM]
			-- tree-structured directory of archetypes
						
	archetype_directory_index: HASH_TABLE [TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM], STRING]
			-- index of archetype nodes in archetype_directory, keyed by archetype domain_concept

	populate_archetype_directory(a_dir_name: STRING):TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM] is
			-- add archetype and folder meta-data for directory to archetype directory
		require
			Dir_name_exists: a_dir_name /= Void and then not a_dir_name.is_empty
		local
			fn, fpath: STRING
			a_dir: DIRECTORY
			fs_node_names: ARRAYED_LIST[STRING]
			dir_name_index: SORTED_TWO_WAY_LIST[STRING]
			file_name_index: SORTED_TWO_WAY_LIST[ARCHETYPE_ID]
			file_name_table: HASH_TABLE[STRING, STRING]
			a_file: RAW_FILE
			an_arch_id: ARCHETYPE_ID
			an_arch_name: STRING
			ada_item: ARCHETYPE_DIRECTORY_ARCHETYPE
			arch_node, non_spec_arch_node: TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM]
   		do
			create a_dir.make(a_dir_name)
			create Result.make(create {ARCHETYPE_DIRECTORY_FOLDER}.make(a_dir_name))

			if a_dir.exists then
				a_dir.open_read
				fs_node_names := a_dir.linear_representation
				create file_name_index.make
				create dir_name_index.make
				create file_name_table.make(0)
				from 
					fs_node_names.start
				until 
					fs_node_names.off
				loop
					fn := fs_node_names.item
					if not (fn.is_equal(".") or fn.is_equal("..") or fn.item (1) = '.') then
						fpath := a_dir_name + Os_directory_separator.out + fn
						create a_file.make(fpath)	
						if a_file.is_directory then
							dir_name_index.extend (fn)
						elseif a_file.is_plain and base_name_pattern_regex.matches(fn) then
							an_arch_name := fn.twin
							an_arch_name.remove_tail(("." + Archetype_file_extension).count)
							create an_arch_id.default_create
							if an_arch_id.valid_id(an_arch_name) then
								an_arch_id.make_from_string(an_arch_name)
								file_name_index.extend (an_arch_id)
								file_name_table.put(fn, an_arch_id.as_string)
							end
						end			
					end
					fs_node_names.forth
				end
			end
			
			from
				dir_name_index.start
			until
				dir_name_index.off
			loop
				fpath := a_dir_name + Os_directory_separator.out + dir_name_index.item
				Result.put_child_right (populate_archetype_directory(fpath))
				Result.child_forth				
				dir_name_index.forth
			end
			
			from
				file_name_index.start
			until
				file_name_index.off
			loop
				fpath := a_dir_name + Os_directory_separator.out + file_name_table.item(file_name_index.item.as_string)
				an_arch_id := file_name_index.item				
				create ada_item.make(fpath, an_arch_id, an_arch_id.is_specialised)
				create arch_node.make(ada_item)
				if not an_arch_id.is_specialised then
					Result.put_child_right(arch_node)
					Result.child_forth
				else
					if archetype_directory_index.has(an_arch_id.domain_concept_base) then
						non_spec_arch_node := archetype_directory_index.item(an_arch_id.domain_concept_base)
					else
						non_spec_arch_node := Result
					end
					non_spec_arch_node.put_child_right(arch_node)
					non_spec_arch_node.child_forth
				end
				archetype_directory_index.put(arch_node, an_arch_id.domain_concept)
				
				file_name_index.forth
			end		
		end
							
	populate_gui_tree(node: TWO_WAY_TREE [ARCHETYPE_DIRECTORY_ITEM])  is
			-- add archetype ids found in directory and subdirectories to file_ids table
   		do
  			from
 				node.child_start
 			until
 				node.child_off
 			loop		
				populate_gui_tree_item(node.child_item)
 				populate_gui_tree(node.child)
				gui_tree_item_stack.remove
 				node.child_forth
 			end
   		end	
   		
   	populate_gui_tree_item(an_item: ARCHETYPE_DIRECTORY_ITEM) is
   			--
   		local
			a_ti: EV_TREE_ITEM
   			ada: ARCHETYPE_DIRECTORY_ARCHETYPE
   			adf: ARCHETYPE_DIRECTORY_FOLDER
   		do
   			adf ?= an_item
   			if adf /= Void then
 				create a_ti.make_with_text(adf.base_name)
				a_ti.set_pixmap(pixmaps.item("file_folder"))
				a_ti.set_data(adf)
			else
				ada ?= an_item
				create a_ti.make_with_text(ada.id.domain_concept + "(" + ada.id.version_id + ")")
				a_ti.set_data(ada)		
				if ada.id.is_specialised then
					a_ti.set_pixmap(pixmaps.item("archetype_specialised"))
				else
					a_ti.set_pixmap(pixmaps.item("archetype"))
				end
   			end		
			if gui_tree_item_stack.is_empty then
				gui.archetype_file_tree.extend(a_ti)
			else
				gui_tree_item_stack.item.extend(a_ti)
			end			
			gui_tree_item_stack.extend(a_ti)
		end

	base_name_pattern_regex: LX_DFA_REGULAR_EXPRESSION is
			-- pattern matcher for filenames ending in ".adl"
		once
			create Result.compile_case_insensitive(".*\." + Archetype_file_extension + "$")
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
