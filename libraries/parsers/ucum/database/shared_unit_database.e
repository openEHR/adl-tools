note
	component:   "openEHR Reusable Libraries"
	description: "Shared Database of unit tables."
	keywords:    "units, UCUM"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_UNIT_DATABASE

feature -- Initialisation

	initialise_unit_database(unit_groups_path_name, prefixes_file_name:STRING)
			-- initialise unit database from supplied directory & filename
		require
			Groups_path_name_exists: unit_groups_path_name /= Void and then not unit_groups_path_name.is_empty
			Prefixes_file_name_exists: prefixes_file_name /= Void and then not prefixes_file_name.is_empty
		local
			ud:UNIT_DATABASE
			dir:DIRECTORY
			a_file:RAW_FILE
		do
			create dir.make(unit_groups_path_name)
			create a_file.make(prefixes_file_name)
			if not (dir.exists and dir.is_readable) then
				io.put_string("ERROR - directory " + unit_groups_path_name + " does not exist or not readable%N")
			elseif not (a_file.exists and a_file.is_readable) then
				io.put_string("ERROR - file " + prefixes_file_name + " does not exist or not readable%N")
			else
				create ud.make(unit_groups_path_name, prefixes_file_name)
				shared_unit_database.put(ud)
			end
		end

feature -- Access

	unit_database:UNIT_DATABASE
		do
			Result := shared_unit_database.item
		end

feature {NONE} -- Implementation

	shared_unit_database:CELL[UNIT_DATABASE]
		once
			create Result.put(Void)
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
--| The Original Code is shared_unit_database.e.
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
