note
	component:   "openEHR Reusable Libraries"
	description: "[
			     In-memory implementation of message database abstraction.
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class IN_MEMORY_MESSAGE_DB

inherit
	MESSAGE_DB

create
	make

feature -- Modification

	populate (a_dadl_str, a_locale_lang: STRING)
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
			Valid_message_string: attached a_dadl_str
			Valid_local_lang: attached a_locale_lang and then not a_locale_lang.is_empty
		local
			parser: DADL2_VALIDATOR
			dt_tree: DT_COMPLEX_OBJECT_NODE
			init_helper: IN_MEMORY_MESSAGE_DB_INITIALISER
		do
			create parser.make
			parser.execute(a_dadl_str, 1)
			if not parser.syntax_error then
				dt_tree := parser.output
				init_helper ?= dt_tree.as_object_from_string("IN_MEMORY_MESSAGE_DB_INITIALISER")
				if init_helper.templates.has (a_locale_lang) then
					templates.merge (init_helper.templates.item (a_locale_lang))
				else
					templates.merge (init_helper.templates.item (Default_message_language))
				end
			else
				io.put_string ("Message database failure: " + parser.error_text + " (check ADL_APPLICATION)%N")
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
--| The Original Code is in_memory_message_db.e.
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


