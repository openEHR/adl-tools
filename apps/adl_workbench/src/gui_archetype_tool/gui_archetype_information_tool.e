note
	component:   "openEHR Archetype Project"
	description: "Statistics display for a single archetype"
	keywords:    "statistics"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	GUI_ARCHETYPE_INFORMATION_TOOL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

	GUI_DEFINITIONS
		export
			{NONE} all
		end

	GUI_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Grid_class_name_col: INTEGER = 1
	Grid_class_count_col: INTEGER = 2
	Grid_attr_name_col: INTEGER = 3
	Grid_attr_count_col: INTEGER = 4

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_class_name_col, Grid_class_count_col, Grid_attr_name_col, Grid_attr_count_col>>
		end

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			-- create widgets
			create report_controls.make
			ev_root_container := report_controls.ev_root_container
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

feature {NONE} -- Implementation

	report_controls: GUI_ARCHETYPE_STATISTICAL_REPORT

	do_clear
		do
			report_controls.clear
		end

	do_populate
		do
			source.generate_statistics (differential_view)
			report_controls.populate (source.statistical_analyser.stats, differential_view)
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
--| The Original Code is gui_archetype_information_tool.e.
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
