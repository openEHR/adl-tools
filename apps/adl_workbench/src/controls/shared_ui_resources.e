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

	ADL_DEFINITIONS
		export
			{NONE} all
		end
	
feature -- Definitions

	News_file_path: STRING is 
		once
			Result := application_startup_directory + os_directory_separator.out + "news.txt"
		end
		
	Status_file_path: STRING is 
		once
			Result := application_startup_directory + os_directory_separator.out + ".status"
		end
	
	Default_editor_command: STRING is		
			-- generate a reasonable name of an editor based on operating system
		once	
   			if os_type.substring_index("windows", 1) > 0 then
   				Result := "Notepad.exe"
			else
   				Result := "vi"
   			end
   		end
   			
	Default_browser_command: STRING is 
			-- generate a command to launch a browser based on OS
		once
   			if os_type.substring_index("windows", 1) > 0 then
   				Result := "cmd /Q /c start "
			else
   				Result := "firefox "
   			end
		end
	
	ADL_help_page_url: STRING is "http://svn.openehr.org/ref_impl_eiffel/TRUNK/apps/doc/adl_workbench_help.htm"
	
feature -- Access

	repository_path: STRING is
			-- path of root of ADL file tree
		do
			Result := substitute_env_vars(resource_value("default", "repository"))
		end
			
	app_width: INTEGER is
			-- application width
		local
			str: STRING
		do
			str := resource_value("default", "app_width")
			if str.is_integer then
				Result := str.to_integer
			end
		end
			
	app_height: INTEGER is
			-- application height
		local
			str: STRING
		do
			str := resource_value("default", "app_height")
			if str.is_integer then
				Result := str.to_integer
			end
		end
			
	total_view_area_split_position: INTEGER is
			-- split position of outer vertical split control
		local
			str: STRING
		do
			str := resource_value("default", "total_view_area_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end
			
	info_view_area_split_position: INTEGER is
			-- split position of inner vertical split control
		local
			str: STRING
		do
			str := resource_value("default", "info_view_area_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
		end
			
	explorer_view_area_split_position: INTEGER is
			-- split position of explorer horizontal split control
		local
			str: STRING
		do
			str := resource_value("default", "explorer_view_area_split_position")
			if str.is_integer then
				Result := str.to_integer
			end
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
		
	pixmap_help_index: ARRAYED_LIST [STRING] is
			-- list of pixmap ids to be included in icon help dialog
		once
			create Result.make(0)
			
			Result.extend("archetype")
			Result.extend("archetype_specialised")

			Result.extend("C_ATTRIBUTE")
			Result.extend("C_ATTRIBUTE.optional")
			Result.extend("C_ATTRIBUTE.multiple")
			Result.extend("C_ATTRIBUTE.multiple.optional")
			
			Result.extend("C_COMPLEX_OBJECT")
			Result.extend("C_COMPLEX_OBJECT.multiple")
			Result.extend("C_COMPLEX_OBJECT.optional")
			Result.extend("C_COMPLEX_OBJECT.multiple.optional")
			
			Result.extend("ARCHETYPE_SLOT")
			Result.extend("ARCHETYPE_SLOT.optional")
			Result.extend("CADL_INCLUDE")
			Result.extend("CADL_EXCLUDE")
			
			Result.extend("ARCHETYPE_INTERNAL_REF")
			Result.extend("CONSTRAINT_REF")
	
			Result.extend("C_CODED_TERM")
			Result.extend("C_ORDINAL")
			Result.extend("C_QUANTITY")
			Result.extend("C_PRIMITIVE_OBJECT")
			
			Result.extend("CADL_INVARIANT")
			Result.extend("CADL_INVARIANT_ITEM")
		end

	pixmap_help_table: HASH_TABLE [STRING, STRING] is
			-- table of pixmap file paths keyed by icon key used in this app
		once
			create Result.make(0)
			
			Result.put("Single-valued attribute (mandatory)", 			"C_ATTRIBUTE")
			Result.put("Single-valued attribute (optional)", 			"C_ATTRIBUTE.optional")
			Result.put("Container attribute (mandatory)",			 	"C_ATTRIBUTE.multiple")
			Result.put("Container attribute (optional)", 				"C_ATTRIBUTE.multiple.optional")
			
			Result.put("C_CODED_TERM (openEHR archetype profile)", 		"C_CODED_TERM")
			Result.put("C_ORDINAL (openEHR archetype profile)",			"C_ORDINAL")
			Result.put("C_QUANTITY (openEHR archetype profile)", 		"C_QUANTITY")
			Result.put("C_PRIMITIVE_OBJECT - any type (openEHR AOM)", 	"C_PRIMITIVE_OBJECT")
			
			Result.put("Archetype slot (mandatory)", 					"ARCHETYPE_SLOT")
			Result.put("Archetype slot (optional)", 					"ARCHETYPE_SLOT.optional")
			Result.put("Archetype slot allowed archetypes", 					"CADL_INCLUDE")
			Result.put("Archetype slot excluded archetypes", 					"CADL_EXCLUDE")
			
			Result.put("Complex ref model object (mandatory, single occurrence)", 			"C_COMPLEX_OBJECT")
			Result.put("Complex ref model object (mandatory, multiple occurrences)", 		"C_COMPLEX_OBJECT.multiple")
			Result.put("Complex ref model object (optional, single occurrence)", 			"C_COMPLEX_OBJECT.optional")
			Result.put("Complex ref model object (optional, multiple occurrences)", 		"C_COMPLEX_OBJECT.multiple.optional")
			
			Result.put("Archetype internal reference to previously defined node", 			"ARCHETYPE_INTERNAL_REF")
			Result.put("Constraint reference (openEHR AOM)", 			"CONSTRAINT_REF")
	
			Result.put("Invariant section", 							"CADL_INVARIANT")
			Result.put("Invariant section item", 						"CADL_INVARIANT_ITEM")

			Result.put("Archetype", 									"archetype")
			Result.put("Specialised archetype", 						"archetype_specialised")
		end
		
	pixmap_file_table: HASH_TABLE [STRING, STRING] is
			-- table of pixmap file paths keyed by icon key used in this app
		local
			a_dir: DIRECTORY
		once
			create Result.make(0)
			
			Result.put("c_attribute.ico", 								"C_ATTRIBUTE")
			Result.put("c_attribute_optional.ico", 						"C_ATTRIBUTE.optional")
			Result.put("c_attribute_multiple.ico",					 	"C_ATTRIBUTE.multiple")
			Result.put("c_attribute_multiple_optional.ico", 			"C_ATTRIBUTE.multiple.optional")
			
			Result.put("c_coded_term.ico", 								"C_CODED_TERM")
			Result.put("c_ordinal.ico", 								"C_ORDINAL")
			Result.put("c_quantity.ico", 								"C_QUANTITY")
			Result.put("c_quantity_item.ico", 							"C_QUANTITY_ITEM")
			Result.put("c_primitive_object.ico", 						"C_PRIMITIVE_OBJECT")
			Result.put("archetype_code_ref.ico", 						"CONSTRAINT_REF")
			
			Result.put("archetype_slot.ico", 							"ARCHETYPE_SLOT")
			Result.put("archetype_slot_optional.ico", 					"ARCHETYPE_SLOT.optional")
			
			Result.put("c_complex_object_unknown.ico", 					"C_COMPLEX_OBJECT.unknown")
			Result.put("c_complex_object.ico", 							"C_COMPLEX_OBJECT")
			Result.put("c_complex_object_multiple.ico", 				"C_COMPLEX_OBJECT.multiple")
			Result.put("c_complex_object_optional.ico", 				"C_COMPLEX_OBJECT.optional")
			Result.put("c_complex_object_multiple_optional.ico", 		"C_COMPLEX_OBJECT.multiple.optional")
			
			Result.put("archetype_internal_ref.ico", 					"ARCHETYPE_INTERNAL_REF")
			Result.put("term.ico", 										"TERM")
			Result.put("ordinal.ico", 									"ORDINAL")
			Result.put("cadl_invariant.ico", 							"CADL_INVARIANT")
			Result.put("cadl_include.ico", 								"CADL_INCLUDE")
			Result.put("cadl_exclude.ico", 								"CADL_EXCLUDE")
			Result.put("cadl_invariant_item.ico", 						"CADL_INVARIANT_ITEM")
			Result.put("Ocean_float.png", 								"Ocean logo")
			Result.put("file_folder.ico", 								"file_folder")
			Result.put("archetype.ico", 								"archetype")
			Result.put("archetype_specialised.ico", 					"archetype_specialised")

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
			Result.append("ADL Workbench (c)2003-2006 Ocean Informatics%N")
			Result.append("%TADL version: " + Current_adl_version + "%N")
			Result.append("%TSource SVN - http://svn.openehr.org/ref_impl_eiffel%N%T" + (create {OPENEHR_VERSION}).version + "%N")
			Result.append("%TSource license: Mozilla tri-license (http://www.mozilla.org/MPL/boilerplate-1.1/mpl-tri-license-txt)%N")
			Result.append("Support: support@OceanInformatics.biz%N")
			Result.append("Funded by: OceanInformatics.biz%N")
			Result.append("Author: Thomas Beale%N")
			Result.append("Built using%N")
			Result.append("%TEiffel Software Eiffel (http://www.eiffel.com)%N")
			Result.append("%TGobo parsing libraries & tools (http://www.gobosoft.com)%N")
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

	set_total_view_area_split_position (v: INTEGER) is
			-- set split position of outer vertical split control
		require
			v > 0
		do
			set_resource_value("default", "total_view_area_split_position", v.out)
		end
			
	set_info_view_area_split_position (v: INTEGER) is
			-- set split position of inner vertical split control
		require
			v > 0
		do
			set_resource_value("default", "info_view_area_split_position", v.out)
		end
			
	set_explorer_view_area_split_position (v: INTEGER) is
			-- set split position of explorer horizontal split control
		require
			v > 0
		do
			set_resource_value("default", "explorer_view_area_split_position", v.out)
		end

	set_app_width (v: INTEGER) is
			-- set app width
		require
			v > 0
		do
			set_resource_value("default", "app_width", v.out)
		end

	set_app_height (v: INTEGER) is
			-- set app height
		require
			v > 0
		do
			set_resource_value("default", "app_height", v.out)
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
