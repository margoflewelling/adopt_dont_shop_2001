require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see list of all pets" do
    shelter_1 = Shelter.create(name: "Routt Humane",
                              address: "760 Critter Court",
                              city: "Steamboat Springs",
                              state: "CO",
                              zip: "80487")

    pet_1 = Pet.create(name: "Odie",
                      age: "8",
                      sex: "Male",
                      shelter: shelter_1)

    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.sex)
  end
end
