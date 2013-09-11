note
	component:   "openEHR ADL Tools"
	description: "Model of a unit atom with prefix, suffix, name, property and unit group"
	keywords:    "units"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UNIT_REFERENCE

inherit
	QUANTIFIABLE
		redefine
			out
		end

create
	make

feature -- Definitions

	Suffix_start:STRING = "["

	Suffix_end:STRING = "]"

feature -- Initialisation

	make(a_name, a_property, a_group:STRING)
		require
			Name_exists: a_name /= Void and then not a_name.is_empty
			Property_exists: a_property /= Void and then not a_property.is_empty
			group_exists: a_group /= Void and then not a_group.is_empty
		do
			name := a_name.twin
			property := a_property.twin
			group := a_group.twin
		ensure
			Name_set: name.is_equal(a_name)
			Property_set: property.is_equal(a_property)
			Group_set: group.is_equal(a_group)
		end

feature -- Access

	name:STRING
			-- name of this unit in `group'

	group:STRING
			-- unit group from which this unit comes

	metric_prefix:STRING
			-- metric prefix symbol used with this unit instance, e.g. "k" for "kilo";
			-- can be used to key into prefix table in units database

	suffix:STRING
			-- string whose inclusion changes the meaning of the unit, e.g.
			-- Hg in "mm[Hg]"

feature -- Modify

	set_metric_prefix(str:STRING)
			-- set metric prefix
		require
			str /= Void and then not str.is_empty
		do
			metric_prefix := str.twin
		end

	set_suffix(str:STRING)
			-- suffix is a string whose inclusion changes the meaning of the unit, e.g.
			-- "m" = distance, but "m[H2O]" means pressure
		require
			str /= Void and then not str.is_empty
		do
			suffix := str.twin
		end

feature -- Output

	as_string:STRING
		do
			create Result.make(0)
			Result.append(metric_prefix_as_string + name.out + suffix_out)
		end

	out:STRING
		do
			create Result.make(0)
			Result.append(metric_prefix_out + name.out + suffix_out + " {" + property.out + ", " + group.out + "}")
		end

feature {UNITS} -- Implementation

	suffix_out:STRING
		do
			create Result.make(0)
			if suffix /= Void then
				Result.append(Suffix_start + suffix + Suffix_end)
			end
		end

	metric_prefix_as_string:STRING
		do
			create Result.make(0)
			if metric_prefix /= Void then
				Result.append(metric_prefix)
			end
		end

	metric_prefix_out:STRING
		do
			create Result.make(0)
			if metric_prefix /= Void then
				Result.append(metric_prefix  + "_")
			end
		end

invariant
	Name_exists: name /= Void and then not name.is_empty
	Property_exists: property /= Void and then not property.is_empty
	group_exists: group /= Void and then not group.is_empty

end

