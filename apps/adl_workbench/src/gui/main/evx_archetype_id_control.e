note
	component:   "openEHR ADL Tools"
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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_ARCHETYPE_ID_CONTROL

inherit
	EVX_SINGLE_LINE_TEXT_CONTROL
		rename
			make_linked as make_linked_text_ctl, make as make_text_ctl, make_readonly as make_readonly_text_ctl
		end

create
	make_linked, make_readonly

feature -- Initialisation

	make (an_id_template: ARCHETYPE_HRID; a_title: STRING; a_data_source_agent: like data_source_agent)
		do
			make_text_ctl (a_title, a_data_source_agent, 0, True)
			make_id_controls (an_id_template)
		end

	make_readonly (an_id_template: ARCHETYPE_HRID; a_title: detachable STRING; a_data_source_agent: like data_source_agent)
			-- make so that no user interaction with visual control is possible
		do
			make_readonly_text_ctl (a_title, a_data_source_agent, 0, True)
			make_id_controls (an_id_template)
		end

	make_linked (an_id_template: ARCHETYPE_HRID; a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain)
		do
			make_linked_text_ctl (a_title, a_data_source_agent, a_data_source_setter_agent,
				a_data_source_remove_agent, an_undo_redo_chain, 0, True)
			make_id_controls (an_id_template)
		end

feature -- Access

	id_issuer_label: EV_LABEL

	id_version_label: EV_LABEL

feature {NONE} -- Implementation

	make_id_controls (an_id_template: ARCHETYPE_HRID)
		do
			-- issuer label
			create id_issuer_label
			id_issuer_label.set_text (an_id_template.qualified_rm_class + an_id_template.axis_separator.out)
			ev_root_container.start
			ev_root_container.put_right (id_issuer_label)
			ev_root_container.disable_item_expand (id_issuer_label)

			-- version label
			create id_version_label
			id_version_label.set_text (an_id_template.axis_separator.out + an_id_template.version_id)
			ev_root_container.finish
			ev_root_container.put_right (id_version_label)
			ev_root_container.disable_item_expand (id_version_label)
		end

end



