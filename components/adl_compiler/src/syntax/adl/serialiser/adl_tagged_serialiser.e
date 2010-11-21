note
	component:   "openEHR Archetype Project"
	description: "parent of all ADL serialisers"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003,2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_TAGGED_SERIALISER

inherit
	ARCHETYPE_SERIALISER

	ADL_TOKENS
		export
			{NONE} all
		end

	XML_TOOLS
		export
			{NONE} all
		end

	XML_SERIALISER_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Serialisation

	serialise (a_target: ARCHETYPE; lang_serialised, desc_serialised, def_serialised, inv_serialised, ont_serialised: STRING)
		do
			target := a_target

			serialise_initialise
			serialise_archetype_id
			serialise_archetype_specialise
			serialise_archetype_concept

			if not desc_serialised.is_empty then
				last_result.append(create_indent(1) + xml_tag_start(symbol(SYM_DESCRIPTION), Void) + format_item(FMT_NEWLINE))
				last_result.append(desc_serialised)
				last_result.append(create_indent(1) + xml_tag_end(symbol(SYM_DESCRIPTION))
					+ format_item(FMT_NEWLINE) + format_item(FMT_NEWLINE))
			end

			if not def_serialised.is_empty then
				last_result.append(create_indent(1) + xml_tag_start(symbol(SYM_DEFINITION), Void) + format_item(FMT_NEWLINE))
				last_result.append(def_serialised)
				last_result.append(create_indent(1) + xml_tag_end(symbol(SYM_DEFINITION))
					+ format_item(FMT_NEWLINE)
					+ format_item(FMT_NEWLINE))
			end

			if inv_serialised /= Void then
				last_result.append(create_indent(1) + xml_tag_start(symbol(SYM_INVARIANT), Void) + format_item(FMT_NEWLINE))
				last_result.append(inv_serialised)
				last_result.append(create_indent(1) + xml_tag_end(symbol(SYM_INVARIANT))
					+ format_item(FMT_NEWLINE)
					+ format_item(FMT_NEWLINE))
			end

			if not ont_serialised.is_empty then
				last_result.append(create_indent(1) + xml_tag_start(symbol(SYM_ONTOLOGY), Void) + format_item(FMT_NEWLINE))
				last_result.append(ont_serialised)
				last_result.append(create_indent(1) + xml_tag_end(symbol(SYM_ONTOLOGY))
					+ format_item(FMT_NEWLINE)
					+ format_item(FMT_NEWLINE))
			end

			serialise_finalise
		end

	serialise_initialise
		do
			last_result.append(format_item(FMT_DOC_START))
			last_result.append(experimental_message)
		end

	serialise_archetype_id
		local
			attrs: HASH_TABLE [STRING, STRING]
		do
			create attrs.make(0)
			-- attrs.put("http://www.openehr.org/adl/v1.1", "xmlns")
			attrs.put("http://www.w3.org/2001/XMLSchema-instance", "xmlns:xsi")
			attrs.put(target.archetype_id.as_string, "archetype_id")
			last_result.append(xml_tag_start("archetype", attrs))
		end

	serialise_archetype_concept
		do
			last_result.append(create_indent(1) + xml_tag_start(symbol(SYM_CONCEPT), Void) + format_item(FMT_NEWLINE))
			last_result.append(create_indent(2) + xml_tag_enclose(tag(TAG_CODE), target.concept_code, Void) + format_item(FMT_NEWLINE))
			last_result.append(create_indent(2) + xml_tag_enclose(tag(TAG_TEXT),
				ontology.term_definition(language, target.concept_code).item("text"), Void) + format_item(FMT_NEWLINE))
			last_result.append(create_indent(1) + xml_tag_end(symbol(SYM_CONCEPT)) + format_item(FMT_NEWLINE))
		end

	serialise_archetype_specialise
		do
			if target.is_specialised then
				last_result.append(format_item(FMT_NEWLINE) + create_indent(1) +
					xml_tag_enclose(symbol(SYM_SPECIALIZE), target.parent_archetype_id.as_string, Void) +
					format_item(FMT_NEWLINE))
			end
			last_result.append(format_item(FMT_NEWLINE))
		end

	serialise_finalise
		do
			last_result.append(xml_tag_end("archetype"))
		end

feature {NONE} -- Implementation


	experimental_message: STRING
		once
			create Result.make(0)
			Result.append("%N")
			Result.append("<!-- **************************************** -->%N")
			Result.append("<!-- **                                    ** -->%N")
			Result.append("<!-- **   Experimental ad hoc XML for OWL  ** -->%N")
			Result.append("<!-- **   conversion project, Mayo clinic  ** -->%N")
			Result.append("<!-- **                                    ** -->%N")
			Result.append("<!-- **************************************** -->%N")
			Result.append("%N")
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
--| The Original Code is adl_serialiser.e.
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
