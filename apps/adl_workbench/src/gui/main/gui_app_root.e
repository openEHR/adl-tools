note
	component:   "openEHR Archetype Project"
	description: "Main Application"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	GUI_APP_ROOT

inherit
	EV_APPLICATION

	SHARED_APP_ROOT
		export
			{NONE} all;
			{ANY} app_root
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch
			-- Create and launch the application
		do
			default_create
			if not is_destroyed then
				create splash.make_with_shadow
				post_launch_actions.extend_kamikaze (agent app_launch)
				launch
			end
		end

	app_launch
		do
			splash.show
			process_events
			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				app_root.initialise_app
				if not app_root.has_errors then
					process_graphical_events
					create main_window
					main_window.show
					splash.hide
				else
					io.put_string (app_root.errors.as_string)
				end
			else
				io.put_string (app_root.errors.as_string)
			end
		end

	main_window: MAIN_WINDOW

	splash: SPLASH_WINDOW

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
