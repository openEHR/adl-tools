note
	component:   "openEHR ADL Tools"
	description: "Version of openEHR"
	keywords:    "ADL, version"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	OPENEHR_VERSION

inherit
	ANY
		redefine
			out
		end

feature -- Access

			-- Details of when this class was last committed to Version control.
			-- This would typically be whenever `major', `minor', `build' or `out' are manually edited.

	major: INTEGER = 2
			-- The major version number: manually incremented.

	minor: INTEGER = 1
			-- The minor version number: manually incremented, or else reset to 0 when `major' changes.

	build: INTEGER = 0
			-- The build number: manually incremented for each public release, or else reset to 0 when `minor' changes.

	revision: INTEGER = 0
			-- The build number: automatically set by the SConstruct.
			-- Make sure this is zero whenever the class is committed to Subversion.
			-- Builds done within EiffelStudio will therefore always show revision 0.
			-- This helps distinguish a developer build from a proper release build.
			-- A proper release build done by the SConstruct will have a non-zero revision number.
			-- The SConstruct automatically reverts its change, after it has finished building.

	beta: IMMUTABLE_STRING_8
			-- The beta number: manually incremented for each public release, or else reset to 0 when `major' changes.
		once
			create Result.make_from_string ("12")
		end

	version_to_minor: IMMUTABLE_STRING_8
			-- The version as a string of the form "major.minor".
		do
			create Result.make_from_string (major.out + "." + minor.out)
		end

	version_to_build: IMMUTABLE_STRING_8
			-- The version as a string of the form "major.minor".
		do
			create Result.make_from_string (major.out + "." + minor.out + "." + build.out)
		end

	out: STRING
			-- The version as a string of the form "major.minor.build.revision".
		do
			Result := major.out + "." + minor.out + "." + build.out + "." + revision.out
		ensure then
			long_enough: Result.count >= 7
		end

end



