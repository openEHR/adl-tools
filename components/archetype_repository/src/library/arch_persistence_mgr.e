note
	component:   "openEHR ADL Tools"
	description: "[
				 Persistent state and behaviour for ADL 2 format archetype.
	             Some of the state in this object replicates the state recorded in its owning ARCH_LIB_ARCHETYPE.
	             The state here represents the values last read from a file read, whereas the ARCH_LIB_ARCHETYPE
	             state represents the state of the in-memory archetype. These are normally the same, unless
	             editing is occurring. Editing can occur in the following ways:

	             	* on text source of the archetype under control of the ADL Workbench, i.e. when the users
	             	  completes the change, a 'save' function in the AWB causes immediate writing of the file
	             	  and update of the in-memory form of the artefact.
	             	  	=> text source is more up to date until resynchronisation achieved

	             	* on text source of the artefact via an external editor. In this case, an external event
	             	  needs to be received by the AWB for it to take account of the change.
	             	  	=> text source is more up to date until resynchronisation achieved

	             	* direct in-memory editing of archetypes via the UI. In this case, the 'commit' action of the
	             	  user causes flushing through of changes.
	             	  	=> in-memory form (ARCH_LIB_ARCHETYPE) form is more up to date until resynchronisation achieved
	             ]"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCH_PERSISTENCE_MGR

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
			{ANY} deep_twin, standard_is_equal, is_deep_equal
		end

	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_ADL_ENGINE
		export
			{NONE} all
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
			{ANY} has_serialiser_format, has_archetype_native_serialiser_format, archetype_native_serialiser_formats, archetype_all_serialiser_formats, has_dt_serialiser_format
		end

feature -- Access

	adl_version: STRING
			-- ADL version of the most recently read differential text file
		deferred
		end

	source_text: STRING
			-- Read `differential_text_converted' and `text_timestamp' from `source_file_path', returning
			-- the text of the archetype source file, i.e. the differential form.
		require
			source_available: has_source
		deferred
		end

	source_id: STRING
			-- a reliable identifier for the source
		deferred
		end

	status: STRING
			-- status of last operation
		attribute
			create Result.make_empty
		end

feature -- Thumbnail state

	id: ARCHETYPE_HRID
			-- Archetype identifier from last file read

	old_id: detachable ARCHETYPE_HRID
			-- previous Archetype identifier, due to change by editing

	parent_id: detachable STRING
			-- Archetype identifier of specialisation parent at last file read

feature -- Status Report

	has_source: BOOLEAN
		deferred
		end

	is_source_modified: BOOLEAN
			-- Should this archetype be recompiled due to changes on the file system?
		deferred
		end

	is_adhoc: BOOLEAN
			-- True if this is an adhoc archetype
		deferred
		end

feature -- File Operations

	refresh_from_source
			-- refresh from disk files that have been modified externally
		deferred
		end

feature {NONE} -- Implementation

	source_text_timestamp: INTEGER
			-- Modification timestamp of source file at last read

	archetype_serialise_engine: ODIN_ENGINE
		once
			create Result.make
		end

end

