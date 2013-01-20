note
	component:   "openEHR Archetype Project"
	description : "[
				   Message DB compiler. Validates any number of dADL files which look like:
				   	<
						["lang1"] = <
							["CodeA"] = <"text $1 text $2">
							["CodeB"] = <"text $1 text">
							["CodeC"] = <"text $1, $2, $3">
						>
						["lang2"] = <
							["CodeA"] = <"text $1 text $2">
							["CodeB"] = <"text $1 text">
							["CodeC"] = <"text $1, $2, $3">
						>
						etc
					>
					
				    These are converted to the in memory form HASH_TABLE [HASH_TABLE [STRING, STRING], STRING] and validated.
				    
				    If valid, generate an Eiffel class containing all messages for chosen language, that can be included in any app,
				    which looks as follows:
				    
				    class COMPILED_MESSAGE_DB
				    feature -- Access
				    	messages: [HASH_TABLE [STRING, STRING]]
				    		once
				    			create Result.make(0)
				    			Result.put ("text $1 text $2", "CodeA")
				    			Result.put ("text $1 text", "CodeB")
				    			Result.put ("text $1, $2, $3", "CodeC")
				    		end
				    end
				    
				    This class can then be inherited by the class MESSAGE_DB in any app.
				    
						USAGE:
						   msgdbc.exe [-l <lang>] [-s <directory>] [-o <directory>] [-v] [-nologo]

						OPTIONS:
						   Options should be prefixed with: '-' or '/'

						   -l --lang      : language (Optional)
						                    <lang>: language code
						   -s --source_dir: source directory (Optional)
						                    <directory>: directory
						   -o --output_dir: output directory (Optional)
						                    <directory>: directory
						   -? --help      : Display usage information. (Optional)
						   -v --version   : Displays version information. (Optional)
  				   ]"
	keywords:    "Internationalisation, I18N, Localisation, L10N"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	APPLICATION

inherit
	SHARED_MESSAGE_DB

	KL_SHARED_FILE_SYSTEM

	ANY_VALIDATOR

create
	make

feature -- Definition

	Error_file_extension: STRING = ".txt"

feature -- Initialization

	make
		do
			reset
			options_processor.execute (agent start)
		end

feature -- Access


feature -- Status Report


feature -- Commands

	start
		local
			fd: PLAIN_TEXT_FILE
			file_path: STRING
		do
			populate (options_processor.msg_source_dir, options_processor.locale_lang)
			if passed then
				class_generator.generate (message_defs)
				check attached file_system.pathname (options_processor.output_file_dir, class_generator.class_name.as_lower + ".e") as pn then
					file_path := pn
				end
				create fd.make_create_read_write (file_path)
				fd.put_string (class_generator.output)
				io.put_string ("Wrote class text to " + file_path + "%N")
			else
				io.put_string (errors.as_string)
			end
		end

	validate
		do

		end

feature {NONE} -- Implementation

	options_processor: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_displayed_on_error (True)
		end

	populate (a_msg_db_dir, a_locale_lang: STRING)
			-- populate message table for one language `a_locale_lang' from message files found in `a_msg_db_dir'
		local
			file_path: STRING
			msg_file: PLAIN_TEXT_FILE
			dir: DIRECTORY
			found_count: INTEGER
		do
			message_defs.wipe_out
			create dir.make (a_msg_db_dir)
			if dir.exists then
				dir.open_read
				across dir.linear_representation as file_names_csr loop
					if file_names_csr.item.ends_with (Error_file_extension) then
						found_count := found_count + 1
						check attached file_system.pathname (a_msg_db_dir, file_names_csr.item) as pn then
							file_path := pn
						end
						create msg_file.make (file_path)
						if not msg_file.exists or else not msg_file.is_readable then
							add_error ("msg_file_not_found", <<file_path>>)
						else
							msg_file.open_read
							msg_file.read_stream (msg_file.count)
							populate_from_text (msg_file.last_string, a_locale_lang, file_path)
							msg_file.close
						end
					end
				end
				if found_count = 0 then
					add_error ("msg_files_dir_empty", <<a_msg_db_dir>>)
				end
			else
				add_error ("msg_files_dir_not_found", <<a_msg_db_dir>>)
			end
		end

	populate_from_text (a_dadl_str, a_locale_lang, a_file_path: STRING)
			-- populate message database using messages in `a_dadl_str' in language `a_locale_lang'.
			-- The latter should be a 2-digit ISO 639 language code, e.g. "en", "de" etc
			-- The format of `a_dadl_str' (dADL):
			--	templates = <
			--		["en"] = <
			--			["key1"] = <"Message string with $1 argument $2 argument etc">
			--			["key2"] = <"Message string with $1 argument $2 argument etc">
			--		>
			--	>
			-- caller should check database_loaded after call.
		require
			Valid_message_string: not a_dadl_str.is_empty
			Valid_local_lang: not a_locale_lang.is_empty
			Valid_file_path: not a_file_path.is_empty
		do
			dadl_parser.reset
			dadl_parser.execute (a_dadl_str, 1)
			if not dadl_parser.syntax_error then
				if attached {IN_MEMORY_MESSAGE_DB_INITIALISER} dadl_parser.output.as_object_from_string ("IN_MEMORY_MESSAGE_DB_INITIALISER", Void) as init_helper then
					if init_helper.templates.has (a_locale_lang) then
						across init_helper.templates.item (a_locale_lang) as msg_def_csr loop
							if not message_defs.has (msg_def_csr.key) then
								message_defs.put (msg_def_csr.item, msg_def_csr.key)
								key_file_xref.put (a_file_path, msg_def_csr.key)
							else
								check attached key_file_xref.item (msg_def_csr.key) as kfx then
									add_error ("dup_key_in_other_file", <<msg_def_csr.key, a_file_path, kfx>>)
								end
							end
						end
					else
						add_error ("lang_not_found", <<a_locale_lang, a_file_path>>)
					end
				end
			else
				add_error ("dadl_parse_failure", <<a_file_path, dadl_parser.errors.as_string>>)
			end
		end

	dadl_parser: DADL_VALIDATOR
		once
			create Result.make
		end

	key_file_xref: HASH_TABLE [STRING, STRING]
			-- table of message file name keyed by message key, used for generating useful errors about duplicates tec
		once
			create Result.make (0)
		end

	message_defs: HASH_TABLE [STRING, STRING]
			-- message definitions in the form of a table of templates keyed by id
		attribute
			create Result.make (1000)
		end

	class_generator: MESSAGE_CLASS_GENERATOR
		once
			create Result.make
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
