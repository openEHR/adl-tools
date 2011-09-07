note
	component:   "openEHR Reusable Libraries"
	description: "Event logging facility Interface"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EVENT_LOG_FACILITY

inherit
	EVENT_SEVERITY_CONSTANTS

create
	make

feature -- Initialisation

	make(an_app_name, a_name, a_type, a_threshold:STRING)
		require
			App_name_exists: an_app_name /= Void and then not an_app_name.is_empty
			Name_exists: a_name /= Void
			Type_exists: a_type /= Void
		do
			app_name := an_app_name
			name := a_name
			type := a_type
			type.to_lower

			severity_threshold := event_severity_threshold(a_threshold)

			-- decide what type of implementation to used based on resource setting
			if type.is_equal("windows_event_log") then
			    implementation := create {WINDOWS_EVENT_LOG_I}.make(Current)

			elseif type.is_equal("file_event_log") then
			    implementation := create {FILE_EVENT_LOG_I}.make(Current)

			elseif type.is_equal("console_event_log") then
			    implementation := create {CONSOLE_EVENT_LOG_I}.make(Current)

			else
			    implementation := create {CONSOLE_EVENT_LOG_I}.make(Current)
			    append_event(generator, "make", "NO EVENT LOG FACILITY; using CONSOLE as log", Information)
			end

			if implementation.exists then
				log_start_event
				exists := True
			end
		end

feature -- Access

	app_name:STRING

	name:STRING

	type:STRING

	severity_threshold:INTEGER

feature -- Status Report

	exists: BOOLEAN
			-- True if event log was created correctly

feature -- Modify

	append_event(class_name, op_name, msg:STRING; severity:INTEGER)
		require
			Valid_source: class_name /= Void and op_name /= Void
		local
			source_in_app:STRING
		do
			if severity >= severity_threshold then
				create source_in_app.make(0)
				source_in_app.append(class_name)
				source_in_app.to_upper
				source_in_app.append(".")
				source_in_app.append(op_name)
				source_in_app.append(": ")

				implementation.append_event(severity, source_in_app, msg)
			end
		end

feature {NONE} -- Implementation

	log_start_event
			-- log initial message
	    do
			append_event(generator, "make",
					"Started logging on facility " + name + " at " + (create {DATE_TIME}.make_now).out,
					Information)
	    end

	implementation:EVENT_LOG_FACILITY_I

invariant
	Implementation_exists: implementation /= Void
	Valid_severity: is_valid_severity(severity_threshold)

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
--| The Original Code is event_log_facility.e.
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
