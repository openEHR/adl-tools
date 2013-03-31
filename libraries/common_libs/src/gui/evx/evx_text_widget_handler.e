note
	component:   "openEHR Re-usable Components"
	description: "Add standard cut & paste capabilities to any text widget within an EV_XX structure"
	keywords:    "EiffelVision, GUI"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_TEXT_WIDGET_HANDLER

inherit
	EV_SHARED_APPLICATION
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

create
	set_root

feature -- Initialisation

	set_root (a_root: EV_CONTAINER)
		do
			root := a_root
		end

feature -- Access

	root: EV_CONTAINER
			-- root widget of some widget structure; may be local root

feature -- Edit events

	on_cut
			-- Cut the selected item, depending on which widget has focus.
		do
			on_copy
			on_delete
		end

	on_copy
			-- Copy the selected item, depending on which widget has focus.
		do
			if attached focused_text and then focused_text.has_selection then
				focused_text.copy_selection
			end
		end

	on_paste
			-- Paste an item, depending on which widget has focus.
		local
			old_length: INTEGER
		do
			if attached focused_text and then focused_text.is_editable then
				on_delete
				old_length := focused_text.text_length
				focused_text.paste (focused_text.caret_position)
				focused_text.set_caret_position (focused_text.caret_position + focused_text.text_length - old_length)
			end
		end

	on_delete
			-- Delete the selected item, depending on which widget has focus.
		do
			if attached focused_text and then focused_text.is_editable and focused_text.has_selection then
				focused_text.delete_selection
			end
		end

	on_select_all
			-- Select all text in the currently focused text box, if any.
		do
			if attached focused_text and then focused_text.text_length > 0 then
				focused_text.select_all
			end
		end

	call_unless_text_focused (action: PROCEDURE [ANY, TUPLE])
			-- Some of the edit shortcuts are implemented automatically for text boxes (although not for rich text
			-- boxes, or at least not on Windows).
			-- If called from a keyboard shortcut, execute the action unless a text box is focused.
			-- Executing it within a text box would cause it to be performed twice.
			-- For some actions this wouldn't really matter (cut, copy), but for paste it would be a blatant bug.
		local
			t: detachable EV_TEXT_COMPONENT
		do
			t := focused_text
			if not attached t or else attached {EV_RICH_TEXT} t then
				action.call ([])
			end
		end

	step_focused_notebook_tab (step: INTEGER)
			-- Switch forward or back from the current tab page of the currently focused notebook.
		require
			valid_step: step.abs <= 1
		local
			widget: EV_WIDGET
		do
			if attached notebook_containing_focused_widget as notebook then
				widget := notebook [1 + (step + notebook.selected_item_index - 1 + notebook.count) \\ notebook.count]
				notebook.select_item (widget)
				focus_first_widget (widget)
			end
		end

	focus_first_widget (widget: EV_WIDGET)
			-- Set focus to `widget' or to its first child widget that accepts focus.
		local
			widgets: LINEAR [EV_WIDGET]
		do
			if attached {EV_CONTAINER} widget as container and not attached {EV_GRID} widget as grid and attached ev_application.focused_widget as fw then
				widgets := container.linear_representation
				from
					widgets.start
				until
					widgets.off or container.has_recursive (fw)
				loop
					focus_first_widget (widgets.item)
					widgets.forth
				end
			elseif widget.is_displayed and widget.is_sensitive then
				if not attached {EV_LABEL} widget as label and not attached {EV_TOOL_BAR} widget as toolbar then
					widget.set_focus
				end
			end
		end

feature {NONE} -- Implementation

	notebook_containing_focused_widget: detachable EV_NOTEBOOK
			-- The notebook, if any, containing the currently focused widget.
		local
			container: detachable EV_CONTAINER
		do
			if attached ev_application.focused_widget as fw and then root.has_recursive (fw) then
				from container := fw.parent until container = Void or attached Result loop
					if attached {EV_NOTEBOOK} container as c then
						Result := c
					end
					container := container.parent
				end
			end
		end

	focused_text: detachable EV_TEXT_COMPONENT
			-- The currently focused text widget, if any.
		do
			if attached {EV_TEXT_COMPONENT} ev_application.focused_widget as fw and then root.has_recursive (fw) then
				Result := fw
			end
		ensure
			focused: attached Result implies Result.has_focus
			in_this_window: attached Result implies root.has_recursive (Result)
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
--| The Original Code is gui_text_widget_handler.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
