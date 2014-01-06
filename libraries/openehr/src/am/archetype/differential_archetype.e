note
	component:   "openEHR ADL Tools"
	description: "Archetype abstraction"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DIFFERENTIAL_ARCHETYPE

inherit
	ARCHETYPE
		redefine
			add_language_tag, terminology, make_from_other
		end

create
	make, make_minimal, make_minimal_child, make_from_flat, make_all, make_from_other

feature -- Initialisation

	make_from_other (other: like Current)
			-- duplicate from another archetype
		do
			precursor (other)
			is_valid := other.is_valid
		ensure then
			Is_valid_preserved: other.is_valid implies is_valid
		end

	make_minimal (an_artefact_type: ARTEFACT_TYPE; an_id: like archetype_id; an_original_language: STRING)
			-- make a new differential form archetype
		require
			Language_valid: not an_original_language.is_empty
		do
			artefact_type := an_artefact_type
			archetype_id := an_id
			adl_version := 	Latest_adl_version
			create terminology.make_empty(an_original_language, 0)
			create original_language.make (ts.Default_language_code_set, an_original_language)
			create description.default_create
			create definition.make_identified (an_id.rm_class, terminology.concept_code.twin)
			is_dirty := True
			is_valid := True
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = Latest_adl_version
			Id_set: archetype_id = an_id
			Original_language_set: original_language.code_string.is_equal (an_original_language)
			terminology_original_language_set: original_language.code_string.is_equal (terminology.original_language)
			Not_specialised: not is_specialised
			Definition_root_node_id: definition.node_id.is_equal (concept)
			Not_generated: not is_generated
			Is_dirty: is_dirty
			Is_valid: is_valid
		end

	make_minimal_child (an_artefact_type: ARTEFACT_TYPE; an_id: like archetype_id; an_original_language: STRING; a_parent: ARCHETYPE)
			-- make a new differential form archetype as a child of `a_parent'
		require
			Language_valid: not an_original_language.is_empty
		do
			artefact_type := an_artefact_type
			archetype_id := an_id
			adl_version := 	Latest_adl_version
			create terminology.make_empty (an_original_language, a_parent.specialisation_depth + 1)
			create original_language.make (ts.Default_language_code_set, an_original_language)
			create description.default_create
			create definition.make_identified (an_id.rm_class, terminology.concept_code.twin)
			parent_archetype_id := a_parent.archetype_id.deep_twin
			is_dirty := True
			is_valid := True
		ensure
			Artefact_type_set: artefact_type = an_artefact_type
			Adl_version_set: adl_version = Latest_adl_version
			Id_set: archetype_id = an_id
			Original_language_set: original_language.code_string.is_equal (an_original_language)
			terminology_original_language_set: original_language.code_string.is_equal (terminology.original_language)
			Specialisation_depth_valid: specialisation_depth = a_parent.specialisation_depth + 1
			Parent_set: parent_archetype_id.as_string.same_string (a_parent.archetype_id.as_string)
			Definition_root_node_id: definition.node_id.is_equal (concept)
			Not_generated: not is_generated
			Is_dirty: is_dirty
			Is_valid: is_valid
		end

	make_from_flat (a_flat: FLAT_ARCHETYPE)
		do
			make_all (a_flat.artefact_type, Latest_adl_version, a_flat.archetype_id, a_flat.parent_archetype_id,
					a_flat.is_controlled, a_flat.uid, a_flat.other_metadata, a_flat.original_language, a_flat.translations,
					a_flat.description, a_flat.definition, a_flat.rules,
					a_flat.terminology.to_differential, a_flat.annotations)
			is_generated := True
			rebuild
		ensure
			is_generated
		end

feature -- Access

	terminology: DIFFERENTIAL_ARCHETYPE_TERMINOLOGY

	terminology_unused_term_codes: ARRAYED_LIST [STRING]
			-- list of at codes found in terminology that are not referenced anywhere in the archetype definition
		local
			term_codes: like term_codes_index
			id_codes: like id_codes_index
		do
			create Result.make (0)
			term_codes := term_codes_index
			id_codes := id_codes_index
			across terminology.term_codes as term_codes_csr loop
				if not id_codes.has (term_codes_csr.item) and not term_codes.has (term_codes_csr.item) then
					Result.extend (term_codes_csr.item)
				end
			end
			Result.prune (concept)
		end

	terminology_unused_constraint_codes: ARRAYED_LIST [STRING]
			-- list of ac codes found in terminology that are not referenced
			-- anywhere in the archetype definition
		local
			accodes: HASH_TABLE [ARRAYED_LIST [CONSTRAINT_REF], STRING]
		do
			create Result.make (0)
			accodes := constraint_codes_index
			across terminology.constraint_codes as constraint_codes_csr loop
				if not accodes.has (constraint_codes_csr.item) then
					Result.extend (constraint_codes_csr.item)
				end
			end
		end

feature -- Status Report

	is_valid: BOOLEAN
			-- True if archetype is completely validated, including with respect to specialisation parents, where they exist

feature -- Status Setting

	set_is_valid (a_validity: BOOLEAN)
			-- set is_valid flag
		do
			is_valid := a_validity
			is_dirty := False
		end

feature {ARCH_CAT_ARCHETYPE, ARCHETYPE_COMPARATOR} -- Structure

	convert_to_differential_paths
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- compress paths of congruent nodes in specialised archetype so that equivalent paths
			-- are recorded in the `differential_path' attribute of terminal C_ATTRIBUTE nodes of congruent sections
			-- This routine only works if validation has successfully completed because the latter process sets
			-- is_mergeable markers in the structure.
		require
			Target_specialised: is_specialised
			Is_generated: is_generated
		local
			def_it: C_ITERATOR
		do
			converted_def := definition.deep_twin
			create def_it.make (definition)
			def_it.do_at_surface (agent node_set_differential_path,
				agent (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
					do
						Result := not a_c_node.is_path_compressible
					end
			)
			if attached converted_def as conv_def then
				definition := conv_def
				rebuild
			end
		end

	converted_def: detachable C_COMPLEX_OBJECT

	node_set_differential_path (a_c_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- FIXME: only needed while differential archetype source is being created in uncompressed form
			-- perform validation of node against reference model
			-- This function gets executed on nodes 1 level BELOW where the is_congruent marker is True
		local
			ca2: C_ATTRIBUTE
			co2: C_OBJECT
		do
			if attached {C_ATTRIBUTE} a_c_node as ca then
				-- these are attributes that are not congruent to any node in the parent archetype,
				-- i.e. they don't exist in the parent.
				if converted_def.has_attribute_path (ca.path) then
					ca2 := converted_def.attribute_at_path (ca.path)
					if not ca2.has_differential_path then
						debug("compress")
							io.put_string ("Compressing path at ATTR " + ca.path + "%N")
						end
						ca2.set_differential_path_to_here
					else
						debug("compress")
							io.put_string ("Path " + ca.path + " no longer available - attribute moved (already compressed?)%N")
						end
					end
				end
			elseif attached {C_OBJECT} a_c_node as co then
				if not co.is_root then
					if converted_def.has_object_path (co.path) then
						co2 := converted_def.object_at_path (co.path)
						if not co2.parent.has_differential_path then
debug("compress")
	io.put_string ("Compressing path of ATTR above OBJ with path " + co.path + "%N")
end
							co2.parent.set_differential_path_to_here
						end
					else
		debug("compress")
			io.put_string ("Path " + co.path + " no longer available - parent moved (already compressed?)%N")
		end
					end
				end
			end
		end

feature -- Modification

	set_definition_node_id (a_term_code: STRING)
			-- set the node_id of the archetype root node to a_term_id
		require
			Valid_term_code: terminology.has_term_code (a_term_code)
		do
			definition.set_node_id (a_term_code)
		end

	reset_definition
			-- set definition back to its original state - just the root
			-- node with all children gone
		do
			definition.remove_all_attributes
		end

	add_language_tag (a_lang_tag: STRING)
			-- add a new language to the archetype - creates new language section in
			-- terminology, translations and resource description
		do
			precursor (a_lang_tag)
			terminology.add_language (a_lang_tag)
		end

	remove_terminology_unused_codes
			-- remove all term and constraint codes from terminology
		do
			across terminology_unused_term_codes as codes_csr loop
				terminology.remove_definition (codes_csr.item)
			end
			across terminology_unused_constraint_codes as codes_csr loop
				terminology.remove_definition (codes_csr.item)
			end
		end

end


