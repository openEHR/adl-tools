indexing
	component:   "openEHR Archetype Project"
	description: "Generic visitor class for C_xxx class objects"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class C_VISITOR

inherit
	C_COMMON
		export
			{NONE} all
		end

feature -- Initialisation

	initialise(an_ontology: ARCHETYPE_ONTOLOGY) is
			-- set ontology required for interpreting meaning of object nodes
		require
			Ontology_valid: an_ontology /= Void
		do
			ontology := an_ontology
		end

feature -- Visitor

	start_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- enter an C_COMPLEX_OBJECT
		do
		end

	end_c_complex_object(a_node: C_COMPLEX_OBJECT; depth: INTEGER) is
			-- exit an C_COMPLEX_OBJECT
		do
		end

	start_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- enter an ARCHETYPE_SLOT
		do
		end

	end_archetype_slot(a_node: ARCHETYPE_SLOT; depth: INTEGER) is
			-- exit an ARCHETYPE_SLOT
		do
		end

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- enter a C_ATTRIBUTE
		do
		end

	end_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- exit a C_ATTRIBUTE
		do
		end

	start_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER) is
			-- enter a C_LEAF_OBJECT
		do
		end

	end_c_leaf_object(a_node: C_LEAF_OBJECT; depth: INTEGER) is
			-- exit a C_LEAF_OBJECT
		do
		end

	start_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER) is
			-- enter a C_REFERENCE_OBJECT
		do
		end

	end_c_reference_object(a_node: C_REFERENCE_OBJECT; depth: INTEGER) is
			-- exit a C_REFERENCE_OBJECT
		do
		end

	start_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- enter an ARCHETYPE_INTERNAL_REF
		do
		end

	end_archetype_internal_ref(a_node: ARCHETYPE_INTERNAL_REF; depth: INTEGER) is
			-- exit an ARCHETYPE_INTERNAL_REF
		do
		end

	start_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- enter a CONSTRAINT_REF
		do
		end

	end_constraint_ref(a_node: CONSTRAINT_REF; depth: INTEGER) is
			-- exit a CONSTRAINT_REF
		do
		end

	start_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- enter an C_PRIMITIVE_OBJECT
		do
		end

	end_c_primitive_object(a_node: C_PRIMITIVE_OBJECT; depth: INTEGER) is
			-- exit an C_PRIMITIVE_OBJECT
		do
		end

	start_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- enter an C_DOMAIN_TYPE
		do
		end

	end_c_domain_type(a_node: C_DOMAIN_TYPE; depth: INTEGER) is
			-- exit an C_DOMAIN_TYPE
		do
		end

	start_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- enter an C_CODE_PHRASE
		do
		end

	end_c_code_phrase(a_node: C_CODE_PHRASE; depth: INTEGER) is
			-- exit an C_CODE_PHRASE
		do
		end

	start_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- enter an C_DV_ORDINAL
		do
		end

	end_c_ordinal(a_node: C_DV_ORDINAL; depth: INTEGER) is
			-- exit an C_DV_ORDINAL
		do
		end

	start_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER) is
			-- enter a C_DV_QUANTITY
		do
		end

	end_c_quantity(a_node: C_DV_QUANTITY; depth: INTEGER) is
			-- exit a C_DV_QUANTITY
		do
		end

feature -- Finalisation

	finalise is
			-- finalise after all nodes visited
		do
			-- assume nothing; override in descendants
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
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
