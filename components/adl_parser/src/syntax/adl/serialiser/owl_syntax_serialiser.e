indexing
	component:   "openEHR Archetype Project"
	description: "parent of all ADL serialisers"
	keywords:    "ADL, serialiser"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ADL_OWL_SERIALISER

inherit
	ARCHETYPE_SERIALISER

creation
	make

feature -- Serialisation

	serialise (a_target: ARCHETYPE; desc_serialised, def_serialised, inv_serialised, ont_serialised: STRING) is
		do
			target := a_target
			
			initialise
			serialise_initialise
			serialise_archetype_id
			serialise_archetype_specialise
			serialise_archetype_concept
			
			if not desc_serialised.is_empty then
				last_result.append(desc_serialised)				
			end
			
			if not def_serialised.is_empty then
				last_result.append(def_serialised)
			end
			
			if inv_serialised /= Void then
				last_result.append(inv_serialised)
			end
			
			if not ont_serialised.is_empty then
				last_result.append(ont_serialised)
			end
			
			serialise_finalise
		end

	serialise_initialise is
		do
			last_result.append("Namespace(rdf = http://www.w3.org/1999/02/22-rdf-syntax-ns#)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(xsd = http://www.w3.org/2001/XMLSchema:)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(rdfs = http://www.w3.org/2000/01/rdf-schema:)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(rdfs = http://www.w3.org/2002/07/owl#)")
			last_result.append(format_item(FMT_NEWLINE))
			
			last_result.append("Namespace(ba = http://www.openEHR.org/base_archetype#)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Namespace(rm = http://www.openEHR.org/rm/release0.9#)")
			last_result.append(format_item(FMT_NEWLINE))
		end

	serialise_archetype_id is
		do
			last_result.append("Namespace(this = http://archetypes.org/" + target.archetype_id.as_string + "#)")
			last_result.append(format_item(FMT_NEWLINE))
			last_result.append("Ontology (")
			last_result.append(format_item(FMT_NEWLINE))
		end

	serialise_archetype_concept is
		do
		end

	serialise_archetype_specialise is
		do
		end

	serialise_finalise is
		do
			last_result.append(")")
			last_result.append(format_item(FMT_NEWLINE))
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
