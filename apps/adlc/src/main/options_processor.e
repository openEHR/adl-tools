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
			post_process_arguments, switch_groups, initialize_defaults
		end

	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Validate_action: STRING = "validate"

	Serialise_action: STRING = "serialise"

	Serialise_action_alt_sp: STRING = "serialize"

	List_action: STRING = "list"

	Actions: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (Validate_action)
			Result.extend (Serialise_action)
			Result.extend (Serialise_action_alt_sp)
			Result.extend (List_action)
		end

	Actions_string: STRING
		once
			create Result.make (0)
			across actions as actions_csr loop
				if actions_csr.target_index > 1 then
					Result.append (", ")
				end
				Result.append (actions_csr.item)
			end
		end

	switches: ARRAYED_LIST [ARGUMENT_SWITCH]
			-- Retrieve a list of switch used for a specific application
		once
			create Result.make (4)

			-- non-argument switches
			Result.extend (create {ARGUMENT_SWITCH}.make (quiet_switch, get_text (ec_adlc_quiet_switch_desc), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (flat_switch, get_text (ec_flat_switch_desc), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (show_config_switch, get_text (ec_show_config_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (list_archetypes_switch, get_text (ec_list_archetypes_switch_desc), False, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (display_archetypes_switch, get_text (ec_display_archetypes_switch_desc), False, False))

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (repository_switch, get_text (ec_repository_switch_desc), False, False, repository_switch_arg, get_text ("repository_switch_arg_desc"), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (format_switch, get_text (ec_format_switch_desc), True, False, format_switch_arg, get_msg (ec_format_switch_arg_desc, <<archetype_all_serialiser_formats_string>>), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (cfg_switch, get_text (ec_cfg_switch_desc), True, False, cfg_switch_arg_name, get_text ("cfg_switch_arg_desc"), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (action_switch, get_text (ec_action_switch_desc), False, False, action_switch_arg, Actions_string, False))

			-- valid command line configurations

		end

	switch_groups: ARRAYED_LIST [ARGUMENT_GROUP]
			-- <Precursor>
		once
			create Result.make (2)
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (show_config_switch), switch_of_name (quiet_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (repository_switch), switch_of_name (list_archetypes_switch), switch_of_name (quiet_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (repository_switch), switch_of_name (display_archetypes_switch), switch_of_name (quiet_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (repository_switch), switch_of_name (flat_switch), switch_of_name (cfg_switch),
														switch_of_name (quiet_switch), switch_of_name (format_switch),
														switch_of_name (action_switch)>>, True))
		end

	quiet_switch: STRING = "q|quiet"
	flat_switch: STRING = "flat"
	show_config_switch: STRING = "s|show_config"
	list_archetypes_switch: STRING = "l|list_archetypes"
	display_archetypes_switch: STRING = "d|display_archetypes"

	action_switch: STRING = "a|action"
	action_switch_arg: STRING = "action"

	repository_switch: STRING = "r|repository"
	repository_switch_arg: STRING = "repository name"

	format_switch: STRING = "f|format"
	format_switch_arg: STRING = "format"

	cfg_switch: STRING = "cfg"
	cfg_switch_arg_name: STRING = "file path"

	non_switched_argument_name: STRING = "id_pattern"
			--  <Precursor>

	non_switched_argument_description: STRING
			--  <Precursor>
		once
			Result := get_text (ec_id_pattern_arg_description)
		end

	non_switched_argument_type: STRING
			--  <Precursor>
		once
			Result := get_text (ec_id_patter_arg_type)
		end

feature {NONE} -- Initialization

	make
			-- Initialize argument parser
		do
			make_parser (False, True)
		end

	initialize_defaults
		do
			precursor
			is_using_builtin_switches := False
		end

	post_process_arguments
		do
			Precursor
			if is_successful then
				is_verbose := not has_option (quiet_switch)
				use_flat_source := has_option (flat_switch)
				show_config := has_option (show_config_switch)
				list_archetypes := has_option (list_archetypes_switch)
				display_archetypes := has_option (display_archetypes_switch)
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

	repository: detachable STRING
			-- name of repository
		require
			is_successful: is_successful
		once
			if has_option (repository_switch) and then attached option_of_name (repository_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	action: detachable STRING
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

	list_archetypes: BOOLEAN
			-- True for -l switch to list archetypes

	display_archetypes: BOOLEAN
			-- True for -d switch to list archetypes in user friendly format

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012 openEHR Foundation"
			--  <Precursor>

	name: STRING
			--  <Precursor>
		once
			Result := application_name
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
