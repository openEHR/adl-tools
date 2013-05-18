note
	component:   "openEHR ADL Tools"
	description: "[
			 routines for generating a generic tree representation that
			 can be serialised to a file.
			 ]"
	keywords:    "UML, introspection, reflection"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


deferred class UML_SERIALISABLE

inherit
	SHARED_SERIALISER_ENV

feature -- Serialisation

	synchronise_to_tree
			-- serialise to representation
		do
		end

end


