note
	component:   "openEHR ADL Tools"
	description: "Helper class containing only annotations for use in conversion of archetype annotations section Data tree to object form"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class RESOURCE_ANNOTATIONS_HELPER

feature -- Access

	annotations: detachable HASH_TABLE [RESOURCE_ANNOTATION_NODES, STRING]
			-- list of annotations, keyed by language. Annotations may be present for only one or
			-- some languages; if they are present for more than one, the structures must match

end


