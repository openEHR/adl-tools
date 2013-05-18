note
	component:   "openEHR ADL Tools"
	
	description: "Definition of a state machine"
	keywords:    "archetype, state, data"
	
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class STATE_MACHINE

feature -- Access

	states: LINKED_SET [STATE]

feature -- Output

	as_display_string:STRING
		do
			create Result.make(0)
			from 
				states.start
			until 
				states.off
			loop
				Result.append(states.item.as_display_string)
				states.forth
			end
		end

	as_canonical_string:STRING
		do
			create Result.make(0)
		end

invariant
	states_valid: states /= Void and then not states.empty

end


