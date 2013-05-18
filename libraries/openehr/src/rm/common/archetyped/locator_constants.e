note
	component:   "openEHR ADL Tools"
	description: "Locator constants."
	keywords:    "content, path, locator"
	requirements:"clin:data-ref-std"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class LOCATOR_CONSTANTS

feature {NONE} -- Definitions

	Current_transaction_id:STRING = "current"

	Fragment_separator:STRING = "#"
			-- separator between identifiers for whole document, and for fragments. In the EHR, this is
			-- between the transaction id, and id of organiser and/or content

	Content_path_separator:STRING = "|"
			-- separator between path items in content paths

	Organiser_path_separator:STRING = "/"
			-- separator between path items in organiser paths

	Multipart_id_delimiter:STRING = "::"
			-- separator between sections in multi-part ids, such as the transaction id

end


