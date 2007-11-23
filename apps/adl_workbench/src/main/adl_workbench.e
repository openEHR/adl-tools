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
		redefine
			initialize
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch
			-- Create `Current', build and display `main_window',
			-- then launch the application.
		do
			default_create

			if has_resources then
				initialise_default_resource_config_file_name
				main_window.show

				if new_news then
					main_window.display_news
					update_status_file
				end

				launch
			else
				io.put_string(fail_reason + "%N")
				io.put_string("Hit any key to exit application%N")
				io.read_character
			end
		end

	initialize
			-- Ensure that `splash_window' is shown at the earliest opportunity.
		do
			Precursor
			show_splash_window
		end

	show_splash_window
			-- Show the splash window, centred on the screen in front of `main_window'.
		local
			retrying: BOOLEAN
			splash: SPLASH_WINDOW
		do
			if not retrying then
				retrying := True
				create splash.make
				splash.show_relative_to_window (main_window)
				splash.refresh_now
			end
		rescue
			retry
		end

feature {NONE} -- Implementation

	main_window: MAIN_WINDOW
			-- The application's main window.
		once
			create Result
		ensure
			attached: Result /= Void
		end

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
