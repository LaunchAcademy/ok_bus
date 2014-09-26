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

    let(:ride) { FactoryGirl.create(:ride) }
    let(:bus) { ride.bus }
    let(:review) {FactoryGirl.create(:review)}

  before :each do
    visit bus_path(bus)
  end

  scenario "edit review from the bus detail page" do
    sign_in_as(review.user)
    visit bus_path(bus)
    save_and_open_page
    expect(page).to have_content "Edit"
  end

  scenario "cannot delete review if not logged in" do
    expect(page).to_not have_content "Edit"
  end

  scenario "only user can edit his/her own review" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    expect(page).to_not have_content "Edit"
  end

  context "unauthenticated user" do
    scenario "user cannot edit a review" do
      visit edit_bus_review_path(bus)

      expect(page).to have_content
      "You need to sign in or sign up before continuing."
    end
  end
end
