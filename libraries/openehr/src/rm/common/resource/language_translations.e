note
	component:   "openEHR Common Information Model"
	description: "[
				 Dummy class containing just the translations attribute of AUTHORED_RESOURCE;
				 used by pre-ADL2 parsing to convert dADL text of translations in language section
				 of archetype into an object that can then be pasted into the archetype.
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class LANGUAGE_TRANSLATIONS

inherit
	DT_CONVERTIBLE
		redefine
			default_create
		end

	TERMINOLOGY_SERVICE
		export
			{NONE} all
		undefine
			default_create
		end

create
	make, make_dt

feature -- Initialisation

	default_create
			--
		do
		end

	make
			-- default make
		do
			default_create
		end

	make_dt
			-- make used by DT_OBJECT_CONVERTER
		do
			make
		end

feature -- Access

	original_language: CODE_PHRASE

	translations: HASH_TABLE [TRANSLATION_DETAILS, STRING]
			-- List of details for each natural translation made of this resource, keyed by
			-- language. For each translation listed here, there must be corresponding
			-- sections in all language-dependent parts of the resource.

feature -- Modification

	set_translations(a_trans: HASH_TABLE [TRANSLATION_DETAILS, STRING])
			-- set translations
		do
			translations := a_trans
		end

	set_original_language(a_lang: CODE_PHRASE)
			--
		do
			original_language := a_lang
		end

	set_original_language_from_string(a_lang: STRING)
			--
		do
			create original_language.make (Default_language_code_set, a_lang)
		end

	add_new_translation(a_lang: STRING)
			-- add a blank translation object for a_lang
		local
			a_trans: TRANSLATION_DETAILS
		do
			if translations = Void then
				create translations.make(0)
			end

			create a_trans.make_from_language(a_lang)
			translations.put (a_trans, a_lang)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.extend ("original_language")
			Result.extend ("translations")
			Result.compare_objects
		end

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
--| The Original Code is adl_archetype.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
