note
	component:   "openEHR Archetype Project"
	description: "Tests for intervals of comparable types"
	keywords:    "archetype, ontology, terminology"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"
	testing:     "type/manual"

class
	TEST_INTERVAL

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_equal_interval
			-- Two intervals are equal if their bounds are the same, regardless of whether they are of the same type.
		note
			testing:  "covers/{INTERVAL}.equal_interval"
		local
			target: INTERVAL [INTEGER]
		do
			create target.make_upper_unbounded (1, True)
			assert_equal (True, target.equal_interval (target))
			assert_equal (True, target.equal_interval (target.twin))
			assert_equal (True, target.equal_interval (create {INTERVAL [INTEGER]}.make_upper_unbounded (1, True)))
			assert_equal (True, target.equal_interval (create {MULTIPLICITY_INTERVAL}.make_from_interval (target)))
		end

	test_contains
			-- Two intervals are equal if their bounds are the same, regardless of whether they are of the same type.
		note
			testing:  "covers/{INTERVAL}.contains"
		local
			outer, inner: INTERVAL [INTEGER]
		do
			-- 1..* does not contain 1..*
			create outer.make_upper_unbounded (1, True)
			create inner.make_upper_unbounded (1, True)
			assert_equal (False, outer.contains (inner))

			-- 1..* does not contain 0..*
			create outer.make_upper_unbounded (1, True)
			create inner.make_upper_unbounded (0, True)
			assert_equal (False, outer.contains (inner))

			-- 1..* contains 1..5
			create inner.make_bounded_included (1, 5)
			assert_equal (True, outer.contains (inner))

			-- 1..* does not contain 0..5
			create inner.make_bounded_included (0, 5)
			assert_equal (False, outer.contains (inner))

			-- 1..* contains 1..1
			create inner.make_point (1)
			assert_equal (True, outer.contains (inner))

			-- 0..* contains 1..*
			create outer.make_upper_unbounded (0, True)
			create inner.make_upper_unbounded (1, True)
			assert_equal (True, outer.contains (inner))

			-- 0..* contains 0..1
			create inner.make_bounded_included (0, 1)
			assert_equal (True, outer.contains (inner))

			-- 0..* contains 1..1
			create inner.make_point (1)
			assert_equal (True, outer.contains (inner))

			-- 0..* does not contain 0..*
			create inner.make_upper_unbounded (0, True)
			assert_equal (False, outer.contains (inner))

			-- 0..1 contains 1..1
			create outer.make_bounded_included (0, 1)
			create inner.make_point (1)
			assert_equal (True, outer.contains (inner))

			-- 0..1 does not contain 0..1
			create outer.make_bounded_included (0, 1)
			create inner.make_bounded_included (0, 1)
			assert_equal (False, outer.contains (inner))

			-- 1..1 does not contain 0..1
			create outer.make_point (1)
			create inner.make_bounded_included (0, 1)
			assert_equal (False, outer.contains (inner))

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
--| The Original Code is test_interval.e.
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
