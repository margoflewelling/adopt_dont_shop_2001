require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  it 'can see list of all pets at that shelter' do


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
  shelter_2 = Shelter.create(name: "Dumb Friends League",
                            address: "76 Adopt Alley",
                            city: "Denver",
                            state: "CO",
                            zip: "804210")
  pet_2 = Pet.create(name: "Phoebe",
                    age: "14",
                    sex: "Female",
                    shelter: shelter_2,
                    description: "Lovable Golden Doodle",
                    adoption_status: "Adoption Pending")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to_not have_content(pet_2.name)
  end
end
