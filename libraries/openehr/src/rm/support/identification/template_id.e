note
	component:   "openEHR Common Reference Model"

	description: "[
				 Multi-axial template identifier of the form:
				 		qualified_rm_entity.domain_concept.version
				 	where:
				 		qualified_rm_entity	= rm_originator-rm_name-rm_entity_name
				 		domain_concept = string name of concept, including specialised parts
				 						 separated by '-'s
				 		version = string
				 ]"
	keywords:    "archetype"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2008 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TEMPLATE_ID

inherit
	RM_CONCEPT_ID

create
	make,
	make_from_string,
	default_create

feature -- Definitions

	Default_id: STRING = "openehr-ehr-COMPOSITION.any.v1"

feature -- Access


feature {NONE} -- Implementation

	id_pattern_regex: LX_DFA_REGULAR_EXPRESSION
			-- Pattern matcher for archetype ids.
		once
			-- currently same as Archetype id regex, but probably needs
			-- a) front section for reverse domain name of authority
			-- b) remove the '-' sections from the middle part, since specialisation not supported in templates
			create Result.compile_case_insensitive ("^[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+){2}\.[a-zA-Z][a-zA-Z0-9_]+(-[a-zA-Z][a-zA-Z0-9_]+)*\.v[1-9][0-9]*$")
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
--| The Original Code is archetype_id.e.
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
