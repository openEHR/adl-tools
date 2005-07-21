indexing
	component:   "openEHR Reusable Libraries"
	description: "Error status flag and reason to be inherited by classes needing its services."
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ERROR_STATUS

feature -- Access

	last_op_fail: BOOLEAN -- result of operation

	fail_reason:STRING is
			-- reason for last op failure
		do
			Result := fail_reason_string
		end

feature -- Reporting

	fail_reason_line_len:INTEGER is 78

feature -- Modify

	set_fail_reason(s:STRING) is
			-- initialise 'fail_reason' to reason 's'
		require
			Args_valid: s /= Void
		do
			fail_reason_string := s

			last_op_fail := True
		ensure
			Fail_flag_set: last_op_fail
		end

	append_fail_reason(s:STRING) is
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

	clear_fail_reason is
			-- clear fail reason and flag
		do
			fail_reason_string := Void
			last_op_fail := False
		ensure
			Fail_flag_cleared: not last_op_fail
		end

feature {NONE} -- Implementation

	fail_reason_string:STRING

	fail_string(op_name, code_context, rep_msg:STRING; rep_code:INTEGER):STRING is
	    require
			Args_valid: op_name /= Void and code_context /= Void and rep_msg /= Void
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
--| The Original Code is error_status.e.
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

 
