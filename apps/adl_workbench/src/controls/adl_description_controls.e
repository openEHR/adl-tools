indexing	
	component:   "openEHR Archetype Project"
	description: "Populate description controls in ADL editor"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class ADL_DESCRIPTION_CONTROLS

inherit
	SHARED_ADL_INTERFACE
		export
			{NONE} all
		end
	
create
	make

feature -- Initialisation

	make(a_main_window: MAIN_WINDOW) is
		require
			a_main_window /= Void
		do
			gui := a_main_window
			gui.arch_desc_resource_orig_res_mlist.hide_title_row
			gui.arch_desc_auth_orig_auth_mlist.hide_title_row
			gui.arch_desc_purpose_text.enable_word_wrapping			
			gui.arch_desc_use_text.enable_word_wrapping			
			gui.arch_desc_misuse_text.enable_word_wrapping		
			gui.arch_desc_copyright_text.enable_word_wrapping
		end

feature -- Commands
	
	clear is
			-- wipe out content
		do
			gui.arch_desc_status_text.remove_text

			gui.arch_desc_auth_orig_auth_mlist.wipe_out
			gui.arch_desc_auth_contrib_list.wipe_out
		
			gui.arch_desc_purpose_text.remove_text			
			gui.arch_desc_use_text.remove_text			
			gui.arch_desc_misuse_text.remove_text		
			gui.arch_desc_keywords_list.wipe_out		

			gui.arch_desc_resource_package_text.remove_text
			gui.arch_desc_resource_orig_res_mlist.wipe_out

			gui.arch_desc_copyright_text.remove_text
		end

	populate is
			-- populate ontology controls
		do
			clear
			if adl_interface.archetype.description /= Void then
				populate_status
				populate_authorship
				populate_details
				populate_resources
				populate_copyright			
			end
		end

feature {NONE} -- Implementation

	gui: MAIN_WINDOW
			-- main window of system

	populate_status is
			-- populate lifecycle status field
		local
			sts: STRING
		do
			sts := adl_interface.archetype.description.lifecycle_state
			if sts /= Void then
				gui.arch_desc_status_text.set_text(sts)
			end
		end

	populate_authorship is
			-- populate authorship fields
		local
			ev_auth_mlist: EV_MULTI_COLUMN_LIST
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
			ev_list_item: EV_LIST_ITEM
			orig_auth: HASH_TABLE [STRING, STRING]
			contribs: ARRAYED_LIST [STRING]
			i: INTEGER
		do
			-- original author: tagged list of strings
			orig_auth := adl_interface.archetype.description.original_author
			ev_auth_mlist := gui.arch_desc_auth_orig_auth_mlist
			from
				orig_auth.start
			until
				orig_auth.off				
			loop	
				create ev_list_row
				ev_list_row.extend(orig_auth.key_for_iteration)
				ev_list_row.extend(orig_auth.item_for_iteration)
				ev_auth_mlist.extend(ev_list_row)
				orig_auth.forth				
			end

			from i := 1
			until i > ev_auth_mlist.column_count
			loop ev_auth_mlist.resize_column_to_content(i)
				i := i + 1
			end				
			
			-- contributors: list of strings
			contribs := adl_interface.archetype.description.other_contributors
			if contribs /= Void then
				gui.arch_desc_auth_contrib_list.set_strings (contribs)
			end
		end

	populate_details is
			-- populate details (language senstive)
		local
			arch_desc_item: ARCHETYPE_DESCRIPTION_ITEM
			keywords: ARRAYED_LIST [STRING]
			ev_list: EV_LIST
			ev_list_item: EV_LIST_ITEM
		do
			arch_desc_item := adl_interface.archetype.description.details_for_lang(language)
			
			if arch_desc_item /= Void then
				if arch_desc_item.purpose /= Void then
					gui.arch_desc_purpose_text.set_text(arch_desc_item.purpose)
				end
			
				if arch_desc_item.use /= Void then
					gui.arch_desc_use_text.set_text(arch_desc_item.use)
				end
			
				if arch_desc_item.misuse /= Void then
					gui.arch_desc_misuse_text.set_text(arch_desc_item.misuse)
				end
			
				ev_list := gui.arch_desc_keywords_list
				keywords := arch_desc_item.keywords
				if keywords /= Void then			
					from
						keywords.start
					until
						keywords.off
					loop
						create ev_list_item.make_with_text (keywords.item)
						ev_list.extend(ev_list_item)
						keywords.forth
					end			
				end
			end
		end

	populate_resources is
			-- populate resources fields
		local
			arch_desc_item: ARCHETYPE_DESCRIPTION_ITEM
			orig_res_uris: HASH_TABLE [URI, STRING]
			ev_mlist: EV_MULTI_COLUMN_LIST
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
			arch_pkg_uri: URI
			i: INTEGER
		do
			-- package URI
			arch_pkg_uri := adl_interface.archetype.description.archetype_package_uri
			if arch_pkg_uri /= Void then
				gui.arch_desc_resource_package_text.set_text(arch_pkg_uri.out)
			end
	
			-- list of URI resources
			arch_desc_item := adl_interface.archetype.description.details_for_lang(language)
			if arch_desc_item /= Void then
				orig_res_uris := arch_desc_item.original_resource_uri
				if orig_res_uris /= Void then
					ev_mlist := gui.arch_desc_resource_orig_res_mlist
					from
						orig_res_uris.start
					until
						orig_res_uris.off
					loop
						create ev_list_row
						ev_list_row.extend(orig_res_uris.key_for_iteration)
						ev_list_row.extend(orig_res_uris.item_for_iteration.out)
						ev_mlist.extend(ev_list_row)
						orig_res_uris.forth
					end
				
					from i := 1
					until i > ev_mlist.column_count
					loop ev_mlist.resize_column_to_content(i)
						i := i + 1
					end
				end			
			end
		end

	populate_copyright is
			-- populate copyright field
		local
			arch_desc_item: ARCHETYPE_DESCRIPTION_ITEM
		do
			arch_desc_item := adl_interface.archetype.description.details_for_lang(language)
			if arch_desc_item /= Void and then arch_desc_item.copyright /= Void then
				gui.arch_desc_copyright_text.set_text(arch_desc_item.copyright)
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
--| The Original Code is adl_ontology_controls.e.
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
