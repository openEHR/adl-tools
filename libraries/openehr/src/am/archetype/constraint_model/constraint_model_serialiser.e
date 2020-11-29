indexing
	component:   "openEHR Archetype Project"
	description: "Serialise archetype definition to any format"
	keywords:    "test, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class CONSTRAINT_MODEL_SERIALISER

inherit
	ANY_SERIALISER
		rename
			initialise as initialise_any_serialiser
		end

	CONSTRAINT_MODEL_COMMON
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

feature -- Modification

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- start serialising an C_COMPLEX_OBJECT
		deferred
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- end serialising an C_COMPLEX_OBJECT
		deferred
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- start serialising an ARCHETYPE_SLOT
		deferred
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- end serialising an ARCHETYPE_SLOT
		deferred
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- start serialising an C_ATTRIBUTE
		deferred
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- end serialising an C_ATTRIBUTE
		deferred
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- start serialising an ARCHETYPE_INTERNAL_REF
		deferred
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- end serialising an ARCHETYPE_INTERNAL_REF
		deferred
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- start serialising a CONSTRAINT_REF
		deferred
		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- end serialising a CONSTRAINT_REF
		deferred
		end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- start serialising an C_PRIMITIVE_OBJECT
		deferred
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- end serialising an C_PRIMITIVE_OBJECT
		deferred
		end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- start serialising an C_DOMAIN_TYPE
		deferred
		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- end serialising an C_DOMAIN_TYPE
		deferred
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- start serialising an C_CODE_PHRASE
		deferred
		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- end serialising an C_CODE_PHRASE
		deferred
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- start serialising an C_DV_ORDINAL
		deferred
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- end serialising an C_DV_ORDINAL
		deferred
		end

	start_c_scale(a_node: C_DV_SCALE; depth: INTEGER) is
			-- start serialising an C_DV_SCALE
		deferred
		end

	end_c_scale(a_node: C_DV_SCALE; depth: INTEGER) is
			-- end serialising an C_DV_SCALE
		deferred
		end

	serialise_occurrences(a_node: C_OBJECT; depth: INTEGER) is
			-- any positive range
		deferred
		end

	serialise_existence(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- can only  be a range of 0..1 or 1..1
		deferred
		end

	serialise_cardinality(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- includes a range and possibly ordered, unique qualifiers
		deferred
		end

feature {NONE} -- Implementation

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
--| The Original Code is cadl_serialiser.e.
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
