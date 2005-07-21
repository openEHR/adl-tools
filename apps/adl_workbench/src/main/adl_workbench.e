indexing
	component:   "openEHR Archetype Project"
	description: "Main Application"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	ADL_WORKBENCH

inherit
	EV_APPLICATION
	
	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_and_launch
	
feature {NONE} -- Initialization

	make_and_launch is
			-- Create `Current', build and display `main_window',
			-- then launch the application.
		do
			default_create
		
			if has_resources then
				read_resource_file
				create main_window
				create splash_window.make
				splash_window.show
				main_window.show
				if main_window.need_to_set_options then
					main_window.set_options
				end

				if new_news then
					main_window.display_news
					update_status_file
				end
				
				splash_window.raise
				
				launch				
			else
				io.put_string(fail_reason + "%N")
				io.put_string("Hit any key to exit application%N")
				io.read_character
			end
		end
		
feature {NONE} -- Implementation

	main_window: MAIN_WINDOW
		-- Main window of `Current'.
	
	splash_window: SPLASH_WINDOW
	
	fail_reason: STRING
	
	has_resources: BOOLEAN is
			-- True if all resources are available
		do
			Result := True
			if not has_icon_directory then
				fail_reason := "Cannot run: 'icons' directory missing"
				Result := False
			end
		ensure
			not Result implies fail_reason /= Void
		end
		
	read_resource_file is
			-- 
		local
			s: STRING
		do
			s := application_name
			s.replace_substring_all(".exe", "")
			s.append(".cfg")
			initialise_resource_config_file_name(startup_directory + os_directory_separator.out + s)
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
--| The Original Code is adl_gui_vision2.e.
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
