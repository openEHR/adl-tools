note
	component:   "openEHR ADL Tools"
	
	description: "Definition of a state machine state"
	keywords:    "archetype, state, data"
	
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class STATE

feature -- Access

	name: STRING	
			-- name of this state

	transitions: LINKED_SET [TRANSITION]
	
feature -- Output

	as_display_string:STRING
		do
			create Result.make(0)
			from 
				transitions.start
			until 
				transitions.off
			loop
				Result.append(transitions.item.as_display_string)
				transitions.forth
			end
		end

	as_canonical_string:STRING
		do
			create Result.make(0)
		end


invariant
	transitions_valid: transitions /= Void and then not transitions.empty	

end


