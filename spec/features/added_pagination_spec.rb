require "rails_helper"

feature "Pagination" do

  context "browsing website" do
    before :each do
      @admin = FactoryGirl.create(:user, admin: true)
      @user = FactoryGirl.create(:user)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      visit "/admin/users"
      expect(page).to have_content('Next')
    end

    scenario "user sees buses" do
      sign_in_as(@user)
      visit "/buses"

    end
  end
end
