indexing
	component:   "openEHR Archetype Project"
	description: "[
			 Storage on Eiffel side for objects created by factory and other routines.
			 An integer handle is created for each new object.
			 ]"
	keywords:    "C wrapper"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_ADL_OBJECTS

create
	make
	
feature -- Initialisation

	make is
		do
			-- C_OBJECTs
			create c_objects.make(0) -- used for routines which are defined on C_OBJECT
			create archetype_internal_refs.make(0)
			create archetype_slots.make(0)
			create c_complex_objects.make(0)
			create c_attributes.make(0)
			create constraint_refs.make(0)
			create c_code_phrases.make(0)
			create c_ordinals.make(0)
			create c_quantities.make(0)
			create c_primitive_objects.make(0)

			-- ASSERTIONs
			create assertions.make(0)
			create expr_items.make(0)

			-- C_PRIMITIVEs
			create c_primitives.make(0)
			
			-- misc
			create integer_intervals.make(0)
			create real_intervals.make(0)
			create cardinalities.make(0)
		end

feature -- Access

	new_handle: INTEGER is
		do
			last_handle := last_handle + 1
			Result := last_handle
		end

	set_archetype_definition_handle(a_handle: INTEGER) is
			-- record handle of archetype.definition in c_complex_objects hash
		do
			archetype_definition_handle := a_handle
		end

feature {SHARED_ADL_OBJECTS} -- Handles

	archetype_definition_handle: INTEGER
			-- C interface handle of archetype.definition

	c_objects: HASH_TABLE[C_OBJECT, INTEGER]
	
	archetype_internal_refs: HASH_TABLE[ARCHETYPE_INTERNAL_REF, INTEGER]

	archetype_slots: HASH_TABLE[ARCHETYPE_SLOT, INTEGER]

	c_complex_objects: HASH_TABLE[C_COMPLEX_OBJECT, INTEGER]

	c_attributes: HASH_TABLE[C_ATTRIBUTE, INTEGER]

	constraint_refs: HASH_TABLE[CONSTRAINT_REF, INTEGER]

	assertions: HASH_TABLE[ASSERTION, INTEGER]

	expr_items: HASH_TABLE[EXPR_ITEM, INTEGER]

	cardinalities: HASH_TABLE[CARDINALITY, INTEGER]

	c_code_phrases: HASH_TABLE[C_CODE_PHRASE, INTEGER]

	c_ordinals: HASH_TABLE[C_ORDINAL, INTEGER]

	c_quantities: HASH_TABLE[C_QUANTITY, INTEGER]

	c_primitives: HASH_TABLE[C_PRIMITIVE, INTEGER]

	c_primitive_objects: HASH_TABLE[C_PRIMITIVE_OBJECT, INTEGER]

	real_intervals: HASH_TABLE[OE_INTERVAL[REAL], INTEGER]

	integer_intervals: HASH_TABLE[OE_INTERVAL[INTEGER], INTEGER]

	last_handle: INTEGER

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
--| The Original Code is adl_interface.e.
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
