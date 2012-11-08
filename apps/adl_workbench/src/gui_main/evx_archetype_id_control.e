note
	component:   "openEHR Archetype Project"
	description: "[
				 Visual control for editing an ARCHETYPE_ID.
				 Visual control structure has a static label 'id' on the left, 
				 then a non-editable control for the 'issuer-model-class' part of the id;
				 then an edit box for the concept part of the id;
				 then a non-editable control for the version part of the id.
				 
					   +-----------+ +------------+ +---------+
				    Id | (label)   | | text edit  | | (label) |
					   +-----------+ +------------+ +---------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class EVX_ARCHETYPE_ID_CONTROL

inherit
	EVX_SINGLE_LINE_TEXT_CONTROL
		rename
			make_editable as make_editable_text_ctl, make as make_text_ctl, make_readonly as make_readonly_text_ctl
		end

create
	make_editable, make_readonly

feature -- Initialisation

	make (an_id_template: ARCHETYPE_ID; a_title: STRING; a_data_source_agent: like data_source_agent)
		do
			make_text_ctl (a_title, a_data_source_agent, 0, 0, True, True)
			make_id_controls (an_id_template)
		end

	make_readonly (an_id_template: ARCHETYPE_ID; a_title: detachable STRING; a_data_source_agent: like data_source_agent)
			-- make so that no user interaction with visual control is possible
		do
			make_readonly_text_ctl (a_title, a_data_source_agent, 0, 0, True, True)
			make_id_controls (an_id_template)
		end

	make_editable (an_id_template: ARCHETYPE_ID; a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain)
		do
			make_editable_text_ctl (a_title, a_data_source_agent, a_data_source_setter_agent,
				a_data_source_remove_agent, an_undo_redo_chain, 0, 0, True, True)
			make_id_controls (an_id_template)
		end

feature -- Access

	id_issuer_label: EV_LABEL

	id_version_label: EV_LABEL

feature {NONE} -- Implementation

	make_id_controls (an_id_template: ARCHETYPE_ID)
		do
			-- issuer label
			create id_issuer_label
			id_issuer_label.set_text (an_id_template.qualified_rm_entity + an_id_template.axis_separator_string)
			ev_root_container.start
			ev_root_container.put_right (id_issuer_label)
			ev_root_container.disable_item_expand (id_issuer_label)

			-- version label
			create id_version_label
			id_version_label.set_text (an_id_template.axis_separator_string + an_id_template.version_id)
			ev_root_container.finish
			ev_root_container.put_right (id_version_label)
			ev_root_container.disable_item_expand (id_version_label)
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
--| The Original Code is gui_hash_table.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2012
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
