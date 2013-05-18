note
	component:   "openEHR ADL Tools"
      description: "Test input/output streams"
	keywords:    "test"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TEST_IO

feature -- Access

	streams: HASH_TABLE [TEST_STREAM, STRING] 
			-- a set of names streams
		once
			create Result.make(0)
		end

	io_message: TEST_STREAM
		do
			Result := streams.item("message")
		end

	io_output: TEST_STREAM
		do
			Result := streams.item("output")
		end

feature -- Modify

	set_default_streams(msg_stream, out_stream: TEST_STREAM)
		require
			Msg_stream_valid: msg_stream /= Void
			Out_stream_valid: out_stream /= Void
		do
			streams.put(msg_stream, "message")
			streams.put(out_stream, "output")
		end

	add_stream(stream_name: STRING; a_stream: TEST_STREAM)
		require
			stream_name_valid: stream_name /= Void and then not streams.has(stream_name)
			stream_valid: a_stream /= Void
		do
			streams.put(a_stream, stream_name)
		end

end

