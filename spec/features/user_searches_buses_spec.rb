require "rails_helper"

feature "User searches for a bus", %{
  As a user
  I want to search for a bus
  So that I dont have to filter through
  all of the buses

  Acceptance Criteria:

  I must be logged in to edit a review
  I can only edit my own review
  I can get to the edit page from the
  bus details page
  } do

    before :each do
      visit buses_path
    end

    scenario "user searches for valid search" do
      bus = FactoryGirl.create(:bus)

      fill_in "search", with: bus.number
      click_button "Search"

      expect(page).to have_content(bus.number)
    end

    scenario "user is notified when search fails" do
      fill_in "search", with: "mass ave"
      click_button "Search"

      expect(page).to have_content("Could not find your search term")
    end
  end
