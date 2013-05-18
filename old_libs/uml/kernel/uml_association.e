note
	component:   "openEHR ADL Tools"
	description: "[
			 UML class abstraction, as defined in OMG UML 2.0 Infrastructure 
			 Specification 2003-09-15.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UML_ASSOCIATION

inherit
	UML_CLASSIFIER
		rename
			make as make_classifier
		end

	UML_RELATIONSHIP

create
	make

feature -- Initialisation

	make(a_name: STRING; target: UML_CLASS)
			-- make a single relationship
		require
			Name_valid: a_name /= Void and then not a_name.is_empty
			Target_exists: target /= Void
		do
			name := a_name
			end_type := target
			create owned_comment.make(0)
			create owned_element.make(0)
			create related_element.make
			related_element.extend(end_type)
			make_classifier
		end

feature -- Access

	is_derived: BOOLEAN

	end_type: UML_TYPE

invariant
	related_element /= Void and then related_element.has(end_type)
	
end


