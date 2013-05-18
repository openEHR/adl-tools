note
	component:   "openEHR ADL Tools"
	description: "Shared UML model"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_SERIALISER_ENV
		
inherit
	DT_FACTORY
		export
			{NONE} all
		end

feature -- Representation

	model_rep: DT_COMPLEX_OBJECT_NODE
		do
			Result := model_rep_cell.item
		end

	set_model_rep(an_obj: DT_COMPLEX_OBJECT_NODE)
			-- put a new model_rep object
		require
			an_object_exists: an_obj /= Void
		do
			model_rep_cell.put(an_obj)
		end
		
	object_node_stack: ARRAYED_STACK [DT_COMPLEX_OBJECT_NODE]
			-- 
		once
			create Result.make(0)
		end
		
	attribute_node_stack: ARRAYED_STACK [DT_ATTRIBUTE_NODE]
			-- 
		once
			create Result.make(0)
		end
		
feature {NONE} -- Implementation

	model_rep_cell: CELL [DT_COMPLEX_OBJECT_NODE]
		once
			create Result.put(Void)
		end

end


