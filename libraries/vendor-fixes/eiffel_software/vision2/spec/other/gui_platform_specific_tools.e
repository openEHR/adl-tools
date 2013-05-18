note
	component:   "openEHR ADL Tools"
	description: "[
				 Platform-specific utilities for working with Eiffel Vision2.
				 GTK version.
				 ]"
	keywords:    "vision2, GTK"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class
	GUI_PLATFORM_SPECIFIC_TOOLS

inherit
	EV_INTERMEDIARY_ROUTINES

feature -- Modification

	show_combo_box_list (combo_box_imp: attached EV_COMBO_BOX_IMP)
			-- Make the drop-down list of `combo_box_imp' appear.
		do
			gtk_combo_box_popup (combo_box_imp.container_widget)
		end

	hide_combo_box_list (combo_box_imp: attached EV_COMBO_BOX_IMP)
			-- Make the drop-down list of `combo_box_imp' disappear.
		do
			{GTK2}.gtk_combo_box_popdown (combo_box_imp.container_widget)
		end

	frozen gtk_combo_box_popup (a_combo: POINTER)
		external
			"C signature (GtkComboBox*) use <ev_gtk.h>"
		end

end

