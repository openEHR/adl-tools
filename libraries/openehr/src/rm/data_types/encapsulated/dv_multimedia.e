indexing
	component:   "openEHR Data Types"
	description: "[
			 A specialisation of DV_ENCAPSULATED for audiovisual and biosignal types. 
			 Includes further metadata relating to multimedia types which are not 
			 applicable to other subtypes of DV_ENCAPSULATED.
			 ]"

	requirements:"ISO 18308 TS V1.0 STR 3.1"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DV_MULTIMEDIA

inherit
	DV_ENCAPSULATED

feature -- Initialization

	make_from_string(str:STRING) is
		do
		end

	make_from_canonical_string(str:STRING) is
		do
		end
		
feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Access

	alternate_text: STRING
			-- Text to display in lieu of multimedia display/replay

	uri: DV_URI
			-- URI reference to electronic information stored outside the record as a file, 
			-- database entry etc, if supplied as a reference. 

	data: ARRAY [CHARACTER]
			-- the actual data found at 'uri', if supplied inline

	media_type: CODE_PHRASE
			-- Data media type as per IANA MIME types - 
			-- see: http://www.isi.edu/in-notes/iana/assignments/media-types/media-types

	compression_algorithm: CODE_PHRASE
			-- compression type, taken from the HL7v3 domain “CompressionAlgorithm”, or Void = no compression

	integrity_check: ARRAY[CHARACTER]

	integrity_check_algorithm: CODE_PHRASE
			-- integrity check type, taken from the HL7v3 domain “IntegrityCheckAlgorithm”, or Void = no check

	thumbnail: DV_MULTIMEDIA

feature -- Status

	is_external: BOOLEAN is
		do
			Result := uri /= Void
		ensure
			uri /= Void implies Result
		end

	is_inline: BOOLEAN is
		do
			Result := data /= Void
		ensure
			data /= Void implies Result
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans
		do
		end
	
	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
		end
		
invariant
	Not_empty: is_inline or is_external
	Media_type_terminology: media_type /= Void and then 
	code_set("media types").all_codes.has(media_type)
	Compression_algorithm_terminology: compression_algorithm /= Void implies 
		code_set("compression algorithm").all_codes.has(compression_algorithm)
	Integrity_check_validity: integrity_check /= Void implies 
		integrity_check_algorithm /= Void
	Integrity_check_algorithm_terminology: integrity_check_algorithm /= Void implies 
		code_set("integrity check algorithm").has(integrity_check_algorithm)

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
--| The Original Code is dv_multimedia.e.
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
