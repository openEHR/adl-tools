note
	component:   "openEHR Archetype Project"
	description: "[
				 Validator of standalone archetype i.e. without need of flattened parent archetype
				 in the case of specialised archetypes.
		         ]"
	keywords:    "constraint model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_PHASE_1_VALIDATOR

inherit
	ARCHETYPE_VALIDATOR
		redefine
			validate, target
		end

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ADL_SYNTAX_CONVERTER
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY
		export
			{NONE} all
		end

feature -- Access

	target: DIFFERENTIAL_ARCHETYPE
			-- differential archetype being validated

feature -- Status Report

	is_validation_candidate (ara: attached ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := attached ara.differential_archetype
		end

feature -- Validation

	validate
		do
			reset

			-- basic validation
			validate_basics

			-- languages and meta-data
			if passed then
				precursor
				validate_languages
			end

			-- validation requiring the archetype xref tables
			if passed then
				validate_slots
				validate_suppliers
				validate_invariants
			end

			-- basic validation ontology
			if passed then
				report_unused_ontology_codes
				validate_ontology_code_spec_levels
			end

			-- build slots map
			if passed and target.has_slots then
				build_slot_id_index
			end
		end

feature {NONE} -- Implementation

	validate_basics
			-- are basic features of archetype structurally intact and correct?
			-- into account validity with respect to parent archetypes.
		do
			if not target_descriptor.id.as_string.is_equal (target.archetype_id.as_string) then
				-- this is a serious error, because it means that the archteype and its descriptor are
				-- out of sync, due to some uncontrolled modification on the archetype
				add_warning("validate_e3", <<target_descriptor.id.as_string, target.archetype_id.as_string>>)
			elseif not target.definition.rm_type_name.is_equal (target.archetype_id.rm_entity) then
				add_error("VARDT", <<target.archetype_id.rm_entity, target.definition.rm_type_name>>)
			elseif target_descriptor.is_specialised then
				if target.specialisation_depth /= target_descriptor.specialisation_parent.flat_archetype.specialisation_depth + 1 then
					add_error("VACSD", <<specialisation_depth_from_code (target.concept).out, target.specialisation_depth.out>>)
				end
 			elseif specialisation_depth_from_code (target.concept) /= 0 then
 				add_error("VACSDtop", <<specialisation_depth_from_code (target.concept).out>>)
			end
		end

	validate_languages
			-- check to see that all linguistic items in ontology, description, etc are all coherent
		local
			langs: ARRAYED_SET [STRING]
			err_str: STRING
		do
			-- check that languages defined in translations section are in the archetype ontology
			langs := target.languages_available
			if not langs.is_subset (target.ontology.languages_available) then
				create err_str.make (0)
				from langs.start until langs.off loop
					if not target.ontology.languages_available.has (langs.item) then
						if not err_str.is_empty then
							err_str.append (", ")
						end
						err_str.append (langs.item)
					end
					langs.forth
				end
				add_error("VOTM", <<err_str>>)
			end
		end

	validate_slots
			-- check that all slot definitions are valid, according to logic:
			-- 	IF includes not empty and = 'any' THEN
			--		not (excludes empty or /= 'any') ==> Error
			-- 	ELSEIF includes not empty and /= 'any' THEN
			--		not (excludes empty or = 'any') ==> Error
			--	END
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
		do
			from target.slot_index.start until target.slot_index.off loop
				includes := target.slot_index.item.includes
				excludes := target.slot_index.item.excludes

				if not includes.is_empty and includes.first.matches_any then
					if not (excludes.is_empty or not excludes.first.matches_any) then
						add_error("VDSEV1", <<target.slot_index.item.rm_type_name, target.slot_index.item.path>>)
					end
				elseif not includes.is_empty and not includes.first.matches_any then
					if not (excludes.is_empty or excludes.first.matches_any) then
						add_error("VDSEV2", <<target.slot_index.item.rm_type_name, target.slot_index.item.path>>)
					end
				end

				target.slot_index.forth
			end
		end

	validate_suppliers
			-- validate all C_ARCHETYPE_ROOT objects in a basic way
		local
			c_ar_list: ARRAYED_LIST [C_ARCHETYPE_ROOT]
			filler_id: ARCHETYPE_ID
		do
			from target.suppliers_index.start until target.suppliers_index.off loop
				if not current_arch_cat.archetype_index.has (target.suppliers_index.key_for_iteration) then
					add_error("VARXR", <<target.suppliers_index.item_for_iteration.first.parent.path, target.suppliers_index.key_for_iteration>>)
				end

				-- check that the RM type in the archetype references is compatible with the RM type of the C_ARCHETYPE_ROOT node
				c_ar_list := target.suppliers_index.item_for_iteration
				from c_ar_list.start until c_ar_list.off loop
					create filler_id.make_from_string (c_ar_list.item.archetype_id)
					if not (c_ar_list.item.rm_type_name.is_equal (filler_id.rm_entity) or else
						rm_schema.type_conforms_to (c_ar_list.item.rm_type_name, filler_id.rm_entity)) then
						add_error("VARXTV", <<c_ar_list.item.archetype_id, c_ar_list.item.rm_type_name>>)
					end
					c_ar_list.forth
				end
				target.suppliers_index.forth
			end
		end

	validate_ontology_code_spec_levels
			-- See if there are any codes in the ontology that should not be there - either or lower or higher
			-- level of specialisation.
		do
			from ontology.term_codes.start until ontology.term_codes.off loop
				if specialisation_depth_from_code (ontology.term_codes.item) /= ontology.specialisation_depth then
					add_error ("VONSD", <<ontology.term_codes.item>>)
				end
				ontology.term_codes.forth
			end
			from ontology.constraint_codes.start until ontology.constraint_codes.off loop
				if specialisation_depth_from_code (ontology.constraint_codes.item) /= ontology.specialisation_depth then
					add_error ("VONSD", <<ontology.constraint_codes.item>>)
				end
				ontology.constraint_codes.forth
			end
		end

	validate_invariants
			-- validate the invariants if any, which entails checking that all path references are valid against
			-- the flat archetype if specialised
			-- FIXME: do the actual validation
		do
			if target.has_invariants then
				from target.invariants_index.start until target.invariants_index.off loop
					convert_invariant_paths (target.invariants_index.item_for_iteration, target)
					target.invariants_index.forth
				end
			end
		end

	report_unused_ontology_codes
			-- populate lists of at-codes and ac-codes found in ontology that
			-- are not referenced anywhere in the archetype definition
		do
			from target.ontology_unused_term_codes.start until target.ontology_unused_term_codes.off loop
				add_warning ("WOUC", <<target.ontology_unused_term_codes.item>>)
				target.ontology_unused_term_codes.forth
			end
			from target.ontology_unused_constraint_codes.start until target.ontology_unused_constraint_codes.off loop
				add_warning ("WOUC", <<target.ontology_unused_constraint_codes.item>>)
				target.ontology_unused_constraint_codes.forth
			end
		end

	build_slot_id_index
			-- build slot_id_index in ARCH_REP_ARCHETYPE.
			-- Current slot logic of include/exclude lists:
			-- 	IF includes not empty and /= 'any' THEN
			-- 		IF not excludes empty THEN -- excludes must = any; means not a recommendation
			--			create match list = includes constraint
			--		ELSE -- it is just a recommendation;formally it means match all
			--			create match list = all archetypes of compatible RM type
			--		END
			--	ELSEIF excludes not empty and /= 'any' THEN
			-- 		IF not includes empty THEN -- includes must = any; means not a recommendation
			--			create match list = all achetypes - excludes constraint matchlist
			--		ELSE -- just a recommendation; formally it means match all
			--			create match list = all archetypes of compatible RM type
			--		END
			--  ELSE
			--		create match list = all archetypes of compatible RM type
			--	END
		require
			target.has_slots
		local
			includes, excludes: ARRAYED_LIST[ASSERTION]
			id_list: ARRAYED_LIST[STRING]
			ara: ARCH_CAT_ARCHETYPE
		do
			from target.slot_index.start until target.slot_index.off loop
				-- process the includes
				includes := target.slot_index.item.includes
				excludes := target.slot_index.item.excludes
				if not includes.is_empty and not includes.first.matches_any then
					if not excludes.is_empty then -- create specific match list from includes constraint
						from includes.start until includes.off loop
							if attached {STRING} includes.item.extract_regex as a_regex then
								target_descriptor.add_slot_ids (current_arch_cat.matching_ids (a_regex, target.slot_index.item.rm_type_name, Void), target.slot_index.item.path)
							end
							includes.forth
						end
					else -- excludes = empty ==> includes is just a recommendation => match all archetype ids of RM type
						target_descriptor.add_slot_ids (current_arch_cat.matching_ids (Regex_any_pattern, target.slot_index.item.rm_type_name, target.archetype_id.rm_name), target.slot_index.item.path)
					end
				elseif not excludes.is_empty and not excludes.first.matches_any then
					target_descriptor.add_slot_ids (current_arch_cat.matching_ids (Regex_any_pattern, target.slot_index.item.rm_type_name, Void), target.slot_index.item.path)
					if not includes.is_empty then -- means excludes is not a recommendation; need to actually process it
						from excludes.start until excludes.off loop
							if attached {STRING} excludes.item.extract_regex as a_regex then
								id_list := current_arch_cat.matching_ids (a_regex, target.slot_index.item.rm_type_name, target.archetype_id.rm_name)
								from id_list.start until id_list.off loop
									target_descriptor.slot_id_index.item (target.slot_index.item.path).prune (id_list.item)
									id_list.forth
								end
							end
							excludes.forth
						end
					end
				else
					target_descriptor.add_slot_ids (current_arch_cat.matching_ids (Regex_any_pattern, target.slot_index.item.rm_type_name, target.archetype_id.rm_name), target.slot_index.item.path)
				end

				-- now post the results in the reverse indexes
				id_list := target_descriptor.slot_id_index.item (target.slot_index.item.path)
				from id_list.start until id_list.off loop
					ara := current_arch_cat.archetype_index.item (id_list.item)
					if not ara.is_supplier or else not ara.clients_index.has (target.archetype_id.as_string) then
						ara.add_client (target.archetype_id.as_string)
					end
					id_list.forth
				end
				target.slot_index.forth
			end
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
--| The Original Code is archetype_source_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
