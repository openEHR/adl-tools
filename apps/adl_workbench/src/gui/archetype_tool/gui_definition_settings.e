note
	component:   "openEHR Archetype Project"
	description: "Model of a vector of UI settings required to specify definition tree visual appearance."
	keywords:    "archetype, definition, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"
	void_safety: "initial"

class GUI_DEFINITION_SETTINGS

inherit
	BASIC_DEFINITIONS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

create
	make, make_default

feature -- Initialisation

	make_default
		do
			language := default_language
		end

	make (a_language: STRING;
			a_show_codes,
			a_show_rm_inheritance,
			a_show_technical_view,
			a_show_rm_data_properties,
			a_show_rm_runtime_properties,
			a_show_rm_infrastructure_properties: BOOLEAN)
		do
			language := a_language
			show_codes := a_show_codes
			show_rm_inheritance := a_show_rm_inheritance
			show_technical_view := a_show_technical_view
			show_rm_data_properties := a_show_rm_data_properties
			show_rm_runtime_properties := a_show_rm_runtime_properties
			show_rm_infrastructure_properties := a_show_rm_infrastructure_properties
		end

feature -- Access

	language: STRING

	show_codes: BOOLEAN

	show_rm_inheritance: BOOLEAN

	show_technical_view: BOOLEAN

	show_rm_data_properties: BOOLEAN

	show_rm_runtime_properties: BOOLEAN

	show_rm_infrastructure_properties: BOOLEAN

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
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
