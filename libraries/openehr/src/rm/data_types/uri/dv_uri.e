note
	component:   "openEHR ADL Tools"

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
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class DV_URI

inherit
	DATA_VALUE

create
	make, make_from_string, make_from_canonical_string

feature -- Initialization

	make, make_from_string (str: STRING)
			-- make from a single string
		do
			-- TO_BE_IMPLEM
			value := str
		end

	make_from_canonical_string (str: STRING)
			-- make from a canonical string
		do
			-- TO_BE_IMPLEM
			value := str
		end

feature -- Status Report

	valid_canonical_string (str: STRING): BOOLEAN
			-- True if str contains required tags
		do
		end

feature -- Access

	value: STRING

	scheme: STRING
			-- A distributed information "space" in which  information objects  exist.  The scheme
			-- simultaneously specifies an information space and a mechanism for accessing objects
			-- in  that  space.  For  example  if  scheme  = "ftp", it identifies the information
			-- space in which  all  ftpable objects  exist,  and also the application - ftp - which
			-- can be used to access them.  Values may include: "ftp", "telnet", "mailto" and  many
			-- others. Refer to WWW URI RFC for a full list.
			-- New information spaces can be accommodated  within  the URI specification.
		do
			create Result.make_empty
		end

	path: STRING
			-- A string whose format is  a  function  of  the  scheme. Identifies   the   location
			-- in  <scheme>-space  of  an information entity. Typical values include hierarchical
			-- directory  paths  for  any  machine.  For example, with scheme = "ftp", path might
			-- be /pub/images/image_01. The strings "." and ".." are reserved for use in the path.
			-- Paths may include internet/intranet location identifiers of the form: sub_domain...domain,
			-- e.g. "info.cern.ch"
		do
			create Result.make_empty
		end

	fragment_id: STRING
			-- A part of, a  fragment  or  a  sub-function  within  an object. Allows references to
			-- sub-parts of objects, such as a certain line and  character  position  in  a  text
			-- object. The  syntax  and semantics are defined by the application responsible for the object.
		do
			create Result.make_empty
		end

	query: STRING
			-- Query string to send to application implied  by  scheme and  path  Enables  queries
			-- to applications, including databases  to  be  included  in  the  URI   Any   query
			-- meaningful to the server, including SQL.
		do
			create Result.make_empty
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
			create Result.make_empty
			Result.append(value)
		end

	as_canonical_string: STRING
			-- standardised form of string guaranteed to contain all information
			-- in data item
		do
			Result := "<value>" + value + "</value>"
		end

invariant
	Value_exists: not value.is_empty

end


