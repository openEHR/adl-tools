note
	component:   "openEHR ADL Tools"
	description: "Visitor to get attributes on any node."
	keywords:    "terminology, vocabulary, XML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_VALUE_SET_PROCESSOR

inherit
	SHARED_TERMINOLOGY_SERVICE
		export
			{NONE} all
		end

	XML_NODE_VISITOR

feature -- Access

	current_terminology: detachable TERMINOLOGY_ACCESS
			-- current terminology

	current_language: detachable STRING
			-- current language

	current_group: detachable STRING
			-- current group we are in

feature -- Processing

	process_element (e: XML_ELEMENT)
		local
			attrs: LIST [XML_ATTRIBUTE]
			attr_vals: HASH_TABLE [STRING, STRING]
		do
			attrs := e.attributes
			create attr_vals.make (0)
			across attrs as attrs_csr loop
				attr_vals.put (attrs_csr.item.value, attrs_csr.item.name)
			end

			if e.name.is_equal ("terminology") and attached attr_vals.item ("name") as val_name then
				ts.add_terminology (val_name)
				current_terminology := ts.terminology (val_name)
				if attached attr_vals.item ("language") as val_lang then
					current_language := val_lang
				end

			elseif e.name.is_equal ("group") then
				current_group := attr_vals.item ("name")

			elseif e.name.is_equal ("concept") and attached attr_vals.item ("id") as val_id and attached attr_vals.item ("rubric") as val_rubric then
				check attached current_terminology as ct and attached current_group as cg and attached current_language as cl then
					ct.add_term (val_id, val_rubric, cg, cl)
				end
			end
		end

	process_character_data (c: XML_CHARACTER_DATA)
			-- Process character data `c'.
		do
		end

	process_xml_declaration (a_decl: XML_DECLARATION)
			-- Process xml declaration `a_decl'
		do
		end

	process_processing_instruction (a_pi: XML_PROCESSING_INSTRUCTION)
			-- Process processing instruction `a_pi'.
		do
		end

	process_document (doc: XML_DOCUMENT)
			-- Process document `doc'.
		do
		end

	process_comment (com: XML_COMMENT)
			-- Process comment `com'.
		do
		end

	process_attributes (e: XML_ELEMENT)
			-- Process attributes of element `e'.
		do
		end

	process_attribute (att: XML_ATTRIBUTE)
			-- Process attribute `att'.
		do
		end

end



