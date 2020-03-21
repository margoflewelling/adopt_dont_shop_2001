require 'rails_helper'

RSpec.describe 'As a Visitor', type: :feature do
  it 'can navigate to pet and shelter index from all pages' do
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
                      image: 'https://www.sheknows.com/wp-content/uploads/2018/08/fajkx3pdvvt9ax6btssg.jpeg?w=695&h=391&crop=1')
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
                      image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dogs-that-dont-shed-1560974761.jpg')

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link(href: "/shelters")
    expect(page).to have_link(href: "/pets")

    visit "/shelters/#{shelter_2.id}/pets"
    expect(page).to have_link(href: "/shelters")
    expect(page).to have_link(href: "/pets")

    visit "/pets/#{pet_1.id}"
    expect(page).to have_link(href: "/shelters")
    expect(page).to have_link(href: "/pets")

  end
end
