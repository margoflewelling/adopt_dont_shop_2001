require 'rails_helper'

RSpec.describe "as a visitor", type: :feature do
  it "can see update pet info" do
    shelter_1 = Shelter.create(name: "Routt Humane",
                              address: "760 Critter Court",
                              city: "Steamboat Springs",
                              state: "CO",
                              zip: "80487")

    pet_1 = Pet.create(name: "Odie",
                      age: "8",
                      sex: "Male",
                      shelter: shelter_1,
                      description: "Friendly, shnauzer poodle mix",
                      adoption_status: "Available",
                      image: 'https://www.sheknows.com/wp-content/uploads/2018/08/fajkx3pdvvt9ax6btssg.jpeg?w=695&h=391&crop=1')

    visit "/pets/#{pet_1.id}"
    click_on "Update Pet"

    fill_in "pet[name]", with: "Odell"
    click_on "Update Pet"
    expect(page).to have_content("Odell")
    expect(page).to_not have_content("Odie")
  end
end
