note
	component:   "openEHR ADL Tools"
	description: "[
			 UML TypedElement abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UML_DATA_TYPE

inherit 
	UML_CLASSIFIER
		rename
			make as make_classifier
		end

create
	make

feature -- Initialisation

	make(a_name: STRING)
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			name := a_name
			create owned_element.make(0)
			create owned_comment.make(0)
			create owned_attribute.make(0)
			create owned_operation.make(0)
			make_classifier
		end

feature -- Access

	owned_attribute: ARRAYED_LIST[UML_PROPERTY]

	owned_operation: ARRAYED_LIST[UML_OPERATION]

invariant
	Owned_attribute_valid: owned_attribute /= Void and then owned_attribute.for_all(agent owned_element.has({UML_PROPERTY}))	
	Owned_operation_valid: owned_operation /= Void and then owned_operation.for_all(agent owned_element.has({UML_OPERATION}))

end


