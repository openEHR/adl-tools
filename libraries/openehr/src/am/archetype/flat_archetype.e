note
	component:   "openEHR Archetype Project"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FLAT_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			ontology
		end

create
	make, make_all, make_from_other

create {ARCHETYPE_FLATTENER}
	make_specialised, make_non_specialised

feature {ARCHETYPE_FLATTENER} -- Initialisation

	make_non_specialised (a_diff: DIFFERENTIAL_ARCHETYPE)
			-- initialise from a differential archetype
		do
			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin,
					a_diff.description.deep_twin,
					a_diff.definition.deep_twin, a_diff.ontology.to_flat)
			if a_diff.has_translations then
				translations := a_diff.translations.deep_twin
			end
			if a_diff.has_invariants then
				invariants := a_diff.invariants.deep_twin
			end
			if a_diff.has_annotations then
				annotations := a_diff.annotations.deep_twin
			end
			rebuild
			is_valid := True
			is_generated := True
		ensure
			is_valid: is_valid
			is_generated: is_generated
		end

	make_specialised (a_diff: DIFFERENTIAL_ARCHETYPE; a_flat_parent: FLAT_ARCHETYPE)
			-- initialise from a differential archetype and its flat parent, as preparation
			-- for generating a flat archetype. The items from the differential are used
			-- except for the definition, invariants and annotations, which are the flat
			-- parent versions, so that the differential definition can be overlaid on
			-- it by a merging process. The ontology is converted to a form ready for
			-- overlaying as well.
		do
			make (a_diff.artefact_type.deep_twin, a_diff.archetype_id.deep_twin,
					a_diff.original_language.deep_twin,
					a_diff.description.deep_twin,
					a_flat_parent.definition.deep_twin,
					a_diff.ontology.to_flat)
			if a_diff.has_translations then
				translations := a_diff.translations.deep_twin
			end
			if a_flat_parent.has_invariants then
				invariants := a_flat_parent.invariants.deep_twin
			end
			if a_flat_parent.has_annotations then
				annotations := a_flat_parent.annotations.deep_twin
			end
			rebuild
			is_valid := True
			is_generated := True
		ensure
			is_valid: is_valid
			is_generated: is_generated
		end

feature -- Access

	ontology: attached FLAT_ARCHETYPE_ONTOLOGY

feature -- Factory

	to_legacy_differential: DIFFERENTIAL_ARCHETYPE
			-- generate differential form of archetype from a legacy flat
		require
			not is_generated
		do
			create Result.make_from_legacy_flat (Current)
		end

	to_differential: DIFFERENTIAL_ARCHETYPE
			-- generate differential form of archetype if specialised, to be in differential form,
			-- based on inspecting each node's `specialisation_level'
		require
			is_generated
		local
			def_it: C_ITERATOR
		do
			-- deal with main archetype

			-- description

			-- definition
			create diff_nodes.make (0)
			create def_it.make (definition)
			def_it.do_all (agent node_diff_enter, agent node_diff_exit)
			def_it.do_at_surface (agent node_diff_enter,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
					do
						Result := not (a_c_node.specialisation_status = ss_added or a_c_node.specialisation_status = ss_redefined)
					end
			)

			-- rules section

			-- ontology

			-- annotations

		end

	node_diff_enter (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			ss: INTEGER
			new_ca: C_ATTRIBUTE
			a_path: OG_PATH
		do
			ss := a_c_node.specialisation_status
			if attached {C_OBJECT} a_c_node as co then
				if ss = {SPECIALISATION_STATUSES}.ss_added then
					create a_path.make_from_string (co.parent.path)
					if a_path.count = 1 then
						new_ca := co.parent.twin
						-- clone the parent C_ATTRIBUTE
					end
				elseif ss = {SPECIALISATION_STATUSES}.ss_redefined then

				end

			elseif attached {C_ATTRIBUTE} a_c_node as ca then

				-- added tree of constraints, startinng with a C_ATTRIBUTE that was not in the parent flat
				if ss = {SPECIALISATION_STATUSES}.ss_added then
					new_ca := ca.safe_deep_twin
					diff_nodes.put (new_ca, ca.path)

				-- C_ATTRIBUTE local redefinition of cardinality (+/- changes beneath)
				elseif ss = {SPECIALISATION_STATUSES}.ss_redefined then
					-- clone this C_ATTRIBUTE and its cardinality and store it
				end
			end
		end

	diff_nodes: HASH_TABLE [C_ATTRIBUTE, STRING]
			-- table of C_ATTRIBUTEs keyed by path, each is one of:
			--	* redefined - changed cardinality is only possible change
			-- 	* added new, with child C_OBJECTs
			--	* compressed path C_ATTRIBUTEs, containing added/redefined C_OBJECTs

	debug_node_diff_enter (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			s: STRING
			ss: INTEGER
		do
			create s.make_filled ('-', depth*4)
			s.append ("> ")

			ss := a_c_node.specialisation_status
			if attached {C_OBJECT} a_c_node as co then
				s.append (co.rm_type_name)
				if co.is_addressable then
					s.append ("[" + co.node_id + "|" + ontology.term_definition (original_language.code_string, co.node_id).text + "]")
				end
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				s.append (ca.rm_attribute_name)
			end

			s.append_character (' ')
			s.append (specialisation_status_symbols.item (ss))

			s.append_character ('%N')
			io.put_string (s)
		end

	node_diff_exit (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
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
--| The Original Code is adl_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
