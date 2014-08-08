note
	component:   "openEHR ADL Tools"
	description: "[
				 Interface to a physical archetype library, which is the root point for a hierarchical
				 structure (file system or similar) in which archetypes can be found. Typical file
				 content:
					name = <"openEHR ADL reference">
					short_name = <"ADLref">
					maintainer = <"openEHR">
					description = <"openEHR ADL 1.5 regression test archetypes">
				 ]"
	keywords:    "ADL, archetype, library"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY_DEFINITION

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	ADL_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

create
	make_dt

feature -- Definition

	Default_archetype_library_name: STRING = "Unknown"

	Default_archetype_library_short_name: STRING = "Unknown"

	Key_separator: STRING = "-"

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			create name.make_from_string (Default_archetype_library_name)
			create short_name.make_from_string (Default_archetype_library_short_name)
		end

feature -- Access (attributes from file)

	name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	short_name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	description: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	maintainer: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

feature -- Access

	key: STRING
			-- made from "maintainer:name"
		local
			safe_short_name: STRING
		do
			create Result.make_empty
			Result.append (maintainer)
			Result.append (Key_separator)

			create safe_short_name.make_from_string (short_name)
			safe_short_name.replace_substring_all (" ", "_")
			Result.append (safe_short_name)
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work: evaluate rm schema regexes
		do
		end

end


