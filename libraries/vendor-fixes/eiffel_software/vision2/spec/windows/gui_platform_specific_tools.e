note
	component:   "openEHR ADL Tools"
	description: "[
				 Platform-specific utilities for working with Eiffel Vision2.
				 Windows version.
				 ]"
	keywords:    "vision2, Windows"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class
	GUI_PLATFORM_SPECIFIC_TOOLS

feature -- Modification

	show_combo_box_list (combo_box_imp: attached EV_COMBO_BOX_IMP)
			-- Make the drop-down list of `combo_box_imp' appear.
		do
			combo_box_imp.show_list
		end

	hide_combo_box_list (combo_box_imp: attached EV_COMBO_BOX_IMP)
			-- Make the drop-down list of `combo_box_imp' disappear.
		do
			combo_box_imp.hide_list
		end

end

