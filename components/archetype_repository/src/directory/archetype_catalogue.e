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

	SELECTION_HISTORY [ARCH_CAT_ITEM]

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

create
	make

feature -- Definitions

	Archetype_category: STRING = "archetypes"

	Template_category: STRING = "templates"

feature -- Initialisation

	make
		do
			clear
			if ontology_prototype.item = Void then
				initialise_ontology_prototype
				schema_load_counter := rm_schemas_access.load_count
			end
		end

feature -- Access

	archetype_index: attached DS_HASH_TABLE [ARCH_CAT_ARCHETYPE, STRING]
			-- index of archetype descriptors. Used in rest of application

	ontology_index: attached DS_HASH_TABLE [ARCH_CAT_ITEM, STRING]
			-- Index of archetype & class nodes, keyed by ontology concept. Used during construction of `directory'
			-- For class nodes, this will be model_publisher-model_name-class_name, e.g. OPENEHR-DEMOGRAPHIC-PARTY.
			-- For archetype nodes, this will be the archetype id.

	selected_archetype: ARCH_CAT_ARCHETYPE
			-- The archetype at `selected_item'.
		do
			Result ?= selected_item
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

	selected_class: ARCH_CAT_MODEL_NODE
			-- The model node at `selected_item'.
		do
			Result ?= selected_item
			if attached Result and not Result.is_class then
				Result := Void
			end
		ensure
			consistent_with_history: attached Result implies Result = selected_item
		end

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
				Result.extend(create_message_line("regex_e1", <<a_regex>>))
			end
		end

feature -- Statistics

	total_archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.

	specialised_archetype_count: INTEGER
			-- Count of specialised archetype descriptors in directory.

	client_archetype_count: INTEGER
			-- Count of slot-containing archetype descriptors in directory.

	supplier_archetype_count: INTEGER
			-- Count of archetype descriptors for archetypes used in slots in directory.

	bad_archetype_count: INTEGER
			-- Count of invalid archetype files found in repositories.

	compile_attempt_count: INTEGER
			-- Count of archetypes for which parsing has been attempted.

	terminology_bindings_info: HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			-- table of archetypes containing terminology bindings, keyed by terminology;
			-- some archetypes have more than one binding, so could appear in more than one list

feature -- Status Report

	has_selected_archetype: BOOLEAN
			-- Has an archetype been selected?
		do
			Result := attached selected_archetype
		end

	has_validated_selected_archetype: BOOLEAN
			-- Has a valid archetype been selected?
		do
			Result := attached selected_archetype and then selected_archetype.is_valid
		end

	has_selected_class: BOOLEAN
			-- Has a class been selected?
		do
			Result := attached selected_class
		end

	adhoc_path_valid (a_full_path: STRING): BOOLEAN
			-- True if path is valid in adhoc repository
		do
			Result := source_repositories.adhoc_source_repository.is_valid_path (a_full_path)
		end

	item_selectable (an_item_id: STRING): BOOLEAN
			-- True if item can be selected
		do
			Result := archetype_index.has (an_item_id)
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			clear_selection_history
			create archetype_index.make (0)
			create ontology_index.make (0)
			ontology := Void
			reset_statistics
		end

	populate
			-- Rebuild `archetype_index' and `ontology_index' from source repositories.
		local
			archs: ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
			parent_key, child_key: STRING
			added_during_pass: INTEGER
			status_list: ARRAY[INTEGER]
			i: INTEGER
		do
			if schema_load_counter < rm_schemas_access.load_count then
				initialise_ontology_prototype
			end

			clone_ontology_prototype

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
					from archs.start until archs.off loop
						if status_list [archs.index] >= 0 then
							parent_key := archs.item.ontological_parent_name.as_upper
							if ontology_index.has (parent_key) then
								child_key := archs.item.qualified_key
								if not ontology_index.has (child_key) then
									ontology_index.item (parent_key).put_child (archs.item)
									ontology_index.force (archs.item, child_key)
									archetype_index.force (archs.item, archs.item.qualified_name)
									update_basic_statistics (archs.item)
									added_during_pass := added_during_pass + 1
									status_list [archs.index] := -1
								else
									post_error (Current, "populate", "arch_dir_dup_archetype", <<archs.item.full_path>>)
									status_list [archs.index] := -2
								end
							else
								status_list [archs.index] := status_list [archs.index] + 1
							end
						end
						archs.forth
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
		end

	update_basic_statistics (ara: attached ARCH_CAT_ARCHETYPE)
			-- Update statistics counters.
		do
			total_archetype_count := total_archetype_count + 1
			if ara.is_specialised then
				specialised_archetype_count := specialised_archetype_count + 1
			end
		end

	update_slot_statistics (ara: attached ARCH_CAT_ARCHETYPE)
			-- Update slot-related statistics counters.
		do
			if ara.has_slots then
				client_archetype_count := client_archetype_count + 1
			end

			if ara.is_supplier then
				supplier_archetype_count := supplier_archetype_count + 1
			end
		end

	update_terminology_bindings_info (aca: attached ARCH_CAT_ARCHETYPE)
			-- Update term binding info
		local
			terminologies: ARRAYED_LIST [STRING]
		do
			terminologies := aca.differential_archetype.ontology.terminologies_available
			from terminologies.start until terminologies.off loop
				if not terminology_bindings_info.has(terminologies.item) then
					terminology_bindings_info.put(create {ARRAYED_LIST[STRING]}.make(0), terminologies.item)
				end
				terminology_bindings_info.item (terminologies.item).extend(aca.qualified_name)
				terminologies.forth
			end
		end

	update_compile_attempt_count
			-- Increment the count of archetypes for which parsing has been attempted.
		require
			can_increment: compile_attempt_count < total_archetype_count
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

	reset_statistics
			-- Reset counters to zero.
		do
			total_archetype_count := 0
			specialised_archetype_count := 0
			client_archetype_count := 0
			supplier_archetype_count := 0
			bad_archetype_count := 0
			compile_attempt_count := 0
			create terminology_bindings_info.make(0)
		end

	build_detailed_staistics
		do
	--		create statistics_analyser.make ()
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
			if ontology_index.is_empty then
				clone_ontology_prototype
			end

			source_repositories.adhoc_source_repository.add_item (full_path)
			aca := source_repositories.adhoc_source_repository.item (full_path)
			if source_repositories.adhoc_source_repository.has_path (full_path) then
				parent_key := aca.ontological_parent_name.as_upper
				if ontology_index.has (parent_key) then
					child_key := aca.qualified_key
					if not ontology_index.has (child_key) then
						ontology_index.item (parent_key).put_child(aca)
						ontology_index.force (aca, child_key)
						archetype_index.force (aca, child_key)
						update_basic_statistics (aca)
						set_selected_item (source_repositories.adhoc_source_repository.item (full_path))
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

	update_archetype_id (aca: attached ARCH_CAT_ARCHETYPE)
			-- move `ara' in tree according to its current and old ids
		require
			old_id_valid: attached aca.old_id and then archetype_index.has (aca.old_id.as_string) and then archetype_index.item (aca.old_id.as_string) = aca
			new_id_valid: not archetype_index.has(aca.id.as_string)
			ontological_parent_exists: ontology_index.has(aca.ontological_parent_name)
		do
			archetype_index.remove (aca.old_id.as_string)
			archetype_index.force (aca, aca.id.as_string)
			ontology_index.remove (aca.old_id.as_string)
			ontology_index.force (aca, aca.id.as_string)
			aca.parent.remove_child(aca)
			ontology_index.item (aca.ontological_parent_name).put_child (aca)
			aca.clear_old_ontological_parent_name
		ensure
			Node_added_to_archetype_index: archetype_index.has (aca.id.as_string)
			Node_added_to_ontology_index: ontology_index.has (aca.id.as_string)
			Node_parent_set: aca.parent.qualified_name.is_equal (aca.ontological_parent_name)
		end

feature -- Traversal

	do_all (enter_action, exit_action: PROCEDURE [ANY, TUPLE [ARCH_CAT_ITEM]])
			-- On all nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		require
			enter_action_attached: attached enter_action
		do
			do_subtree (ontology, enter_action, exit_action)
		end

	do_archetypes (ari: ARCH_CAT_ITEM; action: attached PROCEDURE [ANY, TUPLE [ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (ari, agent do_if_archetype (?, action), Void)
		end

	do_all_archetypes (action: attached PROCEDURE [ANY, TUPLE [attached ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes in tree, execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (ontology, agent do_if_archetype (?, action), Void)
		end

	do_if_archetype (ari: ARCH_CAT_ITEM; action: attached PROCEDURE [ANY, TUPLE [attached ARCH_CAT_ARCHETYPE]])
			-- If `ari' is an archetype, perform `action' on it.
		do
			if attached {ARCH_CAT_ARCHETYPE} ari as ara then
				action.call ([ara])
			end
		end

	do_archetype_lineage (ara: ARCH_CAT_ARCHETYPE; action: attached PROCEDURE [ANY, TUPLE [attached ARCH_CAT_ARCHETYPE]])
			-- On all archetype nodes from top to , execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		local
			csr: ARCH_CAT_ARCHETYPE
			lineage: attached ARRAYED_LIST [ARCH_CAT_ARCHETYPE]
		do
			create lineage.make (1)
			from csr := ara until csr = Void loop
				lineage.put_front (csr)
				csr := csr.specialisation_parent
			end
			lineage.do_all (action)
		end

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

	ontology: ARCH_CAT_MODEL_NODE
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- The contents of the structure consist of archetypes found in the reference and
			-- working repositories, and are subsequently attached into the structure.
			-- Archetypes opened adhoc are also grafted here.

	ontology_prototype: CELL [ARCH_CAT_MODEL_NODE]
			-- pure ontology structure created from RM schemas; to be used to create a copy for each refresh of the repository
			-- We use a CELL here because we only want one of these shared between all instances
		once
			create Result.put (Void)
		end

	initialise_ontology_prototype
			-- rebuild `ontology_prototype'
		local
			rm_closure_root_pkg: BMM_PACKAGE_DEFINITION
			parent_model_node, model_node: ARCH_CAT_MODEL_NODE
			rm_closure_name, qualified_rm_closure_name: STRING
			supp_list, supp_list_copy: ARRAYED_SET[STRING]
			supp_class_list: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			removed: BOOLEAN
			bmm_schema: BMM_SCHEMA
		do
			create parent_model_node.make_category (Archetype_category.twin)
			ontology_prototype.put (parent_model_node)
			from rm_schemas_access.valid_top_level_schemas.start until rm_schemas_access.valid_top_level_schemas.off loop
				bmm_schema := rm_schemas_access.valid_top_level_schemas.item_for_iteration
				from bmm_schema.archetype_rm_closure_packages.start until bmm_schema.archetype_rm_closure_packages.off loop
					rm_closure_name := package_base_name (bmm_schema.archetype_rm_closure_packages.item)
					qualified_rm_closure_name := publisher_qualified_rm_closure_key (bmm_schema.rm_publisher, rm_closure_name)
					rm_closure_root_pkg := bmm_schema.package_at_path (bmm_schema.archetype_rm_closure_packages.item)
					if not rm_closure_root_pkg.classes.is_empty then
						-- create new model node if not already in existence
						if not parent_model_node.has_child_with_qualified_name (qualified_rm_closure_name) then
							create model_node.make_rm_closure (rm_closure_name, bmm_schema)
							parent_model_node.put_child (model_node)
						else
							model_node ?= parent_model_node.child_with_qualified_name (qualified_rm_closure_name)
						end

						create supp_list.make (0)
						supp_list.compare_objects
						from rm_closure_root_pkg.classes.start until rm_closure_root_pkg.classes.off loop
							supp_list.merge (rm_closure_root_pkg.classes.item.supplier_closure)
							supp_list.extend (rm_closure_root_pkg.classes.item.name)
							rm_closure_root_pkg.classes.forth
						end

						-- now create a list of classes inheriting from LOCATABLE that are among the suppliers of
						-- the top-level class of the package; this gives the classes that could be archetyped in
						-- that package
						if bmm_schema.has_archetype_parent_class then
							from supp_list.start until supp_list.off loop
								if not bmm_schema.is_descendant_of (supp_list.item, bmm_schema.archetype_parent_class) then
									supp_list.remove
								else
									supp_list.forth
								end
							end
						end

						-- clean suppliers list so that only highest class in any inheritance subtree remains
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
			-- put each node into `ontology_index', keyed by `an_rm_closure_name' + '-' + `class_list.item.name',
			-- which will match with corresponding part of archetype identifier
		local
			children: ARRAYED_LIST [BMM_CLASS_DEFINITION]
			model_node: ARCH_CAT_MODEL_NODE
		do
			from class_list.start until class_list.off loop
				create model_node.make_class (an_rm_closure_name, class_list.item)
				a_parent_node.put_child (model_node)
				children := class_list.item.immediate_descendants
				add_child_nodes (an_rm_closure_name, children, model_node)
				class_list.forth
			end
		end

	clone_ontology_prototype
			-- clone `ontology_prototype' and `ontology_index_prototype'
		do
			ontology := ontology_prototype.item.deep_twin
			create ontology_index.make (0)
			do_all (agent (ari: attached ARCH_CAT_ITEM) do ontology_index.force (ari, ari.qualified_name.as_upper) end, Void)
		end

	schema_load_counter: INTEGER
			-- track loading of schemas; when changed, re-intialise the ontology prototype

	statistics_analyser: ARCHETYPE_STATISTICAL_ANALYSER

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

	selectable_item_by_id (an_item_id: STRING): ARCH_CAT_ITEM
			-- obtain a selectable item via an id
		do
			Result := archetype_index.item (an_item_id)
		end

invariant
	total_archetype_count_non_negative: total_archetype_count >= 0
	specialised_archetype_count_valid: specialised_archetype_count >= 0 and specialised_archetype_count <= total_archetype_count
	slotted_archetype_count_valid: client_archetype_count >= 0 and client_archetype_count <= total_archetype_count
	used_by_archetype_count_valid: supplier_archetype_count >= 0 and supplier_archetype_count <= total_archetype_count
	bad_archetype_count_count_valid: bad_archetype_count >= 0 and bad_archetype_count <= total_archetype_count
	parse_attempted_archetype_count_valid: compile_attempt_count >= 0 and compile_attempt_count <= total_archetype_count

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
