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

  let(:review) { FactoryGirl.create(:review) }
  let(:ride) { review.ride }
  let(:bus) { ride.bus }

  context "authenticated user" do
    scenario "edit review from the bus detail page" do
      sign_in_as(review.user)
      visit bus_path(bus)
      expect(page).to have_content "Edit"
    end

    scenario "only user can edit his/her own review" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      visit bus_path(bus)
      expect(page).to_not have_content "Edit"
    end

    scenario "edit review from the bus detail page" do
      sign_in_as(review.user)
      visit bus_path(bus)
      click_on "Edit"
      fill_in "Body", with: "Some new text"
      click_on "Submit Review"

      expect(page).to have_content "Review successfully updated."
      expect(page).to have_content "Some new text"
    end
  end

  context "unauthenticated user" do
    scenario "user cannot edit a review unless logged in" do
      visit edit_bus_review_path(bus, review)

      expect(page).to have_content "You need to sign in or sign up before continuing."
    end

    scenario "cannot delete review if not logged in" do
      visit bus_path(bus)
      expect(page).to_not have_content "Edit"
    end
  end
end
