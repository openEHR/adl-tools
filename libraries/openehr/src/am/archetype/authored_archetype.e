note
	component:   "openEHR ADL Tools"
	description: "Authored archetype abstraction"
	keywords:    "archetype, authored, metadata"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

 class AUTHORED_ARCHETYPE

inherit
	ARCHETYPE
		rename
			make as make_archetype,
			make_all as make_all_archetype,
			make_empty_differential as make_empty_differential_archetype,
			make_empty_differential_child as make_empty_differential_child_archetype
		undefine
			has_language, languages_available, has_matching_language_tag, original_language
		redefine
			default_create, make_from_other, overlay_differential, set_original_language, reduce_languages_to, add_language, set_is_valid
		end

	AUTHORED_RESOURCE
		undefine
			make_from_other
		redefine
			default_create, add_language, reduce_languages_to, set_original_language
		end

create
	default_create

create {ADL_14_ENGINE, ARCHETYPE}
	make

create {ADL_2_ENGINE, ADL_14_ENGINE, P_ARCHETYPE}
	make_all

create {ARCH_LIB_ARCHETYPE}
	make_empty_differential, make_empty_differential_child

feature -- Initialisation

	default_create
		do
			make_empty_differential (create {ARTEFACT_TYPE}.make_archetype, create {ARCHETYPE_HRID}.default_create, "1.0.0", default_language)
		end

	make (an_artefact_type: like artefact_type;
			an_adl_version: like adl_version;
			an_rm_release: like rm_release;
			an_id: like archetype_id;
			an_original_language: like original_language;
			a_uid: like uid;
			a_description: like description;
			a_definition: like definition;
			a_terminology: like terminology)
				-- make from pieces, typically obtained by parsing
		do
			make_archetype (an_artefact_type, an_id, a_definition, a_terminology)
			adl_version := an_adl_version
			rm_release := an_rm_release
			set_original_language (an_original_language)
			description := a_description
			uid := a_uid
		ensure then
			Adl_version_set: adl_version = an_adl_version
			Rm_release_set: rm_release = an_rm_release
			Original_language_set: original_language = an_original_language
			Description_set: description = a_description
			Uid_set: uid = a_uid
		end

	make_all (an_artefact_type: like artefact_type;
			an_adl_version: like adl_version;
			an_rm_release: like rm_release;
			an_id: like archetype_id;
			a_parent_archetype_id: like parent_archetype_id;
			is_controlled_flag: BOOLEAN;
			a_uid: like uid;
			an_other_metadata: like other_metadata;
			an_original_language: like original_language;
			a_translations: like translations;
			a_description: like description;
			a_definition: like definition;
			a_rules: like rules;
			a_terminology: like terminology;
			an_annotations: like annotations)
				-- make from all possible items
		require
			Translations_valid: attached a_translations as att_trans implies not att_trans.is_empty
			Rules_valid: attached a_rules as att_rules implies not att_rules.is_empty
		do
			make (an_artefact_type, an_adl_version, an_rm_release, an_id, an_original_language, a_uid, a_description, a_definition, a_terminology)
			parent_archetype_id := a_parent_archetype_id
			translations := a_translations
			is_controlled := is_controlled_flag
			other_metadata := an_other_metadata
			rules := a_rules
			annotations := an_annotations
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = an_adl_version
			Rm_release_set: rm_release = an_rm_release
			Is_controlled_set: is_controlled = is_controlled_flag
			Id_set: archetype_id = an_id
			Parent_id_set: parent_archetype_id = a_parent_archetype_id
			Original_language_set: original_language = an_original_language
			Translations_set: translations = a_translations
			Definition_set: definition = a_definition
			Invariants_set: rules = a_rules
			Terminology_set: terminology = a_terminology
			Is_differential_follows_terminology: is_differential = a_terminology.is_differential
			Is_dirty: is_dirty
			Not_generated: not is_generated
		end

	make_from_other (other: AUTHORED_ARCHETYPE)
			-- duplicate from another archetype
		do
			precursor {ARCHETYPE} (other)
			is_controlled := other.is_controlled
			adl_version := other.adl_version.twin
			rm_release := other.rm_release.twin
			if attached other.uid as att_other_uid then
				uid := att_other_uid.twin
			end
			set_original_language (other.original_language)
			if attached other.other_metadata as att_omd then
				other_metadata := att_omd.deep_twin
			end
			if attached other.translations as other_trans then
				translations := other_trans.deep_twin
			end
			description := other.description.deep_twin
			if attached other.annotations as other_annots then
				annotations := other_annots.deep_twin
			end
		ensure then
			Other_metadata_copied: attached other_metadata as att_omd implies (attached other.other_metadata as att_other_omd and then att_omd.is_deep_equal (att_other_omd))
			Translations_copied: attached translations as att_trans implies (attached other.translations as att_other_trans and then att_trans.is_deep_equal (att_other_trans))
			Description_copied: description.is_deep_equal (other.description)
			Annotations_copied: attached annotations as att_ann implies (attached other.annotations as att_other_ann and then att_ann.is_deep_equal (att_other_ann))
		end

feature {ARCH_LIB_ARCHETYPE} -- Initialisation

	make_empty_differential (an_artefact_type: ARTEFACT_TYPE; an_id: like archetype_id; an_rm_release, an_original_lang_str: STRING)
			-- make a new differential form archetype
		do
			create original_language.make (ts.default_language_code_set, an_original_lang_str)
			make_empty_differential_archetype (an_artefact_type, an_id, an_original_lang_str)
			create adl_version.make_from_string (Latest_adl_version)
			rm_release := an_rm_release
			create description.default_create
		ensure then
			Adl_version_set: adl_version.same_string (Latest_adl_version)
			Rm_release_set: rm_release = an_rm_release
		end

	make_empty_differential_child (an_artefact_type: ARTEFACT_TYPE; spec_depth: INTEGER; an_id: like archetype_id; a_parent_id, an_rm_release, an_original_lang_str: STRING)
			-- make a new differential form archetype as a child of `a_parent'
		do
			create original_language.make (ts.default_language_code_set, an_original_lang_str)
			make_empty_differential_child_archetype (an_artefact_type, spec_depth, an_id, a_parent_id, an_original_lang_str)
			create adl_version.make_from_string (Latest_adl_version)
			rm_release := an_rm_release
			create description.default_create
		ensure then
			Adl_version_set: adl_version.same_string (Latest_adl_version)
			Rm_release_set: rm_release = an_rm_release
		end

feature -- Access

	uid: detachable HIER_OBJECT_ID
			-- optional UID identifier of this artefact
			-- FIXME: should really be in AUTHORED_RESOURCE

	adl_version: STRING
			-- Semver.org compatible version of ADL/AOM used in this archetype

	rm_release: STRING
			-- Semver.org compatible release of the reference model on which the archetype was based.
			-- This does not imply conformance only to this release, since an archetype may
			-- be valid with respect to multiple releases of a reference model. Conformance is captured
			-- outside of the archetype.

	other_metadata: detachable HASH_TABLE [STRING, STRING]
			-- other top-level meta-data

feature -- Modification

	set_original_language (a_lang: TERMINOLOGY_CODE)
		do
			precursor {AUTHORED_RESOURCE} (a_lang)
			precursor {ARCHETYPE} (a_lang)
		end

	set_is_valid
		do
			precursor
			set_adl_version (latest_adl_version)
		end

	set_adl_version (a_ver: STRING)
			-- set `adl_version' with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: valid_standard_version(a_ver)
		do
			adl_version := a_ver
		end

	set_rm_release (a_ver: STRING)
			-- set `rm_release' with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: valid_standard_version (a_ver)
		do
			rm_release := a_ver
		end

	set_uid (a_uid: STRING)
		do
			create uid.make_from_string (a_uid)
		end

	set_other_metadata (a_metadata: like other_metadata)
		do
			other_metadata := a_metadata
		end

	put_other_metadata_value (a_key, a_value: STRING)
			-- add the pair `a_key' / `a_value' to `other_metadata', overwriting any value
			-- with the same key if necessary.
		local
			o_metadata: HASH_TABLE [STRING, STRING]
		do
			if attached other_metadata as omd then
				o_metadata := omd
			else
				create o_metadata.make (0)
				other_metadata := o_metadata
			end
			o_metadata.force (a_value, a_key)
		ensure
			other_metadata.item (a_key) = a_value
		end

	put_other_metadata_flag (a_key: STRING)
			-- add a meta-data item of the form of a flag, whose value is implied to be 'true',
			-- overwriting any value with the same key if necessary.
		do
			put_other_metadata_value (a_key, (True).out)
		ensure
			other_metadata.item (a_key).is_equal ((True).out)
		end

	add_language (a_lang_tag: STRING)
		do
			precursor {ARCHETYPE} (a_lang_tag)
			precursor {AUTHORED_RESOURCE} (a_lang_tag)
		end

	reduce_languages_to (a_langs: ARRAYED_SET [STRING])
			-- reduce languages to those in the supplied list
		do
			precursor {ARCHETYPE} (a_langs)
			precursor {AUTHORED_RESOURCE} (a_langs)
		end

feature {ARCHETYPE_FLATTENER} -- Flattening

	overlay_differential (a_diff: ARCHETYPE)
			-- <<precursor>>
			-- If `a_diff' is an AUTHORED_ARCHETYPE, the following items from the differential are used:
			--	* uid
			--	* other_metadata
			--	* translations
			--	* description
		do
			precursor (a_diff)

			if attached {AUTHORED_ARCHETYPE} a_diff as att_auth_diff then
				-- identifiers
				if attached att_auth_diff.uid as att_uid then
					uid := att_uid.deep_twin
				end

				-- flatten other_metadata so that child archetype values overwrite any parent values with same key;
				-- otherwise parent key/val pairs are preserved
				if attached att_auth_diff.other_metadata as diff_omd then
					across diff_omd as md_csr loop
						put_other_metadata_value (md_csr.key, md_csr.item)
					end
				end

				-- replace translations and description with differential
				if attached att_auth_diff.translations as diff_trans then
					translations := diff_trans.deep_twin
				end
				if attached att_auth_diff.description as diff_desc then
					description := diff_desc.deep_twin
				end
			end
		end

invariant
	Description_valid: not artefact_type.is_overlay implies attached description
	Translations_valid: artefact_type.is_overlay implies not attached description

end
