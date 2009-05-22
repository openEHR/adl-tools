note
	component:   "openEHR Reusable Libraries"
	description: "Model of Locale"
	keywords:    "internationalisation, locale"

	author:      "Thomas Beale"
	support:     "openEHR support <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics"
	licence:     "The openEHR Open Source Licence"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class LOCALE

create
	make

feature -- Initialisation

	make
			-- FIXME: just fake it for the moment
		local
			start_date, finish_date:DATE
		do
			create country_name_in_english.make(0) country_name_in_english.append("Australia")
			create country_name_in_own_language.make(0) country_name_in_own_language.append("Australia")

			create locale_name_in_english.make(0) locale_name_in_english.append("New South Wales")
			create locale_name_in_own_language.make(0) locale_name_in_own_language.append("New South Wales")

			create language.make(0) language.append("English")
			create territory.make(0) territory.append("Australia")
			create code_set.make(0) code_set.append("xxx")

			create international_phone_code.make(0) international_phone_code.append("61")
			create internet_country_code.make(0) internet_country_code.append("au")
			internet_country_code_required := True

			create currency_symbol.make(0) currency_symbol.append("$")
			create currency_name.make(0) currency_name.append("dollar")

			time_zone_offset := 10
			create time_zone_name.make(0) time_zone_name.append("AEST")
			create short_date_format.make(0) short_date_format.append("dd/mmm/yy")
			create long_date_format.make(0) long_date_format.append("dddd, MMMM YYYY")
			create time_format.make(0) time_format.append("HH:MM:SS")
			use_24_hour_time := False
			summertime_adjustment := 1

			create start_date.make_day_month_year(1,11,00)
			create finish_date.make_day_month_year(31,3,00)
			create summertime_period.make_bounded(start_date, finish_date, True, True)

			create unit_system.make(0) unit_system.append("SI")
			create thousands_separator.make(0) thousands_separator.append(",")
		end

feature -- Region

	country_name_in_english:STRING
		-- e.g.: "Australia", "Sweden"

	country_name_in_own_language:STRING
		-- e.g. "Australia", "Sverige"

	locale_name_in_english:STRING
		-- for parts of a country, esp. large provinces, states etc
		-- e.g. "Tuscany", "New South Wales", "Ontario"

	locale_name_in_own_language:STRING
		-- e.g. "Toscane"

feature -- Language

	language:STRING
			-- language used in this locale. Value is an ISO 639 language code

	territory:STRING
			-- territory. Value is an ISO 3166 country code

	code_set:STRING
			-- name of code set used, e.g. "ISO-????", "kanji2" etc.

feature -- Communication

	international_phone_code:STRING
		-- e.g. Australia is "61"

	internet_country_code:STRING
		-- e.g. Australia is "au", US is "us"

	internet_country_code_required:BOOLEAN
		-- e.g. False for US, True for the rest of us

feature -- Money

	currency_symbol:STRING

	currency_name:STRING
		-- name of currency in English

feature -- Time

	time_zone_offset:INTEGER
		-- relative to GMT, e.g. +10, -8 etc
		-- FIXME: should be a DURATION

	time_zone_name:STRING
		-- e.g. "GMT", "US Central", "AEST" etc

	short_date_format:STRING
		-- e.g. "dd/mm/yy", "dd-MMM-yy"
		-- FIXME: should be a date_format class, with parsing routines

	long_date_format:STRING
		-- e.g. "dddd, MMMM YYYY"
		-- FIXME: should be a date_format class, with parsing routines

	time_format:STRING
		-- e.g. "HH:MM:SS", "HHhMM"

	use_24_hour_time:BOOLEAN
		-- True for most of Europe, False for most anglo, asian
		-- countries. If False, "am" or "pm" are appended to times

	summertime_adjustment:INTEGER
		-- normally +1 if used

	summertime_period: INTERVAL[DATE]
		-- period of Summer time; Void if summertime_adjustment = 0

feature -- Measurement

	unit_system:STRING
		-- e.g. "SI", "US Imperial" etc

	thousands_separator:STRING
		-- e.g. "," for most places

invariant
	Country_name_in_english_required: country_name_in_english /= Void and then not country_name_in_english.is_empty
	Country_name_in_own_language_required: country_name_in_own_language /= Void and then not country_name_in_own_language.is_empty

	Language_required: language /= Void and then not language.is_empty
	Territory_required: territory /= Void and then not territory.is_empty
	Code_set_required: code_set /= Void and then not code_set.is_empty

	Phone_code_required: international_phone_code /= Void and then international_phone_code.is_integer
	Internet_country_code_required: internet_country_code /= Void and then not internet_country_code.is_empty

	Currency_symbol_required: currency_symbol /= Void and then not currency_symbol.is_empty
	Currency_name_required: currency_name /= Void and then not currency_name.is_empty

	Time_zone_offset_valid: time_zone_offset > -12 and time_zone_offset < 12
	Time_zone_name_required: time_zone_name /= Void and then not time_zone_name.is_empty
	Long_date_format_required: long_date_format /= Void and then not long_date_format.is_empty
	Short_date_format_required: short_date_format /= Void and then not short_date_format.is_empty
	Time_format_required: time_format /= Void and then not time_format.is_empty
	Summertime_adjustment: summertime_adjustment /= 0 implies summertime_period /= Void

	Unit_system_required: unit_system /= Void and then not unit_system.is_empty
	Thousands_separator_required: thousands_separator /= Void and then not thousands_separator.is_empty

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
--| The Original Code is locale.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
