note
	component:   "openEHR Archetype Project"
	description: "Serialiser Manager for all ADL serialiser types"
	keywords:    "test, CADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_SERIALISER_MGR

inherit
	SHARED_ARCHETYPE_SERIALISERS

create
	make

feature -- Initialisation

	make (an_archetype: attached ARCHETYPE; format: attached STRING)
			-- create a new manager targetted to the ADL archetype 'a_target'
		require
			Format_valid: has_archetype_serialiser_format (format)
		do
			target := an_archetype
			serialiser := archetype_serialiser_for_format (format)
			serialiser.reset
		end

feature -- Command

	serialise (lang_serialised, desc_serialised, def_serialised: attached STRING; inv_serialised: STRING; ont_serialised: attached STRING; ann_serialised, comp_onts_serialised: STRING)
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			serialiser.serialise_from_parts (target, lang_serialised, desc_serialised, def_serialised, inv_serialised, ont_serialised, ann_serialised, comp_onts_serialised)
		end

feature -- Access

	target: ARCHETYPE

	last_result: attached STRING
		do
			Result := serialiser.last_result
		end

feature {NONE} -- Implementation

	serialiser: ARCHETYPE_MULTIPART_SERIALISER

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
--| The Original Code is adl_serialiser_mgr.e.
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
