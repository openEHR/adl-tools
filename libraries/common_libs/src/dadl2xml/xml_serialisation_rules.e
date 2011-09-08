note
	component:   "openEHR Archetype Project"
	description: "[
				 Object containing rules for controlling XML serialisation of a apecific information type, 
				 e.g. 'ARCHETYPE', via DT graphs. Designed to be populated by reading a dADL file.
				 ]"
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class XML_SERIALISATION_RULES

inherit
	DT_TYPES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Default_doc_tag: STRING = "UNKNOWN_DOCUMENT_TYPE"

	Default_doc_header: STRING = "[
<?xml version="1.0" encoding="utf-8"?>
<$doc_tag xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.openehr.org/v1">
	]"

	Default_doc_footer: STRING = "</$doc_tag>"

feature -- Initialisation

	make
		do
			create im_class_rules.make (0)
			doc_tag := Default_doc_tag.twin
			doc_header := Default_doc_header.twin
			doc_footer := Default_doc_footer.twin
		end

feature -- Access (persistent features from .cfg file)

	im_class_rules: attached HASH_TABLE [XML_IM_CLASS_SERIALISATION_RULES, STRING]
			-- set of rules to do with IM class, keyed by class name to which they apply; this
			-- could include rules for more than one ancestor of a given class, so to get the
			-- full set of rules for type T, a 'flat' set has to be generated - done in `im_class_rules_by_type'

	doc_header: attached STRING
			-- docment level XML header; if '$doc_tag' found in this string, it will be substituted with the
			-- value of the evaluation of 'doc_tag'

	doc_footer: attached STRING
			-- document level XML footer; if '$doc_tag' found in this string, it will be substituted with the
			-- value of the evaluation of 'doc_tag'

	doc_tag: attached STRING
			-- literal name of a tag, or '$xxx' meaning the name of a top-level attribute from the serialised
			-- object whose value should be used as the tag. If nothing found, the default doc_tag is used

feature -- Access

	im_class_flat_rules_by_type: HASH_TABLE [XML_IM_CLASS_SERIALISATION_RULES, INTEGER]
			-- set of rules to do with IM class, based on `im_class_rules' but with
			-- entry for every concrete type requested through `rules_for_type' that
			-- conforms to a type in `im_class_rules'

	rules_for_type (a_type_name: attached STRING): XML_IM_CLASS_SERIALISATION_RULES
			-- get rules for `a_type_name', including any rules defined for a precursor
			-- FIXME: does not yet merge rules found for multiple precursors of a given type
		local
			type_tid, rule_type_tid: INTEGER
		do
			type_tid := dt_dynamic_type_from_string (a_type_name)
			if attached im_class_flat_rules_by_type and then im_class_flat_rules_by_type.has (type_tid) then
				Result := im_class_flat_rules_by_type.item (type_tid)
			else
				-- we do the creation here, because this object may have been read from a text file
				-- and there is no guarantee of make having been run. A slightly cleaner approach
				-- would be to make it DT_CONVERTIBLE and then a make routine can be called on it
				if not attached im_class_flat_rules_by_type then
					create im_class_flat_rules_by_type.make (0)
				end
				from im_class_rules.start until attached Result or im_class_rules.off loop
					rule_type_tid := dt_dynamic_type_from_string (im_class_rules.key_for_iteration)
					if rule_type_tid >= 0 and then type_conforms_to (type_tid, rule_type_tid) then
						if not im_class_flat_rules_by_type.has (type_tid) then
							im_class_flat_rules_by_type.put (im_class_rules.item_for_iteration, type_tid)
						else
							im_class_flat_rules_by_type.item (type_tid).merge (im_class_rules.item_for_iteration)
						end
					end
					im_class_rules.forth
				end
				if im_class_flat_rules_by_type.has (type_tid) then
					Result := im_class_flat_rules_by_type.item (type_tid)
				end
			end
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
--| The Original Code is xml_conversion_rules.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
