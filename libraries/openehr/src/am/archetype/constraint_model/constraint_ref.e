note
	component:   "openEHR Archetype Project"
	description: "[
			 Object node type representing a reference to a constraint
			 defined in the ontology section of the archetype.
			 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class CONSTRAINT_REF

inherit
	C_REFERENCE_OBJECT
		redefine
			enter_subtree, exit_subtree
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_code: STRING)
			-- make from pattern of form "[acNNNN[.NN[etc]]]"
		do
			rm_type_name := Any_type
			target := a_code
			create representation_cache.make_anonymous
			representation_cache.set_content (Current)
		ensure
			Target_set: target = a_code
		end

feature -- Access

	target: STRING
			-- reference to another constraint object containing the logical
			-- constraints for this object, defined outside the archetype,
			-- usually in the ontology section of an ADL archetype
			-- [called 'reference' in AOM, but that is a keyword in Eiffel]

	external_reference: detachable DV_PARSABLE
			-- direct reference to external resource in the form of a String, typically a URI;
			-- the `formalism' attribute can be used to record the exact syntax model of the
			-- parsable value, enabling it to be processed within archetype tools

feature -- Status Report

	is_resolved: BOOLEAN
			-- True if `external_reference' is assigned
		do
			Result := attached external_reference
		ensure
			Result = attached external_reference
		end

feature -- Comparison

	is_subset_of (other: like Current): BOOLEAN
			-- True if this node is a subset, i.e. a redefinition of, `other'
			-- Returns False if they are the same, or if they do not correspond
		do
				-- FIXME - tobe implemented
		end

feature -- Conversion

	as_string: STRING
			--
		do
			create Result.make_empty
			Result.append ("[" + target + "]")
		end

feature -- Modification

	set_external_reference_from_string (an_ext_ref, a_syntax: STRING)
			-- set `external_reference' from two parameters - the actual reference (e.g. a URI string)
			-- and a syntax model, used to help interpret the reference structure
		require
			Ref_valid: not an_ext_ref.is_empty
			Syntax_valid: not a_syntax.is_empty
		do
			create external_reference.make (an_ext_ref, a_syntax)
		end

	set_external_reference (an_ext_ref: DV_PARSABLE)
		do
			external_reference := an_ext_ref
		end

	set_rm_type_name (a_type_name: STRING)
			-- set `rm_type_name'
		do
			rm_type_name := a_type_name
		end

feature -- Visitor

	enter_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			precursor (visitor, depth)
			visitor.start_constraint_ref (Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			precursor (visitor, depth)
			visitor.end_constraint_ref (Current, depth)
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
--| The Original Code is cadl_object_term.e.
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
