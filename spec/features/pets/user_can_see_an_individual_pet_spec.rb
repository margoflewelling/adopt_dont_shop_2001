require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see info for an individal pet" do
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
                      adoption_status: "Available")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.adoption_status)
  end
end
