note
	component:   "openEHR ADL Tools"
	description: "[
				 ADL object nodes that are defined as references to exterior resources,
				 such as other archetypes, ontologies and so on.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_REFERENCE_OBJECT

inherit
	C_OBJECT
		redefine
			representation_cache
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_reference_object (Current, depth)
		end

	exit_subtree(visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_reference_object (Current, depth)
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT_LEAF
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make_anonymous
		end

end


