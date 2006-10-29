indexing
	component:   "openEHR re-usable library"
	description: "ISO 8601 Date/time factory for use in interfaces that need to be able to create ISO date/times from strings"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_FACTORY

inherit
	DATE_TIME_ROUTINES

feature -- Conversion

	create_iso8601_date (str: STRING): ISO8601_DATE is
			-- make from string using ISO8601 format "YYYY-MM-DD"
		require
			str_valid: str /= Void and then valid_iso8601_date(str)
		do
			create Result.make_from_string(str)
		ensure
			Result /= Void
		end

	create_iso8601_time (str: STRING): ISO8601_TIME is
			-- make from string using ISO8601 format "Thh:mm:ss[.ssss]"
		require
			str_valid: str /= Void and then valid_iso8601_time(str)
		do
			create Result.make_from_string(str)
		ensure
			Result /= Void
		end

	create_iso8601_date_time (str: STRING): ISO8601_DATE_TIME is
			-- make from string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
		require
			str_valid: str /= Void and then valid_iso8601_date_time(str)
		do
			create Result.make_from_string(str)
		ensure
			Result /= Void
		end

	create_iso8601_duration (str: STRING): ISO8601_DURATION is
			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
		require
			str_valid: str /= Void and then valid_iso8601_duration(str)
		do
			create Result.make_from_string (str)
		ensure
			Result /= Void
		end

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
