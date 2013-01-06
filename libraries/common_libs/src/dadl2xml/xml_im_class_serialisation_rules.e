note
	component:   "openEHR Archetype Project"
	description: "Object containing rules for controlling XML serialisation of DT graphs. Designed to be populated by reading a dADL file."
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class XML_IM_CLASS_SERIALISATION_RULES

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Access

	convert_to_xml_attr_attr_names: ARRAYED_LIST [STRING]
			-- set of IM class attribute names that should become, along with their value, an XML attribute on the enclosing XML tag
        attribute
            create Result.make (0)
        end

feature -- Status Report

	output_dt_im_type_name_as_xml_attr: BOOLEAN
			-- True if DT_OBJECT.im_type_name should be output as an XML attribute

feature -- Element Change

	merge (other: XML_IM_CLASS_SERIALISATION_RULES)
			-- merge in rules in `other'
		do
			convert_to_xml_attr_attr_names.append (other.convert_to_xml_attr_attr_names)
			output_dt_im_type_name_as_xml_attr := output_dt_im_type_name_as_xml_attr or other.output_dt_im_type_name_as_xml_attr
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
