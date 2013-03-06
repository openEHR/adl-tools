note
	component:   "openEHR common definitions"
	description: "Simple XML implementation of TERMINOLOGY_ACCESS"
	keywords:    "terminology, vocabulary, XML"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class XML_TERMINOLOGY_SERVICE_POPULATOR

inherit
	SHARED_APP_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialization

	make
		-- Initialize `Current'.
	local
		value_set_processor: XML_VALUE_SET_PROCESSOR
	do
		-- for now we just make do with 'en' terminology
		terminology_file_path := file_system.pathname (file_system.pathname (terminology_directory, "en"), terminology_filename)
		if file_system.file_exists (terminology_file_path) then
			xml_doc := deserialize_text (terminology_file_path)
			if attached xml_doc then
				create value_set_processor
				xml_doc.process_children_recursive (value_set_processor)
			end
		else
			init_failed := True
			init_fail_reason := get_msg ("file_does_not_exist", <<terminology_file_path>>)
		end
	end

feature -- Access

	terminology_file_path: STRING

	init_fail_reason: STRING
		attribute
			create Result.make_empty
		end

	xml_doc: detachable XML_DOCUMENT
			-- result of successful parse

feature -- Status Report

	init_failed: BOOLEAN

feature {NONE} -- Implementation

	deserialize_text (a_file_path: STRING): detachable XML_DOCUMENT
			-- Retrieve xml document from content of `a_text'.
			-- If deserialization fails, return Void.
		local
			parser: XML_LITE_PARSER
			callbacks: XML_CALLBACKS_DOCUMENT
		do
			create parser.make
			create callbacks.make_null
			parser.set_callbacks (callbacks)

			parser.parse_from_filename (a_file_path)

			init_fail_reason.wipe_out
			if not parser.error_occurred then
				Result := callbacks.document
			else
				if attached parser.error_message as msg then
					init_fail_reason := msg
				end
				if attached parser.error_position as pos then
					init_fail_reason.append ("Position: " + pos.out)
				end
			end
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
--| The Original Code is terminology_interface.e.
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
