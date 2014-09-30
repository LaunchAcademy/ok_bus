require 'rails_helper'

feature "Pagination" do

  context "browsing website" do
    before :all do
      @admin = FactoryGirl.create(:user, admin: true)
      @user = FactoryGirl.create(:user)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      visit admin_users_path
      click_button 'Next'
      expect(response).to redirect_to('/admin/users?page=2')
    end

    scenario "user sees buses" do
      sign_in_as(@user)
      visit buses_path
      click_button 'Next'
      expect(response).to redirect_to('/buses?page=2')
    end
  end
end
