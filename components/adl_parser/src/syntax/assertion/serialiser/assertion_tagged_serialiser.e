indexing
	component:   "openEHR Archetype Project"
	description: "[
			 Serialise assertion archetype to a tagged format, where each attribute
			 is enclosed in tags.
	             ]"
	keywords:    "serialiser, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ASSERTION_TAGGED_SERIALISER 

inherit
	ASSERTION_SERIALISER
	
	CADL_TOKENS
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

	SHARED_ADL_INTERFACE
		export
			{NONE} all
		end
	
creation
	make
	
feature -- Modification

	start_assertion(invs: ARRAYED_LIST[ASSERTION]; depth: INTEGER) is
			-- start serialising an ASSERTION
		local
			attrs: HASH_TABLE [STRING, STRING]
		do
			from
				invs.start
			until
				invs.off
			loop
				create attrs.make(0)
				attrs.put(invs.item.tag, tag(TAG_INVARIANT_TAG))

				last_result.append(create_indent(depth+2) + xml_tag_start(tag(TAG_ITEM), attrs) + format_item(FMT_NEWLINE))
				last_result.append(invs.item.expression.as_string + format_item(FMT_NEWLINE))						
				last_result.append(create_indent(depth+2) + xml_tag_end(tag(TAG_ITEM)) + format_item(FMT_NEWLINE))
				invs.forth
			end
			last_result.append(create_indent(depth+1) + xml_tag_end(symbol(SYM_INVARIANT)) + format_item(FMT_NEWLINE))
		end
		
	end_assertion(a_node: ARRAYED_LIST[ASSERTION]; depth: INTEGER) is
			-- end serialising an ASSERTION
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
--| The Original Code is cadl_tagged_serialiser.e.
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
