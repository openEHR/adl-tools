note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper class for retrieving object structure of archetype namespaces and any 
				 associated information.  Structure:

					 namespaces = <
						 ["oe"] = <"org.openehr">
						 ["nhs"] = <"uk.gov.nhs">
					 >
				 ]"
	keywords:    "ODIN"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class NAMESPACE_TABLE

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

	TABLE_ITERABLE [STRING, STRING]
		undefine
			default_create
		end

create
	make, default_create

feature -- Definitions

	root_attribute_name: STRING = "namespace_table"
			-- name of the attribute within a parent object at which this object can be found

feature -- Initialisation

	default_create
			-- Basic make routine to guarantee validity on creation.
		do
			create namespaces.make (0)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- Basic make routine to guarantee validity on creation.
		do
			default_create
		end

	make (a_namespace_table: HASH_TABLE [STRING, STRING])
			-- Make from a given hash table of namespaces
			-- item = namespace ref, e.g. 'oe'; key = namespace e.g. 'org.openehr'
		do
			namespaces := a_namespace_table
		ensure
			namespaces_set: namespaces = a_namespace_table
		end

feature -- Access

	namespace_ref (a_namespace: STRING): STRING
		require
			has_namespace (a_namespace)
		do
			check attached namespaces.item (a_namespace) as att_ns_ref then
				Result := att_ns_ref
			end
		end

	count: INTEGER
			-- Number of repositories.
		do
			Result := namespaces.count
		end

	namespaces: HASH_TABLE [STRING, STRING]
			-- Hash table of namespace references, keyed by their namespace.

feature -- Status Report

	has_namespace (a_namespace: STRING): BOOLEAN
		do
			Result := attached namespaces as att_ns_tab and then att_ns_tab.has (a_namespace)
		end

	has_namespace_ref (a_ns_ref: STRING): BOOLEAN
		do
			Result := attached namespaces as att_ns_tab and then
				across att_ns_tab as ns_csr some ns_csr.item.is_equal (a_ns_ref) end
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [STRING, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := namespaces.new_cursor
		end

feature -- Modification

	put_namespace (a_namespace, a_ref: STRING)
			-- put `a_namespace' with 1a_ref', replacing any previous namespace with that reference
		require
			namespace_valid: not a_namespace.is_empty
			ref_valid: not a_ref.is_empty
		do
			namespaces.force (a_ref, a_namespace)
		ensure
			has_namespace: has_namespace (a_namespace)
		end

	remove_namespace (a_namespace: STRING)
		require
			has_namespace (a_namespace)
		do
			namespaces.remove (a_namespace)
		end

	rename_namespace (old_ns_ref, new_ns_ref: STRING)
		require
			has_old_name: has_namespace (old_ns_ref)
			hasnt_new_name: not has_namespace (new_ns_ref)
		do
			namespaces.replace_key (new_ns_ref, old_ns_ref)
		ensure
			old_name_gone: not has_namespace (old_ns_ref)
			has_new_name: has_namespace (new_ns_ref)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end


