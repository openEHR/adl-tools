indexing
	component:   "openEHR Archetype Project"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$Source"
	revision:    "$Revision"
	last_change: "$Date"

class SHARED_UI_RESOURCES

inherit
	SHARED_RESOURCES
	
feature -- Access

	has_icon_directory: BOOLEAN is
			-- True if icon directory available
		local
			a_dir: DIRECTORY
		do
			create a_dir.make(startup_directory + "/icons")
			Result := a_dir.exists
		end
		
	pixmaps: HASH_TABLE[EV_PIXMAP, STRING] is
			-- table of pixmap file paths keyed by logical name
		require
			has_icon_directory
		local
			pixmap: EV_PIXMAP
		once
			create Result.make(0)
			
			create pixmap
			pixmap.set_with_named_file(startup_directory + "/icons/openehr.png")
			Result.put(pixmap, "openEHR logo")
		end

	splash_text: STRING is
			-- create a splash string for the console
		once
			create Result.make(0)
			Result.append("openEHR Reference Model Test Bench (c)2003, 2004%N")
			Result.append("%T" + (create {DATE_TIME}.make_now).out + "(alpha)%N")
			Result.append("%Tavailable from: www.openEHR.org%N")
			Result.append("%Tsupport: support@OceanInformatics.biz%N")
			Result.append("%Tauthor: Thomas Beale%N")
			Result.append("Built using%N")
			Result.append("%TISE Eiffel (see www.eiffel.com)%N")
			Result.append("%TGobo parsing libraries & tools (see www.gobosoft.com)%N")
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
