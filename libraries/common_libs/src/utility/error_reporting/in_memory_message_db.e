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

	SHARED_RESOURCES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Default_message_language: STRING is "en"
			-- default language of messages in this database

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
				init_helper ?= dt_tree.as_object_from_string("IN_MEMORY_MESSAGE_DB_INITIALISER")
				if init_helper.templates.has (locale_language_short) then
					templates := init_helper.templates.item (locale_language_short)
				else
					templates := init_helper.templates.item (Default_message_language)
				end
			else
				io.put_string ("Message database failure: " + parser.error_text + "%N")
			end
		end

feature -- Access

	message_templates_text: STRING is
			-- string form of message template tables in one language
		"[
		templates = <
		["en"] = <
			-- MESSAGE_BILLBOARD
			["none"] = <"No error">
			["message_code_error"] = <"Error code $1 does not exist">
			
			-- ANY
			["report_exception"] = <"Software Exception $1 caught; stack:%N$2">
			["unhandled_exception"] = <"Exception caught but not handled: $1">
			["general_error"] = <"Error: $1">
			["general"] = <"$1">
			
			-- MAIN_WINDOW
			["adl_version_warning"] = <"Using ADL version $1 for output serialisation">

			-- ARCHETYPE_COMPILER
			["create_new_archetype_1"] = <"CREATE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["specialise_archetype_1"] = <"SPECIALISE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["open_adl_file_1"] = <"%NOPEN FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["save_archetype_i1"] = <"Serialised: $1 to file $2">
			["save_archetype_e2"] = <"Serialisation failed (archetype not valid)">
			["save_archetype_e3"] = <"%NSAVE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["serialise_archetype_e1"] = <"Serialisation failed; archetype not valid: $1">
			["serialise_archetype_e2"] = <"%NSERIALISE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["parse_archetype_i1"] = <"Archetype $1 syntax VALIDATED">
			["parse_archetype_i2"] = <"Archetype $1 semantics VALIDATED">
			["parse_archetype_i3"] = <"Archetype differential form file found; parsing that">
			["parse_archetype_e1"] = <"$1 (Parse failed)">
			["parse_archetype_e2"] = <"Archetype $1 semantic validation FAILED; reasons:%N$2">
			["parse_archetype_w2"] = <"Archetype $1 semantic validation Warnings:%N$2">
			["parse_archetype_e3"] = <"PARSE FAILED DUE TO EXCEPTION; see 'status'; call 'reset' to clear">
			["parse_archetype_e4"] = <"Archetype $1 semantic validation of differential form FAILED; reasons:%N$2">

			["arch_context_make_flat_i1"] = <"Generated differential archetype from specialised flat archetype">
			
			-- ARCHETYPE_VALIDATOR
			["validate_e1"] = <"Error: specialisation parent is missing">
			["validate_e2"] = <"Error: specialisation parent failed to validate">
			["validate_e3"] = <"Error: archetype id in filename $1 does not match id at top of file $2%N">
			
			-- MODEL_ACCESS (RM model checker)
			["model_access_e1"] = <"Reference Model DADL file $1 does not exist or not readable">
			["model_access_e2"] = <"Reference Model DADL parse failure; reason: $1">
			["model_access_e3"] = <"Reference Model DADL containes unknown type $1 (object add failed)">
			["model_access_e4"] = <"Reference Model load failure due to exception during processing">
			["model_access_i1"] = <"Reference Model $1 $2 loaded: $3 primitive types, $4 class definitions">
			["model_access_w1"] = <"Reference Model checking is OFF">
			
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
				
			-- ARCHETYPE_DIRECTORY
			["arch_dir_orphan_archetype"] = <"No parent matching $1 found for archetype $2">
			["arch_dir_dup_archetype"] = <"Duplicate archetype $1">

			-- ADL_SYNTAX_CONTERTER
			["syntax_upgraded_i1"] = <"Syntax element upgraded: --$1-- changed to --$2--">
							
			-- ARCHETYPE_FILE_REPOSITORY_IMP
			["invalid_filename_e1"] = <"Invalid archetype filename $1">
			["pair_filename_i1"] = <"(Differential/flat pair archetype filename found $1)">
			["save_as_i1"] = <"Archetype saved in language $1 to $2">
			["save_as_e1"] = <"Save-as failed; could not write to file $1">
			
			------------------------- syntax errors: see the cADL, dADL and ADL syntax validators ---------------------
			["SARID"] = <"in 'archetype' clause; expecting archetype id (model_issuer-ref_model-model_class.concept.version)">
			["SASID"] = <"in 'specialise' clause; expecting parent archetype id (model_issuer-ref_model-model_class.concept.version)">
			["SACO"] = <"in 'concept' clause; expecting TERM_CODE reference">
			["SALA"] = <"error in language section">
			["SADS"] = <"error in description section">
			["SADF"] = <"error in definition section">
			["SAIV"] = <"error in invariant section">
			["SAON"] = <"error in ontology section">

			["SDSF"] = <"differential syntax not allowed in flat archetype">
			["SDINV"] = <"invalid dADL section; error: $1">
			["SCCOG"] = <"expecting a new node definition, primitive node definition, 'use' path, or 'archetype' reference">
			["SOCCF"] = <"expecting an 'occurrences expression', e.g. 'occurrences matches {n..m}'">
			["SUNPA"] = <"expecting absolute path in use_node statement">
			["SUAS"] = <"error after 'use_archetype' keyword; expecting Object node definition">
			["SCAS"] = <"expecting a 'any' node, 'leaf' node, or new node definition">
			["SINVS"] = <"illegal invariant expression at identifier $1">
			["SEXPT"] = <"expecting absolute path after exists keyword">
			["SEXLSG"] = <"existence single value must be 0 or 1">
			["SEXLU1"] = <"existence upper limit must be 0 or 1 when lower limit is 0">
			["SEXLU2"] = <"existence upper limit must be 1 when lower limit is 1">
			["SEXLMG"] = <"existence must be one of 0..0, 0..1, or 1..1">

			["SCIAV"] = <"invalid assumed value; must be an integer">
			["SCRAV"] = <"invalid assumed value; must be a real number">
			["SCDAV"] = <"invalid assumed value; must be an ISO8601 date">
			["SCTAV"] = <"invalid assumed value; must be an ISO8601 time">
			["SCDTAV"] = <"invalid assumed value; must be an ISO8601 date/time">
			["SCDUAV"] = <"invalid assumed value; must be an ISO8601 duration">
			["SCSAV"] = <"invalid assumed value; must be a string">
			["SCBAV"] = <"invalid assumed value; must be a 'True' or 'False'">
			["SCOAV"] = <"invalid assumed value; must be an ordinal integer value">

			["SCDPT"] = <"invalid date constraint pattern; allowed patterns: $1">
			["SCTPT"] = <"invalid time constraint pattern; allowed patterns: $1">
			["SCDTPT"] = <"invalid date/time constraint pattern; allowed patterns: $1">
			["SCDUPT"] = <"invalid duration constraint pattern; legal pattern: P[Y|y][M|m][W|w][D|d][T[H|h][M|m][S|s]] or P[W|w]">
			["SCSRE"] = <"regular expression compile error '$1' is not a valid regular expression">
			["SCPCV"] = <"invalid term code constraint pattern: $1">
			["STCV"] = <"Invalid term code reference: '$1'; code string can only contain digits, letters and '.', '_' and '-' and must commence with a letter or digit">

			["SDAT"] = <"invalid attribute value">
			["SGEE"] = <"generic object not enclosed by normal object not allowed">

			-------------- validity errors: unless otherwise notes, these codes are defined in the AOM 1.5 or later spec ------------------
			["VASID"] = <"Error (VASID): specialised archetype id not based on specialisation parent archetype id">

			["VARDT"] = <"Error (VARDT): archetype id type $1 does not match type $2 in definition section">
			["VACSD"] = <"Error (VACSD): specialisation depth of concept code $1 does not match specialisation depth of archetype id $2">
			["VACCD"] = <"Error (VACCD): archetype concept code $1 not used in definition">			
			["VONSD"] = <"Error (VONSD): archetype code $1 in ontology more specialised than archetype">
			["VOTM"] = <"Error (VOTM): translations missing in the term_definition and constraint_definition sections wit respect to languages defined in the description / translations section%N">
			["VATCD"] = <"Error (VATCD): at-code $1 used in archetype more specialised than archetype">
			["VATDF"] = <"Error (VATDF): node id at-code $1 not defined in ontology">
			["VUNP"] = <"Error (VUNP): use_node path $1 not found in archetype">

			["VSONT"] = <"Error (VSONT): object node at path $1 (AOM type $2) does not conform to node at parent path $3 AOM type $4">
			["VSONCT"] = <"Error (VSONCT): object node at path $1 (RM type $2) does not conform to node at parent path $3 RM type $4">
			["VSONCO"] = <"Error (VSONCO): object node at path $1 occurrences $2 does not conform to node at parent path $3 occurrences $4">
			["VSONCI"] = <"Error (VSONCI): object node at path $1 node_id $2 does not conform to node at parent path $3 node_id $4">
			["VCATU"] = <"Error (VCATU) cADL object duplicate attribute $1">
			
			["VSANCE"] = <"Error (VSANCE): attribute at path $1 existence $2 does not conform to parent $3 existence $4">
			["VSANCC"] = <"Error (VSANCC): attribute at path $1 cardinality $2 does not conform to parent $3 cardinality $4">
			["VSAM"] = <"Error (VSAM): attribute at path $1 multiplicity does not correspond to that of attribute in parent">
			["VSONNC"] = <"Error (VSONNC): $1 object node at path $2 does not conform to $3 node at parent path $4">
			["VSONIR"] = <"Error (VSONIR): object node at path $1 (RM type $2) redefines parent node (RM type = $3) but node_id $4 not redefined">
			["VSCNR"] = <"Error (VSCNR): illegal redefinition of $1 node at $2 in parent into $3 node at $4 in child">

			["VSSM"] = <"Error (VSSM): node at path $1 has order marker referring to non-existant sibling node $2">

			["VOBAV"] = <"Error (VOBAV): assumed value $1 not within constraint range">
			["VOBAVL"] = <"Error (VOBAVL): assumed value $1 not found in constraint list"> -- additional to ADL spec
			["VCPCV"] = <"Error (VCPCV): invalid term code constraint: $1">
			["VCOV"] = <"Error (VCOV): invalid ordinal constraint: duplicated value $1">
			["VCOC"] = <"Error (VCOC): invalid ordinal constraint: duplicated code $1">

			["VIVLO"] = <"Error (VIVLO): invalid interval: $1 must be <= $2"> -- dADL validity; additional to spec
			["VIDV"] = <"Error (VIDV): invalid ISO8601 date: $1"> -- dADL validity; additional to spec
			["VITV"] = <"Error (VITV): invalid ISO8601 time: $1"> -- dADL validity; additional to spec
			["VIDTV"] = <"Error (VIDTV): invalid ISO8601 date/time: $1"> -- dADL validity; additional to spec
			["VIDUV"] = <"Error (VIDUV): invalid ISO8601 duration: $1"> -- dADL validity; additional to spec

			["VDATU"] = <"Error (VDATU): dADL object duplicate attribute: $1">
			["VDOBU"] = <"Error (VDOBU): object key must be unique; key [$1] already exists under attribute '$1'">

			["VACSO"] = <"Error (VACSO): cannot add $1 object with $2 to singly-valued attribute $3 because object occurrences > 1">
			["VACSI"] = <"Error (VACSI): cannot add $1 object with $2 to singly-valued attribute $3 because attribute already has child with same node id">
			["VACSIT"] = <"Error (VACSIT): cannot add $1 object with $2 to singly-valued attribute $3 because attribute already has child with same RM type">

			["VACMC"] = <"Error (VACMC): cannot add $1 object with $2 to multiply-valued attribute $3 because cardinality $4 does not contain occurrences $5 of object">
			["VACMI"] = <"Error (VACMI): cannot add $1 object with $2 to multiply-valued attribute $3 because object has no node id">
			["VACMM"] = <"Error (VACMM): cannot add $1 object with $2 to multiply-valued attribute $3 because attribute already has child with same node id">

			["VARCN"] = <"Error (VARCN): concept code $1 is invalid">

			-- reference model-related validation
			["VCORM"] = <"Error (VCORM): type name $1 at object node at $2 not known in reference model">
			["VCORMT"] = <"Error (VCORMT): type $1 of object node at $2 not does not conform to type $3 of $4.$5 in reference model">
			["VCARM"] = <"Error (VCARM): attribute name $1 in object node at $2 (type=$3) not among flat set of properties in reference model">
			["VCAEX"] = <"Error (VCAEX): attribute $1 in object node at $2 existence $3 does not conform to existence $4 in reference model">
			["VCACA"] = <"Error (VCACA): attribute $1 in object node at $2 cardinality $3 does not conform to cardinality $4 in reference model">
			["VCAM"] = <"Error (VCAM): attribute $1 at path $2 multiplicity does not correspond to that of attribute in reference model">
			["WCACA"] = <"Warning (WCACA): attribute $1 in object node at $2 cardinality $3 same as in reference model">
			["WCAEX"] = <"Warning (WCAEX): attribute $1 in object node at $2 existence $3 same as in reference model">
			["ICARMC"] = <"(info) attribute name $1 in object node at $2 (type=$3) is a computed property in reference model">
			["ICORMTS"] = <"(info) type $1 of object node at $2 not does not conform to type $3 of $4.$5 in reference model but substitution allowed">
					
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


