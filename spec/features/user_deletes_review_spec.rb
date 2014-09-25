require "rails_helper"

feature "User deletes a review", %{
  As a user I want to be able
  to delete my review
  So that I can fix mistakes.
  } do
  before :each do
    @review = FactoryGirl.create(:review)
    @bus = @review.ride.bus
    visit bus_path(@bus)
  end

  scenario "cannot delete review if not logged in" do
    expect(page).to_not have_content "Delete"
  end

  scenario "only user can delete its own review" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to_not have_content "Delete"
  end

  scenario "delete review from the bus detail page" do
    sign_in_as(@review.user)
    visit bus_path(@bus)
    expect { click_link "Delete" }.to change(Review, :count).by(-1)
  end

  scenario "deleting a review deletes all associated votes"
    #needs votes model
end
