note
	component:   "openEHR Reusable Libraries"
	description: "File-based Event logging facility implementation"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FILE_EVENT_LOG_I

inherit
    EVENT_LOG_FACILITY_I
        rename
            make as facility_make
	    end

	OPERATING_ENVIRONMENT
		export
			{NONE} all
		end

create
    make

feature -- Definitions

	Date_variable:STRING = "$DATE"
			-- string to replace with canonical date in filename. Useful for making daily logfiles.

    File_date_format:STRING = "yyyy-[0]mm-[0]dd"
            -- format of date segment of file name for date-stamped file names

feature -- Initialisation

	make(a_facility_interface:like facility_interface)
		local
			event_dir:DIRECTORY
			dir_name, file_name:STRING
			today:DATE
			date_pos:INTEGER
		do
			facility_make(a_facility_interface)

			dir_name := facility_interface.name.mirrored
			dir_name.replace_substring("", 1, dir_name.index_of(Directory_separator,1))
			dir_name.mirror
			create event_dir.make(dir_name)
			if event_dir.exists then
				create file_name.make(0)
				file_name.append(facility_interface.name)

				-- now look for the string $DATE; if found, write the canonical date in
				create today.make_now
				date_pos := file_name.substring_index(Date_variable, 1)
				if date_pos > 0 then
					file_name.replace_substring(today.formatted_out(File_date_format), 
						date_pos, date_pos + Date_variable.count - 1)
				end

				create event_log.make_open_read_append(file_name)
				if not event_log.exists then
					io.put_string("Could not create file " + facility_interface.name + "%N")
					exists := False
				end
			else
				io.put_string("Directory " + dir_name + " does not exist%N")
				exists := False
			end
		end

feature -- Modify

	append_event(severity:INTEGER; source, msg:STRING)
		do
			event_log.put_string(
           		Severities.item(severity) + "    " + facility_interface.app_name + "    " +
				source + "    " + msg + "%R%N")
            end

	event_log: RAW_FILE

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
--| The Original Code is file_event_log_i.e.
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
