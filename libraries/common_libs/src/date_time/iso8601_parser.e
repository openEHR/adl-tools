note
	component:   "openEHR re-usable library"
	description: "ISO 8601 Date/time parser"
	keywords:    "date, time, iso8601"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

class ISO8601_PARSER

inherit
	DATE_TIME_CONSTANTS

create
	make

feature -- Definitions

	Date_separator: CHARACTER = '-'
	Time_separator: CHARACTER = ':'
	Time_leader: CHARACTER = 'T'
	Time_leader_lower: CHARACTER = 't'
	Time_zone_GMT: CHARACTER = 'Z'
	Duration_leader: CHARACTER = 'P'
	Iso8601_decimal_separator: CHARACTER = ','
	Decimal_separator: CHARACTER = '.'

	Case_converter: HASH_TABLE[CHARACTER, CHARACTER]
			-- safe case converter for chars in ISO strings
		once
			create Result.make(0)
			Result.put ('s', 'S')
			Result.put ('m', 'M')
			Result.put ('h', 'H')
			Result.put ('d', 'D')
			Result.put ('y', 'Y')
			Result.put ('w', 'W')
			Result.put ('p', 'P')
			Result.put ('t', 'T')
			Result.put ('z', 'Z')
		end

feature -- Initialisation

	make
			--
		do
			create cached_iso8601_time_string.make(0)
			create cached_iso8601_date_string.make(0)
		end

feature -- Status Report

--	valid_iso8601_string(a_str: STRING): BOOLEAN is
--			-- only use this when caller does not know what kind of ISO8601
--			-- string it is supposed to be
--		require
--			Str_valid: a_str /= Void and then not a_str.is_empty
--		do
--			if a_str.item(1) = Duration_leader then
--				Result := valid_iso8601_duration(a_str)
--			elseif a_str.has(Time_leader) then
--				Result := valid_iso8601_date_time(a_str)
--			else
--				Result := valid_iso8601_date(a_str)
--			end
--		end

	valid_iso8601_time (str: STRING): BOOLEAN
			-- True if string in one of the forms:
			--	hh
			--	hhmm
			--	hh:mm
			--  hhmmss
			--  hhmmss,sss
			-- 	hh:mm:ss
			-- 	hh:mm:ss,sss
			-- with optional timezone in form:
			--	Z
			--	+hhmm
			--	-hhmm
		local
			csr, hms_part_end, tz_ind_pos: INTEGER
			h_str: STRING
			m_str, s_str, fs_str, tz_str: detachable STRING
			extended_form, tz_ok: BOOLEAN
		do
			if attached cached_iso8601_time_string as cached_time_str and then str.is_equal (cached_time_str) then
				Result := True
			else
				cached_iso8601_time := Void

				csr := 1
				if str.count >= csr+1 then
					-- check for timezone on the end
					tz_ok := True
					if str.item (str.count) = Time_zone_GMT then
						tz_str := Time_zone_GMT.out
						hms_part_end := str.count - 1
					elseif str.has ('+') then
						tz_ind_pos := str.index_of ('+', 1)
						tz_str := str.substring (tz_ind_pos, str.count)
						if tz_str.count = 5 and tz_str.is_integer then
							hms_part_end := tz_ind_pos - 1
						else
							tz_ok := False
						end
					elseif str.has ('-') then
						tz_ind_pos := str.index_of ('-', 1)
						tz_str := str.substring (tz_ind_pos, str.count)
						if tz_str.count = 5 and tz_str.is_integer then
							hms_part_end := tz_ind_pos - 1
						else
							tz_ok := False
						end
					else
						hms_part_end := str.count
					end

					-- now start processing the main part
					if tz_ok then
						-- on first h digit
						h_str := str.substring (csr, csr+1)
						csr := csr + 2 -- on char after 2nd h digit
						if hms_part_end > csr then
							if str.item (csr) = Time_separator then
								extended_form := True
								csr := csr + 1 -- on first m digit
								if hms_part_end > csr+2 then -- should be Thh:mm:ss[,sss]
									m_str := str.substring (csr, csr+1)
									csr := csr + 2 -- on char after 2nd m digit
									if str.item (csr) = Time_separator then
										csr := csr + 1 -- first s digit
										if hms_part_end = csr + 1 then -- Thh:mm:ss
											s_str := str.substring(csr, csr+1)
											Result := valid_time_strings (h_str, m_str, s_str, Void,  tz_str, extended_form)
										elseif hms_part_end > csr + 2 and (str.item (csr+2) = iso8601_decimal_separator or str.item(csr+2) = Decimal_separator) then -- Thh:mm:ss,sss
											s_str := str.substring(csr, csr+1)
											csr := csr + 3
											create fs_str.make(0)
											fs_str.append_character (Decimal_separator)
											fs_str.append (str.substring(csr, hms_part_end))
											Result := valid_time_strings(h_str, m_str, s_str, fs_str, tz_str, extended_form)
										end
									end
								elseif hms_part_end = csr + 1 then -- should be Thh:mm
									m_str := str.substring (csr, csr+1)
									Result := valid_time_strings(h_str, m_str, Void, Void, tz_str, extended_form)
								end
							else -- non-extended form
								if hms_part_end = csr + 1 then -- should be Thhmm
									m_str := str.substring (csr, csr+1)
									Result := valid_time_strings (h_str, m_str, Void, Void, tz_str, extended_form)
								elseif hms_part_end > csr+2 then
									m_str := str.substring(csr, csr+1)
									csr := csr+2 -- on char after 2nd m digit
									if str.count = csr + 1 then -- has to be Thhmmss
										s_str := str.substring (csr, csr+1)
										Result := valid_time_strings (h_str, m_str, s_str, Void, tz_str, extended_form)
									elseif str.count > csr + 2 and (str.item(csr+2) = iso8601_decimal_separator or str.item (csr+2) = Decimal_separator) then -- Thhmmss,sss
										s_str := str.substring(csr, csr+1)
										csr := csr + 3
										create fs_str.make(0)
										fs_str.append_character (Decimal_separator)
										fs_str.append(str.substring (csr, hms_part_end))
										Result := valid_time_strings (h_str, m_str, s_str, fs_str, tz_str, extended_form)
									end
								end
							end
						elseif hms_part_end = csr - 1 then -- should be Thh
							Result := valid_time_strings (h_str, Void, Void, Void,tz_str, extended_form)
						end
					end
				end

				if Result then
					cached_iso8601_time_string := str
				end
			end
		end

	valid_iso8601_date (str: STRING): BOOLEAN
			-- True if string in one of the forms
			--	YYYY
			--	YYYYMM
			--	YYYY-MM
			--	YYYYMMDD
			--	YYYY-MM-DD
		local
			csr: INTEGER

			y_str, m_str, d_str: STRING
			extended_form: BOOLEAN
		do
			if attached cached_iso8601_date_string as cached_date_str and then str.is_equal (cached_date_str) then
				Result := True
			else
				cached_iso8601_date := Void

				if str.count >= 4 then
					csr := 1 -- on the first Y digit

					y_str := str.substring(csr, csr+3)
					csr := csr + 4 -- on char after last Y digit
					if str.count > csr then
						if str.item (csr) = Date_separator then
							extended_form := True
							csr := csr + 1 -- on first M digit
							if str.count > csr + 2 then -- should be YYYY-MM-DD
								m_str := str.substring (csr, csr+1)
								csr := csr + 2 -- on char after 2nd M digit
								if str.item (csr) = Date_separator then
									csr := csr + 1 -- first D digit
									if str.count = csr + 1 then -- YYYY-MM-DD
										d_str := str.substring (csr, csr+1)
										Result := valid_date_strings(y_str, m_str, d_str, extended_form)
									end
								end
							elseif str.count = csr + 1 then -- should be YYYY-MM
								m_str := str.substring(csr, csr+1)
								Result := valid_date_strings(y_str, m_str, Void, extended_form)
							end
						else -- non-extended form
							if str.count = csr + 1 then -- should be YYYYMM
								m_str := str.substring(csr, csr+1)
								Result := valid_date_strings (y_str, m_str, Void, extended_form)
							elseif str.count > csr+2 then
								m_str := str.substring (csr, csr+1)
								csr := csr+2 -- on char after 2nd M digit
								if str.count = csr + 1 then -- has to be YYYYMMDD
									d_str := str.substring (csr, csr+1)
									Result := valid_date_strings (y_str, m_str, d_str, extended_form)
								end
							end
						end
					elseif str.count = csr-1 then -- should be YYYY
						Result := valid_date_strings (y_str, Void, Void, extended_form)
					end
				end

				if Result then
					cached_iso8601_date_string := str
				end
			end
		end

	valid_iso8601_date_time (str: STRING): BOOLEAN
			-- True if string in one of the forms
			--	YYYYMMDDThh
			--	YYYYMMDDThhmm
			--	YYYY-MM-DDThh:mm
			--  YYYYMMDDThhmmss
			--  YYYYMMDDThhmmss,sss
			-- 	YYYY-MM-DDThh:mm:ss
			-- 	YYYY-MM-DDThh:mm:ss,sss
			-- with optional timezone in form:
			--	Z
			--	+hhmm
			--	-hhmm
			-- SIDE_EFFECTS: if successful creates `cached_iso8601_date_time' and `cached_iso8601_date_time_string'
		local
			time_sep_pos, end_date_part: INTEGER
			date_part_ok, time_part_ok, has_time_part: BOOLEAN
		do
			if attached cached_iso8601_date_time_string as cached_dt_str and then str.is_equal (cached_dt_str) then
				Result := True
			else

				cached_iso8601_date_time := Void
				time_sep_pos := str.index_of (Time_leader, 1)
				if time_sep_pos = 0 then
					end_date_part := str.count
				else
					end_date_part := time_sep_pos - 1
					time_part_ok := valid_iso8601_time (str.substring (time_sep_pos+1, str.count))
					has_time_part := True
				end

				date_part_ok := valid_iso8601_date (str.substring (1, end_date_part))

				if date_part_ok and attached cached_iso8601_date as dt then
					if has_time_part and attached cached_iso8601_time as tm then
						Result := time_part_ok and not dt.is_partial
						if tm.second_unknown and dt.is_extended then
							tm.set_extended
						end
						Result := Result and tm.is_extended = dt.is_extended
					else
						Result := True
					end

					if Result then
						create cached_iso8601_date_time.make_date_and_time (dt, cached_iso8601_time)
						cached_iso8601_date_time_string := str
					end
				end
			end
		end

	valid_iso8601_duration (str: STRING): BOOLEAN
			-- True if string in form "PnYnMnWnDTnHnMnS"
			-- SIDE_EFFECTS: if True, creates `cached_iso8601_duration' and `cached_iso8601_duration_string'
		local
			str1, ymd_part, hms_part: STRING
			yr, mo, wk, dy, hr, mi, sec: INTEGER
			yr_str, mo_str, wk_str, dy_str, hr_str, mi_str, sec_str, fsec_str: STRING
			fsec: DOUBLE
			left, right, time_sep_pos, dec_pos: INTEGER
		do
			if attached cached_iso8601_duration_string as cached_dur_str and then str.is_equal (cached_dur_str) then
				Result := True
			else
				cached_iso8601_duration := Void

				if str.item (1) = Duration_leader then
					str1 := convert_to_lower(str)
					left := 2

					Result := True
					time_sep_pos := str1.index_of (Time_leader_lower, 1)
					if time_sep_pos > 0 then
						ymd_part := str1.substring (1, time_sep_pos - 1)
						hms_part := str1.substring (time_sep_pos + 1, str1.count)
					else
						ymd_part := str1
						create hms_part.make_empty -- easiest way to satisfy void-safety in this case
					end

					-- years
					right := ymd_part.index_of ('y', left)
					if right > 0 then
						yr_str := ymd_part.substring (left, right-1)
						if yr_str.is_integer then
							yr := yr_str.to_integer
								left := right + 1
						else
							Result := False
						end
					end

					-- months
					if Result then
						right := ymd_part.index_of ('m', left)
						if right > 0 then
							mo_str := ymd_part.substring (left, right-1)
							if mo_str.is_integer then
								mo := mo_str.to_integer
								left := right + 1
							else
								Result := False
							end
						end
					end

					-- weeks
					if Result then
						right := ymd_part.index_of ('w', left)
						if right > 0 then
							wk_str := ymd_part.substring (left, right-1)
							if wk_str.is_integer then
								wk := wk_str.to_integer
								left := right + 1
							else
								Result := False
							end
						end
					end

					-- days
					if Result then
						right := ymd_part.index_of ('d', left)
						if right > 0 then
							dy_str := ymd_part.substring (left, right-1)
							if dy_str.is_integer then
								dy := dy_str.to_integer
								left := right + 1
							else
								Result := False
							end
						end
					end

					if Result then
						if time_sep_pos > 0 then
							left := 1

							-- hours
							right := hms_part.index_of ('h', left)
							if right > 0 then
								hr_str := hms_part.substring (left, right-1)
									if hr_str.is_integer then
									hr := hr_str.to_integer
									left := right + 1
								else
									Result := False
								end
							end

							if Result then
								-- minutes
								right := hms_part.index_of ('m', left)
								if right > 0 then
									mi_str := hms_part.substring (left, right-1)
									if mi_str.is_integer then
										mi := mi_str.to_integer
										left := right + 1
									else
										Result := False
									end
								end
							end

							if Result then
								-- seconds
								right := hms_part.index_of ('s', left)
								if right > 0 then
									dec_pos := hms_part.index_of (Iso8601_decimal_separator, left)
									if dec_pos > 0 then
										sec_str := hms_part.substring (left, dec_pos-1)
										fsec_str := hms_part.substring (dec_pos, right-1)
										fsec_str.put (Decimal_separator, 1)
										if sec_str.is_integer and fsec_str.is_double then
											sec := sec_str.to_integer
											fsec := fsec_str.to_double
										end
									else
										sec_str := hms_part.substring (left, right-1)
										if sec_str.is_integer then
											sec := sec_str.to_integer
										end
									end
								end
							end
						else
							-- should be no H or S
							Result := Result and not ymd_part.has ('h') and not ymd_part.has ('s')
						end
					end
					if Result then
						create cached_iso8601_duration.make (yr, mo, wk, dy, hr, mi, sec, fsec)
						cached_iso8601_duration_string := str
					end
				end
			end
		end

feature {NONE} -- Implementation

	valid_date_strings (y_str: STRING; an_m_str, a_d_str: detachable STRING; is_extended: BOOLEAN): BOOLEAN
			-- True if each string is within correct limits for years, mnonths, days
			-- SIDE_EFFECTS: if True, creates `cached_iso8601_date'
		local
			y, m, d: INTEGER
		do
			if y_str.is_integer then
				y := y_str.to_integer
				if attached an_m_str as m_str and then m_str.is_integer then
					m := m_str.to_integer
					if m >= 1 and m <= Months_in_year then
						if attached a_d_str as d_str and then d_str.is_integer then
							d := d_str.to_integer
							if d >= 1 and d <= days_in_month(m, y) then
								Result := True
								create cached_iso8601_date.make_ymd (y, m, d, is_extended)
							end
						else -- years and months only
							Result := True
							create cached_iso8601_date.make_ym (y, m, is_extended)
						end
					end
				else -- years only
					Result := True
					create cached_iso8601_date.make_y (y, is_extended)
				end
			end
		ensure
			Result implies attached cached_iso8601_date
		end

	valid_time_strings (h_str: STRING; a_m_str, an_s_str, an_fs_str, a_tz_str: detachable STRING; is_extended: BOOLEAN): BOOLEAN
			-- True if each string is within correct limits for hours, minutes, seconds
			-- SIDE_EFFECTS: creates `cached_iso8601_time'
		local
			h, m, s, tz_h, tz_m: INTEGER
			fs: DOUBLE
			tz_obj: detachable ISO8601_TIMEZONE
			tz_sign: INTEGER
			tz_ok: BOOLEAN
		do
			-- check timezone part if any
			if attached a_tz_str as tz_str then
				if tz_str.count > 1 then
					tz_h := tz_str.substring(2,3).to_integer
					tz_m := tz_str.substring(4,5).to_integer
					if (tz_h >=0 and tz_h <= Max_timezone_hour) and (tz_m >= 0 and tz_m <= Minutes_in_hour) then
						tz_sign := (tz_str.item(1).out + "1").to_integer
						create tz_obj.make (tz_sign, tz_h, tz_m)
						tz_ok := True
					end
				else
					create tz_obj.make_gmt
					tz_ok := True
				end
			else
				tz_ok := True
			end

			-- check main parts
			if tz_ok then
				if h_str.is_integer then
					h := h_str.to_integer
					if h <= Hours_in_day then
						if attached a_m_str as m_str and then m_str.is_integer then
							m := m_str.to_integer
							if m < Minutes_in_hour then
								if attached an_s_str as s_str then
									if s_str.is_integer then
										s := s_str.to_integer
										if s < Seconds_in_minute then
											if h = Hours_in_day then
												Result := m = 0 and s = 0
											else
												Result := True
											end
											if Result then
												if attached an_fs_str as fs_str and then fs_str.is_double then
													fs := fs_str.to_double
													if fs < 1.0 then
														if h = Hours_in_day then
															Result := fs = 0.0
														else
															Result := True
														end
														if Result then
															create
															cached_iso8601_time.make_hmsf (h, m, s, fs, is_extended)
															if attached tz_obj as att_tz_obj then
																cached_iso8601_time.set_timezone (att_tz_obj)
															end
														end
													end
												else
													create
													cached_iso8601_time.make_hms(h, m, s, is_extended)
													if attached tz_obj as att_tz_obj then
														cached_iso8601_time.set_timezone (att_tz_obj)
													end
												end
											end
										end
									end
								else -- hours and minutes only
									if h = Hours_in_day then
										Result := m = 0
									else
										Result := True
									end
									if Result then
										create cached_iso8601_time.make_hm(h, m, is_extended)
										if attached tz_obj as att_tz_obj then
											cached_iso8601_time.set_timezone (att_tz_obj)
										end
									end
								end
							end
						else -- hours only
							Result := True
							create cached_iso8601_time.make_h (h, is_extended)
							if attached tz_obj as att_tz_obj then
								cached_iso8601_time.set_timezone (att_tz_obj)
							end
						end
					end
				end
			end
		ensure
			Result implies attached cached_iso8601_time
		end

feature {ISO8601_ROUTINES} -- Implementation

	convert_to_lower (a_str: STRING): STRING
			-- safe case conversion
		local
			i: INTEGER
		do
			create Result.make(0)
			from
				i := 1
			until
				i > a_str.count
			loop
				if case_converter.has (a_str.item(i)) then
					Result.append_character(case_converter.item (a_str.item(i)))
				else
					Result.append_character (a_str.item(i))
				end
				i := i + 1
			end
		end

	cached_iso8601_time_string: detachable STRING
			-- last time string on which is_valid_iso8601_time was called; used for matching
			-- to decide on whether to use cached ISO8601_TIME value or not

	cached_iso8601_time: detachable ISO8601_TIME
			-- side-effect of calling valid_time_strings with valid input

	cached_iso8601_date_string: detachable STRING
			-- last date string on which is_valid_iso8601_date was called; used for matching
			-- to decide on whether to use cached ISO8601_DATE value or not

	cached_iso8601_date: detachable ISO8601_DATE
			-- side-effect of calling valid_time_strings with valid input

	cached_iso8601_date_time_string: detachable STRING
			-- last date string on which is_valid_iso8601_date was called; used for matching
			-- to decide on whether to use cached ISO8601_DATE value or not

	cached_iso8601_date_time: detachable ISO8601_DATE_TIME
			-- side-effect of calling valid_time_strings with valid input

	cached_iso8601_duration_string: detachable STRING
			-- last date string on which is_valid_iso8601_date was called; used for matching
			-- to decide on whether to use cached ISO8601_DATE value or not

	cached_iso8601_duration: detachable ISO8601_DURATION
			-- side-effect of calling valid_time_strings with valid input
end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is date_time_routines.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
