note
	component:   "openEHR ADL Tools"

	description: "[
			 Class describing a reference to an object maintained outside (usually) the current 
			 namespace, e.g. in another service. Services are usually external, e.g. available in 
			 a LAN (including on the same host) or the internet via Corba, SOAP, or some other 
			 distributed protocol. However, in small systems they may be part of the same 
			 executable as the data containing the Id.
			 ]"
	keywords:    "object identifiers"

	design:      "openEHR Common Reference Model 1.4.1"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OBJECT_REF

create
	make

feature {NONE} -- Initialization

	make (a_namespace, a_type: STRING; an_object_id: OBJECT_ID)
			-- build an external ID
		require
			Namespace_exists: not a_namespace.is_empty
			Type_exists: not a_type.is_empty
		do
			namespace := a_namespace
			type := a_type
			id := an_object_id
		ensure
			Namespace_set: namespace = a_namespace
			Type_set: type = a_type
			Id_set: id = an_object_id
		end

feature -- Access

	id: OBJECT_ID
			-- Globally unique id of an object, regardless of where it is stored.

	namespace: STRING
			-- Namespace to which this identifier belongs in the local system context (and possibly
			-- in any other openEHR compliant environment) e.g. “terminology”, “demographic”. These
			-- names are not yet standardised. Legal values for the namespace are
			-- “local” | “unknown” | “[a-zA-Z][a-zA-Z0-9_-]*”

	type: STRING
			-- Name of the class of object to which this identifier type refers, e.g. “PARTY”,
			-- “PERSON”, “GUIDELINE” etc. These class names are from the relevant reference model.
			-- The type name “ANY” can be used to indicate that any type is accepted (e.g. if the
			-- type is unknown).

	as_string: STRING
			-- 	
		do
			create Result.make_empty
		end

invariant
	namespace_valid: not namespace.is_empty
	type_valid: not type.is_empty

end



