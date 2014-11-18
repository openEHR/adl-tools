note
	component:   "openEHR ADL Tools"
	description: "Hand-built-parser for ARCHETYPE_HRIDs."
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_ARCHETYPE_HRID

inherit
	ARCHETYPE_DEFINITIONS

create
	make

feature -- Initialisation

	make (an_id: ARCHETYPE_HRID)
		do
			physical_id := an_id.physical_id
			if attached an_id.namespace as att_ns then
				namespace := att_ns.value
			end

			rm_publisher := an_id.rm_publisher
			rm_package := an_id.rm_package
			rm_class := an_id.rm_class

			concept_id := an_id.concept_id

			release_version := an_id.release_version

			version_status := an_id.version_status

			build_count := an_id.build_count
		end

feature -- Access

	physical_id: STRING
			-- full stringified form of id

	namespace: detachable STRING
			-- Reverse domain name namespace identifier.

	rm_publisher: STRING
			-- Name of the Reference Model publisher.

	rm_package: STRING
			-- Name of the package in whose reachability graph the rm_class class is found (there can be more than
			-- one possibility in a reference model).

	rm_class: STRING
			-- Name of the root class of this archetype.

	concept_id: STRING
			-- The short concept name of the archetype as used in the multi-axial archetype_hrid.

	release_version: STRING
			-- The full numeric version of this archetype consisting of 3 parts, e.g. 1.8.2. The archetype_hrid
			-- feature includes only the major version.

	version_status: INTEGER
			-- status of version: release candidate, released, build, unstable

	build_count: INTEGER
			-- Build count of this archetype. This is a number that advances from 1 and is reset for
			-- each new value of release_version.

end

