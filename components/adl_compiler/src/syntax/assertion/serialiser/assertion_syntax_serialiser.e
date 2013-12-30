note
	component:   "openEHR ADL Tools"
	description: "[
			 Serialise assertion to any syntax format, i.e. where the
			 output reflects the tree hierarchy of the parse tree inline - nodes
			 are presented in the order of the tree traversal, and the semantics 
			 of the tree are output as language syntax keywords, symbols etc.
	             ]"
	keywords:    "serialiser, assertion"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ASSERTION_SYNTAX_SERIALISER

inherit
	ASSERTION_SERIALISER
		redefine
			make
		end

	CADL_15_TOKENS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_profile: SERIALISATION_PROFILE)
			-- set profile
		do
			precursor (a_profile)
			create last_string_value.make_empty
		end

feature -- Modification

	start_assertion (invs: ARRAYED_LIST [ASSERTION]; depth: INTEGER)
			-- start serialising an ASSERTION
		do
			across invs as invs_csr loop
				last_result.append (create_indent(depth+1))
				if attached invs_csr.item.tag then
					last_result.append (invs_csr.item.tag + ": ")
				end
				last_result.append (invs_csr.item.expression.as_string + format_item(FMT_NEWLINE))
			end
		end

	end_assertion (a_node: ARRAYED_LIST [ASSERTION]; depth: INTEGER)
			-- end serialising an ASSERTION
		do
		end

end


