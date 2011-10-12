note
	component:   "openEHR Reusable Libraries"
	description: "[
			     Error database abstraction. Subtypes can be easily turned into a file that is read in as
			     a dADL text.
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class MESSAGE_DB

inherit
	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

	EXCEPTIONS

create
	make

feature -- Definitions

	Default_message_language: STRING = "en"
			-- default language of messages in this database

	Error_file_extension: STRING = ".txt"

feature -- Initialisation

	make
		do
			create templates.make (0)
		end

feature -- Access

	templates: attached HASH_TABLE [STRING, STRING]
			-- error templates in the form of a table of templates keyed by id

	has_message(an_id: attached STRING): BOOLEAN
		do
			Result := templates.has(an_id)
		end

	create_message_content (an_id: attached STRING; args: ARRAY[STRING]): attached STRING
		local
			i: INTEGER
			idx_str: STRING
			args_list: ARRAY[STRING]
			replacement: STRING
		do
			if templates.has (an_id) then
				Result := templates.item (an_id).twin
				args_list := args
			else
				Result := templates.item ("message_code_error").twin
				args_list := <<an_id>>
			end
			Result.replace_substring_all ("%%N", "%N")
			if args_list /= Void then
				from i := args_list.lower until i > args_list.upper loop
					replacement := args_list.item(i)
					if not attached replacement then
						create replacement.make_empty
					end
					idx_str := i.out
					idx_str.left_adjust
					Result.replace_substring_all ("$" + idx_str, replacement)
					i := i + 1
				end
			end
		end

	create_message_line(an_id: attached STRING; args: ARRAY[STRING]): attached STRING
			-- create message as a full line
		do
			Result := create_message_content(an_id, args)
			Result.append_character ('%N')
		end

feature -- Status Report

	database_loaded: BOOLEAN
		do
			Result := not templates.is_empty
		end

feature -- Modification

	populate (an_err_db_dir, a_locale_lang: attached STRING)
			-- populate error database from error DB files found in `an_err_db_dir'
		local
			file_name, file_path: STRING
			err_db_file: PLAIN_TEXT_FILE
			dir: DIRECTORY
			file_names: ARRAYED_LIST [STRING]
		do
			create dir.make (an_err_db_dir)
			if dir.exists then
				dir.open_read
				file_names := dir.linear_representation
				from file_names.start until file_names.off loop
					file_name := file_names.item
					if file_name.ends_with(Error_file_extension) then
						file_path := file_system.pathname (an_err_db_dir, file_name)
						create err_db_file.make (file_path)
						if not err_db_file.exists or else not err_db_file.is_readable then
							io.put_string ("Message database file: " + file_path + " does not exist or not readable%N")
						else
							err_db_file.open_read
							err_db_file.read_stream (err_db_file.count)
							populate_from_text(err_db_file.last_string, a_locale_lang)
						end
					end
					file_names.forth
				end
			else
				io.put_string ("Message database directory: " + an_err_db_dir + " does not exist or not readable%N")
			end
		end

	populate_from_text (a_dadl_str, a_locale_lang: attached STRING)
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
			Valid_message_string:  not a_dadl_str.is_empty
			Valid_local_lang: not a_locale_lang.is_empty
		local
			parser: DADL_VALIDATOR
			dt_tree: DT_COMPLEX_OBJECT_NODE
			init_helper: IN_MEMORY_MESSAGE_DB_INITIALISER
		do
			create parser.make
			parser.execute(a_dadl_str, 1)
			if not parser.syntax_error then
				dt_tree := parser.output
				init_helper ?= dt_tree.as_object_from_string("IN_MEMORY_MESSAGE_DB_INITIALISER", Void)
				if init_helper.templates.has (a_locale_lang) then
					templates.merge (init_helper.templates.item (a_locale_lang))
				else
					templates.merge (init_helper.templates.item (Default_message_language))
				end
			else
				io.put_string ("Message database failure: " + parser.errors.as_string + "%N")
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
--| The Original Code is error_status.e.
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


