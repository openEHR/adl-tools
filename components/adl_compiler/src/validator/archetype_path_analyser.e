note
	component:   "openEHR ADL Tools"
	description: "Validator of archeype paths."
	keywords:    "path"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_PATH_ANALYSER

inherit
	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make, make_from_string

feature -- Initialisation

	make (a_path: OG_PATH)
			-- create from an OG_PATH
		do
			target := a_path
			calculate_level
		end

	make_from_string (a_path: STRING)
			-- create from a STRING
		do
			create target.make_from_string(a_path)
			calculate_level
		end

feature -- Access

	target: OG_PATH
			-- differential archetype

	level: INTEGER

feature -- Conversion

	path_at_level (a_level: INTEGER): STRING
			-- generate a form of the path at the specialisation level `a_level';
			-- only applicable if the path can actually exist at the level indicated, which
			-- cannot be the case if there are any '0's in any path node id at the requested level
		require
			valid_level: a_level >= 0 and not is_phantom_path_at_level (a_level)
		local
			a_path: OG_PATH
		do
			if a_level >= level then
				Result := target.as_string
			else
				create a_path.make_from_other (target)
				from
					target.start
					a_path.start
				until
					target.off
				loop
					if is_valid_code (target.item.object_id) and then specialisation_depth_from_code (target.item.object_id) > a_level then
						a_path.item.set_object_id (code_at_level (target.item.object_id, a_level))
					end
					target.forth
					a_path.forth
				end
				Result := a_path.as_string
			end
		end

feature -- Status Report

	 is_phantom_path_at_level (a_level: INTEGER): BOOLEAN
	 		-- True if this path corresponds to a node that does not exist in the specified level, i.e.
	 		-- if it contains any object id whose parent ends in a '0', e.g. .../items[at0.0.9]
	 		-- would return True for a_level = 1, because at0.0.9 is a new node, only introduced at
	 		-- level 2
	 	require
	 		Level_valid: a_level >= 0
	 	do
	 		-- this should only ever return True if the last node is a phantom node; so we go backwards. If I was more sure
	 		-- of this fact mathematically, I would replace the loop with a single test on the last item
			from target.finish until target.off or Result loop
				if is_valid_code (target.item.object_id) and a_level <= specialisation_depth_from_code(target.item.object_id) then
					Result := not code_exists_at_level(target.item.object_id, a_level)
				end
				target.back
			end
	 	end

	 is_archetype_path: BOOLEAN
	 		-- True if this path is of the form for referencing an archetyped structure, i.e. contains at least one archetype
	 		-- node code. If it has none, it is a pure RM path, even though some such paths are valid in archetype
	 	do
	 		Result := target.has_addressable_item
	 	end

feature {NONE} -- Implementation

	calculate_level
			-- get the deepest level of this path, determined from the depth of the object codes
			-- set `level'
		do
			across target as target_csr loop
				if is_valid_code (target_csr.item.object_id) then
					level := level.max (specialisation_depth_from_code (target_csr.item.object_id))
				end
			end
		end

end


