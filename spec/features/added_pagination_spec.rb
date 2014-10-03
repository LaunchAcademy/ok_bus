require 'rails_helper'

feature "Pagination" do

  context "browsing website" do
      @admin = User.find_by(admin: true)
#      26.times {FactoryGirl.create(:user)}
#      26.times {FactoryGirl.create(:bus)}

    scenario "admin visits user index" do
      sign_in_as(@admin)
      visit admin_users_path
      page.should have_selector('nav.pagination')
    end

    scenario "user sees buses" do
      visit root_path
      page.should have_selector('nav.pagination')
    end
  end
end
