require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see list of all shelters names" do
    shelter_1 = Shelter.create(name: "Routt Humane",
                              address: "760 Critter Court",
                              city: "Steamboat Springs",
                              state: "CO",
                              zip: "80487")
    shelter_2 = Shelter.create(name: "Dumb Friends League",
                              address: "2080 S Quebec St",
                              city: "Denver",
                              state: "CO",
                              zip: "80231")


    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
