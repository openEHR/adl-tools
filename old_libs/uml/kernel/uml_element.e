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


deferred class UML_ELEMENT
		
inherit
	UML_SERIALISABLE
	
feature -- Access

	owned_comment: ARRAYED_LIST[UML_COMMENT]
	
	owned_element: ARRAYED_LIST [UML_ELEMENT]
			-- master list of elements

invariant
	-- Comments_valid: owned_comment /= Void implies owned_comment.for_all(agent owned_element.has({UML_COMMENT}))
	
end


