note
	component:   "openEHR ADL Tools"
	description: "cardinality representation in ADL parse tree"
	keywords:    "cardinality, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CARDINALITY

inherit
	ANY
		redefine
			is_equal
		end

create
	make, make_from_string

feature -- Definitions

	Cardinality_subsection_delimiter: CHARACTER = ';'

	Cardinality_unique_marker: STRING = "unique"

	Cardinality_ordered_marker: STRING = "ordered"

	Cardinality_unordered_marker: STRING = "unordered"

feature -- Initialisation

	make (an_interval: attached MULTIPLICITY_INTERVAL)
			-- default status is: ordered, not unique, i.e., a list
		require
			Interval_valid: not an_interval.lower_unbounded
		do
			interval := an_interval
			is_ordered := True
		ensure
			Is_list: is_ordered and not is_unique
		end

	make_from_string (a_str: attached STRING)
			-- make from string of form "n..m; ordered; unique" where the ';' section(s) are optional
		local
			end_pos: INTEGER
		do
			end_pos := a_str.index_of (Cardinality_subsection_delimiter, 1)
			if end_pos > 0 then
				create interval.make_from_string (a_str.substring (1, end_pos-1))
				if a_str.has_substring (Cardinality_unordered_marker) then
					-- nothing, but have to check before checking for 'ordered' marker
				elseif a_str.has_substring (Cardinality_ordered_marker) then
					is_ordered := True
				end

				if a_str.has_substring (Cardinality_unique_marker) then
					is_unique := True
				end
			else
				create interval.make_from_string (a_str)
			end
		end

feature -- Access

	interval: MULTIPLICITY_INTERVAL

feature -- Status Report

	is_ordered: BOOLEAN

	is_unique: BOOLEAN

	is_list: BOOLEAN
		do
			Result := is_ordered and not is_unique
		end

	is_set: BOOLEAN
		do
			Result := not is_ordered and is_unique
		end

	is_bag: BOOLEAN
		do
			Result := not is_ordered and not is_unique
		end

	is_open: BOOLEAN
			-- True if this interval imposes no constraints, i.e. is set to 0..*
		do
			Result := interval.is_open
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- True if this and `other' are the same logical interval
		do
			Result := interval.is_equal (other.interval) and is_ordered = other.is_ordered and is_unique = other.is_unique
		end

	contains (other: CARDINALITY): BOOLEAN
			-- Does current cardinality contain `other'?
		do
			Result := interval.contains (other.interval)
		end

feature -- Modification

	set_unordered
		do
			is_ordered := False
		end

	set_unique
		do
			is_unique := True
		end

feature -- Output

	as_string: STRING
			-- output as a string, excluding default items
		do
			create Result.make(0)

			Result.append(interval.lower.out)
			if interval.upper_unbounded then
				Result.append("..*")
			elseif not interval.is_point then
				Result.append(".." + interval.upper.out)
			end

			if is_ordered then
				Result.append("; ordered")
			else
				Result.append("; unordered")
			end

			if is_unique then
				Result.append("; unique")
			end
		end

invariant
	Validity: not interval.lower_unbounded

end


