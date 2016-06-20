note
	component:   "openEHR ADL Tools"
	description: "General model of a GUI tool whose data source is a BMM_SCHREMA"
	keywords:    "object model, schema"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_RM_TARGETTED_TOOL

inherit
	GUI_TOOL
		redefine
			source
		end

feature -- Access

	source: detachable BMM_MODEL
			-- archetype to which this tool is targetted

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := safe_source.schema_id
		end

end


