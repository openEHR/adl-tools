note
	component:   "openEHR ADL Tools"
	description: "Error status flag and reason to be inherited by classes needing its services."
	keywords:    "error status reporting"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ERROR_STATUS

feature -- Access

	last_op_fail: BOOLEAN -- result of operation

	fail_reason: STRING
			-- reason for last op failure
		do
			Result := fail_reason_string
		end

feature -- Reporting

	fail_reason_line_len: INTEGER = 78

feature -- Modify

	set_fail_reason (s: STRING)
			-- initialise 'fail_reason' to reason 's'
		require
			Args_valid: s /= Void
		do
			fail_reason_string := s

			last_op_fail := True
		ensure
			Fail_flag_set: last_op_fail
		end

	append_fail_reason (s: STRING)
			-- append another reason 's' to 'fail_reason'
		require
			Args_valid: s /= Void
		do
			if fail_reason_string = Void then
				create fail_reason_string.make(0)
			end
			fail_reason_string.append("%N----------------------------%N")
			fail_reason_string.append(s)

			last_op_fail := True
		ensure
			Fail_flag_set: last_op_fail
		end

	clear_fail_reason
			-- clear fail reason and flag
		do
			fail_reason_string := Void
			last_op_fail := False
		ensure
			Fail_flag_cleared: not last_op_fail
		end

feature {NONE} -- Implementation

	fail_reason_string: detachable STRING

	fail_string (op_name, code_context, rep_msg: STRING; rep_code: INTEGER): STRING
	    local
			str:STRING
			charpos, spcpos:INTEGER
	    do
			create Result.make(0)

			Result.append(op_name)
			Result.to_upper
			Result.append(" failure (reported in " + code_context + "):%N")

			-- the next bit might be long, so build it, then chop it up to be readable
			create str.make_filled(' ', 4)
			str.append(rep_msg) str.append(" <error code: ") str.append_integer(rep_code) str.append(">")
			from charpos := fail_reason_line_len until charpos >= str.count loop
			    -- find next space
			    spcpos := str.index_of(' ',charpos).max(charpos)
			    if spcpos <= str.count then
				    str.insert_string("%N",spcpos)
				    str.insert_string(create {STRING}.make_filled(' ', 4), spcpos+2)
			    end
			    charpos := spcpos + fail_reason_line_len
			end

			Result.append(str)
	    end

invariant
	Reason_set: last_op_fail implies not fail_reason.is_empty

end



