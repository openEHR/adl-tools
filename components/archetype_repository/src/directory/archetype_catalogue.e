note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype catalogue - a data structure containing archetypes (of any kind) found
				 in one or more physical locations, each of which is on some medium, such as the 
				 file system or a web-accessible repository. 
				 
				 The structure of the catalogue is a list of top-level packages, each containing
				 an inheritance tree of first degree descendants of a class that provides 
				 archetyping capability, such as the openEHR class LOCATABLE or the 13606 class
				 RECORD_COMPONENT (which class it is is marked in the .bmm schema for the relevant
				 reference model).
				 
				 The contents of the structure consist of archetypes found in the reference and
				 working repositories, and are subsequently attached into the structure.
				 Archetypes opened adhoc are also grafted here.
				 
				 The catalogue is populated at startup, using the source repository paths stored in a
				 configuration file or elsewhere.
				 
				 Archetypes can also be explicitly loaded by the user at runtime, outside of the 
				 repositories, e.g. the user wants to look at an archetype sent to him in email and
				 stored in /tmp. These archetypes are remembered on the 'adhoc_repository', and this 
				 is also merged into the directory by 'grafting'.
				 
				 In the resulting catalogue, the archetype descriptors from each repository are marked
				 so that calling routines can distinguish them, e.g. to use different coloured icons on 
				 the screen.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCHETYPE_CATALOGUE

inherit
	SHARED_RESOURCES
		export
			{NONE} all
		end

	SHARED_REFERENCE_MODEL_ACCESS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	SHARED_MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	SHARED_SOURCE_REPOSITORIES
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	ARCHETYPE_STATISTICAL_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Archetype_category: STRING = "archetypes"

	Template_category: STRING = "templates"

feature -- Initialisation

	make
		do
			clear
			if not attached item_tree_prototype.item then
				initialise_item_tree_prototype
				schema_load_counter := rm_schemas_access.load_count
			end
		end

feature -- Access

	archetype_index: attached DS_HASH_TABLE [ARCH_CAT_ARCHETYPE, STRING]
			-- index of archetype descriptors keyed by mixed-case archetype id. Used in rest of application

	item_index: attached DS_HASH_TABLE [ARCH_CAT_ITEM, STRING]
			-- Index of archetype & class nodes, keyed by lower-case ontology concept. Used during construction of `directory'
			-- For class nodes, this will be model_publisher-model_name-class_name, e.g. openehr-demographic-party.
			-- For archetype nodes, this will be the archetype id.

	matching_ids (a_regex: attached STRING; an_rm_type, an_rm_package: STRING): attached ARRAYED_SET[STRING]
			-- generate list of archetype ids that match the regex pattern and optional rm_type. If rm_type is supplied,
			-- we assume that the regex itself does not contain an rm type
		require
			Regex_valid: not a_regex.is_empty
			Rm_type_valid: an_rm_type /= Void implies not an_rm_type.is_empty
			Rm_package_valid: an_rm_package /= Void implies not an_rm_package.is_empty
		local
			regex_matcher: LX_DFA_REGULAR_EXPRESSION
			arch_id: ARCHETYPE_ID
			is_candidate: BOOLEAN
		do
			create Result.make (0)
			Result.compare_objects
			create regex_matcher.compile_case_insensitive (a_regex)
			if regex_matcher.is_compiled then
				from archetype_index.start until archetype_index.off loop
					if regex_matcher.matches (archetype_index.key_for_iteration) then
						if an_rm_type /= Void then
							create arch_id.make_from_string (archetype_index.key_for_iteration)
							is_candidate := an_rm_type.as_lower.is_equal (arch_id.rm_entity.as_lower)
							if is_candidate and an_rm_package /= Void then
								is_candidate := an_rm_package.as_lower.is_equal (arch_id.rm_name.as_lower)
							end
						else
							is_candidate := True
						end
						if is_candidate then
							Result.extend(archetype_index.key_for_iteration)
						end
					end
					archetype_index.forth
				end
			else
				Result.extend (get_msg_line("regex_e1", <<a_regex>>))
			end
		end

	last_stats_build_timestamp: DATE_TIME
			-- timestamp of stats build

	last_populate_timestamp: DATE_TIME
			-- timestamp of last populate or repopulate

feature -- Status Report

	adhoc_path_valid (a_full_path: STRING): BOOLEAN
			-- True if path is valid in adhoc repository
		do
			Result := source_repositories.adhoc_source_repository.is_valid_path (a_full_path)
		end

	has_item (an_item: ARCH_CAT_ITEM): BOOLEAN
			-- True if `an_item' in catalogue
		do
			Result := item_index.has_item (an_item)
		end

	has_item_with_id (an_id: STRING): BOOLEAN
			-- True if `an_id' exists in catalogue
		do
			Result := item_index.has (an_id.as_lower)
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			create archetype_index.make (0)
			create item_index.make (0)
			item_tree := Void
			compile_attempt_count := 0
		end

	populate
			-- Rebuild `archetype_index' and `item_index' from source repositories.
		local
			archs: ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
			parent_key, child_key: STRING
			added_during_pass: INTEGER
			status_list: ARRAY[INTEGER]
			i: INTEGER
		do
			if schema_load_counter < rm_schemas_access.load_count then
				initialise_item_tree_prototype
			end

			clone_item_tree_prototype

			from source_repositories.repositories.start until source_repositories.repositories.off loop
				source_repositories.repositories.item_for_iteration.populate
				archs := source_repositories.repositories.item_for_iteration.fast_archetype_list

				-- maintain a list indicating status of each attempted archetype; values:
				-- -1 = succeeded
				-- -2 = failed (duplicate)
				--  0 = not yet tried
				-- +ve number = number of passes attempted with no success
				create status_list.make_filled (0, 1, archs.count)

				from i := 0 until i > 0 and added_during_pass = 0 loop
					added_during_pass := 0
					across archs as archs_csr loop
						if status_list [archs_csr.target_index] >= 0 then
							parent_key := archs_csr.item.ontological_parent_name.as_lower
							if item_index.has (parent_key) then
								child_key := archs_csr.item.qualified_key
								if not item_index.has (child_key) then
									item_index.item (parent_key).put_child (archs_csr.item)
									item_index.force (archs_csr.item, child_key)
									archetype_index.force (archs_csr.item, archs_csr.item.qualified_name)
									added_during_pass := added_during_pass + 1
									status_list [archs_csr.target_index] := -1
								else
									post_error (Current, "populate", "arch_dir_dup_archetype", <<archs_csr.item.full_path>>)
									status_list [archs_csr.target_index] := -2
								end
							else
								status_list [archs_csr.target_index] := status_list [archs_csr.target_index] + 1
							end
						end
					end
					i := i + 1
				end

				-- now report on all the archetypes which could not be attached into the hierarchy
				from archs.start until archs.off loop
					if status_list [archs.index] > 0 then
						if archs.item.is_specialised then
							post_error (Current, "populate", "arch_dir_orphan_archetype", <<archs.item.ontological_parent_name, archs.item.qualified_name>>)
						else
							post_error (Current, "populate", "arch_dir_orphan_archetype_e2", <<archs.item.ontological_parent_name, archs.item.qualified_name>>)
						end
					end
					archs.forth
				end

				source_repositories.repositories.forth
			end
			create last_populate_timestamp.make_now
		end

feature -- Modification

	add_adhoc_item (full_path: attached STRING)
			-- Add the archetype designated by `full_path' to the ad hoc repository, and graft it into `directory'.
		require
			path_valid: adhoc_path_valid (full_path)
		local
			parent_key, child_key: STRING
			aca: ARCH_CAT_ARCHETYPE
		do
			if item_index.is_empty then
				clone_item_tree_prototype
			end

			source_repositories.adhoc_source_repository.add_item (full_path)
			aca := source_repositories.adhoc_source_repository.item (full_path)
			if source_repositories.adhoc_source_repository.has_path (full_path) then
				parent_key := aca.ontological_parent_name.as_lower
				if item_index.has (parent_key) then
					child_key := aca.qualified_key
					if not item_index.has (child_key) then
						item_index.item (parent_key).put_child(aca)
						item_index.force (aca, child_key)
						archetype_index.force (aca, child_key)
						last_adhoc_item := aca
					else
						post_error (Current, "add_adhoc_item", "arch_dir_dup_archetype", <<full_path>>)
					end
				elseif aca.is_specialised then
					post_error (Current, "add_adhoc_item", "arch_dir_orphan_archetype", <<parent_key, child_key>>)
				else
					post_error (Current, "add_adhoc_item", "arch_dir_orphan_archetype_e2", <<parent_key, child_key>>)
				end
			else
				post_error (Current, "add_adhoc_item", "invalid_filename_e1", <<full_path>>)
			end
		end

	last_adhoc_item: ARCH_CAT_ARCHETYPE
			-- adhoc archetype added by last call to `add_adhoc_item'

	update_archetype_id (aca: attached ARCH_CAT_ARCHETYPE)
			-- move `ara' in tree according to its current and old ids
		require
			old_id_valid: attached aca.old_id and then archetype_index.has (aca.old_id.as_string) and then archetype_index.item (aca.old_id.as_string) = aca
			new_id_valid: not archetype_index.has (aca.id.as_string)
			ontological_parent_exists: item_index.has (aca.ontological_parent_name.as_lower)
		do
			archetype_index.remove (aca.old_id.as_string)
			archetype_index.force (aca, aca.id.as_string)
			item_index.remove (aca.old_id.as_string.as_lower)
			item_index.force (aca, aca.id.as_string.as_lower)
			aca.parent.remove_child (aca)
			item_index.item (aca.ontological_parent_name).put_child (aca)
			aca.clear_old_ontological_parent_name
		ensure
			Node_added_to_archetype_index: archetype_index.has (aca.id.as_string)
			Node_added_to_ontology_index: item_index.has (aca.id.as_string)
			Node_parent_set: aca.parent.qualified_name.is_equal (aca.ontological_parent_name)
		end

feature -- Traversal

	do_all (enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]])
			-- On all nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		require
			enter_action_attached: attached enter_action
		do
			do_subtree (item_tree, enter_action, exit_action)
		end

	do_archetypes (aci: ARCH_CAT_ITEM; action: attached PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]])
			-- Execute `action' on all archetypes found below `aci' in the tree
		do
			do_subtree (aci, agent do_if_archetype (?, action), Void)
		end

	do_all_archetypes (action: attached PROCEDURE [ANY, TUPLE [attached ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes, execute `action'
		do
			do_subtree (item_tree, agent do_if_archetype (?, action), Void)
		end

	do_if_archetype (aci: ARCH_CAT_ITEM; action: attached PROCEDURE [ANY, TUPLE [attached ARCH_CAT_ARCHETYPE]])
			-- If `aci' is an archetype, perform `action' on it.
		do
			if attached {ARCH_CAT_ARCHETYPE} aci as aca then
				action.call ([aca])
			end
		end

	do_archetype_lineage (aca: ARCH_CAT_ARCHETYPE; action: attached PROCEDURE [ANY, TUPLE [attached ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes from top to `aca', execute `action'
		local
			csr: ARCH_CAT_ARCHETYPE
			lineage: attached ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
		do
			create lineage.make (1)
			from csr := aca until csr = Void loop
				lineage.put_front (csr)
				csr := csr.specialisation_parent
			end
			lineage.do_all (action)
		end

feature -- Metrics

	archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.
		do
			Result := archetype_index.count
		end

	template_count: INTEGER
			-- count of artefacts designated as templates or template_components
		do
			from archetype_index.start until archetype_index.off loop
				if archetype_index.item_for_iteration.artefact_type /= {ARTEFACT_TYPE}.archetype then
					Result := Result + 1
				end
				archetype_index.forth
			end
		end

	compile_attempt_count: INTEGER
			-- Count of archetypes for which compiling has been attempted.

	update_compile_attempt_count
			-- Increment the count of archetypes for which parsing has been attempted.
		require
			can_increment: compile_attempt_count < archetype_count
		do
			compile_attempt_count := compile_attempt_count + 1
		ensure
			incremented: compile_attempt_count = old compile_attempt_count + 1
		end

	decrement_compile_attempt_count
			-- Decrement the count of archetypes for which parsing has been attempted.
		require
			can_decrement: compile_attempt_count > 0
		do
			compile_attempt_count := compile_attempt_count - 1
		ensure
			decremented: compile_attempt_count = old compile_attempt_count - 1
		end

feature -- Statistics

	can_build_statistics: BOOLEAN
		do
			Result := compile_attempt_count = archetype_count
		end

	catalogue_metrics: HASH_TABLE [INTEGER, STRING]

	terminology_bindings_statistics: HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- table of archetypes containing terminology bindings, keyed by terminology;
			-- some archetypes have more than one binding, so could appear in more than one list

	reset_statistics
			-- Reset counters to zero.
		do
			create terminology_bindings_statistics.make(0)
			create stats.make (0)
			create catalogue_metrics.make (catalogue_metric_names.count)
			Catalogue_metric_names.do_all (
				agent (metric_name: STRING)
					do
						catalogue_metrics.put (0, metric_name)
					end
			)
			last_stats_build_timestamp := Void
		end

	build_detailed_statistics
		require
			can_build_statistics
		do
			if not attached last_stats_build_timestamp or else last_stats_build_timestamp < last_populate_timestamp then
				reset_statistics
				do_all_archetypes (agent gather_statistics)
				catalogue_metrics.put (archetype_count, Total_archetype_count)
				create last_stats_build_timestamp.make_now
			end
		end

	stats: HASH_TABLE [ARCHETYPE_STATISTICAL_REPORT, STRING]
			-- table of aggregated stats, keyed by BMM_SCHEMA id to which the contributing archetypes relate
			-- (a single logical archetpe repository can contain archetypes of multiple RMs)

feature {NONE} -- Implementation

	do_subtree (node: ARCH_CAT_ITEM; enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]])
			-- On `node', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		require
			enter_action_attached: enter_action /= Void
		do
			if attached node then
				enter_action.call ([node])
				if node.has_children then
					from node.child_start until node.child_off loop
						do_subtree (node.child_item, enter_action, exit_action)
						node.child_forth
					end
				end
				if attached exit_action then
					exit_action.call ([node])
				end
			end
		end

	item_tree: ARCH_CAT_MODEL_NODE
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- The contents of the structure consist of archetypes found in the reference and
			-- working repositories, and are subsequently attached into the structure.
			-- Archetypes opened adhoc are also grafted here.

	item_tree_prototype: CELL [ARCH_CAT_MODEL_NODE]
			-- pure ontology structure created from RM schemas; to be used to create a copy for each refresh of the repository
			-- We use a CELL here because we only want one of these shared between all instances
		once
			create Result.put (Void)
		end

	initialise_item_tree_prototype
			-- rebuild `item_tree_prototype'
		local
			rm_closure_root_pkg: BMM_PACKAGE_DEFINITION
			parent_model_node, model_node: ARCH_CAT_MODEL_NODE
			rm_closure_name, qualified_rm_closure_key: STRING
			supp_list, supp_list_copy: ARRAYED_SET[STRING]
			supp_class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			root_classes: ARRAYED_SET [BMM_CLASS_DEFINITION]
			removed: BOOLEAN
			bmm_schema: BMM_SCHEMA
		do
			create parent_model_node.make_category (Archetype_category.twin)
debug ("rm_ontology")
	io.put_string ("Category: " + Archetype_category + "%N")
end
			item_tree_prototype.put (parent_model_node)
			from rm_schemas_access.valid_top_level_schemas.start until rm_schemas_access.valid_top_level_schemas.off loop
				bmm_schema := rm_schemas_access.valid_top_level_schemas.item_for_iteration
				from bmm_schema.archetype_rm_closure_packages.start until bmm_schema.archetype_rm_closure_packages.off loop
					rm_closure_name := package_base_name (bmm_schema.archetype_rm_closure_packages.item)
					qualified_rm_closure_key := publisher_qualified_rm_closure_key (bmm_schema.rm_publisher, rm_closure_name)
					rm_closure_root_pkg := bmm_schema.package_at_path (bmm_schema.archetype_rm_closure_packages.item)

					-- create new model node if not already in existence
					if not parent_model_node.has_child_with_qualified_key (qualified_rm_closure_key) then
						create model_node.make_rm_closure (rm_closure_name, bmm_schema)
						parent_model_node.put_child (model_node)
debug ("rm_ontology")
	io.put_string ("%TClosure: " + rm_closure_name + "%N")
end
					elseif attached {ARCH_CAT_MODEL_NODE} parent_model_node.child_with_qualified_key (qualified_rm_closure_key) as mn then
						model_node := mn
debug ("rm_ontology")
	io.put_string ("%TClosure: " + qualified_rm_closure_key + "%N")
end
					end

					-- obtain the top-most classes from the package structure; they might not always be in the top-most
					-- package
					root_classes := rm_closure_root_pkg.root_classes
debug ("rm_ontology")
	io.put_string ("%TInitial class set: ")
	root_classes.linear_representation.do_all (agent (a_bmm_class: BMM_CLASS_DEFINITION) do io.put_string (a_bmm_class.name + ", ") end)
	io.new_line
end
					if not root_classes.is_empty then
						-- create the list of supplier classes for all the classes in the closure root package
						create supp_list.make (0)
						supp_list.compare_objects
						from root_classes.start until root_classes.off loop
							supp_list.merge (root_classes.item.supplier_closure)
							supp_list.extend (root_classes.item.name)
							root_classes.forth
						end

						-- now filter this list to keep only those classes inheriting from the archetype_parent_class
						-- that are among the suppliers of the top-level class of the package; this gives the classes
						-- that could be archetyped in that package
						if bmm_schema.has_archetype_parent_class then
							from supp_list.start until supp_list.off loop
								if not bmm_schema.is_descendant_of (supp_list.item, bmm_schema.archetype_parent_class) then
									supp_list.remove
								else
									supp_list.forth
								end
							end
						end

						-- filter list list again so that only highest class in any inheritance subtree remains
						supp_list_copy := supp_list.deep_twin
						from supp_list.start until supp_list.off loop
							removed := False
							from supp_list_copy.start until supp_list_copy.off or removed loop
								if bmm_schema.is_descendant_of (supp_list.item, supp_list_copy.item) then
									supp_list.remove
									removed := True
								end
								supp_list_copy.forth
							end

							if not removed then
								supp_list.forth
							end
						end

						-- convert to BMM_CLASS_DESCRIPTORs
						create supp_class_list.make(0)
						from supp_list.start until supp_list.off loop
							supp_class_list.extend (bmm_schema.class_definition (supp_list.item))
							supp_list.forth
						end
						add_child_nodes (rm_closure_name, supp_class_list, model_node)
					end
					bmm_schema.archetype_rm_closure_packages.forth
				end
				rm_schemas_access.valid_top_level_schemas.forth
			end
		end

	add_child_nodes (an_rm_closure_name: STRING; class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]; a_parent_node: ARCH_CAT_MODEL_NODE)
			-- populate child nodes of a node in catalogue with immediate descendants of classes in `class_list'
			-- put each node into `item_index', keyed by `an_rm_closure_name' + '-' + `class_list.item.name',
			-- which will match with corresponding part of archetype identifier
		local
			children: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			model_node: ARCH_CAT_MODEL_NODE
		do
			from class_list.start until class_list.off loop
				create model_node.make_class (an_rm_closure_name, class_list.item)
				a_parent_node.put_child (model_node)
debug ("rm_ontology")
	io.put_string ("%T%TClass: " + class_list.item.name + "%N")
end
				children := class_list.item.immediate_descendants
				add_child_nodes (an_rm_closure_name, children, model_node)
				class_list.forth
			end
		end

	clone_item_tree_prototype
			-- clone `item_tree_prototype' for use in an `item_tree'
		do
			item_tree := item_tree_prototype.item.deep_twin
			create item_index.make (0)
			do_all (agent (ari: attached ARCH_CAT_ITEM) do item_index.force (ari, ari.qualified_key) end, Void)
		end

	schema_load_counter: INTEGER
			-- track loading of schemas; when changed, re-intialise the ontology prototype

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

	gather_statistics (aca: attached ARCH_CAT_ARCHETYPE)
			-- Update statistics counters from `aca'
		local
			terminologies: ARRAYED_LIST [STRING]
		do
			if aca.is_specialised then
				catalogue_metrics.force (catalogue_metrics.item (specialised_archetype_count) + 1, specialised_archetype_count)
			end
			if aca.has_slots then
				catalogue_metrics.force (catalogue_metrics.item (client_archetype_count) + 1, client_archetype_count)
			end
			if aca.is_supplier then
				catalogue_metrics.force (catalogue_metrics.item (supplier_archetype_count) + 1, supplier_archetype_count)
			end

			-- RM stats
			if aca.is_valid then
				catalogue_metrics.force (catalogue_metrics.item (valid_archetype_count) + 1, valid_archetype_count)

				terminologies := aca.differential_archetype.ontology.terminologies_available
				from terminologies.start until terminologies.off loop
					if not terminology_bindings_statistics.has (terminologies.item) then
						terminology_bindings_statistics.put (create {ARRAYED_LIST[STRING]}.make(0), terminologies.item)
					end
					terminology_bindings_statistics.item (terminologies.item).extend (aca.qualified_name)
					terminologies.forth
				end

				aca.generate_statistics (True)
				if stats.has (aca.rm_schema.schema_id) then
					stats.item (aca.rm_schema.schema_id).merge (aca.statistical_analyser.stats)
				else
					stats.put (aca.statistical_analyser.stats.duplicate, aca.rm_schema.schema_id)
				end
			end
		end

invariant
	parse_attempted_archetype_count_valid: compile_attempt_count >= 0 and compile_attempt_count <= archetype_count

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
--| The Original Code is archetype_directory.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2008
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
