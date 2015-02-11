note
	component:   "openEHR ADL Tools"
	description: "interface class to assertion parser and parse tree"
	keywords:    "ADL, assertion"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ASSERTION_2_ENGINE

inherit
	PARSER_ENGINE
		rename
			set_source as parser_set_source
		redefine
			tree, parser, assign_parser_result
		end

	SHARED_ASSERTION_SERIALISERS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, has_assertion_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create parser.make
		end

feature -- Access

	tree: detachable ARRAYED_LIST [ASSERTION]
			-- set if parse succeeded

feature -- Commands

	set_source (in_text: STRING; a_source_start_line: INTEGER; aca: ARCH_LIB_ARCHETYPE)
			-- Set `in_text' as working artifact.
		do
			parser_set_source (in_text, a_source_start_line)
			target_desc := aca
		end

	serialise (a_format: STRING)
			-- serialise current artifact into format
		require
			Format_valid: has_assertion_serialiser_format (a_format)
		local
			serialiser_mgr: ASSERTION_SERIALISER_MGR
		do
			if attached tree as att_tree then
				create serialiser_mgr.make (att_tree, a_format)
				serialiser_mgr.serialise
				serialised := serialiser_mgr.last_result
			end
		end

feature {NONE} -- Implementation

	assign_parser_result
			-- override in descendants to get around limitations in gobo parsers not being able
			-- to be componentised
		local
			new_tree: ARRAYED_LIST [ASSERTION]
		do
			if attached {ARRAYED_LIST [ASSERTION]} parser.output as al then
				tree := al
			-- FIXME: the following is needed while the ADL parsers remain void-unsafe, since
			-- the type ARRAYED [LIST] in the parser is actually detachable ARRAYED_LIST [detachable ASSERION]
			elseif attached {ARRAYED_LIST [detachable ASSERTION]} parser.output as det_al then
				create new_tree.make (0)
				tree := new_tree
				across det_al as det_al_csr loop
					if attached det_al_csr.item as inv then
						new_tree.extend (inv)
					end
				end
			end
		end

	parser_execute
			-- call the parser.execute with specific args
		do
			if attached source as att_source and attached target_desc as att_aca then
				parser.execute (att_source, source_start_line, att_aca)
			end
		end

	parser: CADL_2_PARSER

	target_desc: detachable ARCH_LIB_ARCHETYPE
		note
			option: stable
		attribute
		end

end


