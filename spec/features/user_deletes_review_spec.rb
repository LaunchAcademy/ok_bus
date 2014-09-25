require "rails_helper"

feature "User deletes a review", %{
  As a user I want to be able
  to delete my review
  So that I can fix mistakes.
  } do
  scenario "must be logged in to delete review" do
    review = FactoryGirl.create(:review)
    bus = review.ride.bus
    expect(page).to_not have_content "Delete"
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to have_content "Delete"
  end

  scenario "only user can delete its own review"
  scenario "delete review from the bus detail page"
  scenario "deleting a review deletes all associated votes"
end
