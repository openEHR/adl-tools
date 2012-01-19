note
	component:   "openEHR Archetype Project"
	description: "Common routines for HTML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class HTML_ADL_SERIALISATION_PROFILE

inherit
	ADL_TOKENS
		export
			{NONE} all
		end

	HTML_SERIALISATION_PROFILE
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("archetype",		SYM_ARCHETYPE)
			Result.put("template",		SYM_TEMPLATE)
			Result.put("template_overlay",		SYM_TEMPLATE_OVERLAY)
			Result.put("adl_version",	SYM_ADL_VERSION)
			Result.put("controlled",	SYM_IS_CONTROLLED)
			Result.put("generated",	    SYM_IS_GENERATED)
			Result.put("concept",		SYM_CONCEPT)
			Result.put("specialize",	SYM_SPECIALIZE)
			Result.put("language",		SYM_LANGUAGE)
			Result.put("description",	SYM_DESCRIPTION)
			Result.put("definition",	SYM_DEFINITION)
			Result.put("invariant",		SYM_INVARIANT)
			Result.put("ontology",		SYM_ONTOLOGY)
			Result.put("annotations",	SYM_ANNOTATIONS)
			Result.put("component_ontologies",	SYM_COMPONENT_ONTOLOGIES)
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
--| The Original Code is html_adl_serialisation_profile.e.
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
