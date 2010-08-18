note
	component:   "openEHR Reusable Libraries"
	description: "Windows Event implementation of logging facility"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class WINDOWS_EVENT_LOG_I

inherit
	EVENT_LOG_FACILITY_I
		rename
                make as facility_make
	    end

create
	make

feature -- Initialisation

	make(a_facility_interface:like facility_interface)
		do
			facility_make(a_facility_interface)

			-- FIXME: to be implemented
            -- real implementation to be determined - Windows event log
            -- create event_log.make

			-- if event_log /= Void then
			--     log_start_event
			-- else
			    -- do something basic
			-- end
		end

feature {NONE} -- Implementation

	append_event(severity: INTEGER; source ,msg: STRING)
		do
			-- FIXME: to be implemented
		end

	event_log: ANY
		once
			-- FIXME: to be implemented with Windows event log
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
--| The Original Code is nt_event_log_i.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2005
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
