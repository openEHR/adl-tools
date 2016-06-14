note
	component:   "openEHR ADL Tools"
	description: "UI visualisation node for a C_DATE"
	keywords:    "archetype, editing"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2016- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_DATE_UI_NODE

inherit
	C_PRIMITIVE_OBJECT_UI_NODE
		redefine
			arch_node
		end

create
	make, make_rm

feature -- Access

	arch_node: detachable C_DATE

end


