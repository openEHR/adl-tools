note
	component:   "openEHR Archetype Project"
	description: "[
				 Profile of common settings relating to use of reference model(s) and terminology for a
				 given arhetype developing organisation.
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class AOM_PROFILE

inherit
	ANY_VALIDATOR

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	SHARED_REFERENCE_MODEL_ACCESS

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

create
	make_dt

feature -- Initialisation

	make_dt (make_args: ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			reset
			create profile_name.make_from_string (Default_aom_profile_name)
			create rm_schema_patterns.make (0)
			create rm_schemas.make (0)
			create archetype_rm_closure_packages.make (0)
			create file_path.make_empty
		end

feature -- Identification

	profile_name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

feature -- Access (attributes from file)

	rm_schema_patterns: ARRAYED_LIST [STRING]
			-- PERL regex based on id of publisher of Reference Models to which this profile applies.
			-- This is used to match the 'schema_id' generated in BMM_SCHEMA class based on model
			-- publisher, model name, model release found in .bmm files.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	terminology_profile: detachable AOM_TERMINOLOGY_PROFILE
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	archetype_parent_class: detachable STRING
			-- name of a parent class used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_data_value_parent_class: detachable STRING
			-- name of a parent class of logical 'data types' used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_rm_closure_packages: ARRAYED_SET [STRING]
			-- list of top-level package paths that provide the RM 'model' part in achetype identifiers,
			-- e.g. the path "org.openehr.ehr" gives "EHR" in "openEHR-EHR". Within this namespace,
			-- archetypes can be based on any class reachable from classes defined directly in these packages
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	archetype_visualise_descendants_of: detachable STRING
			-- If archetype_parent_class is not set, designate a class whose descendants should be
			-- made visible in tree and grid renderings of the archetype definition. For openEHR
			-- and CEN this class is normally the same as the archetype_parent_class, i.e. LOCATABLE
			-- and RECORD_COMPONENT respectively. It is typically set for CEN, because archetype_
			-- parent_class may not be stated, due to demographic types not inheriting from it.
			--
			-- The effect of this attribute in visualisation is to generate the most natural tree or
			-- grid-based view of an archetype definition, from the semantic viewpoint.

feature -- Access

	file_path: STRING

	rm_schemas: ARRAYED_LIST [STRING]
			-- list of rm schemas matched by `rm_schema_patterns'

feature -- Validation

	validate
		do
			if profile_name.is_equal (Default_aom_profile_name) then
				add_error ("ARP_no_profile_name", <<file_path>>)
			end
			if rm_schemas.is_empty then
				add_error ("ARP_no_matching_schemas", <<file_path>>)
			end
		end

feature -- Modification

	set_file_path (a_path: STRING)
		do
			file_path := a_path
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work: evaluate rm schema regexes
		local
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			across rm_schema_patterns as sch_csr loop
				get_regex_matches (sch_csr.item)
			end
		end

	get_regex_matches (a_regex: STRING)
			-- Finalisation work: evaluate rm schema regexes
		local
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			create regex_matcher.make
			regex_matcher.set_case_insensitive (True)
			regex_matcher.compile (a_regex)
			if regex_matcher.is_compiled then
				across rm_schema_ids as sch_ids_csr loop
					if regex_matcher.recognizes (sch_ids_csr.item) then
						rm_schemas.extend (sch_ids_csr.item)
					end
				end
			else
				add_error ("regex_e1", <<a_regex>>)
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
