indexing
	component:   "openEHR Archetype Project"
	description: "EV_GRID control for compiler error output"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_COMPILER_ERROR_CONTROL

inherit
	SHARED_ARCHETYPE_DIRECTORY
		export
			{NONE} all
		end

	SHARED_UI_RESOURCES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

feature {NONE} -- Initialisation

	make (a_main_window: MAIN_WINDOW)
			-- create control
		require
			a_main_window /= Void
		do
			gui := a_main_window
			grid := gui.compiler_output_grid
			grid.enable_tree
			grid.insert_new_column (1)
			grid.insert_new_column (2)
			grid.column (1).set_title ("Error")
			grid.column (2).set_title ("Message")
		end

feature -- Access


feature -- Status Setting

	is_expanded: BOOLEAN
			-- True if archetype tree is in expanded state

feature -- Commands

	clear is
			-- wipe out content from controls
   		local
			gli: EV_GRID_LABEL_ITEM
		do
			grid.wipe_out

 			-- Populate first column with archetype tree.
			create gli.make_with_text ("Errors")
			grid.set_item (1, 1, gli)
			gli.enable_select
		end

	add_item (an_archetype: ARCH_REP_ARCHETYPE) is
			-- Add a node representing the errors or warnings of the archetype
		require
			an_archetype /= Void
		local
			gli: EV_GRID_LABEL_ITEM
			row: EV_GRID_ROW
			pixmap: EV_PIXMAP
		do
			grid.insert_new_row (grid.row_count+1)
			row := grid.row (grid.row_count)
			create gli.make_with_text (utf8 (an_archetype.id.as_string))
			row.set_item (1, gli)
			pixmap := pixmaps [an_archetype.group_name]
			if pixmap /= Void then
				gli.set_pixmap (pixmap)
			end

			row.insert_subrow (row.subrow_count + 1)
			row := row.subrow (row.subrow_count)
			row.set_data (an_archetype)
			create gli.make_with_text (utf8 (an_archetype.compiler_status))
			row.set_item (2, gli)

			grid.column (1).resize_to_content
			grid.column (2).resize_to_content
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	grid: EV_GRID
			-- reference to MAIN_WINDOW.compiler_output grid

invariant
	grid_attached: grid /= Void

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
--| The Original Code is gui_compiler_error_control.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
