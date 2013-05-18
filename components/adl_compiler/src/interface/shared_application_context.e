note
	component:   "openEHR ADL Tools"
	description: "Shared context settings for serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class SHARED_APPLICATION_CONTEXT

inherit
	OPENEHR_DEFINITIONS
		export
			{NONE} all
		end

	ADL_DEFINITIONS
		export
			{NONE} all
		end

feature -- Access

	current_language: STRING
		do
			Result := cell_language.item
		ensure
			Result_exists: Result /= Void
		end

feature -- Modification

	set_current_language(a_lang: STRING)
			-- set `language'
		require
			a_lang /= Void and then not a_lang.is_empty
		do
			cell_language.put(a_lang)
		end

feature {NONE} -- Implementation

	cell_language: CELL[STRING]
			-- language to serialise in, for comments and other language-specific items
		once
			create Result.put(Default_language)
		end

end


