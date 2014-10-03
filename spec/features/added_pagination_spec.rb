require 'rails_helper'

feature "Pagination" do

  context "browsing website" do
    scenario "admin visits user index" do
      26.times { FactoryGirl.create(:user) }
      admin = FactoryGirl.create(:user, admin: true)

      sign_in_as(admin)
      visit admin_users_path

      expect(page).to have_selector('nav.pagination')
      expect(page).to have_link "Next"
    end

    scenario "user sees buses" do
      26.times {FactoryGirl.create(:bus)}

      visit root_path

      expect(page).to have_selector('nav.pagination')
      expect(page).to have_link "Next"
    end
  end
end
