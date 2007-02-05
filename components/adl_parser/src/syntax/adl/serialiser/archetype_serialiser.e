indexing
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

deferred class ARCHETYPE_SERIALISER

inherit
	ANY_SERIALISER
		rename
			initialise as initialise_any_serialiser
		end

	SHARED_ARCHETYPE_CONTEXT
		export
			{NONE} all
		end
		
feature -- Initialisation

	initialise(an_ontology: ARCHETYPE_ONTOLOGY) is
			-- set ontology required for serialising cADL, and perform basic initialisation
		require
			Ontology_valid: an_ontology /= Void
		do
			initialise_any_serialiser
			ontology := an_ontology
		end
		
feature -- Serialisation

	serialise (a_target: ARCHETYPE; lang_serialised, desc_serialised, def_serialised, inv_serialised, ont_serialised: STRING) is
		require
			a_target /= Void
			lang_serialised /= Void
			desc_serialised /= Void
			def_serialised /= Void
			ont_serialised /= Void
		deferred
		end

	serialise_initialise is
		deferred
		end

	serialise_archetype_id is
		deferred
		end

	serialise_archetype_concept is
		deferred
		end

	serialise_archetype_specialise is
		deferred
		end

	serialise_finalise is
		deferred
		end

feature {NONE} -- Access

	target: ARCHETYPE

	ontology: ARCHETYPE_ONTOLOGY

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
