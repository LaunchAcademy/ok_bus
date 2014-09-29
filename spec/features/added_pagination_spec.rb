require "rails_helper"

feature "Pagination" do

  context "browsing website" do
    before :each do
      @admin = FactoryGirl.create(:user, admin: true)
      @user = FactoryGirl.create(:user)
      @dummy_user1 = FactoryGirl.create(:user)
      @dummy_user2 = FactoryGirl.create(:user)
      @dummy_user3 = FactoryGirl.create(:user)
      @dummy_bus1 = FactoryGirl.create(:bus)
      @dummy_bus2 = FactoryGirl.create(:bus)
      @dummy_bus3 = FactoryGirl.create(:bus)
      @dummy_bus4 = FactoryGirl.create(:bus)
    end

    scenario "admin visits user index" do
      sign_in_as(@admin)
      visit "/admin/users"
      click_button 'Next'
      expect(response).to redirect_to('/admin/users?page=2')
    end

    scenario "user sees buses" do
      sign_in_as(@user)
      visit "/buses"
      click_button 'Next'
      expect(response).to redirect_to('/buses?page=2')
    end

  end
end
