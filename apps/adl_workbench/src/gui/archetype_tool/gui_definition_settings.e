note
	component:   "openEHR ADL Tools"
	description: "Model of a vector of UI settings required to specify definition tree visual appearance."
	keywords:    "archetype, definition, gui"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

class GUI_DEFINITION_SETTINGS

inherit
	BASIC_DEFINITIONS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

create
	make, make_default

feature -- Initialisation

	make_default
		do
			language := default_language
		end

	make (a_language: STRING;
			a_show_codes,
			a_show_rm_inheritance,
			a_show_technical_view,
			a_show_rm_multiplicities,
			a_show_rm_data_properties,
			a_show_rm_runtime_properties,
			a_show_rm_infrastructure_properties: BOOLEAN)
		do
			language := a_language
			show_codes := a_show_codes
			show_rm_inheritance := a_show_rm_inheritance
			show_technical_view := a_show_technical_view
			show_rm_multiplicities := a_show_rm_multiplicities
			show_rm_data_properties := a_show_rm_data_properties
			show_rm_runtime_properties := a_show_rm_runtime_properties
			show_rm_infrastructure_properties := a_show_rm_infrastructure_properties
		end

feature -- Access

	language: STRING

	show_codes: BOOLEAN

	show_rm_inheritance: BOOLEAN

	show_technical_view: BOOLEAN

	show_rm_multiplicities: BOOLEAN

	show_rm_data_properties: BOOLEAN

	show_rm_runtime_properties: BOOLEAN

	show_rm_infrastructure_properties: BOOLEAN

end


