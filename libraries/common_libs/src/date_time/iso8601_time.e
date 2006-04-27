indexing
	component:   "openEHR re-usable library"
	description: "[
				ISO8601:2004 compliant Time class, including facility to represent 
				partial times (called 'reduced accuracy' in the standard). This class
				uses  a standard library TIME class to represent the time
				value for the purpose of mathematical operations and validity
				checking.
				]"
	keywords:    "date time"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2006 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ISO8601_TIME

inherit
	ISO8601_ROUTINES
	
create
	make_from_string, make_from_extended_string, make_h, make_hm, make_hms, make_hmfs
	
feature -- Initialisation

	make_from_string(s: STRING) is
			-- make from a time of form: hhmmss 
		require
			String_valid: s /= Void and is_valid_iso8601_time(s)
		do
			-- xx := iso8601_string_to_time(s)
		end

	make_from_extended_string(s: STRING) is
			-- make from a time of form: hh:mm:ss
		require
			String_valid: s /= Void and is_valid_iso8601_time(s)
		do
			-- xx := iso8601_string_to_time(s)
		end

	make_h(h: INTEGER; is_expanded: BOOLEAN) is
			-- 
		do
			
		end

	make_hm(h, m: INTEGER; is_expanded: BOOLEAN) is
			-- 
		do
			
		end

	make_hms(h, m, s: INTEGER; is_expanded: BOOLEAN) is
			-- 
		do
			
		end

	make_hmfs(h: INTEGER; m: INTEGER fs: DOUBLE; is_expanded: BOOLEAN) is
			-- 
		do
			
		end
		
feature -- Status Report

	minutes_known: BOOLEAN
			-- True if minutes known

	seconds_known: BOOLEAN
			-- True if second is known

	is_partial: BOOLEAN is
			-- True if either minutes or second unknown
		do
			Result := not seconds_known
		end

invariant
	Partial_validity: not minutes_known implies not seconds_known
		
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
