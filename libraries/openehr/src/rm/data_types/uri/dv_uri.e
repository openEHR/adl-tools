indexing
	component:   "openEHR Data Types"

	description: "[
			 A reference to an object which conforms to the Universal Resource Identifier (URI) 
			 standard, as defined by W3C RFC 2936. See 'Universal Resource Identifiers in WWW' 
			 by Tim Berners-Lee at http://www.ietf.org/rfc/rfc2396.txt. This  is  a  World-Wide  
			 Web  RFC  for  global identification  of resources.
			 See http://www.w3.org/Addressing for a starting point on URIs.
			 See http://www.ietf.org/rfc/rfc2806.txt for new URI types like telephone, fax and 
			 modem numbers.
			 ]"
	keywords:    "www, uri, uniform, resource, identifier"

	requirements:"ISO 18308 TS V1.0 STR ??"
	design:      "openEHR Data Types Reference Model 1.7"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$Source: C:/project/openehr/spec-dev/architecture/computable/eiffel/rm/data_types/uri/SCCS/s.dv_uri.e $"
	revision:    "$Revision$"
	last_change: "$Date: 04/07/15 12:09:39+10:00 $"

class DV_URI

inherit
	DATA_VALUE
	
create
	make, make_from_string, make_from_canonical_string

feature -- Initialization

	make, make_from_string (str:STRING) is
			-- make from a single string
		do
			-- TO_BE_IMPLEM
		end

	make_from_canonical_string(str:STRING) is
			-- make from a canonical string
		do
			-- TO_BE_IMPLEM
		end

feature -- Status Report

	valid_canonical_string(str: STRING): BOOLEAN is
			-- True if str contains required tags
		do
		end

feature -- Access

	value: STRING

	scheme: STRING is
			-- A distributed information "space" in which  information objects  exist.  The scheme 
			-- simultaneously specifies an information space and a mechanism for accessing objects 
			-- in  that  space.  For  example  if  scheme  = "ftp", it identifies the information 
			-- space in which  all  ftpable objects  exist,  and also the application - ftp - which 
			-- can be used to access them.  Values may include: "ftp", "telnet", "mailto" and  many 
			-- others. Refer to WWW URI RFC for a full list.
			-- New information spaces can be accommodated  within  the URI specification.
		do
		end

	path: STRING is
			-- A string whose format is  a  function  of  the  scheme. Identifies   the   location  
			-- in  <scheme>-space  of  an information entity. Typical values include hierarchical 
			-- directory  paths  for  any  machine.  For example, with scheme = "ftp", path might 
			-- be /pub/images/image_01. The strings "." and ".." are reserved for use in the path. 
			-- Paths may include internet/intranet location identifiers of the form: sub_domain...domain, 
			-- e.g. "info.cern.ch"
		do
		end

	fragment_id: STRING is
			-- A part of, a  fragment  or  a  sub-function  within  an object. Allows references to 
			-- sub-parts of objects, such as a certain line and  character  position  in  a  text 
			-- object. The  syntax  and semantics are defined by the application responsible for the object.
		do
		end

	query: STRING is
			-- Query string to send to application implied  by  scheme and  path  Enables  queries  
			-- to applications, including databases  to  be  included  in  the  URI   Any   query 
			-- meaningful to the server, including SQL.
		do
		end

feature -- Output

	as_string: STRING is
			-- string form displayable for humans
		do
			create Result.make(0)
			Result.append(value)
		end
	
	as_canonical_string: STRING is
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<value>" + value + "</value>"
		end

invariant
	Value_exists: value /= Void and then not value.is_empty

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
--| The Original Code is dv_uri.e.
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
