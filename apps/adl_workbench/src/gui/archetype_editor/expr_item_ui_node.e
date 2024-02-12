note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node interface for anyu EXPR_ITEM node in an ASSERTION."
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXPR_ITEM_UI_NODE

inherit
	RULE_ELEMENT_UI_NODE
		redefine
			arch_node, parent
		end

feature -- Access

	arch_node: detachable EXPRESSION
			-- assertion item being edited

	parent: detachable RULE_ELEMENT_UI_NODE

end


