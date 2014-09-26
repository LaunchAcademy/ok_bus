require "rails_helper"

feature "User edits a review", %{
  As a user
  I want to edit my review
  So that I can provide other users
  with an accurate evaluation of my
  experience

  Acceptance Criteria:

  I must be logged in to edit a review
  I can only edit my own review
  I can get to the edit page from the
  bus details page
  } do

  before :each do
    @review = FactoryGirl.create(:review)
    @bus = @review.ride.bus
    visit bus_path(@bus)
  end

  context "unauthenticated user" do
    scenario "user cannot edit a review" do
      visit new_bus_review_path(bus)

      expect(page).to have_content
      "You need to sign in or sign up before continuing."
    end
  end
end
