note
	component:   "openEHR ADL Tools"
	description: "Shared address bar"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@openEHR.org"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2024 openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	SHARED_GUI_ADDRESS_BAR

feature -- Address control

	address_bar: GUI_ADDRESS_BAR
		once ("PROCESS")
			create Result.make
		end

end


