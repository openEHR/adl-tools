note
	component:   "openEHR ADL Tools"
	description: "Editor context interface for anyu EXPR_ITEM node in an ASSERTION."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXPR_ITEM_ED_CONTEXT

inherit
	ANY_ED_CONTEXT
		redefine
			arch_node
		end

feature -- Definitions

	Pixmap_path: STRING
			-- path to pixmaps for assertion elements, including final '/'
		once
		 	Result := "am" + resource_path_separator + "assertion" + resource_path_separator
		end

feature -- Access

	arch_node: detachable EXPR_ITEM
			-- assertion item being edited

	parent: detachable EXPR_ITEM_ED_CONTEXT

feature -- Modification

	set_parent (a_node: like parent)
		do
			parent := a_node
		end

feature {EXPR_ITEM_ED_CONTEXT} -- Implementation

	meaning: STRING
			-- generate useful string representatoin for meaning column
		deferred
		end

	specialisation_status: INTEGER
			-- specialisation status of archetype node in this context object
		do
			Result := Ss_added
		end

end


