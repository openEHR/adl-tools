indexing
	component:   "openEHR Archetype Project"
	description: "Common routines for XML assertion serialisation"
	keywords:    "serialisation, XML, assertion"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class XML_ASSERTION_SERIALISATION_PROFILE

inherit
	XML_SERIALISATION_PROFILE

	CADL_TOKENS
		export
			{NONE} all
		end

create
	make
	
feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER] is
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("&isin;",			SYM_MATCHES)
			Result.put("{",					SYM_START_CBLOCK)
			Result.put("}",					SYM_END_CBLOCK)
			Result.put("*",					SYM_ANY)
		end	
	
	tags: HASH_TABLE[STRING, INTEGER] is
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("node",			TAG_NODE)
			Result.put("type",			TAG_NODE_TYPE)
			Result.put("rm_class",		TAG_NODE_RM_CLASS)
			Result.put("id",			TAG_NODE_ID)
			Result.put("level",			TAG_NODE_LEVEL)
			Result.put("parent",		TAG_NODE_PARENT)
			Result.put("child",			TAG_NODE_CHILD)
			Result.put("tag",			TAG_INVARIANT_TAG)
			Result.put("item",			TAG_ITEM)
			Result.put("code",			TAG_CODE)
			Result.put("text",			TAG_TEXT)
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
--| The Original Code is html_cadl_serialisation_profile.e.
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
