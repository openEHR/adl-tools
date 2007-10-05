indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype compiler interface. This object knows how to compile a system of archetypes
				 found in the ARCHETYPE_DIRECTORY.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://svn.openehr.org/ref_impl_eiffel/BRANCHES/specialisation/components/adl_parser/src/interface/archetype_parser.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2007-10-02 16:49:19 +0100 (Tue, 02 Oct 2007) $"

class ARCHETYPE_COMPILER

inherit
	SHARED_ARCHETYPE_DIRECTORY

	SHARED_RESOURCES
		export
			{NONE} all
		end

	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make is
		do
			create status.make(0)
		end

feature -- Access

	status: STRING
			-- last status of compiler

feature -- Status Report

feature -- Commands

	build_all is
			-- rebuild the whole system, but don't rebuild artefact that seem to already be built
		do

		end

	rebuild_all is
			-- force rebuild the whole system from scratch, regardless of previous previous attempts
		do

		end

	build_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- build just the archetypes that need to be rebuilt in the lineage containing ara, down as far
			-- as ara, and not including sibling branches (since this would create errors in unrelated archetypes)
		do

		end

	rebuild_lineage (ara: ARCH_REP_ARCHETYPE) is
			-- force rebuild of the archetypes in the lineage containing ara
		do

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
--| The Original Code is archetype_compiler.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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
