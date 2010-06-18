note
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype parser. This object can parse single archetypes. It is used by the 
				 ARCHETYPE_COMPILER to perform a system-wide or partial system compilation of
				 archetypes found in the ARCHETYPE_DIRECTORY. It can be driven in an ad hoc fashion, 
				 as by the Archetype Editor. For the target archetype, it can then be used to:
				 	- parse (single archetype), 
				 	- save (serialise back to ADL), 
				 	- save-as (serialise to another format).
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003-2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_PARSER

inherit
	SHARED_KNOWLEDGE_REPOSITORY

	SHARED_APPLICATION_CONTEXT
		export
			{NONE} all
			{ANY} current_language, set_current_language
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Definitions

	openehr_version: STRING
			-- version of openEHR implem-dev repository containing
			-- this software
		once
			Result := (create {OPENEHR_VERSION}).last_changed
		end

feature -- Access

feature -- Commands


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
--| The Original Code is adl_interface.e.
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
