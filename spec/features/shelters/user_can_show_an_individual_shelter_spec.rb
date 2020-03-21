require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can see a shelters address" do
    shelter_1 = Shelter.create(name: "Routt Humane",
                              address: "760 Critter Court",
                              city: "Steamboat Springs",
                              state: "CO",
                              zip: "80487")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

    expect(page).to have_link(href: "/shelters/#{shelter_1.id}/pets")


  end
end
