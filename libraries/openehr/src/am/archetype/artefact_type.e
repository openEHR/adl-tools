note
	component:   "openEHR ADL Tools"
	description: "Enumeration of archetype-based artefact types"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARTEFACT_TYPE

create
	default_create, make, make_from_type_name, make_archetype, make_template, make_operational_template

feature -- Defnition

	archetype: INTEGER = 0
			-- Constant to indicate that the artefact is designed as an archetype.

	template: INTEGER = 1
			-- Constant to indicate that the artefact is designed as a template.

	template_overlay: INTEGER = 2
			-- Constant to indicate that the artefact is designed as a template_overlay.

	operational_template: INTEGER = 3
			-- Constant to indicate that the artefact is an operational template.

feature -- Initialisation

	make (i: INTEGER)
		require
			valid_type(i)
		do
			value := i
		end

	make_from_type_name (s: attached STRING)
		require
			valid_type_name (s)
		do
			value := types.item (s)
		end

	make_operational_template
		do
			value := operational_template
		end

	make_archetype
		do
			value := archetype
		end

	make_template
		do
			value := template
		end

feature -- Access

	value: INTEGER

	simplified_type_names: HASH_TABLE [STRING, INTEGER]
			-- type names to use for visual classification; treat all template variants as 'templates'
		once
			create Result.make(0)
			Result.extend("archetype", archetype)
			Result.extend("template", template)
			Result.extend("template", template_overlay)
			Result.extend("template", operational_template)
		end

	types: HASH_TABLE [INTEGER, STRING]
		once
			create Result.make(0)
			Result.extend(archetype, "archetype")
			Result.extend(template, "template")
			Result.extend(template_overlay, "template_overlay")
			Result.extend(operational_template, "operational_template")
		end

	type_names: HASH_TABLE [STRING, INTEGER]
		once
			create Result.make(0)
			Result.extend("archetype", archetype)
			Result.extend("template", template)
			Result.extend("template_overlay", template_overlay)
			Result.extend("operational_template", operational_template)
		end

	type_name_to_type (a_name: STRING): INTEGER
		require
			valid_type_name(a_name)
		do
			Result := types.item (a_name)
		end

	type_name: STRING
		do
			check attached type_names.item (value) as tn then
				Result := tn
			end
		end

feature -- Status report

	is_template: BOOLEAN
			-- True if value is `template'
		do
			Result := value = template
		end

	is_template_or_overlay: BOOLEAN
			-- True if value is `template' or `template_overlay'
		do
			Result := value = template or value = template_overlay
		end

	is_overlay: BOOLEAN
			-- True if value is `template_overlay'
		do
			Result := value = template_overlay
		end

feature -- Validation

	valid_type (n: INTEGER): BOOLEAN
			-- Function to test value validity.
		require
			n >= 0
		do
			Result := types.has_item (n)
		end

	valid_type_name (s: attached STRING): BOOLEAN
			-- Function to test validity of string name of value
		do
			Result := types.has_key(s)
		end

	valid_artefact_types (a_list: ARRAY [INTEGER]):BOOLEAN
		do
			Result := a_list.for_all (agent (i: INTEGER): BOOLEAN do Result := valid_type(i) end)
		end

invariant
	Valid_value: valid_type(value)

end


