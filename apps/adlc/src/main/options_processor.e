note
	component:   "openEHR Archetype Project"
	description: "Options  definitions and processor for adlc command line ADL 1.4/1.5 parser tool."
	keywords:    "UI, resources"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class
	OPTIONS_PROCESSOR

inherit
	ARGUMENT_SINGLE_PARSER
		rename
			make as make_parser
		redefine
			post_process_arguments, switch_groups
		end

	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	switches: ARRAYED_LIST [ARGUMENT_SWITCH]
			-- Retrieve a list of switch used for a specific application
		once
			create Result.make (4)

			-- non-argument swtiches
			Result.extend (create {ARGUMENT_SWITCH}.make (quiet_switch, get_text ("quiet_switch_desc"), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (flat_switch, get_text ("flat_switch_desc"), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (show_config_switch, get_text ("show_config_switch_desc"), True, False))

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (format_switch, get_text ("format_switch_desc"), True, False, format_switch_arg, get_msg ("format_switch_arg_desc", <<archetype_all_serialiser_formats_string>>), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (cfg_switch, get_text ("cfg_switch_desc"), True, False, cfg_switch_arg_name, get_text ("cfg_switch_arg_desc"), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (profile_switch, get_text ("profile_switch_desc"), True, False, profile_switch_arg, get_text ("profile_switch_arg_desc"), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (action_switch, get_text ("action_switch_desc"), True, False, action_switch_arg, get_text ("action_switch_arg_desc"), False))

			-- valid command line configurations

		end

	switch_groups: ARRAYED_LIST [ARGUMENT_GROUP]
			-- <Precursor>
		once
			create Result.make (2)
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch), switch_of_name (show_config_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (quiet_switch), switch_of_name (flat_switch),
														switch_of_name (cfg_switch), switch_of_name (profile_switch),
														switch_of_name (action_switch), switch_of_name (format_switch) >>, True))
		end

	quiet_switch: STRING = "q|quiet"
	flat_switch: STRING = "flat"
	show_config_switch: STRING = "s|show_config"

	action_switch: STRING = "a|action"
	action_switch_arg: STRING = "action"

	profile_switch: STRING = "p|profile"
	profile_switch_arg: STRING = "profile name"

	format_switch: STRING = "f|format"
	format_switch_arg: STRING = "format"

	cfg_switch: STRING = "cfg"
	cfg_switch_arg_name: STRING = "file path"

	non_switched_argument_name: STRING = "id_pattern"
			--  <Precursor>

	non_switched_argument_description: STRING
			--  <Precursor>
		once
			Result := get_text ("id_pattern_arg_description")
		end

	non_switched_argument_type: STRING
			--  <Precursor>
		once
			Result := get_text ("id_patter_arg_type")
		end

feature {NONE} -- Initialization

	make
			-- Initialize argument parser
		do
			make_parser (False, True)
		end

	post_process_arguments
		do
			Precursor
			if is_successful then
				is_verbose := not has_option (quiet_switch)
				use_flat_source := has_option (flat_switch)
				show_config := has_option (show_config_switch)
			end
		end

feature -- Access

	output_format: detachable STRING
			-- name of output format
		require
			is_successful: is_successful
		once
			if has_option (format_switch) and then attached option_of_name (format_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	cfg_file_path: detachable STRING
			-- path to .cfg file
		require
			is_successful: is_successful
		once
			if has_option (cfg_switch) and then attached option_of_name (cfg_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	profile: detachable STRING
			-- name of profile
		require
			is_successful: is_successful
		once
			if has_option (profile_switch) and then attached option_of_name (profile_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	action: STRING
			-- action to perform
		require
			is_successful: is_successful
		once
			if has_option (action_switch) and then attached option_of_name (action_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	archetype_id_pattern: STRING
		do
			Result := value
		end

feature -- Status Report

	is_verbose: BOOLEAN

	use_flat_source: BOOLEAN

	show_config: BOOLEAN
			-- request to show configuration information

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012 openEHR Foundation"
			--  <Precursor>

	name: STRING
			--  <Precursor>
		once
			Result := application_name
		end

	version: attached STRING
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
