note
	component:   "openEHR Archetype Project"
	description: "descriptor for conversion for one type into and out of DT_OBJECT"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DT_CONV_DESC

create
	make

feature -- Initialisation

	make (a_from_obj_proc: like from_obj_proc; a_from_dt_proc: like from_dt_proc)
		require
			From_proc_valid: a_from_obj_proc /= Void
			To_proc_valid: a_from_dt_proc /= Void
		do
			from_obj_proc := a_from_obj_proc
			from_dt_proc := a_from_dt_proc
		end


feature -- Access

	from_obj_proc: PROCEDURE [DT_OBJECT_CONVERTER, TUPLE [DT_ATTRIBUTE_NODE, ANY, STRING]]
			-- object_to_dt(a_parent: DT_ATTRIBUTE_NODE; an_obj: ANY; a_node_id: STRING)

	from_dt_proc: PROCEDURE [DT_OBJECT_CONVERTER, TUPLE [INTEGER, ANY, ANY]]
			-- signature: from_dt_xxx (a_dt_obj: DT_OBJECT_ITEM)
			-- set_xxx_field (i: INTEGER; object: ANY; value: ANY)

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
--| The Original Code is dt_conv_desc.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2005
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
