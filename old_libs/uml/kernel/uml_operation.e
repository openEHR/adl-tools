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


class UML_OPERATION

inherit
	UML_BEHAVIOURAL_FEATURE
		redefine
			formal_parameter
		end

create
	make

feature -- Initialisation

	make(a_name: STRING)
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
		do
			name := a_name
			create owned_comment.make(0)
			create owned_element.make(0)
			create precondition.make
			create postcondition.make
		end

feature -- Access

	formal_parameter: LIST [UML_PARAMETER]

	precondition: LINKED_SET [UML_CONSTRAINT]

	postcondition: LINKED_SET [UML_CONSTRAINT]

	body_condition: UML_CONSTRAINT

	type: UML_TYPE

	redefined_operation: SET [UML_OPERATION]

invariant

end


