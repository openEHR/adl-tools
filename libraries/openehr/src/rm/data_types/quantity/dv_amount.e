note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract class defining the concept of relative quantified 'amounts'. For relative quantities, 
				 the '+' and '-' operators are defined (unlike descendants of DV_ABSOLUTE_QUANTITY, such as the 
				 date/time types).
				 ]"
	keywords:    "quantity, data"
	requirements:"ISO 18308 TS V1.0 STR 3.2 - 3.4"
	design:      "openEHR Data Types Reference Model 1.7"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DV_AMOUNT

inherit
	DV_QUANTIFIED

	EXTERNAL_ENVIRONMENT_ACCESS
		undefine
			is_equal
		end

feature -- Access

	accuracy: REAL
			-- optional accuracy of measurement instrument or method which applies
			-- to this specific instance of DV_QUANTIFIED, expressed as the value
			-- of the half-range quoted for the accuracy, e.g. "+/- 5%" is represented 
			-- as a DV_QUANTITY of value 5 and units "%".

feature -- Status Report

	accuracy_is_percent: BOOLEAN
			-- If True, indicates that when this object was created, accuracy was recorded as a
			-- percent value; if False, as an absolute quantity value.

feature -- Comparison

	valid_percentage (v: REAL): BOOLEAN
			-- True if v between 0 and 1
		do
			if attached {COMPARABLE} v as a_comparable then
				Result := a_comparable >= 0.0 and a_comparable <= 1.0
			end
		end

feature -- Basic Operations

	plus alias "+" (other: like Current): like Current
			-- addition
		require
			is_strictly_comparable_to(other)
		deferred
		ensure
			is_strictly_comparable_to(Result)
		end

	minus alias "-" (other: like Current): like Current
			-- difference
		require
			is_strictly_comparable_to(other)
		deferred
		ensure
			is_strictly_comparable_to(Result)
		end

feature -- Modification

	set_accuracy (v: REAL; is_percent: BOOLEAN)
			-- set accuracy as half-range v, flag indicates whether understood as a percentage or not
		require
			is_percent implies valid_percentage(v)
		do
			accuracy := v
			accuracy_is_percent := is_percent
		ensure
			accuracy = v
			accuracy_is_percent = is_percent
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans
		do
			Result := magnitude_as_string
			if accuracy /= 0 then
				Result.append(" +/-" + accuracy.out)
				if accuracy_is_percent then
					Result.append ("%%")
				end
			end
		end

	magnitude_as_string: STRING
			-- output the magnitude in its natural form
		deferred
		ensure
			not_empty: not Result.is_empty
		end

invariant
	Accuracy_validity: accuracy_is_percent implies valid_percentage (accuracy)

end


