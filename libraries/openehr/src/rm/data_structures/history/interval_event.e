note
	component:   "openEHR ADL Tools"
	
	description: "[
	              An event in an event series.
				  ]"
	keywords:    "content, temporal, data structure"

	requirements:"ISO 18308 TS V1.0 ???"
	design:      "openEHR Data Structures Reference Model 1.6"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class INTERVAL_EVENT [G -> ITEM_STRUCTURE]

inherit
	EVENT [G]
	
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all
		end
	
feature -- Access

	math_function: DV_CODED_TEXT
			-- The math function of the data of this event
			
	width: DV_DURATION	
			-- length of the interval during which the state was true. Void if an instantaneous event.

	sample_count: INTEGER
			-- number of original point samples to which this interval example
			-- corresponds

	interval_start_time: DV_DATE_TIME
			-- time point of the start of the interval
		do
			Result := time.subtract(width)
		end
		
invariant
	Width_valid: width /= Void
	Interval_start_time_valid: interval_start_time /= Void
	Math_function_validity: terminology(terminology_id_openehr).
		has_code_for_group_id(group_id_event_math_function, math_function.defining_code)
		
end


