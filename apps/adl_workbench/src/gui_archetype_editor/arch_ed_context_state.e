note
	component:   "openEHR Archetype Project"
	description: "Shared state information for all nodes of editor tree"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

class ARCH_ED_CONTEXT_STATE

create
	make, make_editable

feature -- Initialisation

	make (aca: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA; differential_view_flag: BOOLEAN)
		do
			source := aca
			in_differential_view := differential_view_flag
			rm_schema := an_rm_schema
			if differential_view_flag then
				archetype := source.differential_archetype
			else
				archetype := source.flat_archetype
			end
			flat_ontology := source.flat_archetype.ontology
		end

	make_editable (aca: ARCH_CAT_ARCHETYPE; an_rm_schema: BMM_SCHEMA; an_undo_redo_chain: UNDO_REDO_CHAIN)
		do
			source := aca
			in_differential_view := False
			rm_schema := an_rm_schema
			archetype := source.flat_archetype_clone
			flat_ontology := source.flat_archetype_clone.ontology
			undo_redo_chain := an_undo_redo_chain
		end

feature -- Access

	source: ARCH_CAT_ARCHETYPE

	archetype: ARCHETYPE

	in_differential_view: BOOLEAN

	flat_ontology: FLAT_ARCHETYPE_ONTOLOGY

	undo_redo_chain: detachable UNDO_REDO_CHAIN

	rm_schema: BMM_SCHEMA

feature -- Status Report

	editing_enabled: BOOLEAN
		do
			Result := attached undo_redo_chain
		end

feature -- Modification

	set_flat_ontology (a_flat_ontology: FLAT_ARCHETYPE_ONTOLOGY)
		do
			flat_ontology := a_flat_ontology
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
--| The Original Code is c_object_ed_context_builder.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
