note
	component:   "openEHR Archetype Project"
	description: "Version of openEHR"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	OPENEHR_VERSION

inherit
	ANY
		redefine
			out
		end

feature -- Access

	location: STRING = "$URL$"

	last_changed: STRING = "$LastChangedRevision$%N%T$LastChangedDate$"
			-- Details of when this class was last committed to Subversion.
			-- This would typically be whenever `major', `minor', `build' or `out' are manually edited.

	major: INTEGER = 1
			-- The major version number: manually incremented.

	minor: INTEGER = 5
			-- The minor version number: manually incremented, or else reset to 0 when `major' changes.

	build: INTEGER = 0
			-- The build number: manually incremented for each public release, or else reset to 0 when `minor' changes.

	beta: INTEGER = 5
			-- The beta number: manually incremented for each public release, or else reset to 0 when `major' changes.

	revision: INTEGER = 0
			-- The Subversion revision number: automatically set by the SConstruct.
			-- Make sure this is zero whenever the class is committed to Subversion.
			-- Builds done within EiffelStudio will therefore always show revision 0.
			-- This helps distinguish a developer build from a proper release build.
			-- A proper release build done by the SConstruct will have a non-zero revision number.
			-- The SConstruct automatically reverts its change, after it has finished building.

	out: STRING
			-- The version as a string of the form "major.minor.build.revision".
		do
			Result := major.out + "." + minor.out + "." + build.out + "." + revision.out + " Beta " + beta.out
		ensure then
			long_enough: Result.count >= 7
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
--| The Original Code is openehr_version.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
