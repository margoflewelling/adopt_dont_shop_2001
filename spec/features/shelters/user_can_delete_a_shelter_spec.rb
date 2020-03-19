require 'rails_helper'

RSpec.describe "destroy a shelter", type: :feature do
  it "can delete a shelter" do
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


    visit "/shelters/#{shelter_2.id}"
    expect { click_on "Delete Shelter" }.to change(Shelter, :count).by(-1)

    visit '/shelters'
    expect(page).to_not have_content ("#{shelter_2.name}")
  end
end
