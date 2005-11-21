indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Test application for ADL validating parser. Command line option
				 	-overwrite 
				 to overwrite old files with new files which reparse properly - 
				 useful for upgrading ADL syntax in one hit.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_CMD_LINE

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_ADL_INTERFACE
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_archetype_serialiser_format, archetype_serialiser_formats
		end

creation
	make
	
feature -- Definitions

	Option_overwrite: STRING is "overwrite"

feature -- Template
	
	make is
		local
			i: INTEGER
			menu: MENU
			finished: BOOLEAN
			arch_id: STRING
			id_list: ARRAYED_LIST[STRING]
			rep_path: STRING
			parse_failed_list: ARRAYED_LIST[STRING]
			reparse_faied_list: ARRAYED_LIST[STRING]
   		do
			io.put_string(splash)
			read_resource_file
			rep_path := resource_value("any", "repository")
			set_language("en")
			read_command_line

			if not rep_path.is_empty then
				working_directory := substitute_env_vars(rep_path)
			else
				working_directory := startup_directory
			end
			adl_interface.set_current_directory(working_directory)

			create menu.make("ADL Files")
			create repository.make(working_directory, archetype_file_name_pattern)
			if not repository.make_failed then
				id_list := repository.file_ids
				from
					id_list.start
					i := 1
				until
					id_list.off
				loop
					menu.add_item(id_list.item)

					id_list.forth
					i := i + 1
				end
				
				from
				until
					finished
				loop
 		  			create parse_failed_list.make(0)
   					create reparse_faied_list.make(0)
   		
					menu.display
					menu.choose

					if menu.all_selected then
						from
							repository.file_ids.start
						until
							repository.file_ids.off
						loop
							process_one_archetype(repository.file_ids.item)
							if parse_1_failed then
								parse_failed_list.extend(repository.file_ids.item)
							end
							if parse_2_failed then
								reparse_faied_list.extend(repository.file_ids.item)
							end
							repository.file_ids.forth
						end
						
					elseif menu.quit_selected then
						finished := True
						
					else
						arch_id := menu.item_at_index(menu.selection)
						process_one_archetype(arch_id)

						if parse_1_failed then
							parse_failed_list.extend(arch_id)
						end
						if parse_2_failed then
							reparse_faied_list.extend(arch_id)
						end
					end
		
					io.put_string("%N~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%N")
					io.put_string("Archetypes which failed to parse:%N")
					from
						parse_failed_list.start
					until
						parse_failed_list.off
					loop
						io.put_string("%T" + parse_failed_list.item + "%N")
						parse_failed_list.forth
					end
					
					io.put_string("%N~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%N")
					io.put_string("Archetypes which failed to reparse:%N")
					from
						reparse_faied_list.start
					until
						reparse_faied_list.off
					loop
						io.put_string("%T" + reparse_faied_list.item + "%N")
						reparse_faied_list.forth
					end					
				end
			else
				io.put_string("Repository not found; reason: " + repository.make_error + "%N")
			end
		end
	
	read_command_line is
			-- get command line args
		local
			args: ARGUMENTS
		do
			args := execution_environment.Command_line
			if args.index_of_word_option(Option_overwrite) > 0 then
				io.putstring("[Overwrite command line option found - will overwrite files%N")
				overwrite := True
			end
		end
		
	process_one_archetype(arch_id: STRING) is
			-- parse archetype corresponding to `arch_id'
		local
			old_adl_file, new_adl_file: STRING
			html_fname: STRING
			old_file, new_file: PLAIN_TEXT_FILE
		do
			parse_1_failed := False
			parse_2_failed := False
			
			io.put_string("%N======== reading " + arch_id + "========%N")
			adl_interface.reset			
			adl_interface.open_adl_file(repository.file_path(arch_id))
			adl_interface.parse_archetype
			if adl_interface.parse_succeeded then
				io.put_string("--------------------%N")
				io.put_string("Archetype " + arch_id + " is VALIDATED%N")
				io.put_string(adl_interface.status + "%N")

				io.put_string("-------- Serialising to HTML --------%N")
				html_fname := clone(repository.file_path(arch_id))
				html_fname.replace_substring(".html", html_fname.count - Archetype_file_extension.count, html_fname.count)
				adl_interface.save_archetype(html_fname, "html")
				io.put_string(adl_interface.status + "%N")

				io.put_string("-------- Serialising to ADL --------%N")
				old_adl_file := repository.file_path(arch_id)
				new_adl_file := old_adl_file + "2"
				adl_interface.save_archetype(new_adl_file, "adl")
				io.put_string(adl_interface.status + "%N")
				
				io.put_string("-------- reparsing --------%N")
				adl_interface.open_adl_file(new_adl_file)
				adl_interface.parse_archetype
				if adl_interface.parse_succeeded then
					io.put_string("Reparse: archetype " + new_adl_file + " is VALIDATED%N")
					
					-- if overwriting remove old file and copy new file over the top
					if overwrite then
						create old_file.make(old_adl_file)
						old_file.delete
						create new_file.make(new_adl_file)
						new_file.change_name (old_adl_file)
					end
				else
					parse_2_failed := True
					io.put_string("Reparse: Archetype " + new_adl_file + " is NOT VALIDATED; reasons:%N")
					io.put_string(adl_interface.status + "%N")
				end
			else
				parse_1_failed := True
				io.put_string("Reparse: Archetype " + arch_id + " is NOT VALIDATED; reasons:%N")
				io.put_string(adl_interface.status + "%N")
			end
		end
		
	read_resource_file is
			-- 
		local
			s: STRING
		do
			s := application_name
			s.replace_substring_all(".exe", "")
			s.append(".cfg")
			initialise_resource_config_file_name(s)
		end
		
	repository: FILE_REPOSITORY
	
	overwrite: BOOLEAN
			-- set to True by command line if old files are to be overwritten by new files
			-- useful for upgrading ADL syntax in one go
	
	parse_1_failed, parse_2_failed: BOOLEAN

	splash: STRING is
			-- create a splash string for the console
		once
			create Result.make(0)
			Result.append("%N..........................................................................%N")
			Result.append(  ".           Ocean Informatics Validating ADL Parser (c)2003 - 2004       .%N")
			Result.append(  "..........................................................................%N")
			Result.append(  ". available from: www.OceanInformatics.biz                               .%N")
			Result.append(  ".         author: Thomas Beale                                           .%N")
			Result.append(  adl_interface.openehr_version																  )
			Result.append(  ".    built using: ISE Eiffel (see www.eiffel.com)                        .%N")
			Result.append(  ".                 Gobo parsing libraries & tools (see www.gobosoft.com)  .%N")
			Result.append(  ".        support: support@OceanInformatics.biz                           .%N")
			Result.append(  "..........................................................................%N%N")

		end

	working_directory: STRING
		
	archetype_file_name_pattern: STRING is "^[a-z][a-z0-9_]*-[a-z][a-z0-9_]*-[a-z][a-z0-9_]*\.[a-z][a-z0-9\-_]*\.[a-z][a-z0-9_]*\.adl$"
			-- matches "rm_originator-rm_name-rm_entity.concept.version.adl"
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
--| The Original Code is application.e.
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
