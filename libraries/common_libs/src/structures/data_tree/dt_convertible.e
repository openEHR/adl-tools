note
	component:   "openEHR Archetype Project"
	description: "[
			     Abstract class providing convertibility from a DT structure to any object type.
			     
			     The `make_dt' routine provides a parameterless make routine that can be safely called by DT_OBJECT_CONVERTER during 
			     deserialisation, to ensure invariants are satisfied directly after initial creation.
			     
			     The `persistent_attributes' attribute defines a list of names of attributes that should be persisted, since often 
			     there are other extraneous attributes. If empty, the DT_OBJECT_CONVERTER
			     routines will assume all.
			     ]"
	keywords:    "Data Tree"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class DT_CONVERTIBLE

feature -- Initialisation

	make_dt
			-- basic make routine to guarantee validity on creation
		deferred
		end

feature -- Representation

	dt_representation: DT_COMPLEX_OBJECT_NODE
			-- representation as a data tree

feature -- Synchronisation

	synchronise_to_tree
			-- synchronise to parse tree representation
		do
			create dt_representation.make_from_object(Current)
		end

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation
		do
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		deferred
		ensure
			attached Result implies Result.object_comparison
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
--| The Original Code is dadl_factory.e.
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
