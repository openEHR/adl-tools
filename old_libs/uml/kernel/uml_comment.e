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


class UML_COMMENT

inherit 
	UML_ELEMENT

create
	make

feature -- Initialisation

	make(a_body: STRING)
		require
			Body_exists: a_body /= Void
		do
			body := a_body 
		end

feature -- Access

	body: STRING

invariant

end


