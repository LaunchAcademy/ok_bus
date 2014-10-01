require "rails_helper"

feature "User searches for a bus", %{
  As a user
  I want to search for a bus
  So that I dont have to filter through
  all of the buses

  Acceptance Criteria:

  I must be logged in to search for a bus
  I can get to the search page from the
  buses index page
  } do

    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
      @matching_bus = FactoryGirl.create(:bus)
      @non_matching_buses = ["12", "20"].map do |line_no|
        FactoryGirl.create(:bus, number: line_no)
      end

      visit buses_path
    end

    scenario "user searches for a bus" do
      fill_in "search", with: @matching_bus.number
      click_button "Search"

      expect(page).to have_content(@matching_bus.number)

      @non_matching_buses.each do |bus|
        expect(page).to_not have_content(bus.number)
      end
    end
end
