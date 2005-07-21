indexing
	component:   "openEHR support types"
	
	description: "[
				  Model of a URI, or Universal Resource Identifier, as defined by W3C
	              RFC 2936.  See %"Universal Resource Identifiers in WWW%" by 
				  Tim Berners-Lee at http://www.ietf.org/rfc/rfc2396.txt.
	              This  is  a  World-Wide  Web  RFC  for  global 
	              identification  of resources. In current use on the web, 
	              eg by Mosaic, Netscape and similar tools.
	              See http://www.w3.org/Addressing for a starting point on URIs.
	              ]"
	keywords:    "www, uri, uniform, resource, identifier"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class URI

inherit
	ANY
		redefine
			out
		end
		
create
	make, make_from_string
	
feature -- Initialisation

	make(a_scheme, a_path, a_query, a_fragment:STRING) is
		require
			Scheme_exists: a_scheme /= Void and then not a_scheme.is_empty
			Path_exists: a_path /= Void and then not a_path.is_empty
			Valid_query: a_query /= Void implies not a_query.is_empty
			Valid_fragment: a_fragment /= Void implies not a_fragment.is_empty
		do
			value := format(a_scheme, a_path, a_query, a_fragment)
		end

	make_from_string(a_uri_string: STRING) is
		require
			valid_string: a_uri_string /= Void and then valid_uri(a_uri_string)
		do
			value := a_uri_string
		end

feature -- Definitions

	Scheme_delimiter: STRING is ":"
			-- indicates the end of the scheme name

	Path_delimiter: STRING is "//"
			-- indicates start of the path

	Fragment_delimiter: STRING is "#"
			-- Indicates the start of a fragment identifier

	Query_delimiter: STRING is "?"
			-- Indicates the start of a query string

	Hierarchy_delimiter: STRING is "/"
			-- Delimiter character for objects whose  relationship  is
			-- hierarchical.

	Escape_char: STRING is "%%"
			-- Used for escaping characters in a  local  scheme  which
			-- have specific significance in a URI. Note that a double
			-- %% must be used here since % is also the Eiffel Escape
			-- character.

	Reserved_chars: STRING is "/#?*.!+%%"
			-- Characters  reserved  for  use  in  URIs.  Where  these
			-- characters  occur  in local names, they will be escaped
			-- with the escape character.

feature -- Access

	value: STRING
			-- the complete URI value

	scheme: STRING is
			-- A distributed information "space" in which  information
			-- objects  exist.  The scheme simultaneously specifies an
			-- information space and a mechanism for accessing objects
			-- in  that  space.  For  example  if  scheme  = "ftp", it
			-- identifies the information space in which  all  ftpable
			-- objects  exist,  and also the application - ftp - which
			-- can be used to access them.
			--
			-- Values may include: "ftp", "telnet", "mailto", "gopher"
			-- and  many others. Refer to WWW URI RFC for a full list.
			-- New information spaces can be accommodated  within  the
			-- URI specification.
		do
		end

	path: STRING is
			-- A string whose format is  a  function  of  the  scheme.
			-- Identifies   the   location  in  <scheme>-space  of  an
			-- information entity. Typical values include hierarchical
			-- directory  paths  for  any  machine.  For example, with
			-- scheme = "ftp", path might be /pub/images/image_01. The
			-- strings "." and ".." are reserved for use in the path.
			-- Paths may include internet/intranet location identifiers
			-- of the form: sub_domain...domain, e.g. "info.cern.ch"
		do
		end

	fragment_id: STRING is
			-- A part of, a  fragment  or  a  sub-function  within  an
			-- object. Allows references to sub-parts of objects, such
			-- as a certain line and  character  position  in  a  text
			-- object.   The  syntax  and semantics are defined by the
			-- application responsible for the object.
		do
		end

	query: STRING is
			-- Query string to send to application implied  by  scheme
			-- and  path  Enables  queries  to applications, including
			-- databases  to  be  included  in  the  URI   Any   query
			-- meaningful to the server, including SQL.
		do
		end

feature -- Status Report

	valid_uri(a_str: STRING): BOOLEAN is
			-- True if a_str in valid URI syntax
		require
			str_valid: a_str /= Void
		do
			Result := a_str.substring_index(Scheme_delimiter + Path_delimiter, 1) > 1
		end
		
feature -- Conversion

	as_string: STRING is
		do
			Result := value
		end
		
feature -- output

	out: STRING is
		do
			Result := as_string
		end
		
feature {NONE} -- Implementation

	format(a_scheme, a_path, a_query, a_fragment:STRING): STRING is
		do
			Result := a_scheme.twin
			Result.append(Scheme_delimiter + Path_delimiter + a_path)

			if a_query /= Void then
			    Result.append(Query_delimiter + a_query)
			end

			if a_fragment /= Void then
			    Result.append(Fragment_delimiter + a_fragment)
			end
		end
		
end

