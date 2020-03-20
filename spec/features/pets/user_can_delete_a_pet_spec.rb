require 'rails_helper'

RSpec.describe "destroy a pet", type: :feature do
  it "can delete a pet" do
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
    pet_2 = Pet.create(name: "Phoebe",
                      age: "14",
                      sex: "Female",
                      shelter: shelter_1,
                      description: "Lovable Golden Doodle",
                      adoption_status: "Adoption Pending",
                      image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dogs-that-dont-shed-1560974761.jpg')


    visit "/pets/#{pet_2.id}"
    expect {click_on "Delete Pet" }.to change(Pet, :count).by(-1)

    visit '/pets'
    expect(page).to_not have_content ("#{pet_2.name}")
  end
end
