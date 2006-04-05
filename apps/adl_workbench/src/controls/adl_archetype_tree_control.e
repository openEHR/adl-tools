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
		local
			s: STRING
		do
			create s.make(0)
			s.append(".*\.")
			s.append(Archetype_file_extension)
			s.append("$")
			create base_name_pattern_regex.compile_case_insensitive(s)
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
		local
			nr_archetypes_found: INTEGER
		do
			clear
			create tree_item_stack.make(0)
			nr_archetypes_found := populate_tree(repository_path)
		end
		
	item_select is
			-- do something when an item is selected
		local
			arch_path: STRING
		do
			arch_path ?= gui.archetype_file_tree.selected_item.data
			if arch_path /= Void then
				has_selected_file := True
				selected_file_path := arch_path
			end
		end
		
feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system
	
	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	populate_tree(a_dir_name: STRING): INTEGER is
			-- add archetype ids found in directory and subdirectories to file_ids table
		require
			Dir_name_exists: a_dir_name /= Void and then not a_dir_name.is_empty
		local
			fn, fpath: STRING
			a_dir: DIRECTORY
			fnames: ARRAYED_LIST[STRING]
			a_file: RAW_FILE
			a_ti: EV_TREE_ITEM
			an_arch_id: ARCHETYPE_ID
			an_arch_name: STRING
			found_count: INTEGER
   		do
			create a_dir.make(a_dir_name)
			if a_dir.exists then
				a_dir.open_read
				fnames := a_dir.linear_representation
				from 
					fnames.start
				until 
					fnames.off
				loop
					fn := fnames.item
					if not (fn.is_equal(".") or fn.is_equal("..") or fn.item (1) = '.') then
						fpath := a_dir_name + Os_directory_separator.out + fn
						create a_file.make(fpath)	
						if a_file.is_directory then
							create a_ti.make_with_text(fn)
							a_ti.set_pixmap(pixmaps.item("file_folder"))
							tree_item_stack.extend(a_ti)

							found_count := populate_tree(fpath.twin)
							Result := Result + found_count
							if found_count > 0 then -- some files found below here
								a_ti := tree_item_stack.item
								tree_item_stack.remove
								if tree_item_stack.is_empty then
									gui.archetype_file_tree.extend(a_ti)
								else
									tree_item_stack.item.extend(a_ti)
								end
							else
								tree_item_stack.remove
							end

						elseif a_file.is_plain then
							if base_name_pattern_regex.matches(fn) then
								create an_arch_name.make(0)
								an_arch_name.append(fn)
								an_arch_name.remove_tail(("." + Archetype_file_extension).count)
								create an_arch_id.default_create
								if an_arch_id.valid_id(an_arch_name) then
									an_arch_id.make_from_string(an_arch_name)

									create a_ti.make_with_text(an_arch_id.domain_concept + "(" + an_arch_id.version_id + ")")
									a_ti.set_data(fpath)
									
									if an_arch_id.is_specialised then
										a_ti.set_pixmap(pixmaps.item("archetype_specialised"))
									else
										a_ti.set_pixmap(pixmaps.item("archetype"))										
									end
									if tree_item_stack.is_empty then
										gui.archetype_file_tree.extend(a_ti)
									else
										tree_item_stack.item.extend(a_ti)
									end
	
									Result := Result + 1
								end

							end
						end			
					end
					fnames.forth
				end
			end
		end
		
	base_name_pattern_regex: LX_DFA_REGULAR_EXPRESSION		
		
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
