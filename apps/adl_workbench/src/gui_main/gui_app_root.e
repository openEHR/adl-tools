note
	component:   "openEHR Archetype Project"
	description: "Main Application"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

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
			-- Create and launch the application, showing a splash window followed by the main window.
		do
			default_create
			app_root.initialise
			show_splash_window
			if not is_destroyed then
				post_launch_actions.extend_kamikaze (agent show_main_window)
				launch
			end
		end

	show_splash_window
			-- Display the splash window, but abort the application if there is no icons directory.
			-- This avoids a resource leak, by ensuring that there is no reference to the splash window after launch.
		local
			splash: SPLASH_WINDOW
		do
			create splash.make
			splash.show

			if not has_icon_directory then
				new_abort_dialog ("The 'icons' directory is missing. Please reinstall ADL Workbench and try again.").show_modal_to_window (splash)
				destroy
			end
		ensure
			aborting_if_no_icons: is_destroyed xor has_icon_directory
		end

	show_main_window
			-- Build and display the application's main window.
		local
			main_window: MAIN_WINDOW
		do
			process_graphical_events
			create main_window
			main_window.show
		end

	new_abort_dialog (text: STRING): EV_MESSAGE_DIALOG
			-- A newly created dialog containing an "Abort" button and `text'.
		do
			create Result.make_with_text (text)
			Result.set_title ("Cannot launch ADL Workbench")
			Result.set_pixmap ((create {EV_STOCK_PIXMAPS}).error_pixmap)
			Result.set_icon_pixmap (Result.pixmap)
			Result.set_buttons (<<"Abort">>)
			Result.set_default_push_button (Result.button ("Abort"))
			Result.set_default_cancel_button (Result.button ("Abort"))
		ensure
			text_set: Result.text.same_string (text)
			button_set: Result.has_button ("Abort")
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
