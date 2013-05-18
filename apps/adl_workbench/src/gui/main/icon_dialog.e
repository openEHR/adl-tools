note
	description: "Help dialog acting as a legend for the various icons displayed in ADL Workbench."
	date: "$Date$"
	revision: "$Revision$"

class
	ICON_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end

	EVX_DEFINITIONS
		undefine
			is_equal, default_create, copy
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}

			-- Create widgets.
			create ev_vbox_1
			create icon_help_list
			create ev_hbox_1
			create ev_cell_1
			create ok_button
			create ev_cell_2

			-- connect widgets
			extend (ev_vbox_1)
			ev_vbox_1.extend (icon_help_list)
			ev_vbox_1.extend (ev_hbox_1)
			ev_hbox_1.extend (ev_cell_1)
			ev_hbox_1.extend (ok_button)
			ev_hbox_1.extend (ev_cell_2)

			-- set visual characteristics
			ev_vbox_1.set_minimum_width (340)
			ev_vbox_1.disable_item_expand (ev_hbox_1)
			icon_help_list.set_background_color (editable_colour)
			icon_help_list.set_minimum_width (300)
			icon_help_list.set_minimum_height (400)
			ev_hbox_1.set_padding (15)
			ev_hbox_1.set_border_width (10)
			ev_hbox_1.disable_item_expand (ok_button)
			ok_button.set_text ("OK")
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			set_minimum_width (450)
			set_minimum_height (700)
			set_title ("ADL Workbench Icon Key")
			set_icon_pixmap (adl_workbench_icon)

			-- connect events
			ok_button.select_actions.extend (agent hide)
			set_default_cancel_button (ok_button)
			set_default_push_button (ok_button)
			add_help_items
			show_actions.extend (agent icon_help_list.set_focus)
		end

feature {NONE} -- Implementation

	add_help_items
			-- Add icon explanation row items
		local
			list_item: EV_LIST_ITEM
			help: STRING
		do
--			from semantic_icon_table.start until semantic_icon_table.off loop
--				help := semantic_icon_table.item_for_iteration.help

--				if help /= Void then
--					create list_item.make_with_text (help)

--					if pixmaps.has (semantic_icon_table.key_for_iteration) then
--						list_item.set_pixmap (pixmaps [semantic_icon_table.key_for_iteration])
--					end

--					icon_help_list.extend (list_item)
--				end

--				semantic_icon_table.forth
--			end
		end

	ev_vbox_1: EV_VERTICAL_BOX
	icon_help_list: EV_LIST
	ev_hbox_1: EV_HORIZONTAL_BOX
	ev_cell_1, ev_cell_2: EV_CELL
	ok_button: EV_BUTTON

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

end


