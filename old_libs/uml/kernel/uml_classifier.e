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


deferred class UML_CLASSIFIER

inherit 
	UML_TYPE

	UML_NAMESPACE

	UML_REDEFINABLE_ELEMENT

feature -- Initialisation

	make
			-- 
		do
			create generalization.make
		end
		
feature -- Access

	is_abstract: BOOLEAN

	redefined_classifier: LINKED_SET [UML_CLASSIFIER]

	generalization: LINKED_SET [UML_GENERALIZATION]

feature -- Modification

	set_is_abstract
			-- 
		do
			is_abstract := True
		end
		
	add_generalization(a_gen: UML_GENERALIZATION)
			-- add a generalization parent
		require
			a_gen_exists: a_gen /= Void
		do
			generalization.extend(a_gen)
		end	
		
invariant
	-- Generalization_valid: generalization.for_all(agent owned_element.has({UML_GENERALIZATION}))
	-- Redefined_classifier_valid: redefined_classifier.for_all(agent redefined_element.has({UML_CLASSIFIER}))
	
end


