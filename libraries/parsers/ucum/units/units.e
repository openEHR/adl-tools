note
	component:   "openEHR ADL Tools"
	description: "[
		       Units as used for measuring quantities. Made of a series of 
			 UNIT_DEFINITION/exponent atoms.
			 ]"
	keywords:    "unit"
	description: "Model of a unit atom with prefix, suffix, name, property and unit group"
	keywords:    "units"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class UNITS

inherit 
	QUANTIFIABLE
		redefine
			out
		end

create
	make

feature -- Initialisation

	make(item_list:ARRAYED_LIST[UNITS_ITEM])
		require
			Unit_list_valid: item_list /= Void and then not item_list.is_empty
		do
			items := item_list
		ensure
			Simple_units_set: items = item_list
		end

feature -- Access

	items:ARRAYED_LIST[UNITS_ITEM]

feature -- Element Change

	add_unit (a_unit: UNITS_ITEM)
			-- FIXME: this probably needs to be in UNITS
		require
			Unit_valid: a_unit /= Void and then not items.has(a_unit)
		do
			if items = Void then
				create items.make (1)
				items.compare_objects
			end
			items.extend(a_unit)
		end

feature -- Output

	as_string:STRING
		do
			create Result.make(0)
			from items.start until items.off loop
				if not items.isfirst then
				    Result.append_character('.')
				end
				Result.append(items.item.unit.as_string)
				if items.item.exponent > 1 then
					Result.append("^" + items.item.exponent.out)
				end
				items.forth
			end
		end

	out:STRING
		do
			create Result.make(0)
			Result.append(as_string)
			from items.start until items.off loop
				if not items.isfirst then
				    Result.append("%N")
				end
				Result.append(items.item.out)
				items.forth
			end
		end

end


