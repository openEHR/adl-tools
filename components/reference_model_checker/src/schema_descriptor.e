note
	component:   "openEHR Archetype Project"
	description: "[
				 Descriptor for a BMM schema. Contains a meta-data table of attributes obtained from a mini-dadl parse of the 
				 schema file.
	             ]"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class SCHEMA_DESCRIPTOR

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ANY_VALIDATOR

	BMM_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_meta_data: attached HASH_TABLE [STRING, STRING])
		local
			bmm_ver: STRING
		do
			reset
			meta_data := a_meta_data
			schema_id := create_schema_id (meta_data.item (metadata_rm_publisher), meta_data.item (metadata_schema_name), meta_data.item (metadata_rm_release))

			-- if there is no bmm_version meta-data item, that means that the initial fast-parse scan (note: doesn't use the main dadl parser)
			-- did not find one; therefore we use the assumed value
			if not meta_data.has (Metadata_bmm_version) then
				bmm_ver := Assumed_bmm_version
			else
				bmm_ver := meta_data.item (Metadata_bmm_version)
			end
			is_bmm_compatible := bmm_version_compatible (bmm_ver)
			if not is_bmm_compatible then
				add_error ("BMM_VER", <<schema_id, bmm_ver, Bmm_internal_version>>)
			end

			create includes.make (0)
		end

feature -- Access

	p_schema: detachable P_BMM_SCHEMA
			-- persistent form of model

	schema: detachable BMM_SCHEMA
			-- computable form of model

	schema_id: STRING
			-- schema id, formed from:
			-- meta_data(Metadata_model_publisher) '-' meta_data(metadata_schema_name) '-' meta_data(Metadata_model_release)
			--	 e.g. openehr_rm_1.0.3, openehr_test_1.0.1, iso_13606-1_2008

	meta_data: HASH_TABLE [STRING, STRING]
			-- table of {key, value} pairs of schema meta-data, keys as follows:
			-- "bmm_version",
			-- "model_publisher",
			-- "schema_name",
			-- "model_release",
			-- "schema_revision",
			-- "schema_lifecycle_state",
			-- "schema_description",
			-- "schema_path"

	includes: ARRAYED_LIST [STRING]
			-- schema_ids of schemas included by this schema

feature -- Status Report

	is_top_level: BOOLEAN
			-- True if this is a top-level schema, i.e. not included by some other schema

	is_bmm_compatible: BOOLEAN
			-- True if the BMM version found in the schema (or assumed, if none) is compatible with that in this software

feature -- Modification

	set_top_level
		do
			is_top_level := True
		end

	signal_load_include_error
			-- set error status due to failure to load an included schema
		do
			add_error ("model_access_e11", <<schema_id>>)
		end

feature {REFERENCE_MODEL_ACCESS} -- Commands

	load
			-- load schema into in-memory form
		local
			model_file: PLAIN_TEXT_FILE
			dt_tree: DT_COMPLEX_OBJECT_NODE
			parser: DADL_VALIDATOR
		do
			reset
			schema := Void
			p_schema := Void
			create model_file.make (meta_data.item (Metadata_schema_path))
			if not model_file.exists or else not model_file.is_readable then
				add_error ("model_access_e1", <<meta_data.item (Metadata_schema_path)>>)
			else
				model_file.open_read
				model_file.read_stream (model_file.count)
				create parser.make
				parser.execute(model_file.last_string, 1)
				if not parser.syntax_error then
					dt_tree := parser.output
					if not attached {P_BMM_SCHEMA} dt_tree.as_object_from_string ("P_BMM_SCHEMA", Void) as p_sch then
						add_error ("model_access_e4", <<meta_data.item (Metadata_schema_path)>>)
					else
						p_schema := p_sch
						passed := True
						p_schema.validate_created
						merge_errors (p_schema.errors)
						if passed then
							p_schema.load_finalise
						end
					end
				else
					add_error ("model_access_e2", <<meta_data.item (Metadata_schema_path), parser.errors.as_string>>)
				end
				model_file.close
			end
		ensure
			attached p_schema or else errors.has_errors
		end

	validate_includes (all_schemas_list: ARRAY [STRING])
			-- validate includes list for this schema, to see if each mentioned schema exists in read schemas
		local
			all_schemas: ARRAYED_LIST [STRING]
		do
			create all_schemas.make (0)
			all_schemas.compare_objects
			all_schemas.make_from_array (all_schemas_list)
			if attached p_schema.includes then
				across p_schema.includes as supplier_schemas_csr loop
					if not all_schemas.has (supplier_schemas_csr.item.id) then
						add_error("BMM_INC", <<schema_id, supplier_schemas_csr.item.id>>)
					else
						includes.extend (supplier_schemas_csr.item.id)
					end
				end
			end
		end

	validate
		do
			p_schema.validate
			merge_errors (p_schema.errors)
		end

	create_schema
			-- create `schema'
		require
			passed
		do
			p_schema.create_bmm_schema
			schema := p_schema.bmm_schema
		end

end



--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
