note
	component:   "openEHR ADL Tools"
	description: "Constrainer type for instances of BOOLEAN"
	keywords:    "archetype, boolean, data"
	design:      "openEHR Common Archetype Model 0.2"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000-2004 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_BOOLEAN

inherit
	C_PRIMITIVE

create
	make_true, make_false, make_true_false

feature -- Initialisation

	make_true
		do
			default_create
			true_valid := True
		end

	make_false
		do
			default_create
			false_valid := True
		end

	make_true_false
		do
			default_create
			true_valid := True
			false_valid := True
		end

feature -- Access

	prototype_value: BOOLEAN_REF
		do
			create Result
			Result.set_item(true_valid)
		end

feature -- Status Report

	true_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "True"

	false_valid: BOOLEAN
			-- True if the value being constrained is allowed to be "False"

	valid_value (a_value: BOOLEAN_REF): BOOLEAN
		do
			Result := (a_value.item and true_valid) or else (not a_value.item and false_valid)
		end

feature -- Comparison

	node_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a subset of, or the same as `other'
		do
			Result := (true_valid implies other.true_valid) and (false_valid implies other.false_valid)
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if true_valid then
				Result.append(True_valid.out)
				if false_valid then
					Result.append(", ")
				end
			end
			if false_valid then
				Result.append((not False_valid).out)
			end
			if assumed_value /= Void then
				Result.append("; " + assumed_value.out)
			end
		end

	as_canonical_string: STRING
		do
			create Result.make(0)
			Result.append("<true_valid>" + true_valid.out + "</true_valid>")
			Result.append("<false_valid>" + false_valid.out + "</false_valid>")
			Result.append("<assumed_value>" + assumed_value.out + "</assumed_value>")
		end

invariant
	Binary_consistency: true_valid or false_valid
	Default_value_consistency: prototype_value and true_valid or else (not prototype_value and false_valid)

end


