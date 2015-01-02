require 'rails_helper'

feature "user records new manufacturer", %q(

	As a car salesperson
	I want to record a car manufacturer
	So that I can keep track of the types of cars found in the lot
	Acceptance Criteria:

	[x] I must specify a manufacturer name and country.
	[x] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
	[] If I do not specify the required information, I am presented with errors.

	) do

	scenario "record new manufacturer" do
		manufacturer = Manufacturer.create(
			name: "Honda",
			country: "Japan"
			)

		visit new_manufacturer_path

		fill_in "Name", with: "Honda"
		fill_in "Country", with: "Japan"

		click_button "Add Manufacturer"

		expect(page).to have_content manufacturer.name
		expect(page).to have_content manufacturer.country
	end
end