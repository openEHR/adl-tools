note
	component:   "openEHR Archetype Project"
	description: "Tests for ARCHETYPE_PATH_ANALYSER class"
	keywords:    "archetype, paths"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"
	testing:     "type/manual"

class
	TEST_ARCHETYPE_PATH_ANALYSER

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_path_at_level
			-- path at level should return a valid path for a given specialisation level, as long as the path is deep enough
		note
			testing:  "covers/{ARCHETYPE_PATH_ANALYSER}.path_at_level"
		local
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
		do
			create apa.make_from_string("/items")
			a_path := apa.path_at_level(0)
			assert_equal ("/items", a_path)

			create apa.make_from_string("/items[at0001]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0001]", a_path)

			create apa.make_from_string("/items[at0002.1]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0002]", a_path)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0002.1]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0002.1]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0002.1]", a_path)

			create apa.make_from_string("/items[at0003.0.1]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0003]", a_path)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0003]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0003.0.1]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0003.0.1]", a_path)
			a_path := apa.path_at_level(4)
			assert_equal ("/items[at0003.0.1]", a_path)

			create apa.make_from_string("/items[at0004.0.0.1]")
			a_path := apa.path_at_level(0)
			assert_equal ("/items[at0004]", a_path)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0004]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0004]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0004.0.0.1]", a_path)
			a_path := apa.path_at_level(4)
			assert_equal ("/items[at0004.0.0.1]", a_path)
			a_path := apa.path_at_level(5)
			assert_equal ("/items[at0004.0.0.1]", a_path)

			create apa.make_from_string("/items[at0.1]")
			-- a_path := apa.path_at_level(0)
			a_path := apa.path_at_level(1)
			assert_equal ("/items[at0.1]", a_path)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0.1]", a_path)

			create apa.make_from_string("/items[at0.0.2]")
			-- a_path := apa.path_at_level(0)
			-- a_path := apa.path_at_level(1)
			a_path := apa.path_at_level(2)
			assert_equal ("/items[at0.0.2]", a_path)
			a_path := apa.path_at_level(3)
			assert_equal ("/items[at0.0.2]", a_path)
		end

	test_is_phantom_path_at_level
		note
			testing:  "covers/{ARCHETYPE_PATH_ANALYSER}.is_phantom_path_at_level"
		local
			apa: ARCHETYPE_PATH_ANALYSER
			a_path: STRING
		do
			create apa.make_from_string("/items[at0004.0.0.1]")
			assert_equal (False, apa.is_phantom_path_at_level(0))
			assert_equal (False, apa.is_phantom_path_at_level(1))
			assert_equal (False, apa.is_phantom_path_at_level(2))
			assert_equal (False, apa.is_phantom_path_at_level(3))

			create apa.make_from_string("/items[at0.0.0.1]")
			assert_equal (True, apa.is_phantom_path_at_level(0))
			assert_equal (True, apa.is_phantom_path_at_level(1))
			assert_equal (True, apa.is_phantom_path_at_level(2))
			assert_equal (False, apa.is_phantom_path_at_level(3))
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
--| The Original Code is test_differential_archetype_ontology.e.
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
