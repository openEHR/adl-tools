note
	component:   "openEHR ADL Tools"
	description: "[
				 Obsolete class retained so that the old-style 'profiles configuration' can be read from 
				 existing ADL tool .cfg files. This class encodes the outer-most object in the following
				 old .cfg structure:

				 profile = <
					 current_repository_profile = <"CKM">
					 profiles = <
						 ["CKM"] = <
						 	reference_repository = <"C:\\project\\openehr\\knowledge\\archetypes\\CKM">
							work_repository = <"">
						 >
						 ["abc"] = <
						 	reference_repository = <"C:\\some\\other\\ref\\dir">
							work_repository = <"C:\\some\\other\\work\\dir">
						 >
					 >
				 >
				 ]"
	keywords:    "test, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_PROFILE_CONFIG

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

create
	make_dt, default_create

feature -- Definitions

	root_attribute_name: STRING = "profile"
			-- name of the attribute within a parent object at which this object can be found

feature -- Initialisation

	default_create
			-- Basic make routine to guarantee validity on creation.
		do
			create profiles.make (0)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- Basic make routine to guarantee validity on creation.
		do
			default_create
		end

feature -- Access

	current_profile_name: detachable STRING
			-- name of profile that is currently in use

	profiles: HASH_TABLE [REPOSITORY_PROFILE, STRING]
			-- Hash table of profiles, keyed by their names.

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end


