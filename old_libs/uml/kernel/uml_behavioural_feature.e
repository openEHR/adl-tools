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


deferred class UML_BEHAVIOURAL_FEATURE

inherit
	UML_FEATURE

	UML_NAMESPACE

feature -- Access

	is_query: BOOLEAN

	formal_parameter: LIST [UML_PARAMETER]

	return_result: LIST [UML_PARAMETER]

	raised_exception: SET [UML_TYPE]

invariant

end


