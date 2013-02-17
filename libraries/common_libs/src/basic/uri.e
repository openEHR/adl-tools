note
	component:   "openEHR support types"

	description: "[
				  Model of a URI, or Universal Resource Identifier, as defined by W3C
	              RFC 3896.  See %"Universal Resource Identifiers in WWW%" by 
				  Tim Berners-Lee at http://www.ietf.org/rfc/rfc3986.txt.
	              This  is  a  World-Wide  Web  RFC  for  global 
	              identification  of resources. In current use on the web, 
	              eg by Mosaic, Netscape and similar tools.
	              See http://www.w3.org/Addressing for a starting point on URIs.
	              
	              FIXME: This class does not implement this RFC at the moment. It will use the
	              Gobo class to do so in the future, since URIs are made persisitent, 
	              this class will have to iinherit from DT_CONVERTIBLE and list only value as
	              being persistent.
	              ]"
	keywords:    "www, uri, uniform, resource, identifier"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class URI

inherit
	ANY
		redefine
			out
		end

create
	make, make_from_string

feature -- Initialisation

	make (a_scheme, a_path, a_query, a_fragment: STRING)
		require
			Scheme_exists: not a_scheme.is_empty
			Path_exists: not a_path.is_empty
			Valid_query: a_query /= Void implies not a_query.is_empty
			Valid_fragment: a_fragment /= Void implies not a_fragment.is_empty
		do
			value := format(a_scheme, a_path, a_query, a_fragment)
		end

	make_from_string (a_uri_string: STRING)
		require
			valid_string: valid_uri (a_uri_string)
		do
			value := a_uri_string
		end

feature -- Definitions

	Scheme_delimiter: STRING = ":"
			-- indicates the end of the scheme name

	Authority_delimiter: STRING = "//"
			-- indicates start of authority id under which next level of ids are sensible

	Fragment_delimiter: STRING = "#"
			-- Indicates the start of a fragment identifier

	Query_delimiter: STRING = "?"
			-- Indicates the start of a query string

	Hierarchy_delimiter: STRING = "/"
			-- Delimiter character for objects whose  relationship  is
			-- hierarchical.

	Escape_char: STRING = "%%"
			-- Used for escaping characters in a  local  scheme  which
			-- have specific significance in a URI. Note that a double
			-- %% must be used here since % is also the Eiffel Escape
			-- character.

	Reserved_chars: STRING = "/#?*.!+%%"
			-- Characters  reserved  for  use  in  URIs.  Where  these
			-- characters  occur  in local names, they will be escaped
			-- with the escape character.

feature -- Access

	value: STRING
			-- the complete URI value

	scheme: STRING
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
			create Result.make_empty
		end

	path: STRING
			-- A string whose format is  a  function  of  the  scheme.
			-- Identifies   the   location  in  <scheme>-space  of  an
			-- information entity. Typical values include hierarchical
			-- directory  paths  for  any  machine.  For example, with
			-- scheme = "ftp", path might be /pub/images/image_01. The
			-- strings "." and ".." are reserved for use in the path.
			-- Paths may include internet/intranet location identifiers
			-- of the form: sub_domain...domain, e.g. "info.cern.ch"
		do
			create Result.make_empty
		end

	fragment_id: STRING
			-- A part of, a  fragment  or  a  sub-function  within  an
			-- object. Allows references to sub-parts of objects, such
			-- as a certain line and  character  position  in  a  text
			-- object.   The  syntax  and semantics are defined by the
			-- application responsible for the object.
		do
			create Result.make_empty
		end

	query: STRING
			-- Query string to send to application implied  by  scheme
			-- and  path  Enables  queries  to applications, including
			-- databases  to  be  included  in  the  URI   Any   query
			-- meaningful to the server, including SQL.
		do
			create Result.make_empty
		end

feature -- Status Report

	valid_uri (a_str: STRING): BOOLEAN
			-- True if a_str in valid URI syntax
		do
			-- FIXME: for the moment, anything is valid. We need to use the Gobo UT_URI class to
			-- do proper validation
			Result := not a_str.is_empty -- a_str.substring_index(Scheme_delimiter + Authority_delimiter, 1) > 1
		end

feature -- Conversion

	as_string: STRING
		do
			Result := value
		end

feature -- output

	out: STRING
		do
			Result := as_string
		end

feature {NONE} -- Implementation

	format(a_scheme, a_path, a_query, a_fragment:STRING): STRING
		do
			Result := a_scheme.twin
			Result.append(Scheme_delimiter + Authority_delimiter + a_path)

			if a_query /= Void then
			    Result.append(Query_delimiter + a_query)
			end

			if a_fragment /= Void then
			    Result.append(Fragment_delimiter + a_fragment)
			end
		end

end

