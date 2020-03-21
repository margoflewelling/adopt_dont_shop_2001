require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  it 'can add a pet to that shelter' do


  shelter_1 = Shelter.create(name: "Routt Humane",
                            address: "760 Critter Court",
                            city: "Steamboat Springs",
                            state: "CO",
                            zip: "80487")

    visit "/shelters/#{shelter_1.id}/pets"
    click_on "Create Pet"
    fill_in :name, with: "Townes"
    fill_in :description, with: "Shy Catahoula Leopard Dog Mix"
    fill_in :age, with: "4"
    fill_in :sex, with: "male"

    click_on "Create Pet"
    expect(page).to have_content("Townes")
  end
end
