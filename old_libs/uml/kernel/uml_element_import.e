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


class UML_ELEMENT_IMPORT

inherit 
	UML_DIRECTED_RELATIONSHIP

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Access

	uml_alias: STRING

	imported_element: UML_PACKAGEABLE_ELEMENT
	
	visibility: UML_VISIBILITY_KIND

invariant

	imported_element /= Void

end


