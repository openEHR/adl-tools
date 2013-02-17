note
	support:     "http://www.openehr.org/issues/browse/AWB"	description: "Options  definitions and processor for icondbc command line tool."
	keywords:    "Embedded icons, options"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class
	OPTIONS_PROCESSOR

inherit
	ARGUMENT_OPTION_PARSER
		rename
			make as make_parser
		redefine
			post_process_arguments
		end

	ARGUMENTS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Definitions

	switches: ARRAYED_LIST [ARGUMENT_SWITCH]
			-- Retrieve a list of switch used for a specific application
		once
			create Result.make (2)

			-- non-argument swtiches
			Result.extend (create {ARGUMENT_SWITCH}.make (quiet_switch, get_text ("quiet_switch_desc"), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (force_switch, get_text ("force_switch_desc"), True, False))

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (icon_source_dir_switch, icon_source_dir_switch_desc, True, False, icon_source_dir_switch_arg, icon_source_dir_switch_arg, False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (output_file_dir_switch, output_file_dir_switch_desc, True, False, output_file_dir_switch_arg, output_file_dir_switch_arg, False))
		end

	force_switch: STRING = "f|force"
	quiet_switch: STRING = "q|quiet"

	output_file_dir_switch: STRING = "o|output_dir"
	output_file_dir_switch_desc: STRING = "output directory"
	output_file_dir_switch_arg: STRING = "directory"

	icon_source_dir_switch: STRING = "s|source_dir"
	icon_source_dir_switch_desc: STRING = "source directory"
	icon_source_dir_switch_arg: STRING = "directory"

feature {NONE} -- Initialization

	make
			-- Initialize argument parser
		do
			make_parser (False)
		end

feature -- Access

	icon_source_dir: STRING
			-- message source directory; default to ".", i.e. current working directory of app
		require
			is_successful: is_successful
		once
			if has_option (icon_source_dir_switch) and then attached option_of_name (icon_source_dir_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := file_system.current_working_directory
			end
		end

	output_file_dir: STRING
			-- message source directory; default to ".", i.e. current working directory of app
		require
			is_successful: is_successful
		once
			if has_option (output_file_dir_switch) and then attached option_of_name (output_file_dir_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := file_system.current_working_directory
			end
		end

	is_verbose: BOOLEAN

	force_generation: BOOLEAN

feature {NONE} -- Implementation

	post_process_arguments
		do
			Precursor
			if is_successful then
				is_verbose := not has_option (quiet_switch)
				force_generation := has_option (force_switch)
			end
		end

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012 openEHR Foundation"
			--  <Precursor>

	name: STRING
			--  <Precursor>
		once
			Result := command_name
		end

	version: STRING
			--  <Precursor>
		once
			Result := (create {OPENEHR_VERSION}).out
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
--| The Original Code is shared_ui_resources.e.
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
