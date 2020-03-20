require 'rails_helper'

RSpec.describe "shelter edit page", type: :feature do
  it "can edit an existing shelter" do
    shelter_1 = Shelter.create(name: "Routt Humane",
                              address: "760 Critter Court",
                              city: "Steamboat Springs",
                              state: "CO",
                              zip: "80487")


    visit "/shelters/#{shelter_1.id}/edit"
    expect(page).to have_field 'shelter[name]'
    expect(page).to have_field 'shelter[address]'
    expect(page).to have_field 'shelter[city]'
    expect(page).to have_field 'shelter[state]'
    expect(page).to have_field 'shelter[zip]'


    fill_in "shelter[name]", with: "Routt County Humane"
    click_on "Submit"

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("Routt County Humane")

  end
end
