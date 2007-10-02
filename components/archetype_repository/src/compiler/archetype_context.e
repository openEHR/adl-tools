indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Wrapper object for ARCHETYPE being parsed & compiled; provides a place
				 to record intermediate prodcts of compilation. Also includes parent
				 relationship between specialised archetypes.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ARCH_CONTEXT

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

create
	make_differential, make_flat

feature -- Initialisation

	make_differential(an_archetype: ARCHETYPE) is
			-- create with a new differential form (i.e. source form) archetype
		require
			Archetype_exists: an_archetype /= Void and then an_archetype.is_differential
		do
			archetype_differential := an_archetype
			if not an_archetype.is_specialised then
				-- FIXME for the moment
				archetype_flat := archetype_differential
			else
				-- FIXME set flat_form to structure generated from differential form in memory
			end

	-- FIXME: the following call yet to be properly implemented
	--		archetype_differential.validate
	--		if archetype_differential.is_valid then
	--			post_info(Current, "parse_archetype", "parse_archetype_i2", <<archetype_differential.archetype_id.as_string>>)
	--			is_valid := True
	--		else
	--			post_error(Current, "parse_archetype", "parse_archetype_e2", <<archetype_differential.archetype_id.as_string, archetype_differential.validator.errors>>)
	--		end
	--		if archetype_differential.validator.has_warnings then
	--			post_warning(Current, "parse_archetype", "parse_archetype_w2", <<archetype_differential.archetype_id.as_string, archetype_differential.validator.warnings>>)
	--		end
		end

	make_flat(an_archetype: ARCHETYPE) is
			-- create with a flat form archetype
		require
			Archetype_exists: an_archetype /= Void and then not an_archetype.is_differential
		do
			archetype_flat := an_archetype
			-- FIXME validation is currently done here on flat form; in future has to be done on the differential form,
			-- but requires new validation code to be written. THE FOLLOWING LINES OF CODE WOULD THEN DISAPPEAR - AND THE
			-- EQUIVALENT LINES IN THE make_differential ROUTINE ABOVE WOULD BE UNCOMMENTED, AND EITHER OPY THAT HERE
			-- OR MAKE A NEW ROUTINE THAT VALIDATES THE DIFFERENTIAL FORM, TO BE CALLED BY BOTH make ROUTINES HERE.
			archetype_flat.validate
			if archetype_flat.is_valid then
				post_info(Current, "parse_archetype", "parse_archetype_i2", <<archetype_flat.archetype_id.as_string>>)
				is_valid := True

				-- generate the differential form
				if not an_archetype.is_specialised then
					-- FIXME for the moment; in future needs to be separate instances??
					archetype_differential := archetype_flat
				else -- generate differential form from flat
					-- first make a complete clone of the archetype; could also be done by copy of serialised form and parse
					archetype_differential := archetype_flat.deep_twin
					archetype_differential.convert_to_differential
					post_info (Current, "make_flat", "arch_context_make_flat_i1", Void)
				end
			else
				post_error(Current, "parse_archetype", "parse_archetype_e2", <<archetype_flat.archetype_id.as_string, archetype_flat.validator.errors>>)
			end
			if archetype_flat.validator.has_warnings then
				post_warning(Current, "parse_archetype", "parse_archetype_w2", <<archetype_flat.archetype_id.as_string, archetype_flat.validator.warnings>>)
			end
		end

feature -- Access

	archetype_differential: ARCHETYPE
			-- archetype representing differential structure with respect to parent archetype;
			-- if this is a non-specialised archetype, then it is the same as the flat form, else
			-- it is just the differences (like an object-oriented source file for a subclass)

	archetype_flat: ARCHETYPE
			-- inheritance-flattened form of archetype

	specialisation_parent: ARCH_CONTEXT
			-- parent archetype if this one is specialised, or else Void

feature -- Status Report

	is_valid: BOOLEAN
			-- True if archetype object created and 'is_valid' True. This can be used to check if the archetype has
			-- actually been compiled and is available in memory. This is useful for specialised archetypes because
			-- you want to know if the parent has been compiled (up the lineage) before you can compile the current
			-- one

	is_specialised: BOOLEAN is
			-- True if archetype is a specialisation
		do
			Result := archetype_differential.is_specialised
		end

invariant
	Parent_existence: specialisation_parent /= Void implies is_specialised
	Parent_validity: specialisation_parent /= Void implies specialisation_parent.archetype_flat.archetype_id.semantic_id.is_equal(archetype_differential.archetype_id.semantic_parent_id)

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
