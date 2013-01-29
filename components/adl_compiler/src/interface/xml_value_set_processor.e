note
	component:   "openEHR common definitions"

	description: "Visitor to get attributes on any node."
	keywords:    "terminology, vocabulary, XML"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class XML_VALUE_SET_PROCESSOR

inherit
	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	XML_NODE_VISITOR
		redefine
			process_element
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

feature -- Access

	current_terminology: detachable TERMINOLOGY_ACCESS
			-- current terminology

	current_language: detachable STRING
			-- current language

	current_group: detachable STRING
			-- current group we are in

feature -- Processing

	process_element (e: XML_ELEMENT)
		local
			attrs: LIST [XML_ATTRIBUTE]
			attr_vals: HASH_TABLE [STRING, STRING]
		do
			attrs := e.attributes
			create attr_vals.make (0)
			across attrs as attrs_csr loop
				attr_vals.put (attrs_csr.item.value, attrs_csr.item.name)
			end

			if e.name.is_equal ("terminology") and attached attr_vals.item ("name") as val_name then
				ts.add_terminology (val_name)
				current_terminology := ts.terminology (val_name)
				if attached attr_vals.item ("language") as val_lang then
					current_language := val_lang
				end

			elseif e.name.is_equal ("group") then
				current_group := attr_vals.item ("name")

			elseif e.name.is_equal ("concept") and attached attr_vals.item ("id") as val_id and attached attr_vals.item ("rubric") as val_rubric then
				check attached current_group as cg and attached current_language as cl then
					current_terminology.add_term (val_id, val_rubric, cg, cl)
				end
			end
		end

	process_character_data (c: XML_CHARACTER_DATA)
			-- Process character data `c'.
		do
		end

	process_xml_declaration (a_decl: XML_DECLARATION)
			-- Process xml declaration `a_decl'
		do
		end

	process_processing_instruction (a_pi: XML_PROCESSING_INSTRUCTION)
			-- Process processing instruction `a_pi'.
		do
		end

	process_document (doc: XML_DOCUMENT)
			-- Process document `doc'.
		do
		end

	process_comment (com: XML_COMMENT)
			-- Process comment `com'.
		do
		end

	process_attributes (e: XML_ELEMENT)
			-- Process attributes of element `e'.
		do
		end

	process_attribute (att: XML_ATTRIBUTE)
			-- Process attribute `att'.
		do
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
