require "rails_helper"

feature "Admin fuctionality", %{
  As an admin, I should be identified as such
  I should have more functions than a regular user
  So that I can maintain order on the site.

  Acceptance Criteria:

  I must be logged in and identified as an admin
  } do

  context "authenticated admin" do
    before :each do
      @admin = FactoryGirl.create(:user)
      @admin.update_attribute :admin, true
      @user = FactoryGirl.create(:user)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      binding.pry
      visit "/admin/users"
      expect(page).to have_content(@user.email)
    end

    scenario "Unauthorized users cannot access user index" do
      sign_in_as(@user)
      visit "/admin/users"
      save_and_open_page
      expect(page).to have_content("not authorized")
    end

    scenario "admin deletes another user's account" do
    end
  end
end
