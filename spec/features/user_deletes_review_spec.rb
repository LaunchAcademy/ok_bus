require "rails_helper"

feature "User deletes a review", %{
  As a user I want to be able
  to delete my review
  So that I can fix mistakes.
  } do
  let(:review) { FactoryGirl.create(:review) }
  let(:bus) { review.ride.bus }

  context "unauthenticated user" do
    before :each do
      visit bus_path(bus)
    end

    scenario "cannot delete review if not logged in" do
      expect(page).to_not have_content "Delete"
    end

    scenario "only user can delete its own review" do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      expect(page).to_not have_content "Delete"
    end
  end

  context "authenticated user" do
    before :each do
      FactoryGirl.create(:vote, review: review)
      sign_in_as(review.user)
      visit bus_path(bus)
    end

    scenario "delete review from the bus detail page" do
      expect { click_link "Delete" }.to change(Review, :count).by(-1)
    end

    scenario "deleting a review deletes all associated votes" do
      expect { click_link "Delete" }.to change(Vote, :count)
    end
  end
end
