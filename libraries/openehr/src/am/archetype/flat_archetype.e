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
			Valid: is_valid
			Generated: is_generated
			Top_level: not is_specialised
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
			Valid: is_valid
			Generated: is_generated
			Specialised: is_specialised
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
			-- ======= deal with main archetype =======

			-- ======= description =======

			-- ======= definition =========
			create diff_added_obj_nodes.make (0)
			create diff_added_attr_nodes.make (0)
			create diff_redefined_obj_nodes.make (0)
			create diff_redefined_attr_nodes.make (0)
			create diff_redefined_id_nodes.make (0)
			create def_it.make (definition)

			-- extract the added nodes first
			def_it.do_at_surface (agent node_diff_extract_additions,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := a_c_node.specialisation_status = ss_added end
			)

			-- now find redefined nodes
			def_it.do_until_surface (agent node_diff_extract_redefinitions,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN do Result := a_c_node.specialisation_status /= ss_added end
			)

			-- ======= rules section =======

			-- ======= ontology =======

			-- ======= annotations =======

		end

	node_diff_extract_additions (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- record all added nodes & paths (including sibling order markers, which remain in the
			-- in-memory flat)
		local
			node_path: STRING
		do
			node_path := a_c_node.path
			if attached {C_OBJECT} a_c_node as co then
				if not diff_added_obj_nodes.has (node_path) then
					diff_added_obj_nodes.put (create {ARRAYED_LIST [C_OBJECT]}.make (0), node_path)
				end
				diff_added_obj_nodes.item (node_path).extend (co)
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				if not diff_added_attr_nodes.has (node_path) then
					diff_added_attr_nodes.put (create {ARRAYED_LIST [C_ATTRIBUTE]}.make (0), node_path)
				end
				diff_added_attr_nodes.item (node_path).extend (ca)
			end
		end

	node_diff_extract_redefinitions (a_c_node: attached ARCHETYPE_CONSTRAINT; depth: INTEGER)
		local
			ss: INTEGER
		do
			ss := a_c_node.specialisation_status
			if attached {C_OBJECT} a_c_node as co then
				-- solely node_id was redefined
				if ss = {SPECIALISATION_STATUSES}.ss_id_redefined then
					diff_redefined_id_nodes.put (co.node_id, co.path)

				-- occurrences and/or rm_type (C_COMPLEX_OBJECT case), and/or other redefinitions for
				-- other C_OBJECT subtypes - just remember the node
				elseif ss = {SPECIALISATION_STATUSES}.ss_redefined then
					diff_redefined_obj_nodes.put (co, co.path)
				end

			-- must be redefined cardinality and/or existence
			elseif attached {C_ATTRIBUTE} a_c_node as ca then
				diff_redefined_attr_nodes.put (ca, ca.path)
			end
		end

	diff_added_obj_nodes: HASH_TABLE [ARRAYED_LIST [C_OBJECT], STRING]

	diff_added_attr_nodes: HASH_TABLE [ARRAYED_LIST [C_ATTRIBUTE], STRING]

	diff_redefined_obj_nodes: HASH_TABLE [C_OBJECT, STRING]

	diff_redefined_attr_nodes: HASH_TABLE [C_ATTRIBUTE, STRING]

	diff_redefined_id_nodes: HASH_TABLE [STRING, STRING]
			-- table of redefined node_id keyed by path; these correspond to C_OBJECT nodes whose
			-- only redefinition was in the id, and which appeared in the orginal differential in
			-- compressed paths

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
