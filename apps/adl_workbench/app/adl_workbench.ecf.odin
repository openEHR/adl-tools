
--
-- This is a file written in the 'dadl' formalism used in openEHR, containing the contents of an Eiffel .ecf file (reduced)
-- to illustrate a friendlier alternative to .ecf as XML. The assumed object model is about the same.
-- The contents of this file could be directly materialised to Eiffel objects and also saved from Eiffel objects.
--
-- Features:
--	- half the size of XML
--	- specific leaf data types (not everything is a string)
--	- 'list' leaf types, e.g. list of string, list of integer etc
--	- hash structures for multiples (see ["xxxx"] keys)
--	- Interval data types for ordered prmitive types
--	- dates and times (ISO 8601) built in as leaf types
--	- has an Eiffel parser, serialiser, 'data tree' (DT) representation (like XML DOM), and DT => Eiffel object conversion
--	- full spec in this doc http://www.openehr.org/svn/specification/TRUNK/publishing/architecture/am/adl1.5.pdf (chapter 4)
--	- source code of DT lib - https://github.com/openEHR/adl-tools/tree/master/libraries/common_libs/src/structures/data_tree
--  - parser source - https://github.com/openEHR/adl-tools/tree/void-safety/libraries/parsers/dadl
--
--	T Beale 6 Feb 2013
--

project = <
	name = <"adl_workbench">
	uuid = <"C99BD5CC-111C-4EE7-9BCF-337A924E2783">
>
targets = <
	["adl_workbench"] = <
		name = <"adl_workbench">
		root = <
			class = <"GUI_APP_ROOT">
			feature = <"make_and_launch">
		>
		file_rule = <
			exclusions = <"\.git", "\.svn">
		>
		options = <
			trace = <"false">
			profile = <false>
			debug = <false>
			warning = <true>
			full_class_checking = <true>
			is_attached_by_default = <true>
			void_safety = <"none">
			syntax = <"standard">
			namespace = <"openehr">
		>
		warnings = <
			["export_class_missing"] = <true>
			["old_verbatim_strings"] = <true>
			["syntax"] = <true>
			["vjrv"] = <true>
		>
		settings = <
			["address_expression"] = <true>
			["array_optimization"] = <false>
			["automatic_backup"] = <true>
			["check_vape"] = <true>
			["console_application"] = <false>
			["dead_code_removal"] = <true>
			["dynamic_runtime"] = <false>
		>
		libraries = <
			["base"] = <
				name = <"base">
				location = <"$ISE_LIBRARY\library\base\base-safe.ecf">
				renaming = <
					old_name = <"C_STRING">
					new_name = <"BASE_C_STRING">
				>
			>
			["docking"] = <
				name = <"docking">
				location = <"$ISE_LIBRARY\library\base\docking-safe.ecf">
			>
		>
		clusters = <
			["adl_compiler"] = <
				name = <"adl_compiler">
				location = <"..\..\..\components\adl_compiler\src\">
				recursive = <true>
				options = <
					void_safety = <"initialisation">
					assertions = <
						precondition = <true>
						postcondition = <true>
						invariant = <false>
					>
				>
			>
			["app_messages"] = <
				name = <"app_messages">
				location = <"..\..\..\message_db\generated\">
				recursive = <true>
				options = <
					void_safety = <"initialisation">
					assertions = <
						precondition = <true>
						postcondition = <true>
						invariant = <false>
					>
				>
				file_rules = <
					["windows"] = <
						exclude = <"/other$">
						include = <"/windows">
						conditions = <
							platform = <
								excluded_values = <"windows">
							>
						>
					>
					["other"] = <
						exclude = <"/windows$">
						include = <"/other">
						conditions = <
							platform = <
								excluded_values = <"windows">
							>
						>
					>
				>
			>
		>
	>
	["other"] = <
		name = <"other">
		root = <
			class = <"GUI_APP_ROOT">
		>
		etc = <"">
	>
>
