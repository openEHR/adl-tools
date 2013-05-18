note
	component:   "openEHR ADL Tools"
	
	description: "Definition of a state machine transition"
	keywords:    "archetype, transition, data"
	
	design:      "openEHR Data Types Archetype Model 0.4"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TRANSITION

feature -- Access

	event: STRING	
			-- Event which fires this transition

	guard: STRING	
			-- Guard condition which must be true for this transition to fire
	action: STRING	
			-- Side-effect action to execute during the firing of this transition

	next_state: STATE	
			-- Target state of transition

feature -- Output

	as_display_string:STRING
		do
			create Result.make(0)
		end

	as_canonical_string:STRING
		do
			create Result.make(0)
		end

invariant
	event_valid: event /= Void and then not event.empty
	action_valid: action /= Void implies not action.empty
	guard_valid: guard /= Void implies not guard.empty	

end


