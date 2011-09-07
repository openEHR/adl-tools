note
	component:   "openEHR Archetype Project"
	description: "OWL syntax definitions"
	keywords:    "serialisation, OWL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OWL_DEFINITIONS

feature -- Access

	SYM_ANNOTATION: INTEGER = 501
	SYM_ONTOLOGY: INTEGER = 502
	SYM_NAMESPACE: INTEGER = 503
	SYM_CLASS: INTEGER = 504
	SYM_OBJECT_PROPERTY: INTEGER = 505
	SYM_DATA_PROPERTY: INTEGER = 506
	SYM_COMPLETE: INTEGER = 507
	SYM_PARTIAL: INTEGER = 508
	SYM_RESTRICTION: INTEGER = 509
	SYM_INTERSECTION_OF: INTEGER = 510
	SYM_SOME_VALUES_FROM: INTEGER = 511
	SYM_ALL_VALUES_FROM: INTEGER = 512
	SYM_UNION_OF: INTEGER = 513
	
	SYM_CARDINALITY: INTEGER = 514
	SYM_MIN_CARDINALITY: INTEGER = 515
	SYM_MAX_CARDINALITY: INTEGER = 516
	
	SYM_OPEN_PAREN: INTEGER = 517
	SYM_CLOSE_PAREN: INTEGER = 518
		
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
--| The Original Code is native_serialisation_profile.e.
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
