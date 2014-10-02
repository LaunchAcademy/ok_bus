require "rails_helper"

feature "Admin fuctionality", %{
  As an admin, I should be identified as such
  I should have more functions than a regular user
  So that I can maintain order on the site.

  Acceptance Criteria:

  I must be logged in and identified as an admin
  I can visit an index of users (not accessible by regular users)
  I can delete a user
  I can delete a user's review
  } do

    before :each do
      @admin = FactoryGirl.create(:user, admin: true)
      @user = FactoryGirl.create(:user)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      click_on "View Users"
      expect(page).to have_content(@user.email)
    end

    scenario "admin deletes another user's account" do
      sign_in_as(@admin)
      click_on "View Users"
      prev_count = User.count
      first(:link, "Delete").click
      expect(User.count).to eq prev_count - 1
      expect(page).to have_content "User successfully deleted"
      expect(page).to_not have_content @user.username
    end

    scenario "admin can delete another user's review" do
      review1 = FactoryGirl.create(:review)
      prev_count = Review.count
      bus = review1.ride.bus
      sign_in_as(@admin)
      visit bus_path(bus)
      click_on "Delete"
      expect(Review.count).to eq prev_count - 1
      expect(page).to have_content("Review successfully deleted")
    end

    scenario "Unauthorized users cannot access user index" do
      sign_in_as(@user)
      visit "/admin/users"
      expect(page).to have_content("You must be an admin")
    end

    scenario "Unauthorized users cannot see the View Users link" do
      sign_in_as(@user)
      expect(page).to_not have_content("View Users")
    end
end
