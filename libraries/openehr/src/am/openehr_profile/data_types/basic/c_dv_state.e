note
	component:   "openEHR ADL Tools"

	description: "[
			 Constrainer type for DV_STATE instances. The attribute c_value defines 
			 a state/event table which constrains the allowed values of the 
			 attribute value in a DV_STATE instance, as well as the order of 
			 transitions between values.
			 ]"
	keywords:    "archetype, state, data"

	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_DV_STATE

feature -- Access

	default_value: DV_BOOLEAN
		do
		end

	c_value: STATE_MACHINE
			-- constrainer on value

feature -- Status Report

	valid_value (a_value: DV_STATE): BOOLEAN
		do
		end

feature -- Output

	as_display_string:STRING
		do
			create Result.make(0)
			Result.append("{" + c_value.as_display_string + "}")
		end

	as_canonical_string:STRING
		do
			create Result.make(0)
			Result.append( "<c_value>" + c_value.as_canonical_string + "</c_value>")
		end

invariant
	c_value_exists: c_value /= Void

end


