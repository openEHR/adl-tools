note
	component:   "openEHR ADL Tools"
	description: "Perform overlaying of template fillers onto flattened core template."
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TEMPLATE_FLATTENER

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	opt: OPERATIONAL_TEMPLATE
		attribute
			create Result.default_create
		end

feature -- Commands

	execute (a_template: TEMPLATE; include_rm: BOOLEAN)
			-- create with source (differential) archetype for which we wish to generate a flat archetype
		require
			Template_valid: a_template.is_valid and then a_template.is_flat
		do
			create opt.make_from_other (a_template)

			fillers_on_current_path.wipe_out
			overlay_filler_definitions (opt, include_rm, 0)
			opt.rebuild
		end

feature {NONE} -- Implementation

	overlay_filler_definitions (a_flat_arch: ARCHETYPE; include_rm: BOOLEAN; depth: INTEGER)
			-- process `template.suppliers_index' to overlay target definitions.
		require
			a_flat_arch.is_flat
		local
			supp_flat_arch, matched_arch: ARCHETYPE
			supp_arch_root_cco: C_COMPLEX_OBJECT
			supp_arch_id: STRING
			bindings: HASH_TABLE [URI, STRING]
			found: BOOLEAN
		do
debug ("overlay")
	io.put_string ("&&&&&& flattening template root nodes &&&&&&%N")
end
			fillers_on_current_path.extend (a_flat_arch.archetype_id.physical_id)

			across a_flat_arch.suppliers_index as xrefs_csr loop
				-- get the definition structure of the flat archetype corresponding to the archetype id in the suppliers list
				check attached current_library.archetype_matching_ref (xrefs_csr.key) as att_ala then
					matched_arch := att_ala.flat_archetype_processed (include_rm)
				end

				-- make a copy of the supplier archetype (or template)
				create supp_flat_arch.make_from_other (matched_arch)
				supp_arch_id := supp_flat_arch.archetype_id.physical_id
				supp_arch_root_cco := supp_flat_arch.definition

				-- add the terminology of this archetype to the OPT component_terminologies
				if not opt.has_component_terminology (supp_arch_id) then
					opt.add_component_terminology (supp_flat_arch.terminology, supp_arch_id)
				end

				-- get list of C_ARCHETYPE_ROOT nodes in this archetype or template corresponding to the supplier
				-- archetype id xrefs_csr.key into each one of these C_ARCHETYPE_ROOT nodes, clone the
				-- flat definition structure from the supplier archetype
				across xrefs_csr.item as c_arch_roots_csr loop

					-- first, copy any bindings to the root point of the used archetype/overlay into the bindings of the owning template, under the
					-- id-code of the use_archetype reference
					across supp_flat_arch.terminology.term_bindings as bindings_for_terminology_csr loop
						bindings := bindings_for_terminology_csr.item

						-- see if there is a binding for the supplier archetype concept id (some id1....1 code) or any parent of that
						found := False
						from bindings.start until bindings.off or found loop
							if supp_flat_arch.concept_id.starts_with (bindings.key_for_iteration) then
								found := True
								if attached bindings.item_for_iteration as uri and
									not a_flat_arch.terminology.has_term_binding (bindings_for_terminology_csr.key, c_arch_roots_csr.item.node_id)
								then
									a_flat_arch.terminology.put_term_binding (uri, bindings_for_terminology_csr.key, c_arch_roots_csr.item.node_id)
								end
							end
							bindings.forth
						end
					end

					-- always convert, to ensure archetype id replaces archetype ref in C_ARCHETYPE_ROOT
					-- even if no overlaying takes place
					c_arch_roots_csr.item.convert_to_flat (supp_flat_arch.archetype_id)

					-- Now we decide if we are going to overlay the referenced supplier archetype...
					-- limit depth in case of recursive inclusion and don't repeat descent into same archetype
					-- on any given descent path (we could be more sophisticated and allow N uses of same
					-- archetype on same path, if it were needed)
					if depth <= Max_template_overlay_depth and not fillers_on_current_path.has (supp_arch_id) then

						-- it is empty and needs to be replaced with the supplier structure
						if not c_arch_roots_csr.item.has_attributes and not c_arch_roots_csr.item.is_prohibited then
							-- perform overlays on supplier archetype first
							overlay_filler_definitions (supp_flat_arch, include_rm, depth + 1)
debug ("overlay")
	io.put_string ("%T node at " + c_arch_roots_csr.item.path +
	" with " + xrefs_csr.key + "%N")
end
							across supp_arch_root_cco.attributes as attrs_csr loop
								c_arch_roots_csr.item.put_attribute (attrs_csr.item)
debug ("overlay")
	io.put_string ("%T%T cloning attribute " +
	attrs_csr.item.rm_attribute_path + "%N")
end
							end
						end
					end
				end
			end
			fillers_on_current_path.remove
		end

	fillers_on_current_path: ARRAYED_STACK [STRING]
			-- used to track usage of same archetype on current descent path, due to
			-- recursive / cyclic refs
		attribute
			create Result.make (0)
			Result.compare_objects
		end

end

