indexing
	description: "Help dialog acting as a legend for the various icons displayed in ADL Workbench."
	date: "$Date: 2005/01/07 19:38:13 $"
	revision: "$Revision$"

class
	ICON_DIALOG

inherit
	ICON_DIALOG_IMP

	SHARED_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	user_initialization is
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			set_icon_pixmap (adl_workbench_ico)
			ok_button.select_actions.extend (agent hide)
			set_default_cancel_button (ok_button)
			set_default_push_button (ok_button)
			add_help_items
		end

feature -- Access

	main_window: MAIN_WINDOW
			-- main window of app

feature -- Modification

	set_main_window (a_mw: MAIN_WINDOW) is
			-- set main_window
		require
			a_mw /= Void
		do
			main_window := a_mw
		end

feature {NONE} -- Implementation

	add_help_items is
			-- Add icon explanation row items
		local
			list_item: EV_LIST_ITEM
			help: STRING
		do
			from
				pixmap_table.start
			until
				pixmap_table.off
			loop
				help := pixmap_table.item_for_iteration.help

				if help /= Void then
					create list_item.make_with_text (help)

					if pixmaps.has (pixmap_table.key_for_iteration) then
						list_item.set_pixmap (pixmaps [pixmap_table.key_for_iteration])
					end

					icon_help_list.extend (list_item)
				end

				pixmap_table.forth
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
--| The Original Code is archetype_id.e.
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
