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


deferred class UML_NAMESPACE

inherit 
	UML_NAMED_ELEMENT

feature -- Access

	element_import: SET [UML_ELEMENT_IMPORT]

	package_import: SET [UML_PACKAGE_IMPORT]

	owned_member: LINKED_SET [UML_NAMED_ELEMENT]
			--
		do
			
		end
	
	member: LINKED_SET [UML_PACKAGEABLE_ELEMENT]
			-- 
		do
			
		end
		
invariant
	-- Owned_member_validity: owned_member /= Void implies owned_member.for_all(agent owned_element.has({UML_PACKAGEABLE_ELEMENT}))

end


