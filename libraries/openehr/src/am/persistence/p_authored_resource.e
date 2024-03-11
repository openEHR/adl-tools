note
	component:   "openEHR ADL Tools"
	description: "Persistent form of AUTHORED_RESOURCE"
	keywords:    "resource, document"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_AUTHORED_RESOURCE

feature {P_AUTHORED_ARCHETYPE} -- Initialisation

	make (an_auth_res: AUTHORED_RESOURCE)
		do
			is_controlled := an_auth_res.is_controlled
			original_language := an_auth_res.original_language
			if attached an_auth_res.uid as att_uid then
				uid := att_uid.as_string
			end
			translations := an_auth_res.translations
			description := an_auth_res.description
			revision_history := an_auth_res.revision_history
			annotations := an_auth_res.annotations
		end

feature -- Access

	uid: STRING
		attribute
			create Result.make (0)
		end

	original_language: TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

	translations: HASH_TABLE [TRANSLATION_DETAILS, STRING]
		attribute
			create Result.make (0)
		end

	description: RESOURCE_DESCRIPTION

	revision_history: detachable REVISION_HISTORY

	annotations: detachable RESOURCE_ANNOTATIONS

feature -- Status Report

	is_controlled: BOOLEAN

end
