note
	component:   "openEHR dADL Project"
	description: "[
				 Root application class for any application; performs all application-wide initialisation.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class APP_ROOT

inherit
	SHARED_APP_RESOURCES

	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

create
	make

feature -- Initialisation

	make
		once
			Message_db.populate (Message_templates_text, locale_language_short)
			if Message_db.database_loaded then
				billboard.set_status_reporting_level(status_reporting_level)
				dt_serialisers.put(create {DADL_SYNTAX_SERIALISER}.make(create {NATIVE_DADL_SERIALISATION_PROFILE}.make("dadl")), "dadl")
				initialised := True
			end
		end

feature -- Status Report

	initialised: BOOLEAN
			-- True after successful initialisation

feature {NONE} -- Implementation

	message_templates_text: STRING_8 = "[
		templates = <
			["en"] = <
				-- MESSAGE_BILLBOARD
				["none"] = <"No error">
				["message_code_error"] = <"Error code $1 does not exist">

				-- General application
				["report_exception"] = <"Software Exception $1 caught; Stack:%N$2">
				["report_exception_with_context"] = <"Software Exception caught; Context: $1; Type: $2; Stack:%N$3">
				["unhandled_exception"] = <"Exception caught but not handled: $1">
				["general_error"] = <"Error: $1">
				["general"] = <"$1">
				["cfg_file_i1"] = <"Wrote config file $1">
				["file_exists_replace_question"] = <"File $1 already exists. Replace it?">

				-- the following two groups should be separated out into a dadl-related error file and used by both ADL workbench app and dadl apps

				-- DT_OBJECT_CONVERTER.dt_to_object
				["container_type_mismatch"] =
					<"Mismatch error in data and model for field $1 in type $2. Parsed data implies container type but is not in model">
				["interval_type_mismatch"] =
					<"Mismatch error in data and model for field $1 in type $2. Parsed data implies interval type but is not in model">
				["atomic_type_mismatch"] =
					<"Mismatch error in data and model for field $1 in type $2. Parsed data implies atomic type but no conversion available">
				["primitive_type_mismatch"] =
					<"Mismatch error in data and model for field $1 in type $2. Parsed data implies primitive, sequence<primitive> or interval<primitive> type but model does not">
				["dt_proc_arg_type_mismatch"] =
					<"[Exception caught]: Mismatch between data and model for $1.$2. Expecting $3, read a $4">
				["populate_dt_proc_arg_type_mismatch"] =
					<"[Exception caught]: $1.$2 - writing primitive object of type $3 into argument of type $4">
				["non_existent_path"] = <"Error: non-existent path $1 in data tree structure">
				["non_existent_path_in_list"] = <"Error: non-existent path (in list) $1 in data tree structure">
				["dt_to_object_type_mismatch"] = <"[Exception caught]: Mismatch error - original recipient = $1">

				-- dADL
				["VOBAV"] = <"Error (VOBAV): assumed value $1 not within constraint value space">
				["VCPCV"] = <"Error (VCPCV): invalid term code constraint: $1">
				["VCOV"] = <"Error (VCOV): invalid ordinal constraint: duplicated value $1">
				["VCOC"] = <"Error (VCOC): invalid ordinal constraint: duplicated code $1">

				["VIVLO"] = <"Error (VIVLO): invalid interval: $1 must be <= $2"> -- dADL validity; additional to spec
				["VIDV"] = <"Error (VIDV): invalid ISO8601 date: $1"> -- dADL validity; additional to spec
				["VITV"] = <"Error (VITV): invalid ISO8601 time: $1"> -- dADL validity; additional to spec
				["VIDTV"] = <"Error (VIDTV): invalid ISO8601 date/time: $1"> -- dADL validity; additional to spec
				["VIDUV"] = <"Error (VIDUV): invalid ISO8601 duration: $1"> -- dADL validity; additional to spec

				["VDATU"] = <"Error (VDATU): dADL object duplicate attribute: $1">
				["VOKU"] = <"Error (VOKU): dADL object key must be unique; key [$1] already exists under attribute '$2'">
			>
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
--| The Original Code is app_root.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
