note
	component:   "openEHR ADL Tools"
	description: "Splash window"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SPLASH_WINDOW

inherit
	EV_POPUP_WINDOW
		redefine
			create_interface_objects, initialize
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_with_shadow

feature {NONE} -- Initialization

	create_interface_objects
		do
			Precursor
			create border
			border.set_border_width (2)
			border.set_background_color (Splash_background_color)

			create hb
			hb.set_padding (10)
			hb.set_border_width (15)

			create img_cell
			img_cell.set_minimum_size (adl_workbench_logo.width, adl_workbench_logo.height)
			img_cell.extend (adl_workbench_logo)
			hb.extend (img_cell)

			hb.extend (ev_splash_text)

			border.extend (hb)
		end

	initialize
		local
			screen: EV_SCREEN
		do
			Precursor
			extend (border)
			set_background_color (create {EV_COLOR}.make_with_8_bit_rgb (255, 255, 248))
			propagate_background_color

			create screen
			set_position (app_x_position + (screen.width - width) // 2, app_y_position + (screen.height - height) // 2)
		end

feature {NONE} -- Implementation

	hb, border: EV_HORIZONTAL_BOX

	img_cell: EV_CELL

	close
			-- Close the window and destroy `timer'.
		do
			hide
		end

end


