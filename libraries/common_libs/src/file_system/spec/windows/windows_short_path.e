note
	component:   "openEHR Reusable Libraries"
	description: "Short (8-dot-3) MS-DOS style paths on Windows."
	keywords:    "path, Windows"
	author:      "Peter Gummer <peter.gummer@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	WINDOWS_SHORT_PATH

inherit
	BASE_C_STRING
		rename
			string as as_long_path
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, as_long_path
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make (path: STRING)
			-- If `path' is in Windows short 8.3 format, convert it to a normal long path.
		do
			make_empty (2000)
			set_string (path)
			get_long_path_name (item, capacity)
		end

feature {NONE} -- Externals

	get_long_path_name (path: POINTER; n: INTEGER)
			-- Convert `path' to a normal long path.
		external
			"C inline use <windows.h>"
		alias
			"GetLongPathNameA ((LPCSTR) $path, (LPSTR) $path, (DWORD) $n)"
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
--| The Original Code is shared_resources.e.
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
