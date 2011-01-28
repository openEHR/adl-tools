note
	component:   "openEHR Archetype Project"
	description: "[
	             Service interface to an object model access for types and attributes defined in a schema representing an 
	             object model, or 'reference model'. One instance of this class corresponds to one model; multiple intances
	             might be created in a system, one for each reference model.
	             ]"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class SCHEMA_ACCESS

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ANY_VALIDATOR

create
	make

feature -- Initialisation

	make (a_schema_full_path: attached STRING)
			-- set up model from full path to model file
		local
			model_file: PLAIN_TEXT_FILE
			dt_tree: DT_COMPLEX_OBJECT_NODE
			parser: DADL2_VALIDATOR
		do
			reset
			create model_file.make (a_schema_full_path)
			if not model_file.exists or else not model_file.is_readable then
				add_error ("model_access_e1", <<a_schema_full_path>>)
			else
				model_file.open_read
				model_file.read_stream (model_file.count)
				create parser.make
				parser.execute(model_file.last_string, 1)
				if not parser.syntax_error then
					dt_tree := parser.output
					schema ?= dt_tree.as_object_from_string("BMM_SCHEMA")
					if schema = Void then
						add_error ("model_access_e4", <<a_schema_full_path>>)
					else
						passed := True
						schema.dt_finalise
					end
				else
					add_error ("model_access_e2", <<a_schema_full_path, parser.errors.as_string>>)
				end
				model_file.close
			end
		end

feature -- Access

	schema: detachable BMM_SCHEMA
			-- computable form of model

feature -- Status Report

	is_top_level: BOOLEAN
			-- True if this is a top-level schema, i.e. not included by some other schema

feature -- Modification

	set_top_level
		do
			is_top_level := True
		end

feature -- Commands

	validate
		do
			schema.validate
			merge_errors (schema.errors)
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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
