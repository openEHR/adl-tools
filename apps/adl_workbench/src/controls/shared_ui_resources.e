indexing
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_UI_RESOURCES

inherit
	SHARED_RESOURCES

feature -- Definitions

	News_file_path: STRING is 
		once
			Result := application_startup_directory + os_directory_separator.out + "news.txt"
		end
		
	Status_file_path: STRING is 
		once
			Result := application_startup_directory + os_directory_separator.out + ".status"
		end
		
	Adl_version: STRING is "1.1"
	
	Default_windows_editor_command: STRING is "Notepad.exe"

	Default_non_windows_editor_command: STRING is "vi"
	
feature -- Access

	repository_path: STRING is
			-- path of root of ADL file tree
		do
			Result := substitute_env_vars(resource_value("default", "repository"))
		end
			
	editor_command: STRING is
			-- path of editor application for ADL files
		do
			Result := substitute_env_vars(resource_value("default", "editor"))
		end
			
	icon_directory: STRING is 
		once
			Result := application_startup_directory + os_directory_separator.out + "icons"
		end

	has_icon_directory: BOOLEAN is
			-- True if icon directory available
		local
			a_dir: DIRECTORY
		do
			create a_dir.make(icon_directory)
			Result := a_dir.exists
		end
		
	new_news: BOOLEAN is
			-- is there new news due to last installation?
			-- work this out by seeing if there is a file called ".status" which is
			-- older than the news file
		local
			news_file, status_file: PLAIN_TEXT_FILE	
		once
			create news_file.make(News_file_path)
			create status_file.make(Status_file_path)
			if status_file.exists and news_file.exists then
				Result := news_file.date > status_file.date
			else
				Result := news_file.exists
			end
		end

	update_status_file is
			-- renew the status file, currently only used to indicate that
			-- news has been shown at startup
		local
			status_file: PLAIN_TEXT_FILE	
		once
			create status_file.make(Status_file_path)
			if status_file.exists then
				status_file.touch
			else
				status_file.create_read_write
				status_file.close
			end
		end
		
	pixmap_file_table: HASH_TABLE [STRING, STRING] is
			-- table of pixmap file paths keyed by icon key used in this app
		local
			a_dir: DIRECTORY
		once
			create Result.make(0)
			
			Result.put("c_attribute.ico", 			"C_ATTRIBUTE")
			Result.put("c_attribute_multiple.ico", 	"C_ATTRIBUTE.multiple")
			Result.put("c_coded_term.ico", 			"C_CODED_TERM")
			Result.put("c_ordinal.ico", 			"C_ORDINAL")
			Result.put("c_quantity.ico", 			"C_QUANTITY")
			Result.put("c_quantity_item.ico", 		"C_QUANTITY_ITEM")
			Result.put("c_primitive_object.ico", 		"C_PRIMITIVE_OBJECT")
			Result.put("archetype_code_ref.ico", 		"CONSTRAINT_REF")
			Result.put("archetype_slot.ico", 		"ARCHETYPE_SLOT")
			Result.put("c_complex_object_unknown.ico", 	"C_COMPLEX_OBJECT.unknown")
			Result.put("c_complex_object.ico", 		"C_COMPLEX_OBJECT")
			Result.put("archetype_internal_ref.ico", 	"ARCHETYPE_INTERNAL_REF")
			Result.put("term.ico", 				"TERM")
			Result.put("ordinal.ico", 				"ORDINAL")
			Result.put("cadl_invariant.ico", 		"CADL_INVARIANT")
			Result.put("cadl_include.ico", 			"CADL_INCLUDE")
			Result.put("cadl_exclude.ico", 			"CADL_EXCLUDE")
			Result.put("cadl_invariant_item.ico", 		"CADL_INVARIANT_ITEM")
			Result.put("Ocean_float.png", 			"Ocean logo")
			Result.put("file_folder.ico", 			"file_folder")
			Result.put("archetype.ico", 			"archetype")
			Result.put("archetype_specialised.ico", 	"archetype_specialised")

			-- check that icon files exist; for any that don't, output an error message and 
			-- use a blank icon
			create a_dir.make(icon_directory)
			from
				Result.start
			until
				Result.off
			loop
				if not a_dir.has_entry(Result.item_for_iteration) then
					io.putstring("Could not find icon icons/" + Result.item_for_iteration + "; using default%N")
					Result.force("default", pixmap_file_table.key_for_iteration)
				end
				Result.forth
			end
		end
		
	pixmaps: HASH_TABLE[EV_PIXMAP, STRING] is
			-- table of pixmap file paths keyed by logical name
		require
			has_icon_directory
		local
			pixmap: EV_PIXMAP
		once
			create Result.make(0)
			
			from
				pixmap_file_table.start
			until
				pixmap_file_table.off
			loop
				create pixmap
				if not pixmap_file_table.item_for_iteration.is_equal("default") then
					pixmap.set_with_named_file(icon_directory + "/" + pixmap_file_table.item_for_iteration)
				end
				Result.put(pixmap, pixmap_file_table.key_for_iteration)
				pixmap_file_table.forth
			end
		end

	splash_text: STRING is
			-- create a splash string for the console
		once
			create Result.make(0)
			Result.append("Ocean Informatics openEHR ADL Parser (c)2003-2005%N")
			Result.append("%TADL version: " + adl_version + "%N" + (create {OPENEHR_VERSION}).version)
			Result.append("%Tsource available from: www.openEHR.org%N")
			Result.append("%Tsupport: support@OceanInformatics.biz%N")
			Result.append("%Tauthor: Thomas Beale%N")
			Result.append("Built using%N")
			Result.append("%TISE Eiffel (see www.eiffel.com)%N")
			Result.append("%TGobo parsing libraries & tools (see www.gobosoft.com)%N")
			Result.append("Available versions%N")
			Result.append("%TdotNet dll, Java-wrapped dll/.so, C dll/.so%N")
		end

	News_text: STRING is
			-- news dialog
		local
			news_file: PLAIN_TEXT_FILE	
		once
			create news_file.make(News_file_path)
			if news_file.exists and news_file.is_readable then
				news_file.open_read
				news_file.read_stream(news_file.count)
				Result := news_file.last_string
				news_file.close
			else
				Result := "(news.txt file missing)"
			end
		end

feature -- Modification

	set_repository_path(a_path: STRING) is
			-- set repository_path
		require
			a_path_valid: a_path /= Void and then not a_path.is_empty
		do
			set_resource_value("default", "repository", a_path)
		end
		
	set_editor_command(an_editor_command: STRING) is
			-- set editor
		require
			an_editor_command_valid: an_editor_command /= Void and then not an_editor_command.is_empty
		do
			set_resource_value("default", "editor", an_editor_command)
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
--| The Original Code is shared_ui_resources.e.
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
