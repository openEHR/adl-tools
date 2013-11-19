note
	component:   "Eiffel Object Modelling Framework"
	description: "Date/time constraint routines"
	keywords:    "date time, constraint"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DATE_TIME_ROUTINES

inherit
	ISO8601_ROUTINES

feature -- Definitions

	valid_date_constraint_patterns: ARRAYED_LIST [STRING]
			-- List of allowed date constraints.
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("YYYY-MM-DD")	-- full date required
			Result.extend ("YYYY-MM-??")	-- day optional
			Result.extend ("YYYY-MM-XX")	-- day not allowed
			Result.extend ("YYYY-??-??")	-- any date ok
			Result.extend ("YYYY-??-XX")	-- day not allowed
			Result.extend ("YYYY-XX-XX")	-- neither month nor day allowed
		ensure
			not_empty: not Result.is_empty
		end

	valid_date_constraint_replacements: HASH_TABLE[ARRAY [STRING], STRING]
			-- List of allowed date constraint replacements e.g. in specialised archetype
		once
			create Result.make (0)
			Result.put (<<>>, "YYYY-MM-DD")	-- no replacements possible
			Result.put (<<"YYYY-MM-DD", "YYYY-MM-XX">>, "YYYY-MM-??")
			Result.put (<<>>, "YYYY-MM-XX")	-- no replacements possible
			Result.put (<<"YYYY-MM-??", "YYYY-MM-DD", "YYYY-MM-XX", "YYYY-??-XX", "YYYY-XX-XX">>, "YYYY-??-??")
			Result.put (<<"YYYY-MM-XX", "YYYY-XX-XX">>, "YYYY-??-XX")
			Result.put (<<>>, "YYYY-XX-XX")	-- no replacements possible
			across Result as items_csr loop
				items_csr.item.compare_objects
			end
		ensure
			not_empty: not Result.is_empty
		end

	valid_time_constraint_patterns: ARRAYED_LIST [STRING]
			-- List of allowed time constraints.
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("HH:MM:SS")	-- full time required
			Result.extend ("HH:MM:??")	-- seconds optional
			Result.extend ("HH:MM:XX")	-- seconds not allowed
			Result.extend ("HH:??:??")	-- minutes and seconds optional
			Result.extend ("HH:??:XX")	-- minutes optional but seconds not allowed
		ensure
			not_empty: not Result.is_empty
		end

	valid_time_constraint_replacements: HASH_TABLE[ARRAY [STRING], STRING]
			-- List of allowed time constraint replacements e.g. in specialised archetype
		once
			create Result.make (0)
			Result.put (<<>>, "HH:MM:SS")	-- no replacements possible
			Result.put (<<"HH:MM:SS", "HH:MM:XX">>, "HH:MM:??")
			Result.put (<<>>, "HH:MM:XX")	-- no replacements possible
			Result.put (<<"HH:MM:??", "HH:MM:SS", "HH:MM:XX", "HH:??:XX">>, "HH:??:??")
			Result.put (<<"HH:MM:XX">>, "HH:??:XX")
			across Result as items_csr loop
				items_csr.item.compare_objects
			end
		ensure
			not_empty: not Result.is_empty
		end

	valid_date_time_constraint_patterns: ARRAYED_LIST [STRING]
			-- List of allowed date/time constraints.
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("YYYY-MM-DDTHH:MM:SS")	-- full date/time required
			Result.extend ("YYYY-MM-DDTHH:MM:??")	-- seconds optional
			Result.extend ("YYYY-MM-DDTHH:MM:XX")	-- seconds not allowed
			Result.extend ("YYYY-MM-DDTHH:??:??")	-- minutes and seconds optional
			Result.extend ("YYYY-MM-DDTHH:??:XX")	-- minutes optional but seconds not allowed
			Result.extend ("YYYY-??-??T??:??:??")	-- any date/time ok
		ensure
			not_empty: not Result.is_empty
		end

	valid_date_time_constraint_replacements: HASH_TABLE [ARRAY [STRING], STRING]
			-- List of allowed date/time constraint replacements e.g. in specialised archetype
		once
			create Result.make (0)
			Result.put (<<>>, "YYYY-MM-DDTHH:MM:SS")	-- no replacements possible
			Result.put (<<"YYYY-MM-DDTHH:MM:SS", "YYYY-MM-DDTHH:MM:XX">>, "YYYY-MM-DDTHH:MM:??")
			Result.put (<<>>, "YYYY-MM-DDTHH:MM:XX")	-- no replacements possible
			Result.put (<<"YYYY-MM-DDTHH:??:XX", "YYYY-MM-DDTHH:MM:SS", "YYYY-MM-DDTHH:MM:??", "YYYY-MM-DDTHH:MM:XX">>, "YYYY-MM-DDTHH:??:??")
			Result.put (<<"YYYY-MM-DDTHH:MM:XX">>, "YYYY-MM-DDTHH:??:XX")
			Result.put (<<"YYYY-MM-DDTHH:MM:SS", "YYYY-MM-DDTHH:MM:??", "YYYY-MM-DDTHH:MM:XX", "YYYY-MM-DDTHH:??:??", "YYYY-MM-DDTHH:??:XX">>, "YYYY-??-??T??:??:??")
			across Result as items_csr loop
				items_csr.item.compare_objects
			end
		ensure
			not_empty: not Result.is_empty
		end

	valid_duration_constraint_replacement (a_dur, conforms_to_dur: STRING): BOOLEAN
			-- true if ISO8601 duration string `a_dur' conforms to `conforms_to_dur'
		local
			src_uc, conf_to_uc: STRING
			i: INTEGER
		do
			src_uc := a_dur.as_upper
			conf_to_uc := conforms_to_dur.as_upper

			from i := 2 until i > src_uc.count or not conf_to_uc.has (src_uc.item (i)) loop
				i := i + 1
			end
			Result := i > src_uc.count
		end

feature -- Status Report

	valid_iso8601_time_constraint_pattern (s: STRING): BOOLEAN
			-- True if string literal like "hh:mm:ss[.ssss]"
			-- with XX or ?? allowed in mm or ss slots
		do
			Result := valid_time_constraint_patterns.has (s.as_upper)
		end

	valid_iso8601_date_constraint_pattern (s: STRING): BOOLEAN
			-- True if string literal like "yyyy-MM-dd"
			-- with XX or ?? allowed in MM or dd slots
		do
			Result := valid_date_constraint_patterns.has (s.as_upper)
		end

	valid_iso8601_date_time_constraint_pattern (s: STRING): BOOLEAN
			-- True if string in form "yyyy-MM-dd hh:mm:ss[.ssss]"
		do
			Result := valid_date_time_constraint_patterns.has (s.as_upper)
		end

	valid_iso8601_duration_constraint_pattern (s: STRING): BOOLEAN
			-- True if string in form
			-- P[Y|y][M|m][W|w][D|d][T[H|h][M|m][S|s]]
			-- (note: allowing 'W' to be mixed in is an openEHR deviation of ISO 8601)
		local
			time_leader_pos, i: INTEGER
			str: STRING
			arg_ymd_part, arg_hms_part: detachable STRING
		do
			str := s.as_upper

			if str.count >= 2 and str.item(1) = Duration_leader then
				time_leader_pos := str.index_of (Time_leader, 1)
				if time_leader_pos = 1 then
					arg_hms_part := str.substring (time_leader_pos + 1, str.count)
				elseif time_leader_pos > 1 then
					arg_hms_part := str.substring (time_leader_pos + 1, str.count)
					arg_ymd_part := str.substring (2, time_leader_pos - 1)
				else
					arg_ymd_part := str.substring (2, str.count)
				end
				Result := True
				if attached arg_ymd_part as ymd_part then
					from
						i := 1
					until
						i > ymd_part.count or not Result
					loop
						if ymd_part.item(i) /= 'Y' and
							ymd_part.item(i) /= 'M' and
							ymd_part.item(i) /= 'W' and
							ymd_part.item(i) /= 'D' then
							Result := False
						end
						i := i + 1
					end
				end
				if Result and attached arg_hms_part as hms_part then
					from
						i := 1
					until
						i > hms_part.count or not Result
					loop
						if hms_part.item(i) /= 'H' and
							hms_part.item(i) /= 'M' and
							hms_part.item(i) /= 'S' then
							Result := False
						end
						i := i + 1
					end
				end
			end
		end

end


