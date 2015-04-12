note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node interface for anyu EXPR_ITEM node in an ASSERTION."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class RULE_ELEMENT_UI_NODE

inherit
	ANY_UI_NODE
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

	arch_node: detachable RULE_ELEMENT
			-- assertion item being edited

	parent: detachable RULE_ELEMENT_UI_NODE

feature -- Modification

	set_parent (a_node: like parent)
		do
			parent := a_node
		end

feature {RULE_ELEMENT_UI_NODE} -- Implementation

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


