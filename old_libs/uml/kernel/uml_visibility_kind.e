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


class UML_VISIBILITY_KIND

feature -- Definition

	public: INTEGER = 0

	private: INTEGER = 1

	protected: INTEGER = 2

	package: INTEGER = 3

feature -- Access

	value: INTEGER

feature -- Status Report
	
	valid_visibility(i: INTEGER): BOOLEAN 
		do
			Result := i >= public and i <= protected
		end

invariant

	valid_visibility(value)

end


