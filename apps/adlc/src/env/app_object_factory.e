note
	component:   "openEHR ADL Tools"
	description: "Application specific factory routines"
	keywords:    "AWB, archetypes, workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class APP_OBJECT_FACTORY

feature -- Factory

	create_arch_lib_archetype_make (a_path: STRING; a_repository: ARCHETYPE_LIBRARY_SOURCE; arch_thumbnail: ARCHETYPE_THUMBNAIL): ARCH_LIB_ARCHETYPE_ITEM
		do
			create Result.make (a_path, a_repository, arch_thumbnail)
		end

	create_arch_lib_archetype_make_new_archetype (an_id: ARCHETYPE_HRID; a_repository: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING): ARCH_LIB_ARCHETYPE_ITEM
		do
			create Result.make_new_archetype (an_id, a_repository, a_directory)
		end

	create_arch_lib_archetype_make_new_specialised_archetype (an_id: ARCHETYPE_HRID; a_parent: ARCHETYPE; a_repository: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING): ARCH_LIB_ARCHETYPE_ITEM
		do
			create Result.make_new_specialised_archetype (an_id, a_parent, a_repository, a_directory)
		end

	create_arch_lib_archetype_make_new_template (an_id: ARCHETYPE_HRID; a_parent: ARCHETYPE; a_repository: ARCHETYPE_LIBRARY_SOURCE; a_directory: STRING): ARCH_LIB_ARCHETYPE_ITEM
		do
			create Result.make_new_template (an_id, a_parent, a_repository, a_directory)
		end

end


