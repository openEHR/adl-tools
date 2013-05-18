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


deferred class UML_DIRECTED_RELATIONSHIP

inherit 
	UML_RELATIONSHIP
		redefine
			default_create
		end

feature -- Initialisation

	default_create
			-- 
		do
			create source.make
			create target.make
		end
		
feature -- Access

	source: LINKED_SET [UML_ELEMENT]
	
	target: LINKED_SET [UML_ELEMENT]

invariant
	-- Source_valid: source /= Void and then source.for_all(agent related_element.has({UML_ELEMENT}))
	-- Target_valid: target /= Void and then target.for_all(agent related_element.has({UML_ELEMENT}))
	
end


