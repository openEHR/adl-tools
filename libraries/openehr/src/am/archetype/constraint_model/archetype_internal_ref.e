note
	component:   "openEHR ADL Tools"
	description: "Item representing a 'use' reference in an ADL parse tree. The referenced node must be an object node."
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_COMPLEX_OBJECT_PROXY

inherit
	C_OBJECT
		redefine
			set_occurrences, representation_cache
		end

create
	make, make_identified

feature -- Initialisation

	make (a_rm_type_name, a_path: STRING)
			-- make assuming target object id
		require
			a_rm_type_name_valid: not a_rm_type_name.is_empty
			a_path_exists: not a_path.is_empty
		do
			default_create
			rm_type_name := a_rm_type_name
			set_target_path (a_path)
			use_target_occurrences := True
			create representation_cache.make_anonymous (a_path)
			representation_cache.set_content (Current)
		ensure
			Use_target_occurrences: use_target_occurrences
		end

	make_identified (a_rm_type_name, an_object_id, a_path: STRING)
			-- make with id
		require
			rm_type_name_valid: not a_rm_type_name.is_empty
			object_id_valid: not an_object_id.is_empty
			path_valid: not a_path.is_empty
		do
			default_create
			rm_type_name := a_rm_type_name
			set_target_path (a_path)
			use_target_occurrences := True
			create representation_cache.make (an_object_id, a_path)
			representation_cache.set_content (Current)
		ensure
			Use_target_occurrences: use_target_occurrences
		end

feature -- Access

	target_path: STRING
			-- path to the referenced node

feature -- Status Report

	use_target_occurrences: BOOLEAN
			-- True if target occurrences are to be used as the value of occurrences in this object;
			-- by the time of runtime use, the target occurrences value has to be set into this object

feature -- Modification

	set_target_path (a_path: STRING)
			-- set reference path with a valid ADL path string
		do
			target_path := a_path
		end

	set_occurrences (ivl: MULTIPLICITY_INTERVAL)
			--
		do
			precursor (ivl)
			use_target_occurrences := False
		ensure then
			Dont_use_target_occurrences: not use_target_occurrences
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_complex_object_proxy (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_complex_object_proxy (Current, depth)
		end

feature {NONE} -- Implementation

	representation_cache: detachable OG_OBJECT_PROXY
		note
			option: transient
		attribute
		end

	create_default_representation: attached like representation_cache
			-- create a reasonable `representation' instance
		do
			create Result.make_anonymous ("/")
		end

end


