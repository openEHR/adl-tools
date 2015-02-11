note
	component:   "openEHR ADL Tools"
	description: "Serialiser Manager for archetype definition"
	keywords:    "archetype constraint definition"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class ASSERTION_SERIALISER_MGR

inherit
	SHARED_ASSERTION_SERIALISERS

create
	make

feature -- Initialisation

	make (a_target: ARRAYED_LIST [ASSERTION]; format: STRING)
			-- create a new manager targetted to the parse tree `a_target'
		require
			Format_valid: has_assertion_serialiser_format (format)
		do
			serialiser := assertion_serialiser_for_format (format)
			target := a_target
			serialiser.reset
		end

feature -- Command

	serialise
			-- start the serialisation process; the result will be in `serialiser_output'
		do
			if attached serialiser as ser then
				ser.start_assertion (target, 0)
			end
		end

feature -- Access

	last_result: STRING
		do
			if attached serialiser as ser then
				Result := ser.last_result
			else
				create Result.make_empty
			end
		end

feature {NONE} -- Implementation

	serialiser: ASSERTION_SERIALISER

	target: ARRAYED_LIST [ASSERTION]

end


