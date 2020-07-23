note
	component:   "openEHR ADL Tools"
	description: "Perform post compilation updates of the differential archetype AOM structure."
	keywords:    "constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_POST_COMPILE_PROCESSOR

create
	initialise

feature {ADL_2_ENGINE, ADL_14_ENGINE} -- Initialisation

	initialise (aca: ARCH_LIB_ARCHETYPE)
			-- set target
		require
			aca.is_valid
		do
			target_descriptor := aca
			ref_model := aca.ref_model
			target := aca.safe_differential_archetype
			target_flat := aca.flat_archetype
		ensure
			Target_flat_is_flat: target_flat.is_flat
			Target_is_differential: target.is_differential
		end

feature -- Access

	target_descriptor: ARCH_LIB_ARCHETYPE

	target: ARCHETYPE
			-- differential archetype being processed

	target_flat: ARCHETYPE
		-- flat_parent of `target'

	ref_model: BMM_MODEL

feature -- Commands

	execute
		do
			if target.has_rules then
				update_rules
			end
		end

feature {NONE} -- Implementation

	update_rules
			-- update ASSERTION EXPR_ITEM_LEAF object reference nodes with proper type names
			-- obtained from the AOM objects pointed to
		require
			target.has_rules
		local
			ref_rm_type_name, tail_path: STRING
			bmm_class: BMM_CLASS
		do
			across target.rules_index as ref_path_csr loop
				-- get a matching path from archetype - has to be there, either exact or partial
				if attached target_flat.matching_path (ref_path_csr.key) as arch_path then
					ref_rm_type_name := target_flat.object_at_path (arch_path).rm_type_name
					-- if it was a partial match, we have to obtain the real RM type by going into the RM
					if arch_path.count < ref_path_csr.key.count then
						tail_path := ref_path_csr.key.substring (arch_path.count+1, ref_path_csr.key.count)
						if attached ref_model.property_at_path (ref_rm_type_name, tail_path) as bmm_prop then
							ref_rm_type_name := bmm_prop.bmm_type.effective_type.type_base_name
						end
					end
					across ref_path_csr.item as expr_leaf_csr loop
						expr_leaf_csr.item.update_type (ref_rm_type_name)
					end
				end
			end
		end

end


