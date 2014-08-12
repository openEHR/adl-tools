note
	component:   "openEHR ADL Tools"
	description: "[
				 Part of ARFCHETYPE_LIBRARY_DEFINITION, corresponding to this part of the content
				 
					remote = <
						url = <"http://some.where.org/archetypes">
						custodian = <"Acme archetypes">
					>
				 ]"
	keywords:    "ADL, archetype, library"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY_REMOTE

create
	make

feature -- Definition

	Default_url: STRING = "http://unknown.org"

	Default_custodian: STRING = "xxxxx"

feature -- Initialisation

	make
		do
			create url.make_from_string (Default_url)
			create custodian.make_from_string (Default_custodian)
		end

feature -- Access (attributes from file)

	url: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	custodian: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

end


