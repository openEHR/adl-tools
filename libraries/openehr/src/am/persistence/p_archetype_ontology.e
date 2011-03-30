note
	component:   "openEHR Archetype Project"
	description: "Persistent form of ARCHETYPE_ONTOLOGY class"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_ARCHETYPE_ONTOLOGY

create
	make

feature -- Initialisation

	make (an_ontology: attached ARCHETYPE_ONTOLOGY)
		local
			tb_ont: HASH_TABLE[CODE_PHRASE, STRING]
			cb_ont: HASH_TABLE[URI, STRING]
			tb_p_ont: HASH_TABLE [STRING, STRING]
			cb_p_ont: HASH_TABLE [STRING, STRING]
		do
			terminologies_available := an_ontology.terminologies_available
			term_definitions := an_ontology.term_definitions
			constraint_definitions := an_ontology.constraint_definitions

			if attached an_ontology.term_bindings then
				create term_bindings.make (0)
				from an_ontology.term_bindings.start until an_ontology.term_bindings.off loop
					tb_ont := an_ontology.term_bindings.item_for_iteration
					create tb_p_ont.make (0)
					term_bindings.put (tb_p_ont, an_ontology.term_bindings.key_for_iteration)
					from tb_ont.start until tb_ont.off loop
						tb_p_ont.put (tb_ont.item_for_iteration.as_string, tb_ont.key_for_iteration)
						tb_ont.forth
					end
					an_ontology.term_bindings.forth
				end
			end

			if attached an_ontology.constraint_bindings then
				create constraint_bindings.make (0)
				from an_ontology.constraint_bindings.start until an_ontology.constraint_bindings.off loop
					cb_ont := an_ontology.constraint_bindings.item_for_iteration
					create cb_p_ont.make (0)
					constraint_bindings.put (cb_p_ont, an_ontology.constraint_bindings.key_for_iteration)
					from cb_ont.start until cb_ont.off loop
						cb_p_ont.put (cb_ont.item_for_iteration.as_string, cb_ont.key_for_iteration)
						cb_ont.forth
					end
					an_ontology.constraint_bindings.forth
				end
			end

			terminology_extracts := an_ontology.terminology_extracts
		end

feature -- Access

	terminologies_available: attached ARRAYED_LIST [STRING]

	term_definitions: attached HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language

	constraint_definitions: attached HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language

	term_bindings: attached HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- tables of bindings of external terms to internal codes, keyed by external terminology id

	constraint_bindings: attached HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology

	terminology_extracts: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies


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
--| The Original Code is p_archetype_ontology.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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
