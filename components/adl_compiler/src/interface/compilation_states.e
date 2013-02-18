note
	component:   "openEHR Archetype Project"
	description: "Types of compilation state of a single compilable artefact."
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class COMPILATION_STATES

feature -- Definitions

	Cs_unread: INTEGER = 0
	Cs_lineage_known: INTEGER = 10
	Cs_ready_to_parse: INTEGER = 20
	cs_ready_to_parse_legacy: INTEGER = 21
	Cs_parsed: INTEGER = 22
	Cs_suppliers_known: INTEGER = 30
	Cs_ready_to_validate: INTEGER = 40
	Cs_validated_phase_1: INTEGER = 51
	Cs_validated_phase_2: INTEGER = 52
	Cs_validated: INTEGER = 53
	Cs_invalid: INTEGER = -1
	Cs_rm_class_unknown: INTEGER = -2
	cs_lineage_invalid: INTEGER = -10
	Cs_parse_failed: INTEGER = -20
	Cs_convert_legacy_failed: INTEGER = -21
	cs_suppliers_invalid: INTEGER = -30
	Cs_validate_failed: INTEGER = -40

feature -- Access

	Cs_names: HASH_TABLE [STRING, INTEGER]
			-- version of name suitable for screen display
		once
			create Result.make(0)
			Result.put("Unread", Cs_unread)
			Result.put("Lineage known", Cs_lineage_known)
			Result.put("Ready to parse (legacy .adl archetype)", cs_ready_to_parse_legacy)
			Result.put("Ready to parse", Cs_ready_to_parse)
			Result.put("Suppliers known", Cs_suppliers_known)
			Result.put("Ready to validate", Cs_ready_to_validate)
			Result.put("Validated phase 1", Cs_validated_phase_1)
			Result.put("Validated phase 2", Cs_validated_phase_2)
			Result.put("Validated", Cs_validated)
			Result.put("Invalid", Cs_invalid)
			Result.put("RM class unknown", Cs_rm_class_unknown)
			Result.put("Lineage invalid", Cs_lineage_invalid)
			Result.put("Parse failed", Cs_parse_failed)
			Result.put("Convert legacy .adl failed", Cs_convert_legacy_failed)
			Result.put("Suppliers invalid", cs_suppliers_invalid)
			Result.put("Validate failed", Cs_validate_failed)
		end

	Cs_terminal_states: ARRAYED_LIST [INTEGER]
			-- terminal states from which nothing can be done in current compilation run
			-- (external events e.g. editing the source file can revert the target to another state)
		once
			create Result.make(0)
			Result.extend(Cs_invalid)
			Result.extend(Cs_rm_class_unknown)
			Result.extend(Cs_lineage_invalid)
			Result.extend(Cs_parse_failed)
			Result.extend(Cs_convert_legacy_failed)
			Result.extend(cs_suppliers_invalid)
			Result.extend(Cs_validate_failed)
			Result.extend(Cs_validated)
		end

	Cs_initial_states: ARRAYED_LIST [INTEGER]
			-- states in which an archetype descriptor can be post-creation or editing
		once
			create Result.make(0)
			Result.extend(Cs_lineage_known)
			Result.extend(Cs_rm_class_unknown)
			Result.extend(Cs_ready_to_parse)
			Result.extend(Cs_ready_to_parse_legacy)
			Result.extend(Cs_validated) -- possible due to new in-memory creation
		end

feature -- Status Report

	valid_compilation_state (i: INTEGER): BOOLEAN
			-- True if i is a valid error type
		do
			Result := Cs_names.has(i)
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
--| The Original Code is compilation_states.e
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
