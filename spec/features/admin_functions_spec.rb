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

  context "authenticated admin" do
    before :each do
      @admin = FactoryGirl.create(:user, admin: true)
      @user = FactoryGirl.create(:user)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      visit "/admin/users"
      expect(page).to have_content(@user.email)
    end

    scenario "Unauthorized users cannot access user index" do
      sign_in_as(@user)
      visit "/admin/users"
      expect(page).to have_content("You must be an admin")
    end

    scenario "admin deletes another user's account" do
      sign_in_as(@admin)
      visit "/admin/users"
      first(:link, "Delete").click
    end

    scenario "admin can delete another user's review" do
      review1 = FactoryGirl.create(:review)
      bus = review1.ride.bus
      sign_in_as(@admin)
      visit bus_path(bus)
      binding.pry
      expect { click_link "Delete" }.to change(Review, :count).by(-1)
    end
  end
end
