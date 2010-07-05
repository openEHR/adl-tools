note
	component:   "openEHR Archetype Project"
	description: "[
				 Root application class for any ADL application; performs all application-wide initialisation.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL"
	revision:    "$LastChangedRevision"
	last_change: "$LastChangedDate"

class ADL_APPLICATION

inherit
	SHARED_APP_RESOURCES

	SHARED_APPLICATION_CONTEXT

	SHARED_REFERENCE_MODEL_ACCESS

feature -- Initialisation

	initialise
		once
			initialise_default_resource_config_file_name
			message_db.populate(message_templates_text, locale_language_short)
			billboard.set_status_reporting_level(status_reporting_level)

			if html_export_directory.is_empty then
				set_html_export_directory (file_system.pathname (file_system.absolute_parent_directory (reference_repository_path), "html"))
			end

			if not adl_version_for_flat_output.is_empty then
				set_use_flat_adl_version (adl_version_for_flat_output)
				post_warning (Current, "initialise", "adl_version_warning", <<adl_version_for_flat_output>>)
			end

			if validation_strict then
				set_strict_validation(True)
				post_warning (Current, "initialise", "validation_strict", Void)
			else
				post_warning (Current, "initialise", "validation_non_strict", Void)
			end

			load_rm_schemas
		end

feature -- Message database

	message_templates_text: STRING =
			-- string form of message template tables in one language. Logically these should be broken up into different chunks
			-- but it needs to be carefully done so that it is still possible to find all the pieces for the purposes of eacy
			-- translation
		"[
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
			
			-- DT_OBJECT_CONVERTER.dt_to_object
			["container_type_mismatch"] = 
				<"Mismatch error in data and model for field $1 in type $2. Parsed data implies container type but is not in model">
			["primitive_type_mismatch"] = 
				<"Mismatch error in data and model for field $1 in type $2. Parsed data implies primitive, sequence<primitive> or interval<primitive> type but model does not">
			["dt_proc_arg_type_mismatch"] = 
				<"[Exception caught]: Mismatch between data and model for $1.$2. Expecting $3, read a $4">
			["populate_dt_proc_arg_type_mismatch"] = 
				<"[Exception caught]: $1.$2 - writing primitive object of type $3 into argument of type $4">
			["non_existent_path"] = <"Error: non-existent path $1 in data tree structure">
			["non_existent_path_in_list"] = <"Error: non-existent path (in list) $1 in data tree structure">
			["dt_to_object_type_mismatch"] = <"[Exception caught]: Mismatch error - original recipient = $1">
				
			-- SCHEMA_ACCESS (RM model checker)
			["model_access_e0"] = <"Reference model schema(s) $1 specified in options not valid or not found in directory $2">
			["model_access_e1"] = <"Reference Model schema file $1 does not exist or not readable">
			["model_access_e2"] = <"Reference Model schema $1 parse failure; reason: $2">
			["model_access_e3"] = <"Reference Model schema contains unknown type $1 (object add failed)">
			["model_access_e4"] = <"Reference Model schema $1 load failure due to exception during processing">
			["model_access_e5"] = <"Reference Model schema directory $1 does not exist or not readable">
			["model_access_e6"] = <"Reference Model schema directory $1 does not contain any schemas (expecting structure $1/model_name/schema_file.dadl)">
			["model_access_e7"] = <"No Reference Model schema found for package '$1'">

			["model_access_i1"] = <"Reference Model $1 loaded: $2 primitive types, $3 class definitions">

			["model_access_w1"] = <"Reference Model checking is OFF">
			["model_access_w2"] = <"Duplicate Reference Model schema found for model '$1' in file $2">
			["model_access_w3"] = <"Duplicate instance of Reference Model package $1 found; ignoring instance from schema $2">
			["model_access_w4"] = <"Reference Model for $1 meta-data missing/invalid: $2">
			["model_access_w5"] = <"Unknown Reference Model '$1' mentioned in 'rm_schemas_load_list' config setting (ignored)">
			["model_access_w6"] = <"No 'rm_schemas_load_list' config setting found; attempting to load all schemas (change via Tools>Options)">
			["RMPTV"] = <"Error (RMPTV): class definition $1 property $2 type not defined in schema">
			
			-- MAIN_WINDOW
			["adl_version_warning"] = <"Using ADL version $1 for output serialisation">
			["clean_generated_file"] = <"Removing generated file $1">

			-- ARCHETYPE compilation
			["create_new_archetype_1"] = <"CREATE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["specialise_archetype_1"] = <"SPECIALISE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["open_adl_file_1"] = <"%NOPEN FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["save_archetype_i1"] = <"Serialised: $1 to file $2">
			["save_archetype_e2"] = <"Serialisation failed (archetype not valid)">
			["save_archetype_e3"] = <"%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["serialise_archetype_e1"] = <"Serialisation failed; archetype not valid: $1">
			["serialise_archetype_e2"] = <"%NSERIALISE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">

			["compile_legacy_e1"] = <"$1 (Parse failed)">
			["compile_legacy_e2"] = <"Parse LEGACY Archetype FAILED DUE TO EXCEPTION">
			["compile_legacy_i1"] = <"LEGACY Archetype $1 --> Parsed ok">

			["parse_i1"] = <"Archetype $1 --> parsed ok">
			["parse_i2"] = <"Parsing Archetype differential file">
			["parse_w1"] = <"Archetype $1 parent has changed from $2 to $3; refresh required (^R)">
			["parse_e1"] = <"$1 (Parse failed)">
			["parse_e3"] = <"PARSE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">

			["parse_archetype_i2"] = <"Archetype $1 semantics VALIDATED">
			["parse_archetype_w2"] = <"Archetype $1 semantic validation Warnings:%N$2">

			["parse_archetype_e2"] = <"Archetype $1 semantic validation FAILED; reasons:%N$2">
			["parse_archetype_e4"] = <"Archetype $1 semantic validation of differential form FAILED; reasons:%N$2">
			["parse_archetype_e5"] = <"Archetype $1 basic error in 'archetype' clause">
			["parse_archetype_e6"] = <"Archetype $1 basic error in 'specialise' clause">
			["parse_archetype_e7"] = <"Archetype $1 invalid: old-style 'draft' identifier $2">
			["parse_archetype_e8"] = <"Archetype at $1 invalid identifier $2">
			["parse_archetype_e9"] = <"Archetype at $1 invalid artefact type $2 (should be 'archetype', 'template', etc)">
			["parse_archetype_e10"] = <"Archetype at $1 invalid parent identifier $2">
			["parse_archetype_e11"] = <"Archetype at $1 invalid: old-style 'draft' parent identifier $2">

			["arch_context_make_flat_i1"] = <"Generated differential archetype from specialised flat archetype">
			["compiler_status"] = <"=============== $1 ===============">
			["compiler_finished_status"] = <"=============== finished $1 ===============">
			["compiler_compiling_archetype"] = <"------------- compiling $1 -------------">
			["compiler_already_attempted"] = <"(already attempted; status = $1)">
			["compiler_already_attempted_validated"] = <"(already attempted; status = PASSED)">
			["compiler_unexpected_error"] = <"Location: $1">
			["compiler_no_flat_text"] = <"===================== No flat (.adlf) text available =======================">
			["compiler_no_source_text"] = <"===================== No source (.adls) text available =======================">
			
			-- ARCHETYPE_VALIDATOR
			["validate_e1"] = <"Error: specialisation parent is missing">
			["validate_e2"] = <"Error: specialisation parent failed to validate">
			["validate_e3"] = <"Error: archetype id in descriptor $1 does not match id at top of file $2">
			["validation_strict"] = <"Validation level STRICT">
			["validation_non_strict"] = <"Validation level NON-STRICT; non-coforming existence, occurrences & cardinality will be removed">
			
			-- GUI controls, MAIN_WINDOW
			["slots_incomplete_w1"] = <"Warning: this list may be incomplete. To be sure, run Build All under the Repository menu.">
			
			-- ARCHETYPE_DIRECTORY
			["arch_dir_orphan_archetype"] = <"No parent matching $1 found for archetype $2">
			["arch_dir_orphan_archetype_e2"] = <"No ontology node matching $1 found for archetype $2; incorrect id?">
			["arch_dir_dup_archetype"] = <"Duplicate archetype $1">
			["regex_e1"] = <"Error: Invalid regular expression $1">

			-- ADL_SYNTAX_CONTERTER
			["syntax_upgraded_i1"] = <"Syntax element upgraded: --$1-- changed to --$2--">
							
			-- ARCHETYPE_FILE_REPOSITORY_IMP
			["invalid_filename_e1"] = <"Invalid archetype filename $1">
			["pair_filename_i1"] = <"(Differential/flat pair archetype filename found $1)">
			["save_as_i1"] = <"Archetype saved to $2">
			["save_as_e1"] = <"Save-as failed; could not write to file $1">
			["duplicate_filename"] = <"Duplicate file name or alternate version $1">
			
			------------------------- syntax errors: see the cADL, dADL and ADL syntax validators ---------------------
			["SARID"] = <"Syntax error (SARID): in artefact identification clause; expecting archetype id (format = model_issuer-package-class.concept.version)">
			["SASID"] = <"Syntax error (SASID): in 'specialise' clause; expecting parent archetype id (model_issuer-ref_model-model_class.concept.version)">
			["SACO"] = <"Syntax error (SACO): in 'concept' clause; expecting TERM_CODE reference">
			["SALA"] = <"Syntax error (SALA): error in language section">
			["SALAN"] = <"Syntax error (SALAN): no language section found">
			["SADS"] = <"Syntax error (SADS): error in description section">
			["SADF"] = <"Syntax error (SADF): error in definition section">
			["SAIV"] = <"Syntax error (SAIV): error in invariant section">
			["SAON"] = <"Syntax error (SAON): error in ontology section">

			["SDSF"] = <"Syntax error (SDSF): differential syntax not allowed in top-level archetype">
			["SDINV"] = <"Syntax error (SDINV): invalid dADL section; error: $1">
			["SCCOG"] = <"Syntax error (SCCOG): expecting a new node definition, primitive node definition, 'use' path, or 'archetype' reference">
			["SUAID"] = <"Syntax error (SUAID): expecting [archetype_id], or [at-code ',' archetype_id] in use_archetype statement">
			["SOCCF"] = <"Syntax error (SOCCF): expecting an 'occurrences expression', e.g. 'occurrences matches {n..m}'">
			["SUNPA"] = <"Syntax error (SUNPA): expecting absolute path in use_node statement">
			["SUAS"] = <"Syntax error (SUAS): error after 'use_archetype' keyword; expecting Object node definition">
			["SCAS"] = <"Syntax error (SCAS): expecting a 'any' node, 'leaf' node, or new node definition">
			["SINVS"] = <"Syntax error (SINVS): illegal invariant expression at identifier $1">
			["SEXPT"] = <"Syntax error (SEXPT): expecting absolute path after exists keyword">
			["SEXLSG"] = <"Syntax error (SEXLSG): existence single value must be 0 or 1">
			["SEXLU1"] = <"Syntax error (SEXLU1): existence upper limit must be 0 or 1 when lower limit is 0">
			["SEXLU2"] = <"Syntax error (SEXLU2): existence upper limit must be 1 when lower limit is 1">
			["SEXLMG"] = <"Syntax error (SEXLMG): existence must be one of 0..0, 0..1, or 1..1">

			["SCIAV"] = <"Syntax error (SCIAV): invalid assumed value; must be an integer">
			["SCRAV"] = <"Syntax error (SCRAV): invalid assumed value; must be a real number">
			["SCDAV"] = <"Syntax error (SCDAV): invalid assumed value; must be an ISO8601 date">
			["SCTAV"] = <"Syntax error (SCTAV): invalid assumed value; must be an ISO8601 time">
			["SCDTAV"] = <"Syntax error (SCDTAV): invalid assumed value; must be an ISO8601 date/time">
			["SCDUAV"] = <"Syntax error (SCDUAV): invalid assumed value; must be an ISO8601 duration">
			["SCSAV"] = <"Syntax error (SCSAV): invalid assumed value; must be a string">
			["SCBAV"] = <"Syntax error (SCBAV): invalid assumed value; must be a 'True' or 'False'">
			["SCOAV"] = <"Syntax error (SCOAV): invalid assumed value; must be an ordinal integer value">

			["SCDPT"] = <"Syntax error (SCDPT): invalid date constraint pattern; allowed patterns: $1">
			["SCTPT"] = <"Syntax error (SCTPT): invalid time constraint pattern; allowed patterns: $1">
			["SCDTPT"] = <"Syntax error (SCDTPT): invalid date/time constraint pattern; allowed patterns: $1">
			["SCDUPT"] = <"Syntax error (SCDUPT): invalid duration constraint pattern; legal pattern: P[Y|y][M|m][W|w][D|d][T[H|h][M|m][S|s]] or P[W|w]">
			["SCSRE"] = <"Syntax error (SCSRE): regular expression compile error '$1' is not a valid regular expression">
			["SCPCV"] = <"Syntax error (SCPCV): invalid term code constraint pattern: $1">
			["STCV"] = <"Syntax error (STCV)Invalid term code reference: '$1'; code string can only contain digits, letters and '.', '_' and '-' and must commence with a letter or digit">

			["SDAT"] = <"Syntax error (SDAT)invalid attribute value">
			["SGEE"] = <"Syntax error (SGEE)generic object not enclosed by normal object not allowed">

			-------------- validity errors: unless otherwise noted, these codes are defined in the AOM 1.5 or later spec ------------------
			["VASID"] = <"Error (VASID): specialised archetype id not based on specialisation parent archetype id">
			
			-- description
			["VTRLA"] = <"Error (VTRLA): translations key '$1' does not match translation item language '$2'">
			["VRDLA"] = <"Error (VRDLA): resource detail key '$1' does not match resource detail item language '$2'">

			-- ontology
			["VARDT"] = <"Error (VARDT): archetype id type $1 does not match type $2 in definition section">
			["VACSD"] = <"Error (VACSD): specialisation depth of concept code $1 does not match specialisation depth of archetype id $2">
			["VACCD"] = <"Error (VACCD): archetype concept code $1 not used in definition">			
			["VOTM"] = <"Error (VOTM): translations for $1 defined in the description / translations section but missing in the term_definition and constraint_definition sections">
			["VATCD"] = <"Error (VATCD): at-code $1 used in archetype more specialised than archetype">
			["VATDF1"] = <"Error (VATDF): node id at-code $1 from specialisation parent not defined in ontology of any parent archetype">
			["VATDF2"] = <"Error (VATDF): node id at-code $1 not defined in ontology of current archetype">
			["VACDF1"] = <"Error (VACDF): constraint code $1 from specialisation parent not defined in ontology of any parent archetype">
			["VACDF2"] = <"Error (VACDF): constraint code $1 not found in ontology of current archetype">
			
			-- C_ATTRIBUTE
			["VSANCE"] = <"Error (VSANCE): attribute at path $1 existence $2 does not conform to parent $3 existence $4">
			["VSANCC"] = <"Error (VSANCC): attribute at path $1 cardinality $2 does not conform to parent $3 cardinality $4">
			["VDIFP1"] = <"Error (VDIFP): differential path $1 should have corresponding node in flat parent at $2 but doesn't">
			["VDIFP2"] = <"Error (VDIFP): differential path $1 not legal with respect to RM">
			["VSAM"] = <"Error (VSAM): attribute at path $1 cardinality does not correspond to that of attribute in parent or reference model">
			
			-- C_OBJECT
			["VACSO"] = <"Error (VACSO): cannot add $1 object with $2 to singly-valued attribute $3 because object occurrences > 1">
			["VACSI"] = <"Error (VACSI): cannot add $1 object with $2 to singly-valued attribute $3 because attribute already has child with same node id">
			["VACSIT"] = <"Error (VACSIT): cannot add $1 object with $2 to singly-valued attribute $3 because attribute already has child with same RM type">

			["VACMC1"] = <"Error (VACMC): cannot add $1 object with $2 to multiply-valued attribute $3 because cardinality $4 does not contain occurrences $5 of object">
			["VACMC2"] = <"Error (VACMC): occurrences of children of multiply-valued attribute $1 exceed its cardinality $2">
			["VACMI"] = <"Error (VACMI): cannot add $1 object with $2 to multiply-valued attribute $3 because object has no node id">
			["VACMM"] = <"Error (VACMM): cannot add $1 object with $2 to multiply-valued attribute $3 because attribute already has child with same node id">

			["VARCN"] = <"Error (VARCN): concept code $1 is invalid">
			["VSSM"] = <"Error (VSSM): node at path $1 has order marker referring to non-existant sibling node $2">
			
			["VSONI"] = <"Error (VSONI): $1 object node at path $2 use of node identifier does not conform to $3 node at parent path $4">
			["VSONIN"] = <"Error (VSONIN): object node identifier $1 (RM type $2) at path $3 should have corresponding node in flat parent at $4 but doesn't">
			["VSONIR"] = <"Error (VSONIR): object node at path $1 (RM type $2) redefines parent node (RM type = $3) but node_id $4 not redefined">
			["VSCNR"] = <"Error (VSCNR): illegal redefinition of $1 node at $2 in parent into $3 node at $4 in child">
			["VCOCDocc"] = <"Error (VCOCD): object node of RM type $1 at path $2 definition missing (empty definition only allowed when occurrences redefined in specialised child)">
			["VSONT"] = <"Error (VSONT): object node at path $1 (AOM type $2) does not conform to node at parent path $3 AOM type $4">
			["VSONCT"] = <"Error (VSONCT): object node at path $1 (RM type $2) does not conform to node at parent path $3 RM type $4">
			["VSONCO"] = <"Error (VSONCO): object node at path $1 occurrences $2 does not conform to node at parent path $3 occurrences $4">
			["VSONCI"] = <"Error (VSONCI): object node at path $1 node_id $2 does not conform to node at parent path $3 node_id $4">
			["VCATU"] = <"Error (VCATU) cADL object duplicate attribute $1">
			
			-- ARCHETYPE_INTERNAL_REF
			["VUNP"] = <"Error (VUNP): ARCHETYPE_INTERNAL_REF path $1 not found in archetype">
			["VSUNT"] = <"Error (VSUNT): node at path $1 AOM type $2 does not conform to node at parent path $3 AOM type $4">

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

			-- C_ARCHETYPE_SLOT
			["VASMD"] = <"Error (VASMD): definition of slot of RM type $1 at path $2 missing; only allowed if slot is 'closed'">
			["VDSEV1"] = <"Error (VDSEV): 'exclude' constraint of slot of RM type $1 at path $2 invalid; exclude must be either empty or not match 'any' when 'include' matches 'any'">
			["VDSEV2"] = <"Error (VDSEV): 'exclude' constraint of slot of RM type $1 at path $2 invalid; exclude must be either empty or match 'any' when 'include' matches non-'any'">
			["VDSIV1"] = <"Error (VDSIV): 'include' constraint of slot of RM type $1 at path $2 invalid; include must be either empty or not match 'any' when 'exclude' matches 'any'">
			["VDSIV2"] = <"Error (VDSIV): 'include' constraint of slot of RM type $1 at path $2 invalid; include must be either empty or match 'any' when 'exclude' matches non-'any'">

			-- C_ARCHETYPE_ROOT
			["WARXS"] = <"Warning (VARXS): slot filler at $1 specifies archetype $2 that matches slot but doesn't exist in current archetype repository">
			["VARXS"] = <"Error (VARXS): slot filler at $1 specifies archetype id $2 that does not conform to flat parent slot constraint">
			["VARXNC"] = <"Error (VARXNC): slot node id of slot filler at $1 does not correspond to any ARCHETYPE slot in flat parent">
			["VARXTV"] = <"Error (VARXTV): RM type of slot filler $1 does not conform to RM type $2 of slot or attribute in flat parent">
			["WARNF"] = <"Warning (WARNF): archetype reference at $1 not found in archetype/template repository">

			-- ontology-related validity
			["VONSD"] = <"Error (VONSD): archetype code $1 in ontology more specialised than archetype">
			["VONLC"] = <"Error (VONLC): archetype code $1 in ontology not present in language $2">

			-- description-related validity
			["VDEOL"] = <"Error (VDEOL): original_language section missing">

			-- reference model-related validation
			["VCORM"] = <"Error (VCORM): type name '$1' at object node at $2 not known in reference model">
			["VCORMT"] = <"Error (VCORMT): type '$1' of object node at $2 not does not conform to type '$3' of $4.$5 in reference model">
			["VCARM"] = <"Error (VCARM): attribute name '$1' in object node at $2 (type=$3) not among flat set of properties in reference model">
			["VCAEX"] = <"Error (VCAEX): attribute $1 in object node at $2 existence $3 does not conform to existence $4 in reference model">
			["VCACA"] = <"Error (VCACA): attribute $1 in object node at $2 cardinality $3 does not conform to cardinality $4 in reference model">
			["WCACA"] = <"Warning (WCACA): attribute $1 in object node at $2 cardinality $3 same as in reference model">
			["VCAM"] = <"Error (VCAM): attribute $1 at path $2 multiplicity $3 does not correspond to multiplicity $4 of attribute in reference model">
			["WCAEX"] = <"Warning (WCAEX): attribute $1 in object node at $2 existence $3 same as in reference model">
			["WCARMC"] = <"Warning (WCARMC): attribute name '$1' in object node at $2 (type=$3) is a computed property in reference model">
			["ICORMTS"] = <"(info) type '$1' of object node at $2 not does not conform to type $3 of $4.$5 in reference model but substitution allowed">
					
			-- validation warnings: in addition to spec, used to help archetype authors
			["WOUC"] = <"Warning (WOUC): code $1 in ontology not used in archetype definition">
			["WCRC"] = <"Warning (WCRC): redefinition of CONSTRAINT_REF (ac_code node) by C_CODE_PHRASE node at path $1 in child - not checked">
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
--| The Original Code is adl_application.e.
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
