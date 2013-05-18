note
	component:   "openEHR ADL Tools"
	description: "Simple XML implementation of TERMINOLOGY_ACCESS"
	keywords:    "terminology, vocabulary, XML"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_TERMINOLOGY_SERVICE_POPULATOR

inherit
	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialization

	make
		-- Initialize `Current'.
	local
		value_set_processor: XML_VALUE_SET_PROCESSOR
	do
		-- for now we just make do with 'en' terminology
		terminology_file_path := file_system.pathname (file_system.pathname (terminology_directory, "en"), terminology_filename)
		if file_system.file_exists (terminology_file_path) then
			xml_doc := deserialize_text (terminology_file_path)
			if attached xml_doc then
				create value_set_processor
				xml_doc.process_children_recursive (value_set_processor)
			end
		else
			init_failed := True
			init_fail_reason := get_msg (ec_file_does_not_exist, <<terminology_file_path>>)
		end
	end

feature -- Access

	terminology_file_path: STRING

	init_fail_reason: STRING
		attribute
			create Result.make_empty
		end

	xml_doc: detachable XML_DOCUMENT
			-- result of successful parse

feature -- Status Report

	init_failed: BOOLEAN

feature {NONE} -- Implementation

	deserialize_text (a_file_path: STRING): detachable XML_DOCUMENT
			-- Retrieve xml document from content of `a_text'.
			-- If deserialization fails, return Void.
		local
			parser: XML_LITE_PARSER
			callbacks: XML_CALLBACKS_DOCUMENT
		do
			create parser.make
			create callbacks.make_null
			parser.set_callbacks (callbacks)

			parser.parse_from_filename (a_file_path)

			init_fail_reason.wipe_out
			if not parser.error_occurred then
				Result := callbacks.document
			else
				if attached parser.error_message as msg then
					init_fail_reason := msg
				end
				if attached parser.error_position as pos then
					init_fail_reason.append ("Position: " + pos.out)
				end
			end
		end

end



