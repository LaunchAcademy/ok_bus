require 'rails_helper'

feature "Pagination" do

  context "browsing website" do
  #    FactoryGirl.create(:user, admin: true)
      @admin = User.first
  #    26.times {FactoryGirl.create(:user)}
  #    26.times {FactoryGirl.create(:bus)}

    scenario "admin visits user index" do
  #    sign_in_as(User.new(username: "MRMRMRMRMR", ))
      visit admin_users_path
      page.should have_selector('nav.pagination')
    end

    scenario "user sees buses" do
      visit root_path
      page.should have_selector('nav.pagination')
    end
  end
end
