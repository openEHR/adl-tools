note
	component:   "openEHR ADL Tools"
	description: "[
		`	 Archetype node populator: when an archetype is read in,
			 its nodes need to be included in the Java interface Hash
			 map, keyed by integer handle ids.
			 ]"
	keywords:    "archetype, constraint, definition"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class C_ARCHETYPE_NODE_POPULATOR

inherit
	SHARED_ADL_OBJECTS
		export
			{NONE} all
		end

	C_ITERATOR
		rename
			make as make_iterator
		redefine
			node_enter_action,
			node_exit_action
		end

create
	make

feature -- Initialisation

	make(a_target: C_COMPLEX_OBJECT)
			-- create a new manager targetted to the parse tree `a_target'
		require
			Target_exists: a_target /= Void
		do
			make_iterator (a_target)
			-- FIXME: A visitor is needed for the second argument, and node_enter_action below should be reconsidered.
		end

feature -- Access

	root_handle: INTEGER
			-- handle of root node

feature {NONE} -- Implementation

	node_enter_action(a_node: OG_ITEM; indent_level: INTEGER)
		local
			l_c_object: C_OBJECT
			l_c_complex_object: C_COMPLEX_OBJECT
			l_handle: INTEGER
			l_c_attribute: C_ATTRIBUTE
		do
			l_c_object ?= a_node.content_item
			if l_c_object /= Void then
				l_handle := adl_objects.new_handle
			--	put_c_object(l_c_object, l_handle)
				l_c_complex_object ?= l_c_object
				if l_c_complex_object /= Void then
					if root_handle = 0 then
						root_handle := l_handle
					end
					put_c_complex_object(l_c_complex_object, l_handle)
					from
						l_c_complex_object.attributes.start
					until
						l_c_complex_object.attributes.off
					loop
						put_c_attribute(l_c_complex_object.attributes.item, adl_objects.new_handle)
						l_c_complex_object.attributes.forth
					end
				end
			end
		end

	node_exit_action(a_node: OG_ITEM; indent_level: INTEGER)
		do
		end

end


