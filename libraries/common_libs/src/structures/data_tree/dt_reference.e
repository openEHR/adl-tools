note
	component:   "openEHR Archetype Project"
	description: "Abstract characteristics of a node that contains a reference to another node, implemented by paths. Serialises an object non-containment reference."
	keywords:    "data tree, serialisation, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class DT_REFERENCE

inherit
	ANY
		undefine
			is_equal
		end

feature -- Definitions

	Reference_pseudo_type: STRING = "(reference)"

feature -- Output

	as_string: STRING
		deferred
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	source_object_ref: detachable ANY
			-- reference to the object whose `source_object_field_index' field should be
			-- connected to the object referred to by the reference in this DT object

	source_object_field_index: INTEGER
			-- index of field in `source_object_ref'; to be used in a call to
			-- INTERNAL.set_reference_field(source_object_field_index, source_object_ref, the_target_object)

	is_source_object_container: BOOLEAN
			-- True if the source object is a container

	hash_key: detachable HASHABLE
			-- key for hash insertion if is_source_object_container set and the container is a hash_table

	set_source_object_details (an_object_ref: ANY; a_field_index: INTEGER)
			-- set the source_object values for a non-container source object into with the reference has to
			-- pasted at the i-th field
		do
			source_object_ref := an_object_ref
			source_object_field_index := a_field_index
		end

	set_hash_table_source_object_details (an_object_ref: ANY; a_hash_key: HASHABLE)
			-- set the source_object values for a container object, for which the reference has
			-- to be added to the container via a call to extend, after a check on whether it is a
			-- SEQUENCE or HASH_TABLE
		do
			source_object_ref := an_object_ref
			is_source_object_container := True
			hash_key := a_hash_key
		end

	set_sequence_source_object_details (an_object_ref: ANY)
			-- set the source_object values for a SEQUENCE object, for which the reference has
			-- to be added to the container via a call to extend, after a check on whether it is a
			-- SEQUENCE or HASH_TABLE
			-- FIXME: it should ideally record position, and do inserts, but this is tricky to compute, and
			-- doesn't work for HASH_TABLE anyway, so we assume extend semantics for now
		do
			source_object_ref := an_object_ref
			is_source_object_container := True
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
--| The Original Code is dt_reference.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2009
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
