indexing
	component:   "openEHR Archetype Project"
	description: "Serialiser Manager for all ADL serialiser types"
	keywords:    "test, CADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
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

	make(a_target: ARCHETYPE; format: STRING; an_ontology: ARCHETYPE_ONTOLOGY) is 
			-- create a new manager targetted to the ADL archetype 'a_target'
		require
			Target_exists: a_target /= Void
			Format_valid: format /= Void and then has_archetype_serialiser_format(format)
			Ontology_valid: an_ontology /= Void
		do
			target := a_target
			serialiser := archetype_serialiser_for_format(format)
			serialiser.initialise(an_ontology)
		end

feature -- Command

	serialise(desc_serialised, def_serialised, inv_serialised, ont_serialised: STRING) is
			-- start the serialisation process; the result will be in `serialiser_output'
		require
			desc_serialised /= Void
			def_serialised /= Void
			ont_serialised /= Void
		do
			serialiser.serialise(target, desc_serialised, def_serialised, inv_serialised, ont_serialised)
		end

feature -- Access

	target: ARCHETYPE
	
	last_result: STRING is 
		do
			Result := serialiser.last_result
		end

feature {NONE} -- Implementation
	
	serialiser: ARCHETYPE_SERIALISER

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
