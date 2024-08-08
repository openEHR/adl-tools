note
	component:   "openEHR ADL Tools"
	description: "[
				 Helper class for retrieving object structure of terminology mapping URIs and any
				 associated information.  Structure:
					 uri_templates = <
						 ["snomedct"] = <"http://snomedct.info/id/$code_string">
						 ["loinc"] = <"http://loinc.org/id/$code_string">
						 ["openehr"] = <"http://openehr.org/id/$code_string">
					 >
				 ]"
	keywords:    "ODIN"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERMINOLOGY_SETTINGS

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

	TABLE_ITERABLE [STRING, READABLE_STRING_GENERAL]
		undefine
			default_create
		end

create
	make, default_create

feature -- Definitions

	root_attribute_name: STRING = "terminology_settings"
			-- name of the attribute within a parent object at which this object can be found

feature -- Initialisation

	default_create
			-- Basic make routine to guarantee validity on creation.
		do
			create uri_templates.make (0)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- Basic make routine to guarantee validity on creation.
		do
			default_create
		end

	make (a_uri_table: STRING_TABLE [STRING])
			-- Make from a given hash table of uris
			-- item = uri ref, e.g. 'oe'; key = uri e.g. 'org.openehr'
		do
			uri_templates := a_uri_table
		ensure
			uri_templates_set: uri_templates = a_uri_table
		end

feature -- Access

	uri (a_terminology: STRING): STRING
		require
			has_terminology (a_terminology)
		do
			check attached uri_templates.item (a_terminology) as att_uri_tpl then
				Result := att_uri_tpl
			end
		end

	count: INTEGER
			-- Number of repositories.
		do
			Result := uri_templates.count
		end

	uri_templates: STRING_TABLE [STRING]
			-- Hash table of terminology uri templates, keyed by their terminology.

feature -- Status Report

	has_terminology (a_terminology: STRING): BOOLEAN
		do
			Result := attached uri_templates as att_ns_tab and then att_ns_tab.has (a_terminology)
		end

	has_uri (a_uri: STRING): BOOLEAN
		do
			Result := attached uri_templates as att_ns_tab and then
				across att_ns_tab as ns_csr some ns_csr.item.is_equal (a_uri) end
		end

feature -- Iteration

	new_cursor: HASH_TABLE_ITERATION_CURSOR [STRING, READABLE_STRING_GENERAL]
			-- Fresh cursor associated with current structure
		do
			Result := uri_templates.new_cursor
		end

feature -- Modification

	put_uri (a_uri, a_terminology: STRING)
			-- put `a_uri' with 1a_ref', replacing any previous uri with that reference
		require
			uri_valid: not a_uri.is_empty
			terminology_valid: not a_terminology.is_empty
		do
			uri_templates.force (a_uri, a_terminology)
		ensure
			has_terminology: has_terminology (a_terminology)
		end

	remove_uri (a_terminology: STRING)
		require
			has_terminology (a_terminology)
		do
			uri_templates.remove (a_terminology)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end


