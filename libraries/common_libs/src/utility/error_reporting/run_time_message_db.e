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

class RUNTIME_MESSAGE_DB

inherit
	MESSAGE_DB
		redefine
			make
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

	EXCEPTIONS

	SHARED_APP_RESOURCES

create
	make

feature -- Definitions

	Error_file_extension: STRING = ".txt"

feature -- Initialisation

	make 
			-- populate message table for one language `a_locale_lang' from error DB files found in `an_err_db_dir'
		local
			file_path: STRING
			err_db_file: PLAIN_TEXT_FILE
			dir: DIRECTORY
			file_names: ARRAYED_LIST [STRING]
		do
			precursor
			create dir.make (Error_db_directory)
			if dir.exists then
				dir.open_read
				file_names := dir.linear_representation
				across file_names as file_names_csr loop
					if file_names_csr.item.ends_with (Error_file_extension) then
						file_path := file_system.pathname (Error_db_directory, file_names_csr.item)
						create err_db_file.make (file_path)
						if not err_db_file.exists or else not err_db_file.is_readable then
							io.put_string ("Message database file: " + file_path + " does not exist or not readable%N")
						else
							err_db_file.open_read
							err_db_file.read_stream (err_db_file.count)
							populate_from_text (err_db_file.last_string, locale_language_short)
						end
					end
				end
			else
				io.put_string ("Message database directory: " + Error_db_directory + " does not exist or not readable%N")
			end
		end

	populate_from_text (a_dadl_str, a_locale_lang: STRING)
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
			parser.execute (a_dadl_str, 1)
			if not parser.syntax_error then
				dt_tree := parser.output
				init_helper ?= dt_tree.as_object_from_string ("IN_MEMORY_MESSAGE_DB_INITIALISER", Void)
				if init_helper.templates.has (a_locale_lang) then
					message_db.merge (init_helper.templates.item (a_locale_lang))
				else
					message_db.merge (init_helper.templates.item (Default_message_language))
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


