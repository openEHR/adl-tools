note
	component:   "openEHR ADL Tools"
	description: "Editor context interface for an EXPR_OPERATOR"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXPR_OPERATOR_ED_CONTEXT

inherit
	EXPR_ITEM_ED_CONTEXT
		redefine
			arch_node
		end

feature -- Access

	arch_node: detachable EXPR_OPERATOR

feature {NONE} -- Implementation

	c_pixmap: EV_PIXMAP
		do
			if attached arch_node as a_n then
				Result := get_icon_pixmap (Pixmap_path + "operators" + resource_path_separator + a_n.operator.as_text_symbol)
			else
				create Result.default_create
			end
		end

end


