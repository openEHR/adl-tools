indexing
	component:   "openEHR Archetype Project"
	description: "[
		       GUI interface context for all GUI applications based on
			 the ADL parser.
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_INTERFACE

inherit
	SHARED_ADL_CONTEXT
		export
			{NONE} all
			{ANY} language, ontology
		undefine
			default_create, copy
		end
	
	SHARED_ADL_SERIALISERS
		export
			{NONE} all
		undefine
			default_create, copy
		end

feature -- Access

	splash: STRING is
			-- create a splash string for the console
		do
			create Result.make(0)
			Result.append("Ocean Informatics Validating ADL Parser (c)2003%N")
			Result.append("%T" + (create {DATE_TIME}.make_now).out + "(alpha)%N")
			Result.append("%Tavailable from: www.OceanInformatics.biz%N")
			Result.append("%Tsupport: support@OceanInformatics.biz%N")
			Result.append("%Tauthor: Thomas Beale%N")
			Result.append("Built using%N")
			Result.append("%TISE Eiffel (see www.eiffel.com)%N")
			Result.append("%TGobo parsing libraries & tools (see www.gobosoft.com)%N")
		end

feature {NONE} -- Initialization

	user_initialization is
			-- called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			set_x_position(0)
			set_y_position(0)
			set_icon_name("ADL Editor")
   			view_area.set_proportion(0.5)
			format_combo.set_strings(adl_serialiser_formats)
			edit_command := "notepad.exe"
			startup_directory := execution_environment.current_working_directory
		end

feature {NONE} -- Implementation
	
	startup_directory: STRING
			-- directory application started in
			
	adl_engine: ADL_ENGINE is
		once
			create Result.make
		end
		
	file_context: FILE_CONTEXT is
			-- file handling context
		once
			create Result
		end
		
	edit_command: STRING
			-- command to launch when edit button pushed
			
	open_adl_file is
			-- Called by `pointer_button_press_actions' of `open_file_mi'.
		do
			Adl_file_open_dialog.show_modal_to_window (Current)
			if Adl_file_open_dialog.file_name /= Void and then not Adl_file_open_dialog.file_name.is_empty then
				file_context.set_file_details(Adl_file_open_dialog.file_path, Adl_file_open_dialog.file_title)
				adl_engine.set_source(file_context.read_file)
				populate_archetype_text_edit_area
				clear_controls
			end
		end
	
	close_file is
			-- Called by `pointer_button_press_actions' of `close_file_mi'.
		do
		end
	
	save_adl_file(format: STRING) is
			-- Called by `pointer_button_press_actions' of `save_file_mi'.
		local
			ok_to_write: BOOLEAN
			error_dialog: EV_ERROR_DIALOG
			question_dialog: EV_QUESTION_DIALOG
		do
			ok_to_write := True
			if parse_ready then
				if format_combo.has_selection then
					Adl_file_save_dialog.set_start_directory (file_context.current_directory)
					Adl_file_save_dialog.set_filter ("*" + adl_file_extensions.item(format))
					Adl_file_save_dialog.set_title(file_context.current_file_name + adl_file_extensions.item(format))
					Adl_file_save_dialog.show_modal_to_window (Current)			
					if not Adl_file_save_dialog.file_name.is_empty then
						file_context.set_current_directory(Adl_file_save_dialog.file_path)
						if file_context.has_file(Adl_file_save_dialog.file_title) then
							create question_dialog.make_with_text("File " + Adl_file_save_dialog.file_title + " already exists; replace?")
							question_dialog.set_buttons(<<"Yes", "No">>)
							question_dialog.show_modal_to_window (Current)
							if question_dialog.selected_button.is_equal("No") then
								ok_to_write := False
							end
						end
						if ok_to_write then
							adl_engine.serialise(format)
							parser_status_area.append_text("Serialised: " + format + ", " + language + 
															" to file " + Adl_file_save_dialog.file_name + "%N")
							file_context.save_file(Adl_file_save_dialog.file_name, adl_engine.serialised_archetype)
						end
					end
				else
					create error_dialog.make_with_text("must select a format before serialising")	
					error_dialog.show_modal_to_window (Current)
				end
			end
		end
	
	edit_archetype_file is
			-- launch external editor with archetype
		do
			execution_environment.launch(edit_command + " " + file_context.current_full_path)
			if file_context.file_changed then
				adl_engine.set_source(file_context.read_file)
				populate_archetype_text_edit_area
				clear_controls
			end
		end
		
	display_about is
			-- Called by `pointer_button_press_actions' of `about_mi'.
		do
			About_dialog.show_modal_to_window (Current)
		end
		
	set_editor_command is
			-- 
		do
			
		end
		
	exit_app is
			-- 
		do
			((create {EV_ENVIRONMENT}).application).destroy
		end

	parse_archetype is
			-- Called by `select_actions' of `parse'.
		do
			parse_ready := False
			if adl_engine.source /= Void then
				clear_controls
				adl_engine.parse
				if adl_engine.parse_failed then
					parser_status_area.append_text(adl_engine.parse_error_text)
					parser_status_area.append_text("(Parse failed)%N")
				else
					parser_status_area.append_text("Archetype " + adl_engine.archetype_id.as_string + " syntax VALIDATED%N")
					archetype_id.set_text(adl_engine.archetype_id.as_string)
					language_combo.set_strings(ontology.languages_available)
					set_language(ontology.primary_language)
					terminology_combo.set_strings(ontology.terminologies_available)
					set_terminology(ontology.terminologies_available.first)
					parse_ready := True
					populate_ontology_controls
					
					if adl_engine.parsed_archetype.is_valid then
						parser_status_area.append_text("Archetype " + adl_engine.archetype_id.as_string + " ontologically VALIDATED%N")
					else
						parser_status_area.append_text("Archetype " + adl_engine.archetype_id.as_string + " is NOT VALIDATED; reasons:%N")
						parser_status_area.append_text(adl_engine.parsed_archetype.errors)
					end
					if adl_engine.parsed_archetype.has_warnings then
						parser_status_area.append_text(adl_engine.parsed_archetype.warnings)							
					end
				end
			end				
		end
	
	select_language is
			-- Called by `select_actions' of `language_combo'.
		do
			if language_combo.has_selection then
				set_language(language_combo.selected_text)
				populate_ontology_controls
			end
		end
	
	select_format is
			-- Called by `select_actions' of `format_combo'.
		do
		end
	
	select_terminology is
			-- Called by `select_actions' of `terminology_combo'.
		do
			if terminology_combo.has_selection then
				set_terminology(terminology_combo.selected_text)
				populate_ontology_controls
			end
		end
	
feature {NONE} -- standard dialogs
	
	parse_ready: BOOLEAN
			-- True if parse has been successfully executed
	
	Adl_file_open_dialog: EV_FILE_OPEN_DIALOG is
			-- 	EV_FILE_OPEN_DIALOG for test.
		once
			create Result
			Result.set_start_directory(execution_environment.current_working_directory)
			Result.set_filter("*.adl")
		end
		
	Adl_file_save_dialog: EV_FILE_SAVE_DIALOG is
			-- 	EV_FILE_SAVE_DIALOG for test.
		once
			create Result	
		end

	Print_dialog: EV_PRINT_DIALOG is
			-- 	EV_PRINT_DIALOG for test.
		once
			create Result	
		end
		
	About_dialog: EV_INFORMATION_DIALOG is
			-- about text
		local
			a_pixmap: EV_PIXMAP
		once
			create result.make_with_text(splash)
			create a_pixmap.make_with_size(80,120)
			a_pixmap.set_with_named_file(startup_directory + "/icons/Ocean_float.png")
			result.set_pixmap(a_pixmap)
		end
		
	clear_controls is
			-- wipe out content from visual controls
		do
			parser_status_area.set_text("")
			language_combo.wipe_out
			terminology_combo.wipe_out
			parsed_archetype_tree.wipe_out
			clear_ontology_controls
		end

	execution_environment: EXECUTION_ENVIRONMENT is
	    once
	        create Result
	    end
	    
	pixmaps: HASH_TABLE[EV_PIXMAP, STRING] is
			-- table of pixmap file paths keyed by logical name
		local
			pixmap: EV_PIXMAP
			dir_sep: STRING
		once
			create Result.make(0)
			
			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_rel_node.ico")
			Result.put(pixmap, "CADL_REL_NODE")
			
			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_term.ico")
			Result.put(pixmap, "CADL_OBJECT_TERM")

			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_simple.ico")
			Result.put(pixmap, "CADL_OBJECT_SIMPLE")

			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_constraint_ref.ico")
			Result.put(pixmap, "CADL_OBJECT_NODE.is_constraint_ref")

			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_archetype_ref.ico")
			Result.put(pixmap, "CADL_OBJECT_NODE.is_archetype_ref")

			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_node_unknown.ico")
			Result.put(pixmap, "CADL_OBJECT_NODE.unknown")

			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_node.ico")
			Result.put(pixmap, "CADL_OBJECT_NODE")

			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/cadl_object_node_ref.ico")
			Result.put(pixmap, "CADL_OBJECT_NODE_REF")
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
--| The Original Code is gui_interface.e.
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
