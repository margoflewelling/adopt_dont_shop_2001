require 'rails_helper'

RSpec.describe "add a shelter", type: :feature do
  it "can create a new shelter" do
    visit "/shelters/new"
    fill_in "sname", with: "Animal House"
    fill_in "address", with: "123"
    fill_in "city", with: "Fort Collins"
    fill_in "state", with: "CO"
    fill_in 'zip', with: "80329"
    click_button "Create Shelter"

    visit '/shelters'
    expect(page).to have_content("Animal House")

  end
end
