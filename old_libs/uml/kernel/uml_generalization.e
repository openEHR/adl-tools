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


class UML_GENERALIZATION

inherit 
	UML_DIRECTED_RELATIONSHIP

create
	make_substitutable

feature -- Initialisation

	make_substitutable(a_target: UML_CLASS)
		require
			Target_exists: a_target /= Void
		do
			default_create
			general := a_target
			target.extend(a_target)
			is_substitutable := True
		end

feature -- Access

	is_substitutable: BOOLEAN

	general: UML_CLASSIFIER

invariant

	General_valid: general /= Void and then target.has(general)

end


