indexing
	component:   "openEHR Reusable Libraries"
	description: "[
			     In-memory implementation of message database abstraction
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class IN_MEMORY_MESSAGE_DB

inherit
	MESSAGE_DB

	INTERNAL
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make is
		local
			parser: DADL2_VALIDATOR
			dt_tree: DT_COMPLEX_OBJECT_NODE
			init_helper: IN_MEMORY_MESSAGE_DB_INITIALISER
		do
			create parser.make
			parser.execute(message_templates_text, 1)
			if not parser.syntax_error then
				dt_tree := parser.output
				init_helper ?= dt_tree.as_object(dynamic_type_from_string("IN_MEMORY_MESSAGE_DB_INITIALISER"))
				check init_helper /= Void end
				templates := init_helper.templates
			end
		end

feature -- Access

	message_templates_text: STRING is
			-- string form of message template tables in one language
		"[
		templates = <
			-- MESSAGE_BILLBOARD
			["none"] = <"No error">
			["message_code_error"] = <"Error code $1 does not exist">
			
			-- ANY
			["report_exception"] = <"Software Exception $1 caught; stack:%N$2">
			["unhandled_exception"] = <"Exception caught but not handled: $1">
			["general_error"] = <"Error: $1">
			["general"] = <"$1">
			
			-- ADL_INTERFACE
			["create_new_archetype_1"] = <"CREATE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["specialise_archetype_1"] = <"SPECIALISE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["open_adl_file_1"] = <"%NOPEN FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["save_archetype_i1"] = <"Serialised: $1 to file $2">
			["save_archetype_e1"] = <"Serialise failed - could not write to file $1">
			["save_archetype_e2"] = <"Serialisation failed; archetype not valid: $1">
			["save_archetype_e3"] = <"%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["serialise_archetype_e1"] = <"Serialisation failed; archetype not valid: $1">
			["serialise_archetype_e2"] = <"%NSERIALISE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["parse_archetype_i1"] = <"Archetype $1 syntax VALIDATED">
			["parse_archetype_i2"] = <"Archetype $1 semantics VALIDATED">
			["parse_archetype_e1"] = <"$1 (Parse failed)">
			["parse_archetype_e2"] = <"Archetype $1 semantic validation FAILED; reasons:%N$2">
			["parse_archetype_e3"] = <"PARSE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			
			-- DT_OBJECT_CONVERTER.dt_to_object
			["container_type_mismatch"] = 
				<"Mismatch error in data and model for field $1 in type $2. Parsed data implies container type but is not in model">
			["primitive_type_mismatch"] = 
				<"Mismatch error in data and model for field $1 in type $2. Parsed data implies primitive, sequence<primitive> or interval<primitive> type but model does not">
			["dt_proc_arg_type_mismatch"] = 
				<"[Exception caught]: Mismatch between data and model for $1.$2. Expecting $3, read a $4">
			["populate_dt_proc_arg_type_mismatch"] = 
				<"[Exception caught]: $1.$2 - writing primitive object of type $3 into argument of type $4">
				
			-- ARCHETYPE_DIRECTORY
			["arch_dir_no_arch_parent"] = <"No parent matching $1 found for archetype $2">
			["arch_dir_dup_archetype"] = <"Duplicate archetype $1">

			-- ADL_SYNTAX_CONTERTER
			["syntax_upgraded_i1"] = <"Syntax element upgraded: --$1-- changed to --$2--">
		>
		]"

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
--| The Original Code is in_memory_message_db.e.
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


