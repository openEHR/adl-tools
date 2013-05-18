note
	component:   "openEHR ADL Tools"
	description: "Tests for C_DURATION"
	keywords:    "archetype, adl, aom"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_C_DURATION

inherit
	OPENEHR_TEST_SET

feature -- Test routines

	test_conforms_to
			-- True if code has a valid part at or above specialisation level
		note
			testing:  "covers/{C_DURATION}.conforms_to"
		local
			spec_dur, dur: C_DURATION
		do
			-- check |P1D..P10D| conforms to |P0D..P10D|
			create dur.make (Void, "P0D", "P10D", True, True)
			create spec_dur.make (Void, "P1D", "P10D", True, True)
			assert_equal (True, spec_dur.conforms_to (dur))

			-- check |P1D..P1M| conforms to |P0D..P1Y|
			create dur.make (Void, "P0D", "P1Y", True, True)
			create spec_dur.make (Void, "P0D", "P1M", True, True)
			assert_equal (True, spec_dur.conforms_to (dur))

			-- check |P1D..P1M| conforms to |P0D..P1Y|
			create dur.make (Void, "P0D", "P1Y", True, True)
			create spec_dur.make (Void, "P0D", "P1M", True, True)
			assert_equal (True, spec_dur.conforms_to (dur))
		end

end


