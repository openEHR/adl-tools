note
	description: "This is a class that mostly responsible for copying Archetype class fields, (other than definition). It has some inefficiencies, due to the way Eiffel wrappers for PB C++ objects are generated"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ARCHETYPE_WRAPPER_GENERATOR

create
	make

feature
	archetype:ARCHETYPE

feature {NONE} -- Initialization

	make(p_archetype:ARCHETYPE )
		require
			param_not_null: attached p_archetype
		do
			archetype := p_archetype
		end

feature
	get_archetype_wrapper:ARCHETYPE_WRAPPER_GEN
	local
		wrapper:ARCHETYPE_WRAPPER_GEN
		invariants:ARRAYED_LIST[ASSERTION]
	do
		wrapper.make
		wrapper.init_pb_obj
		wrapper.set_is_root_object (true)

		--copy fields other than the definition field: that will be filled by the visitor
		--adlversion		
		wrapper.set_adlversion (archetype.version)
		--archetypeId
		copy_archetype_id(wrapper.get_archetypeid, archetype.archetype_id)
		--concept
		wrapper.set_concept (archetype.concept)
		--definition:TODO: WILL BE FILLED BY THE VISITOR
		--description
		copy_description(wrapper.get_description, archetype.description)
		--invariants
		invariants := archetype.invariants
		from
			invariants.start
		until
			invariants.after
		loop
			copy_assertion (wrapper.add_invariants, invariants.item_for_iteration)
			invariants.forth
		end
		--iscontrolled
		wrapper.set_iscontrolled (archetype.is_controlled)
		--ontology
		copy_archetype_ontology(wrapper.get_ontology, archetype.ontology)
		--originallanguage
		copy_code_phrase (wrapper.get_originallanguage, archetype.original_language)
		--parentarchetypeid
		copy_archetype_id (wrapper.get_parentarchetypeid, archetype.parent_archetype_id)
		--revisionhistory
		copy_revision_history (wrapper.get_revisionhistory, archetype.revision_history)
		--translations
		from
			archetype.translations.start -- HASH_TABLE[TRANSLATION_DETAILS,STRING_8]
		until
			archetype.translations.after
		loop
			copy_translation_details(wrapper.add_translations,archetype.translations.item_for_iteration)

			archetype.translations.forth
		end
		--uid
--		copy_hierobject_id(wrapper.get_uid,archetype.--TODO: TALK TO T. BEALE : ARCHETYPE DOES NOT SEEM TO HAVE UID FIELD

	end

	copy_archetype_id(p_wrapper:ARCHETYPEID_WRAPPER_GEN; p_archetype_id:ARCHETYPE_ID)
	do
		p_wrapper.set_value (p_archetype_id.value)
	end

	copy_description(wrapper:RESOURCEDESCRIPTION_WRAPPER_GEN; p_description:RESOURCE_DESCRIPTION)
	do
		--details
		copy_resource_description_details(wrapper, p_description.details)
		--lifecyclestate
		wrapper.set_lifecyclestate (p_description.lifecycle_state)
		--originalauthor
		copy_resource_description_org_authors(wrapper,p_description.original_author)
		--othercontributors
		copy_resource_description_other_cont(wrapper,p_description.other_contributors)
		--otherdetails
		copy_resource_description_otherdetails(wrapper,p_description.other_details)
		--parentresource
		copy_authored_resource(wrapper.get_parentresource,p_description.parent_resource)
		--resourcepackageURI
		wrapper.set_resourcepackageuri (p_description.resource_package_uri.as_string)
	end

	copy_resource_description_details(wrapper:RESOURCEDESCRIPTION_WRAPPER_GEN; p_descriptions:HASH_TABLE[RESOURCE_DESCRIPTION_ITEM,STRING_8])
	local
		description_item:RESOURCEDESCRIPTIONITEM_WRAPPER_GEN
	do
		from
			p_descriptions.start
		until
			p_descriptions.after
		loop
			description_item := wrapper.add_details
			--language
			copy_code_phrase(description_item.get_language, p_descriptions.item_for_iteration.language)
			--purpose
			description_item.set_purpose (p_descriptions.item_for_iteration.purpose)
			--keywords
			copy_description_item_keywords(description_item,p_descriptions.item_for_iteration.keywords)
			--use
			description_item.set_use (p_descriptions.item_for_iteration.use)
			--misuse
			description_item.set_misuse (p_descriptions.item_for_iteration.misuse)
			--copyright
			description_item.set_copyright (p_descriptions.item_for_iteration.copyright)
			--original resource uri
			copy_description_item_originalresuri(description_item,p_descriptions.item_for_iteration.original_resource_uri)
			--other details
			copy_description_item_otherdetails(description_item,p_descriptions.item_for_iteration.other_details)

			p_descriptions.forth
		end
	end

	copy_code_phrase(p_wrapper:CODEPHRASE_WRAPPER_GEN; p_code_phrase:CODE_PHRASE)
	do
		--codestring
		p_wrapper.set_codestring (p_code_phrase.code_string)
		--terminologyId
		copy_terminology_id(p_wrapper.get_terminologyid,p_code_phrase.terminology_id)
	end

	copy_terminology_id(p_wrapper:TERMINOLOGYID_WRAPPER_GEN;p_terminology_id:TERMINOLOGY_ID)
	do
		p_wrapper.set_value (p_terminology_id.value)
	end

	copy_description_item_keywords(p_wrapper:RESOURCEDESCRIPTIONITEM_WRAPPER_GEN;p_keywords:ARRAYED_LIST[STRING])
	do
		from
			p_keywords.start
		until
			p_keywords.after
		loop
			p_wrapper.add_keywords (p_keywords.item_for_iteration)
			p_keywords.forth
		end
	end

	copy_description_item_originalresuri(p_wrapper:RESOURCEDESCRIPTIONITEM_WRAPPER_GEN;p_original_uris:HASH_TABLE[STRING_8,STRING_8])
	local
		sd_item:STRINGDICTIONARYITEM_WRAPPER_GEN
	do
		from
			p_original_uris.start
		until
			p_original_uris.after
		loop
			sd_item := p_wrapper.add_originalresourceuri
			sd_item.set_value (p_original_uris.item_for_iteration)
			sd_item.set_id (p_original_uris.key_for_iteration)
			p_original_uris.forth
		end
	end

	copy_description_item_otherdetails(p_wrapper:RESOURCEDESCRIPTIONITEM_WRAPPER_GEN;p_other_details:HASH_TABLE[STRING_8,STRING_8])
	local
		sd_item:STRINGDICTIONARYITEM_WRAPPER_GEN
	do
		from
			p_other_details.start
		until
			p_other_details.after
		loop
			sd_item := p_wrapper.add_otherdetails
			sd_item.set_value (p_other_details.item_for_iteration)
			sd_item.set_id (p_other_details.key_for_iteration)
			p_other_details.forth
		end
	end

	copy_resource_description_org_authors(p_wrapper:RESOURCEDESCRIPTION_WRAPPER_GEN;p_authors:HASH_TABLE[STRING_8,STRING_8])
	local
		sd_item:STRINGDICTIONARYITEM_WRAPPER_GEN
	do
		from
			p_authors.start
		until
			p_authors.after
		loop
			sd_item := p_wrapper.add_originalauthor
			sd_item.set_value (p_authors.item_for_iteration)
			sd_item.set_id (p_authors.key_for_iteration)
			p_authors.forth
		end
	end

	copy_resource_description_other_cont(p_wrapper:RESOURCEDESCRIPTION_WRAPPER_GEN;p_other_conts:ARRAYED_LIST[STRING_8])
	do
		from
			p_other_conts.start
		until
			p_other_conts.after
		loop
			p_wrapper.add_othercontributors (p_other_conts.item_for_iteration)
			p_other_conts.forth
		end
	end

	copy_resource_description_otherdetails(p_wrapper:RESOURCEDESCRIPTION_WRAPPER_GEN;p_other_details:HASH_TABLE[STRING_8,STRING_8])
	local
		sd_item:STRINGDICTIONARYITEM_WRAPPER_GEN
	do
		from
			p_other_details.start
		until
			p_other_details.after
		loop
			sd_item := p_wrapper.add_otherdetails
			sd_item.set_value (p_other_details.item_for_iteration)
			sd_item.set_id (p_other_details.key_for_iteration)
			p_other_details.forth
		end
	end

	copy_authored_resource(p_wrapper:AUTHOREDRESOURCE_WRAPPER_GEN;p_resource:AUTHORED_RESOURCE)
	do
		--description
		copy_description (p_wrapper.get_description, p_resource.description)
		--iscontrolled
		p_wrapper.set_iscontrolled (p_resource.is_controlled)
		--original language
		copy_code_phrase (p_wrapper.get_originallanguage, p_resource.original_language)
		--revision history
		copy_revision_history(p_wrapper.get_revisionhistory,p_resource.revision_history)
		--translations
		from
			p_resource.translations.start
		until
			p_resource.translations.after
		loop
			copy_translation_details (p_wrapper.add_translations, p_resource.translations.item_for_iteration)
			p_resource.translations.forth
		end
	end

	copy_revision_history(p_wrapper:REVISIONHISTORY_WRAPPER_GEN;p_history:REVISION_HISTORY)
	do
		--items
		copy_revision_history_items(p_wrapper,p_history.items)
	end

	copy_revision_history_items(p_wrapper:REVISIONHISTORY_WRAPPER_GEN;p_history_items:LIST[REVISION_HISTORY_ITEM])
	local
		history_item:REVISIONHISTORYITEM_WRAPPER_GEN
	do
		from
			p_history_items.start
		until
			p_history_items.after
		loop
			history_item := p_wrapper.add_items
			--audits
			copy_rev_history_item_audit_details(history_item,p_history_items.item_for_iteration)
			--versionid
			copy_object_version_id(history_item.get_versionid, p_history_items.item_for_iteration.version_id)
			p_history_items.forth
		end
	end

	copy_rev_history_item_audit_details(p_wrapper:REVISIONHISTORYITEM_WRAPPER_GEN;p_history_item:REVISION_HISTORY_ITEM)
	local
		audit_details:AUDITDETAILS_WRAPPER_GEN
	do
		from
			p_history_item.audits.start
		until
			p_history_item.audits.after
		loop
			audit_details := p_wrapper.add_audits
			--audit_details fields
			--changetype
			copy_dv_coded_text(audit_details.get_changetype,p_history_item.audits.item_for_iteration.change_type)
			--committer
			copy_party_proxy(audit_details.get_committer,p_history_item.audits.item_for_iteration.committer)
			--description
			copy_dv_text(audit_details.get_description, p_history_item.audits.item_for_iteration.description)
			--systemid
			audit_details.set_systemid (p_history_item.audits.item_for_iteration.system_id)
			--timecommitted
			copy_dv_datetime(audit_details.get_timecommitted, p_history_item.audits.item_for_iteration.time_committed)

			p_history_item.audits.forth
		end
	end

	copy_dv_coded_text(p_wrapper:DVCODEDTEXT_WRAPPER_GEN;p_dv_coded_text:DV_CODED_TEXT)
	do
		--definingcode
		copy_code_phrase (p_wrapper.get_definingcode, p_dv_coded_text.defining_code)
		--encoding
		copy_code_phrase (p_wrapper.get_encoding, p_dv_coded_text.encoding)
		--formatting
		p_wrapper.set_formatting (p_dv_coded_text.formatting)
		--hyperlink
		copy_dv_uri(p_wrapper.get_hyperlink,p_dv_coded_text.hyperlink)
		--language
		copy_code_phrase (p_wrapper.get_language, p_dv_coded_text.language)
		--mappings
		copy_dv_coded_text_mappings(p_wrapper,p_dv_coded_text.mappings)
		--value
		p_wrapper.set_value (p_dv_coded_text.value)
	end

	copy_dv_uri(p_wrapper:DVURI_WRAPPER_GEN;p_dv_uri:DV_URI)
	do
		p_wrapper.set_value (p_dv_uri.value)
	end

	copy_dv_coded_text_mappings(p_wrapper:DVCODEDTEXT_WRAPPER_GEN;p_mappings:LINKED_LIST[TERM_MAPPING])
	local
		term_mapping:TERMMAPPING_WRAPPER_GEN
	do
		from
			p_mappings.start
		until
			p_mappings.after
		loop
			term_mapping := p_wrapper.add_mappings
			--term mapping fields
			--match
			term_mapping.set_match (p_mappings.item_for_iteration.match.out)
			--purpose
			copy_dv_coded_text(term_mapping.purpose,p_mappings.item_for_iteration.purpose)
			--target
			copy_code_phrase (term_mapping.get_target, p_mappings.item_for_iteration.target)

			p_mappings.forth
		end

	end

	copy_dv_text_mappings(p_wrapper:DVTEXT_WRAPPER_GEN;p_mappings:LINKED_LIST[TERM_MAPPING])
	local
		term_mapping:TERMMAPPING_WRAPPER_GEN
	do
		from
			p_mappings.start
		until
			p_mappings.after
		loop
			term_mapping := p_wrapper.add_mappings
			--term mapping fields
			--match
			term_mapping.set_match (p_mappings.item_for_iteration.match.out)
			--purpose
			copy_dv_coded_text(term_mapping.purpose,p_mappings.item_for_iteration.purpose)
			--target
			copy_code_phrase (term_mapping.get_target, p_mappings.item_for_iteration.target)

			p_mappings.forth
		end

	end

	copy_party_proxy(p_wrapper:PARTYPROXYALTERNATIVES_WRAPPER_GEN;p_party_proxy:PARTY_PROXY)
	do
		--perform operations based on the actual concrete type
		if attached {PARTY_IDENTIFIED} p_party_proxy as party_identified then
			copy_party_identified(p_wrapper.get_partyidentifiedfield,party_identified)
		elseif attached {PARTY_RELATED} p_party_proxy as party_related then
			--party related
			copy_party_related(p_wrapper.get_partyrelatedfield,party_related)
		elseif attached {PARTY_SELF} p_party_proxy as party_self then
			--party self
			copy_party_self(p_wrapper.get_partyselffield, party_self)
		end
	end

	copy_party_identified(p_wrapper:PARTYIDENTIFIED_WRAPPER_GEN;p_party_identified:PARTY_IDENTIFIED)
	do
		--external ref
		copy_party_ref(p_wrapper.get_externalref,p_party_identified.external_ref)
		--identifiers
		copy_party_identified_identifiers(p_wrapper, p_party_identified.identifiers)
		--name
		p_wrapper.set_name (p_party_identified.name)
	end

	copy_party_ref(p_wrapper:PARTYREF_WRAPPER_GEN;p_party_ref:PARTY_REF)
	do
		--id
		copy_object_id(p_wrapper.get_id, p_party_ref.id)
		--namespace
		p_wrapper.set_namespace_ (p_party_ref.namespace)
		--type
		p_wrapper.set_type (p_party_ref.type)
	end

	--TODO: TALK TO THOMAS BEALE: THE OBJECT ID HIEARARCHY DOES NOT SEEM TO MIMIC THE XSD TYPE HIEARARCHY!!
	copy_object_id(p_wrapper:OBJECTIDALTERNATIVES_WRAPPER_GEN;p_object_id:OBJECT_ID)
	do
		if attached {ARCHETYPE_ID} p_object_id as  archetype_id then
			p_wrapper.get_archetypeidfield.set_value (archetype_id.value)
		elseif attached {TERMINOLOGY_ID} p_object_id as  terminology_id then
			p_wrapper.get_terminologyidfield.set_value (terminology_id.value)
		elseif attached {OBJECT_VERSION_ID} p_object_id as object_version_id then
			p_wrapper.get_objectversionidfield.set_value (object_version_id.value)
		end
	end

	copy_party_identified_identifiers(p_wrapper:PARTYIDENTIFIED_WRAPPER_GEN; p_identifiers:LINKED_LIST[DV_IDENTIFIER])
	local
		dv_identifier:DVIDENTIFIER_WRAPPER_GEN
	do
		from
			p_identifiers.start
		until
			p_identifiers.after
		loop
			dv_identifier := p_wrapper.add_identifiers
			--issuer
			dv_identifier.set_issuer (p_identifiers.item_for_iteration.issuer)
			--assigner
			dv_identifier.set_assigner (p_identifiers.item_for_iteration.assigner)
			--id
			dv_identifier.set_id (p_identifiers.item_for_iteration.id)
			--type
			dv_identifier.set_type (p_identifiers.item_for_iteration.type)

			p_identifiers.forth
		end
	end

	copy_party_related(p_wrapper:PARTYRELATED_WRAPPER_GEN;p_party_related:PARTY_RELATED)
	do
		--externalref
		copy_party_ref(p_wrapper.get_externalref, p_party_related.external_ref)
		--identifiers
		copy_party_ref_identifiers(p_wrapper, p_party_related.identifiers)
		--name
		p_wrapper.set_name (p_party_related.name)
		--relationship
		copy_dv_coded_text (p_wrapper.relationship, p_party_related.relationship)
	end

	copy_party_ref_identifiers(p_wrapper:PARTYRELATED_WRAPPER_GEN; p_identifiers:LINKED_LIST[DV_IDENTIFIER])
	local
		dv_identifier:DVIDENTIFIER_WRAPPER_GEN
	do
		from
			p_identifiers.start
		until
			p_identifiers.after
		loop
			dv_identifier := p_wrapper.add_identifiers
			--issuer
			dv_identifier.set_issuer (p_identifiers.item_for_iteration.issuer)
			--assigner
			dv_identifier.set_assigner (p_identifiers.item_for_iteration.assigner)
			--id
			dv_identifier.set_id (p_identifiers.item_for_iteration.id)
			--type
			dv_identifier.set_type (p_identifiers.item_for_iteration.type)

			p_identifiers.forth
		end
	end

	copy_party_self(p_wrapper:PARTYSELF_WRAPPER_GEN;p_party_self:PARTY_SELF)
	do
		--externalref
		copy_party_ref(p_wrapper.get_externalref, p_party_self.external_ref)
	end

	copy_dv_text(p_wrapper:DVTEXT_WRAPPER_GEN; p_dv_text:DV_TEXT)
	do
		--encoding
		copy_code_phrase (p_wrapper.get_encoding, p_dv_text.encoding)
		--formatting
		p_wrapper.set_formatting (p_dv_text.formatting)
		--hyperlink
		copy_dv_uri(p_wrapper.get_hyperlink,p_dv_text.hyperlink)
		--language
		copy_code_phrase (p_wrapper.get_language, p_dv_text.language)
		--mappings
		copy_dv_text_mappings(p_wrapper,p_dv_text.mappings)
		--value
		p_wrapper.set_value (p_dv_text.value)
	end

	copy_dv_datetime(p_wrapper:DVDATETIME_WRAPPER_GEN; p_dv_datetime:DV_DATE_TIME)
	do
		--accuracy
		copy_dv_duration(p_wrapper.get_accuracy, p_dv_datetime.accuracy)
		--magnitude status
		p_wrapper.set_magnitudestatus (p_dv_datetime.magnitude_status)
		--normal range
		copy_dv_interval (p_wrapper.get_normalrange, p_dv_datetime.normal_range)
		--normal status
--		copy_code_phrase(p_wrapper.get_normalstatus, p_dv_datetime.normal_status)--TODO: TALK TO T. BEALE: DV_DATE_TIME.NORMALSTATUS IS DV_ORDINAL, SHOULD BE CODE_PHRASE ACC. TO SPEC
		--otherreference ranges
		copy_dv_date_time_other_ref_ranges (p_wrapper, p_dv_datetime.other_reference_ranges)
		--value
	end

	copy_dv_duration(p_wrapper:DVDURATION_WRAPPER_GEN;p_dv_duration:DV_DURATION)
	do
		--accuracy
		p_wrapper.set_accuracy (p_dv_duration.accuracy.out)--TODO: FLOAT REPRESENTED AS STRING
		--accuracyispercent
		p_wrapper.set_accuracyispercent (p_dv_duration.accuracy_is_percent)
		--magnitudestatus
		p_wrapper.set_magnitudestatus (p_dv_duration.magnitude_status)
		--normalrange
		copy_dv_interval(p_wrapper.get_normalrange, p_dv_duration.normal_range)
		--normalstatus
		--p_wrapper.get_normalstatus,p_dv_duration.normal_status--TODO: TALK TO T.BEALE: DV_DURATION.NORMALSTATUS IS DV_ORDINAL, SHOULD BE CODEPHRASE ACC. TO SPEC
		--otherreferenceranges
		copy_dv_duration_other_ref_ranges(p_wrapper, p_dv_duration.other_reference_ranges)
		--value
		p_wrapper.set_value (p_dv_duration.value)
	end

	copy_dv_interval(p_wrapper:DVINTERVAL_WRAPPER_GEN; p_dv_interval:DV_INTERVAL[DV_ORDERED])--the generic parameter here is the most generic allowed (other than ANY)
	do
		--lower
		copy_dv_ordered(p_wrapper.get_lower, p_dv_interval.lower)
		--lowerincluded
		p_wrapper.set_lowerincluded (p_dv_interval.lower_included)
		--upper
		copy_dv_ordered(p_wrapper.get_upper, p_dv_interval.upper)
		--upperincluded
		p_wrapper.set_upperincluded (p_dv_interval.upper_included)
		--lowerunbounded
		p_wrapper.set_lowerunbounded (p_dv_interval.lower_unbounded)
		--upperunbounded
		p_wrapper.set_upperunbounded (p_dv_interval.upper_unbounded)
	end

	copy_dv_ordered(p_wrapper:DVORDEREDALTERNATIVES_WRAPPER_GEN;p_dv_interval:DV_ORDERED)--TODO: TALK TO THOMAS BEALE: DV_TEMPORAL DOES NOT EXIST IN EIFFEL
	do
		if attached {DV_ORDINAL} p_dv_interval as dv_ordinal  then
			copy_dv_ordinal(p_wrapper.get_dvordinalfield,dv_ordinal)
		elseif attached {DV_AMOUNT} p_dv_interval as dv_amount then
			copy_dv_amount(p_wrapper.get_dvamountfield, dv_amount)
		elseif attached {DV_COUNT} p_dv_interval as dv_count  then
			copy_dv_count(p_wrapper.get_dvcountfield, dv_count)
		elseif attached {DV_DURATION} p_dv_interval as dv_duration  then
			copy_dv_duration(p_wrapper.get_dvdurationfield, dv_duration)
		elseif attached {DV_PROPORTION} p_dv_interval as dv_proportion  then
			copy_dv_proportion(p_wrapper.get_dvproportionfield, dv_proportion)
--		elseif attached {DV_QUANTITY} p_dv_interval as dv_quantity  then --TODO: DV_QUANTITY DOES NOT COMPILE; TALK TO THOMAS BEALE

--		elseif attached {DV_DATE} p_dv_interval as dv_date then --TODO: DV_DATE DOES NOT COMPILE; TALK TO THOMAS BEALE

		elseif attached {DV_DATE_TIME} p_dv_interval as dv_date_time  then
			copy_dv_date_time(p_wrapper.get_dvdatetimefield, dv_date_time)
--		elseif attached {DV_TIME} p_dv_interval as dv_time then --TODO: DV_TIME DOES NOT COMPILE; TALK TO THOMAS BEALE
		end
	end

	copy_dv_ordinal(p_wrapper:DVORDINAL_WRAPPER_GEN; p_dv_ordinal:DV_ORDINAL)
	do
		--normalrange
		copy_dv_interval (p_wrapper.get_normalrange, p_dv_ordinal.normal_range)

		--normalstatus
		--copy_code_phrase (p_wrapper.get_normalstatus, p_dv_ordinal.normal_status)--TODO:DV_ORDINAL SEEMS TO HAVE WRONG TYPE FOR NORMAL_STATUS: TALK TO THOMAS BEALE

		--otherreferenceranges
		copy_dv_ordinal_other_ref_ranges(p_wrapper,p_dv_ordinal.other_reference_ranges)
	end

	copy_dv_ordinal_other_ref_ranges(p_wrapper:DVORDINAL_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_ORDINAL]])
	local
		ref_range:REFERENCERANGE_WRAPPER_GEN
	do
		from
			p_reference_ranges.start
		until
			p_reference_ranges.after
		loop
			ref_range := p_wrapper.add_otherreferenceranges
			--meaning
--			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
			--range
			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

			p_reference_ranges.forth
		end
	end

	copy_dv_date_time_other_ref_ranges(p_wrapper:DVDATETIME_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_DATE_TIME]])
	local
		ref_range:REFERENCERANGE_WRAPPER_GEN
	do
		from
			p_reference_ranges.start
		until
			p_reference_ranges.after
		loop
			ref_range := p_wrapper.add_otherreferenceranges
			--meaning
--			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
			--range
			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

			p_reference_ranges.forth
		end
	end

	get_dv_text_from_dv_coded_text(p_dv_coded_text:DV_CODED_TEXT):DV_TEXT
	do
		create Result.make_from_canonical_string (p_dv_coded_text.as_canonical_string)
	end

	copy_dv_amount(p_wrapper:DVAMOUNT_WRAPPER_GEN;p_dv_amount:DV_AMOUNT)
	do
		--accuracy
		p_wrapper.set_accuracy (p_dv_amount.accuracy.out)--TODO: FLOAT REPRESENTED AS STRING
		--accuracyispercent
		p_wrapper.set_accuracyispercent (p_dv_amount.accuracy_is_percent)
		--magnitudestatus
		p_wrapper.set_magnitudestatus (p_dv_amount.magnitude_status)
		--normalrange
		copy_dv_interval (p_wrapper.get_normalrange, p_dv_amount.normal_range)
		--normalstatus
--		copy_code_phrase (p_wrapper.normalstatus, p_dv_amount.normal_status)--TODO: TALK TO T. BEALE: DV_AMOUNT.NORMAL_STATUS IS DV_ORDINAL; ACCORDING TO SPEC IT SHOUDL BE CODE_PHRASE
		--otherreferenceranges	
		copy_dv_amount_other_ref_ranges(p_wrapper,p_dv_amount.other_reference_ranges)
	end

	copy_dv_amount_other_ref_ranges(p_wrapper:DVAMOUNT_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_AMOUNT]])
	local
		ref_range:REFERENCERANGE_WRAPPER_GEN
	do
		from
			p_reference_ranges.start
		until
			p_reference_ranges.after
		loop
			ref_range := p_wrapper.add_otherreferenceranges
			--meaning
--			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
			--range
			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

			p_reference_ranges.forth
		end
	end

	copy_dv_count(p_wrapper:DVCOUNT_WRAPPER_GEN;p_dv_count:DV_COUNT)--TODO: TALK TO T.BEALE: DV_COUNT DOES NOT INHERIT FROM DV_AMOUNT, IT SHOULD DO SO ACC. TO SPEC
	do
		--accuracy
--		p_wrapper.set_accuracy (p_dv_count.)
		--accuracyispercent--TODO: SEE WARNING IN METHOD SIGNATURE
		--magnitude
		p_wrapper.set_magnitude (p_dv_count.magnitude)
		--magnitudestatus
		p_wrapper.set_magnitudestatus (p_dv_count.magnitude_status)
		--normalrange
		copy_dv_interval (p_wrapper.get_normalrange, p_dv_count.normal_range)
		--normalstatus --TODO: TALK TO T. BEALE: DV_COUNT.NORMAL STATUS IS DV_ORDINAL: SHOULD BE CODEPHRASE
--		copy_code_phrase...
		--otherreferenceranges
		copy_dv_count_other_ref_ranges(p_wrapper,p_dv_count.other_reference_ranges)
	end

	copy_dv_count_other_ref_ranges(p_wrapper:DVCOUNT_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_COUNT]])
	local
		ref_range:REFERENCERANGE_WRAPPER_GEN
	do
		from
			p_reference_ranges.start
		until
			p_reference_ranges.after
		loop
			ref_range := p_wrapper.add_otherreferenceranges
			--meaning
--			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
			--range
			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

			p_reference_ranges.forth
		end
	end

	copy_dv_duration_other_ref_ranges(p_wrapper:DVDURATION_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_DURATION]])
	local
		ref_range:REFERENCERANGE_WRAPPER_GEN
	do
		from
			p_reference_ranges.start
		until
			p_reference_ranges.after
		loop
			ref_range := p_wrapper.add_otherreferenceranges
			--meaning
--			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
			--range
			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

			p_reference_ranges.forth
		end
	end

	copy_dv_proportion(p_wrapper:DVPROPORTION_WRAPPER_GEN; p_dv_proportion:DV_PROPORTION)
	do
		--accurracy
--		p_wrapper.set_accuracy (p_dv_proportion.accuracy)--TODO: TALK TO THOMAS BEALE: DV_PROPORTION SHOULD INHERIT FROM DV_AMOUNT
		--accuracyispercent --TODO: TALK TO THOMAS BEALE: DV_PROPORTION SHOULD INHERIT FROM DV_AMOUNT
		--denominator
		p_wrapper.set_denominator (p_dv_proportion.denominator.out)--TODO: real represented as string
		--magnitudestatus
		p_wrapper.set_magnitudestatus (p_dv_proportion.magnitude_status)
		--normalrange
		copy_dv_interval(p_wrapper.get_normalrange, p_dv_proportion.normal_range)
		--normalstatus
--		copy_code_phrase(p_wrapper...--TODO: DV_PROPORTION.NORMALSTATUS IS DV_ORDINAL, SHOULD BE CODEPHRASE ACC TO SPEC
		--numerator
		p_wrapper.set_numerator (p_dv_proportion.numerator.out)--TODO: REAL REPRESENTED AS STRING
		--otherreferenceranges
		copy_dv_proportion_other_ref_ranges(p_wrapper, p_dv_proportion.other_reference_ranges)
		--precisision
--		p_wrapper.set_precision (p_dv_proportion.)--TODO: TALK TO T. BEALE: DV_PROPORTION DOES NOT HAVE PRECISION FIELD
		--type
		p_wrapper.set_type (p_dv_proportion.type.out)--TODO: INTEGER REPRESENTED AS STRING
	end

	copy_dv_proportion_other_ref_ranges(p_wrapper:DVPROPORTION_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_PROPORTION]])
	local
		ref_range:REFERENCERANGE_WRAPPER_GEN
	do
		from
			p_reference_ranges.start
		until
			p_reference_ranges.after
		loop
			ref_range := p_wrapper.add_otherreferenceranges
			--meaning
--			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
			--range
			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

			p_reference_ranges.forth
		end
	end

	copy_dv_date_time(p_wrapper:DVDATETIME_WRAPPER_GEN;p_dv_date_time:DV_DATE_TIME)
	do
		--accuracy
		copy_dv_duration (p_wrapper.accuracy, p_dv_date_time.accuracy)
		--magnitudestatus
		p_wrapper.set_magnitudestatus (p_dv_date_time.magnitude_status)
		--normalrange
		copy_dv_interval(p_wrapper.get_normalrange, p_dv_date_time.normal_range)
		--otherrefranges
		copy_dv_date_time_other_ref_ranges (p_wrapper, p_dv_date_time.other_reference_ranges)
		--value
		p_wrapper.set_value (p_dv_date_time.value)
	end

--	copy_dv_date_time_other_ref_ranges(p_wrapper:DVDATETIME_WRAPPER_GEN; p_reference_ranges:LINKED_LIST[REFERENCE_RANGE[DV_DATE_TIME]])
--	local
--		ref_range:REFERENCERANGE_WRAPPER_GEN
--	do
--		from
--			p_reference_ranges.start
--		until
--			p_reference_ranges.after
--		loop
--			ref_range := p_wrapper.add_otherreferenceranges
--			--meaning
----			copy_dv_text (ref_range.get_meaning, p_reference_ranges.item_for_iteration.meaning)--TODO: TALK TO T. BEALE: REFRERENCE_RANGE.MEANING SEEMS TO BE DV_CODED_TEXT: ACC. TO SPEC IT SHOULD BE DV_TEXT
--			copy_dv_text (ref_range.get_meaning, get_dv_text_from_dv_coded_text (p_reference_ranges.item_for_iteration.meaning))
--			--range
--			copy_dv_interval (ref_range.get_range, p_reference_ranges.item_for_iteration.range)

--			p_reference_ranges.forth
--		end
--	end

	copy_assertion(p_wrapper: ASSERTION_WRAPPER_GEN; p_assertion:ASSERTION)
	do
		copy_expr_item (p_wrapper.get_expression, p_assertion.expression)
		if attached p_assertion.as_string then
			p_wrapper.set_stringexpression (p_assertion.as_string)
		end
		if attached p_assertion.tag then
			p_wrapper.set_tag (p_assertion.tag)
		end

	end

	copy_expr_item(p_wrapper:EXPRITEMALTERNATIVES_WRAPPER_GEN; p_operand: EXPR_ITEM  )
	--this is an EXPR_ITEM known to be a either an  EXPR_UNARY_OPERATOR OR EXPR_BINARY_OPERATOR so configure accordingly
	do
		if attached {EXPR_UNARY_OPERATOR} p_operand as unary_op then
			p_wrapper.get_exprunaryoperatorfield.set_type (unary_op.type)
			p_wrapper.get_exprunaryoperatorfield.set_precedenceoverridden (unary_op.precedence_overridden)
			--operator of unary operator
			p_wrapper.get_exprunaryoperatorfield.set_operator_ (unary_op.operator.out)--TODO: BIG INT MUST BE HANDLED IN EIFFEL CODE GENERATOR (int to str conversion at the moment)
			--operand of unary operator may be unary, binary  or leaf. Recursion would handle it
			copy_expr_item(p_wrapper.get_exprunaryoperatorfield.get_operand, unary_op.operand)
		elseif attached {EXPR_BINARY_OPERATOR} p_operand as binary_op then
			p_wrapper.get_exprbinaryoperatorfield.set_type (binary_op.type)
			p_wrapper.get_exprbinaryoperatorfield.set_precedenceoverridden (binary_op.precedence_overridden)
			--operator of binary operator
			p_wrapper.get_exprbinaryoperatorfield.set_operator_ (binary_op.operator.out)--TODO: BIG INT MUST BE HANDLED IN EIFFEL CODE GENERATOR (int to str conversion at the moment)
			--left operand of binary operator
			copy_expr_item(p_wrapper.get_exprbinaryoperatorfield.get_leftoperand,binary_op.left_operand)
			--right operand of binary operator
			copy_expr_item(p_wrapper.get_exprbinaryoperatorfield.get_rightoperand,binary_op.right_operand)
		elseif attached {EXPR_LEAF} p_operand as leaf then
			p_wrapper.get_exprleaffield.set_item ("NOT IMPLEMENTED YET: ITEM IN EXPR_LEAF; SHOULD BE SERIALIZED BYTE ARR WITH TYPE INFO")
			p_wrapper.get_exprleaffield.set_referencetype (leaf.reference_type)
			p_wrapper.get_exprleaffield.set_type (leaf.type)
		end
	end

	copy_archetype_ontology(p_wrapper:ARCHETYPEONTOLOGY_WRAPPER_GEN;p_ontology:ARCHETYPE_ONTOLOGY)
	local
		constraint_bindings: HASH_TABLE[ HASH_TABLE[URI,STRING_8], STRING_8]
		constraint_binding_set:CONSTRAINTBINDINGSET_WRAPPER_GEN--TODO: constraint						
		constraint_binding_items: HASH_TABLE[URI,STRING_8]
		constraint_binding_item_wrapper:CONSTRAINTBINDINGITEM_WRAPPER_GEN

		constraint_definitions:HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM,STRING_8], STRING_8]
		constraint_definitions_wrapper: CODEDEFINITIONSET_WRAPPER_GEN
		constraint_definition_item:HASH_TABLE[ARCHETYPE_TERM,STRING_8]
		constraint_definition_item_wrapper:ARCHETYPETERM_WRAPPER_GEN

		term_bindings:HASH_TABLE[HASH_TABLE[CODE_PHRASE,STRING_8], STRING_8]
		term_bindings_item:HASH_TABLE[CODE_PHRASE,STRING_8]
		term_bindings_wrapper:TERMBINDINGSET_WRAPPER_GEN
		term_bindings_item_wrapper:TERMBINDINGITEM_WRAPPER_GEN

		term_definitions:HASH_TABLE[HASH_TABLE[ARCHETYPE_TERM,STRING_8], STRING_8]
		term_definitions_wrapper: CODEDEFINITIONSET_WRAPPER_GEN
		term_definition_item:HASH_TABLE[ARCHETYPE_TERM,STRING_8]
		term_definition_item_wrapper:ARCHETYPETERM_WRAPPER_GEN

	do
		--constraintbindings
		constraint_bindings := p_ontology.constraint_bindings
		from
			constraint_bindings.start
		until
			constraint_bindings.after
		loop

			constraint_binding_set := p_wrapper.add_constraintbindings
			--terminology
			constraint_binding_set.set_terminology (constraint_bindings.item_for_iteration.key_for_iteration)--TODO: IS THIS THE TERMINOLOGY?
			constraint_binding_items := constraint_bindings.item_for_iteration
			--items
			from
				constraint_binding_items.start
			until
				constraint_binding_items.after
			loop
				constraint_binding_item_wrapper := constraint_binding_set.add_items
				constraint_binding_item_wrapper.set_value (constraint_binding_items.item_for_iteration.as_string)--TODO: DEBUG THIS POINT
				constraint_binding_item_wrapper.set_code (constraint_binding_items.key_for_iteration.out)

				constraint_binding_items.forth
			end

			constraint_bindings.forth
		end
		--constraintdefinitions
		constraint_definitions := p_ontology.constraint_definitions
		from
			constraint_definitions.start
		until
			constraint_definitions.after
		loop
			constraint_definition_item := constraint_definitions.item_for_iteration
			constraint_definitions_wrapper := p_wrapper.add_constraintdefinitions
			--language
			constraint_definitions_wrapper.set_language (constraint_definition_item.key_for_iteration)--TODO: IS THIS THE LANGUAGE?
			--items
			from
				constraint_definition_item.start
			until
				constraint_definition_item.after
			loop
				copy_archeype_term(constraint_definitions_wrapper.add_items, constraint_definition_item.item_for_iteration)

				constraint_definition_item.forth
			end

			constraint_definitions.forth
		end
		--termbinding
		term_bindings := p_ontology.term_bindings
		from
			term_bindings.start
		until
			term_bindings.after
		loop
			term_bindings_item := term_bindings.item_for_iteration
			term_bindings_wrapper := p_wrapper.add_termbindings
			--terminology
			term_bindings_wrapper.set_terminology (term_bindings_item.key_for_iteration)--TODO: IS THIS THE TERMINOLOGY?
			--items
			from
				term_bindings_item.start
			until
				term_bindings_item.after
			loop
				term_bindings_item_wrapper := term_bindings_wrapper.add_items
				--value
				copy_code_phrase (term_bindings_item_wrapper.get_value, term_bindings_item.item_for_iteration)
				--code
				term_bindings_item_wrapper.set_code (term_bindings_item.key_for_iteration)--TODO: IS THIS THE CODE?

				term_bindings_item.forth
			end

			term_bindings.forth
		end
		--termdefinitions	
		term_definitions := p_ontology.term_definitions
		from
			term_definitions.start
		until
			term_definitions.after
		loop
			term_definition_item := term_definitions.item_for_iteration
			term_definitions_wrapper := p_wrapper.add_termdefinitions
			--language
			term_definitions_wrapper.set_language (term_definition_item.key_for_iteration)--TODO: IS THIS THE LANGUAGE?
			--items
			from
				term_definition_item.start
			until
				term_definition_item.after
			loop
				copy_archeype_term(term_definitions_wrapper.add_items, term_definition_item.item_for_iteration)

				term_definition_item.forth
			end

			term_definitions.forth
		end

	end

	copy_archeype_term(p_wrapper:ARCHETYPETERM_WRAPPER_GEN;p_archetype_term:ARCHETYPE_TERM)
	local
		string_dict_item:STRINGDICTIONARYITEM_WRAPPER_GEN
	do
		--code
		p_wrapper.set_code (p_archetype_term.code)
		--items
		from
			p_archetype_term.items.start
		until
			p_archetype_term.items.after
		loop
			string_dict_item  := p_wrapper.add_items
			string_dict_item.set_value (p_archetype_term.items.item_for_iteration)
			string_dict_item.set_id (p_archetype_term.items.key_for_iteration)

			p_archetype_term.items.forth
		end
	end

	copy_translation_details(p_wrapper:TRANSLATIONDETAILS_WRAPPER_GEN;p_trans_details:TRANSLATION_DETAILS)
	local
		string_dict_item_wrapper: STRINGDICTIONARYITEM_WRAPPER_GEN
	do
		--language
		copy_code_phrase (p_wrapper.get_language, p_trans_details.language)
		--author
		from
			p_trans_details.author.start
		until
			p_trans_details.author.after
		loop
			string_dict_item_wrapper := p_wrapper.add_author
			string_dict_item_wrapper.set_value (p_trans_details.author.item_for_iteration)
			string_dict_item_wrapper.set_id (p_trans_details.author.key_for_iteration)--TODO: IS THIS THE ID?

			p_trans_details.author.forth
		end
		--accreditation
		p_wrapper.set_accreditation (p_trans_details.accreditation)
		--otherdetails
		from
			p_trans_details.other_details.start
		until
			p_trans_details.other_details.after
		loop
			string_dict_item_wrapper := p_wrapper.add_otherdetails
			string_dict_item_wrapper.set_value (p_trans_details.other_details.item_for_iteration)
			string_dict_item_wrapper.set_id (p_trans_details.other_details.key_for_iteration) --TODO: IS THIS THE ID?

			p_trans_details.other_details.forth
		end
	end

	copy_object_version_id(p_wrapper:OBJECTVERSIONID_WRAPPER_GEN;p_object_vid:OBJECT_VERSION_ID)
	do
		p_wrapper.set_value (p_object_vid.value)

	end

end
