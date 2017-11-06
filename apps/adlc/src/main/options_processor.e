note
	component:   "openEHR ADL Tools"
	description: "Options  definitions and processor for adlc command line ADL 1.4/1.5 parser tool."
	keywords:    "UI, resources"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

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

	ADL_MESSAGES_IDS
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
			Result.extend (create {ARGUMENT_SWITCH}.make (list_rms_switch, get_text (ec_list_rms_switch_desc), False, False))

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (display_rm_switch, get_text (ec_display_rm_switch_desc), False, False, display_rm_switch_arg, get_text (ec_display_rm_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (library_switch, get_text (ec_library_switch_desc), False, False, library_switch_arg, get_text (ec_library_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (format_switch, get_text (ec_format_switch_desc), True, False, format_switch_arg, get_msg (ec_format_switch_arg_desc, <<archetype_all_serialiser_formats_string>>), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (output_dir_switch, get_text (ec_output_dir_switch_desc), True, False, output_dir_switch_arg_name, get_text (ec_output_dir_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (cfg_switch, get_text (ec_cfg_switch_desc), True, False, cfg_switch_arg_name, get_text (ec_cfg_switch_arg_desc), False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (action_switch, get_text (ec_action_switch_desc), False, False, action_switch_arg, Actions_string, False))

			-- valid command line configurations

		end

	switch_groups: ARRAYED_LIST [ARGUMENT_GROUP]
			-- <Precursor>
		once
			create Result.make (4)
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (show_config_switch), switch_of_name (quiet_switch) >>, False))

			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (list_rms_switch), switch_of_name (quiet_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (display_rm_switch), switch_of_name (quiet_switch) >>, False))

			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (library_switch), switch_of_name (list_archetypes_switch), switch_of_name (quiet_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (library_switch), switch_of_name (display_archetypes_switch), switch_of_name (quiet_switch) >>, False))
			Result.extend (create {ARGUMENT_GROUP}.make (<< switch_of_name (library_switch), switch_of_name (flat_switch), switch_of_name (cfg_switch),
														switch_of_name (quiet_switch), switch_of_name (format_switch),
														switch_of_name (action_switch), switch_of_name (output_dir_switch)>>, True))
		end

	quiet_switch: STRING = "q|quiet"
	flat_switch: STRING = "flat"
	show_config_switch: STRING = "s|show_config"

	list_archetypes_switch: STRING = "l|list_archetypes"
	display_archetypes_switch: STRING = "d|display_archetypes"

	list_rms_switch: STRING = "r|list_rms"
	display_rm_switch: STRING = "R|display_rm"
	display_rm_switch_arg: STRING = "reference model name"

	action_switch: STRING = "a|action"
	action_switch_arg: STRING = "action"

	library_switch: STRING = "b|library"
	library_switch_arg: STRING = "library name"

	format_switch: STRING = "f|format"
	format_switch_arg: STRING = "format"

	cfg_switch: STRING = "cfg"
	cfg_switch_arg_name: STRING = "file path"

	output_dir_switch: STRING = "o|output_dir"
	output_dir_switch_arg_name: STRING = "output directory"

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
			make_parser (True, True)
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
				list_rms := has_option (list_rms_switch)
				write_to_file_system := has_option (output_dir_switch)
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

	display_rm: detachable STRING
			-- name of reference model to display with -R switch
		require
			is_successful: is_successful
		once
			if has_option (display_rm_switch) and then attached option_of_name (display_rm_switch) as opt and then opt.has_value then
				Result := opt.value
			end
		end

	library: detachable STRING
			-- name of library
		require
			is_successful: is_successful
		once
			if has_option (library_switch) and then attached option_of_name (library_switch) as opt and then opt.has_value then
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

	output_dir: detachable STRING
			-- output directory to write files to
		require
			is_successful: is_successful
		once
			if has_option (output_dir_switch) and then attached option_of_name (output_dir_switch) as opt and then opt.has_value then
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

	list_rms: BOOLEAN
			-- True for -r switch to list RMs

	write_to_file_system: BOOLEAN
			-- True if -o switch used to specify an output directory

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012- openEHR Foundation"
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

